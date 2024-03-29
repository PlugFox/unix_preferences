import 'dart:async';
import 'dart:collection';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as fn;
import 'package:unix_preferences/src/config/config.dart';
import 'package:unix_preferences/src/model/push.dart';
import 'package:unix_preferences/src/model/storage_codec.dart';
import 'package:unix_preferences/src/protobuf/api.pb.dart' as api;

/// {@template unix_preferences_server}
/// Server for Unix Preferences
/// {@endtemplate}
class UnixPreferencesServer with MapMixin<String, Object> {
  /// {@macro unix_preferences_server}
  UnixPreferencesServer({
    String? serverId,
    void Function(Map<String, Object>)? onUpdate,
  }) : _onStorageUpdate = onUpdate {
    this.serverId =
        serverId ?? hashCode.toUnsigned(20).toRadixString(16).padLeft(5, '0');
  }

  /// Unique counter for messages
  fn.Int64 _id = fn.Int64.ZERO;

  /// Unique identifier for the server
  late final String serverId;

  /// Callback for storage updates
  final void Function(Map<String, Object>)? _onStorageUpdate;

  /// List of message listeners
  final List<({String? topic, OnUnixMessage callback})> _onMessages =
      <({String? topic, OnUnixMessage callback})>[];

  /// Add a message listener
  void addListener(OnUnixMessage listener, {String? topic}) {
    _onMessages.add((topic: topic, callback: listener));
  }

  /// Remove a message listener
  void removeListener(OnUnixMessage listener) =>
      _onMessages.removeWhere((e) => identical(e.callback, listener));

  /// Notify all listeners
  void _notifyListeners(String? topic, Object message) {
    if (_onMessages.isEmpty) return;
    final push = Push(
      topic: topic,
      message: message,
      isBroadcast: topic == null,
      hasTopic: topic != null,
    );
    if (topic != null) {
      for (final e in _onMessages) {
        if (e.topic == null || push.topic != topic) continue;
        try {
          e.callback(push);
        } on Object {/* ignore */}
      }
    } else {
      for (final e in _onMessages) {
        if (e.topic != null) continue;
        try {
          e.callback(push);
        } on Object {/* ignore */}
      }
    }
  }

  /// Server socket
  io.ServerSocket? _serverSocket;

  /// Subscription to the server socket
  StreamSubscription<io.Socket>? _subscription;

  /// List of connections
  final List<io.Socket> _connections = <io.Socket>[];

  /// Check if the server is running
  bool get isRunning => _serverSocket != null;

  /// Get the address of the server socket
  io.InternetAddress? get address => _serverSocket?.address;

  /// Check if there are any connections
  bool get hasConnections => _connections.isNotEmpty;

  /// Check if there are no connections
  bool get hasNoConnections => _connections.isEmpty;

  /// Get the number of connections
  int get connectionCount => _connections.length;

  /// Subsciptions to topics
  final Map<String, Set<io.Socket>> _topics = <String, Set<io.Socket>>{};

  /// Storage for preferences
  final Map<String, Object> _storage = <String, Object>{};

  /// Do not allow multiple operations to run concurrently
  Future<void>? _progress;
  Future<void> _handle(Future<void> Function() fn) async {
    if (_progress != null) {
      assert(false, 'Already in progress');
      return _progress;
    }
    try {
      _progress = fn();
      await _progress;
    } finally {
      _progress = null;
    }
  }

  /// Bind the server socket
  Future<void> bind({String? path, int backlog = 0, bool shared = false}) =>
      _handle(() async {
        if (isRunning) throw StateError('Server is already running');
        final address = path ?? Config().unixPreferencesPath;
        final file = io.File(address);
        if (file.existsSync()) await file.delete();
        final connection = _serverSocket = await io.ServerSocket.bind(
            io.InternetAddress(address, type: io.InternetAddressType.unix), 0,
            backlog: backlog, shared: shared);

        void onConnection(io.Socket socket) {
          _connections.add(socket);
          socket
            ..listen(
              (data) => _onMessage(socket, data),
              cancelOnError: false,
              onDone: () => _connections.remove(socket),
            )
            ..add(api.Reply(
              id: _nextId(),
              server: serverId,
              storage: api.Storage(
                  entries: const StorageEncoder().convert(_storage)),
            ).writeToBuffer());
        }

        _subscription = connection.listen(onConnection, cancelOnError: false);
      });

  /// Get the next unique identifier for a message
  fn.Int64 _nextId() => _id += fn.Int64.ONE;

  /// Handle incoming messages.
  void _onMessage(io.Socket socket, Uint8List bytes) {
    try {
      final command = api.Command.fromBuffer(bytes);
      // ignore: unused_local_variable
      final clientId = command.hasClient() ? command.client : null;
      if (!command.hasId()) {
        return;
      } else if (command.hasPing()) {
        final response = api.Reply(
          id: _nextId(),
          server: serverId,
          pong: api.Pong(),
        );
        socket.add(response.writeToBuffer());
      } else if (command.hasUpdate()) {
        final upsert = const StorageDecoder().convert(command.update.upsert);
        for (final e in upsert.entries) {
          if (e.value == null) {
            _storage.remove(e.key);
          } else {
            _storage[e.key] = e.value!;
          }
        }
        final data = api.Reply(
          id: _nextId(),
          server: serverId,
          storage:
              api.Storage(entries: const StorageEncoder().convert(_storage)),
        ).writeToBuffer();
        final receivers = _connections.toList(growable: false);
        for (final receiver in receivers) {
          try {
            receiver.add(data);
          } on Object {/* ignore */}
        }
        if (_onStorageUpdate != null)
          _onStorageUpdate?.call(Map<String, Object>.unmodifiable(_storage));
      } else if (command.hasPush()) {
        final topic = command.push.hasTopic() ? command.push.topic : null;
        final receivers = topic != null
            ? _topics[topic]?.toList(growable: false)
            : _connections.toList(growable: false);
        if (receivers == null || receivers.isEmpty) return;
        final reply = api.Reply(
          id: _nextId(),
          server: serverId,
          push: api.Push(
              topic: command.push.hasTopic() ? command.push.topic : null),
        );
        final push = command.push;
        Object message;
        if (push.hasBinaryData()) {
          reply.push.binaryData = message = push.binaryData;
        } else if (push.hasTextData()) {
          reply.push.textData = message = push.textData;
        } else if (push.hasMapData()) {
          reply.push.mapData = message = push.mapData;
        } else {
          throw ArgumentError.value(push, 'push', 'Invalid push message');
        }
        final data = reply.writeToBuffer();
        for (final receiver in receivers) {
          if (identical(receiver, socket)) continue;
          try {
            receiver.add(data);
          } on Object {/* ignore */}
        }
        _notifyListeners(topic, message);
      } else if (command.hasSubscribe()) {
        _topics
            .putIfAbsent(
                command.subscribe.topic, LinkedHashSet<io.Socket>.identity)
            .add(socket);
      } else if (command.hasUnsubscribe()) {
        _topics[command.unsubscribe.topic]?.remove(socket);
      } else {
        throw ArgumentError.value(command, 'command', 'Invalid command');
      }
    } on Object {/* ignore */}
  }

  /// Asynchronously send a message to all connected clients.
  /// [topic] is the topic of the message, if null, message will be broadcasted.
  /// [message] is the message to be sent,
  ///   can be either String or Uint8List or Map<String, Object?>.
  void push(
    Object /* String | Uint8List | Map<String, Object?> */ message, {
    String? topic,
  }) {
    if (!isRunning) throw StateError('Server is not running');
    final receivers = topic != null
        ? _topics[topic]?.toList(growable: false)
        : _connections.toList(growable: false);
    if (receivers == null || receivers.isEmpty) return;
    final reply = api.Reply(
      id: _nextId(),
      server: serverId,
      push: api.Push(topic: topic),
    );
    if (message is String) {
      reply.push.textData = message;
    } else if (message is List<int>) {
      reply.push.binaryData = message;
    } else if (message is Map<String, Object?>) {
      reply.push.mapData = api.Storage(
        entries: const StorageCodec().encoder.convert(message),
      );
    } else {
      throw ArgumentError.value(message, 'message', 'Invalid message');
    }
    final data = reply.writeToBuffer();
    final errors = <(io.Socket, Object error, StackTrace stackTrace)>[];
    for (final receiver in receivers) {
      try {
        receiver.add(data);
      } on Object catch (error, stackTrace) {
        errors.add((receiver, error, stackTrace));
      }
    }
    if (errors.length == 1) {
      final (socket, error, stackTrace) = errors.first;
      Error.throwWithStackTrace(
        'Failed to send message to 1 receiver '
        'Socket{${socket.remoteAddress}}: $error',
        stackTrace,
      );
    } else if (errors.isNotEmpty) {
      Error.throwWithStackTrace(
        Exception('Failed to send message to ${errors.length} receivers'),
        errors.first.$3,
      );
    }
  }

  /*
  /// Remote Procedure Call (RPC) - Send a message and wait for a response.
  /// [topic] is the topic of the message, if null, message will be broadcasted.
  /// [message] is the message to be sent, can be either String or Uint8List.
  Future<void> rpc(
          {required Object /*String|Uint8List*/ message, String? topic}) =>
      throw UnimplementedError();
  */

  /// Close the server socket
  Future<void> close() => _handle(() async {
        _subscription?.cancel().ignore();
        _id = fn.Int64.ZERO;
        _onMessages.clear();
        _storage.clear();
        _topics.clear();
        await Future.wait<void>([
          for (final connection in _connections) connection.close(),
        ]).onError((_, __) => const []);
        _connections.clear();
        await _serverSocket?.close();
        _serverSocket = null;
      });

  /// Get a preference value
  @override
  Object? operator [](Object? key) => _storage[key];

  /// Set a preference value
  @override
  void operator []=(String key, Object? value) {
    if (value == null) {
      _storage.remove(key);
    } else {
      _storage[key] = value;
    }
    _scheduleStorageUpdate();
  }

  @override
  void clear() {
    _storage.clear();
    _scheduleStorageUpdate();
  }

  @override
  Iterable<String> get keys => _storage.keys;

  @override
  Object? remove(Object? key) {
    if (key is! String) return null;
    final value = _storage.remove(key);
    _scheduleStorageUpdate();
    return value;
  }

  Future<void>? _updade;
  void _scheduleStorageUpdate() {
    _updade ??= Future<void>.delayed(Duration.zero, () async {
      try {
        final storage = const StorageEncoder().convert(_storage);
        _updade = null;
        final receivers = _connections.toList(growable: false);
        for (final receiver in receivers) {
          try {
            receiver.add(api.Reply(
              id: _nextId(),
              server: serverId,
              storage: api.Storage(entries: storage),
            ).writeToBuffer());
          } on Object {/* ignore */}
        }
      } on Object {/* ignore */}
    });
  }
}
