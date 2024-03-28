import 'dart:async';
import 'dart:collection';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as fn;
import 'package:unix_preferences/src/config/config.dart';
import 'package:unix_preferences/src/model/push.dart';
import 'package:unix_preferences/src/model/storage_codec.dart';
import 'package:unix_preferences/src/protobuf/api.pb.dart' as api;

/// {@template unix_preferences_client}
/// Client for Unix Preferences
/// {@endtemplate}
class UnixPreferencesClient with MapMixin<String, Object> {
  /// {@macro unix_preferences_client}
  UnixPreferencesClient({String? clientId}) {
    this.clientId =
        clientId ?? hashCode.toUnsigned(20).toRadixString(16).padLeft(5, '0');
  }

  /// Unique counter for messages
  fn.Int64 _id = fn.Int64.ZERO;

  /// Unique identifier for the client
  late final String clientId;

  /// List of message listeners
  final List<({String? topic, OnUnixMessage callback})> _onMessages =
      <({String? topic, OnUnixMessage callback})>[];

  /// Add a message listener
  void addListener(OnUnixMessage listener, {String? topic}) {
    _onMessages.add((topic: topic, callback: listener));
    _clientSocket?.add(api.Command(
      id: _nextId(),
      client: clientId,
      subscribe: api.Subscribe(topic: topic),
    ).writeToBuffer());
  }

  /// Remove a message listener
  void removeListener(OnUnixMessage listener) {
    _onMessages.removeWhere((e) => identical(e.callback, listener));
    _clientSocket?.add(api.Command(
      id: _nextId(),
      client: clientId,
      unsubscribe: api.Unsubscribe(),
    ).writeToBuffer());
  }

  /// Notify all listeners
  void _notifyListeners(String? topic, Object message) {
    if (_onMessages.isEmpty) return;
    final push = Push(
      topic: topic,
      message: message,
      isText: message is String,
      isBinary: message is List<int>,
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

  /// Client socket
  io.Socket? _clientSocket;

  /// Subscription to the client socket
  StreamSubscription<Uint8List>? _subscription;

  /// Check if the subscription is running
  bool get isRunning => _clientSocket != null;

  /// Get the address of the client socket
  io.InternetAddress? get address => _clientSocket?.address;

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

  /// Handle incoming messages.
  void _onMessage(Uint8List bytes) {
    try {
      final reply = api.Reply.fromBuffer(bytes);
      // ignore: unused_local_variable
      final serverId = reply.hasServer() ? reply.server : null;
      if (!reply.hasId()) {
        return;
      } else if (reply.hasPong()) {
        /* */
      } else if (reply.hasStorage()) {
        final storage =
            const StorageCodec().decoder.convert(reply.storage.entries);
        _storage
          ..clear()
          ..addAll({
            for (final entry in storage.entries)
              if (entry.value case Object value) entry.key: value,
          });
      } else if (reply.hasPush()) {
        final push = reply.push;
        final topic = push.hasTopic() ? push.topic : null;
        Object message;
        if (push.hasTextData()) {
          message = push.textData;
        } else if (push.hasBinaryData()) {
          message = push.binaryData;
        } else {
          throw ArgumentError.value(push, 'push', 'Invalid push message');
        }
        _notifyListeners(topic, message);
      } else {
        throw ArgumentError.value(reply, 'reply', 'Invalid reply');
      }
    } on Object {/* ignore */}
  }

  /// Connect to the server
  Future<void> connect({String? path}) => _handle(() async {
        if (isRunning) throw StateError('Server is already running');
        final address = io.InternetAddress(
          path ?? Config().unixPreferencesPath,
          type: io.InternetAddressType.unix,
        );
        // ignore: close_sinks
        final connection = _clientSocket = await io.Socket.connect(address, 0);
        _subscription = connection.listen(_onMessage, cancelOnError: false);
      });

  /// Get the next unique identifier for a message
  fn.Int64 _nextId() => _id += fn.Int64.ONE;

  /// Asynchronously send a message to all connected clients.
  /// [topic] is the topic of the message, if null, message will be broadcasted.
  /// [message] is the message to be sent, can be either String or Uint8List.
  void push(Object /*String|Uint8List*/ message, {String? topic}) {
    if (!isRunning) throw StateError('Client is not connected');
    final command = api.Command(
      id: _nextId(),
      client: clientId,
      push: api.Push(topic: topic),
    );
    if (message is String) {
      command.push.textData = message;
    } else if (message is List<int>) {
      command.push.binaryData = message;
    } else {
      throw ArgumentError.value(message, 'message', 'Invalid message');
    }
    final data = command.writeToBuffer();
    _clientSocket?.add(data);
  }

  /// Close the client socket
  Future<void> close() => _handle(() async {
        _id = fn.Int64.ZERO;
        _onMessages.clear();
        _storage.clear();
        _changes.clear();
        _subscription?.cancel().ignore();
        await _clientSocket?.close();
        _clientSocket = null;
      });

  /// Get a preference value
  @override
  Object? operator [](Object? key) => _storage[key];

  /// Set a preference value
  @override
  void operator []=(String key, Object? value) {
    if (value == null) {
      _storage.remove(key);
      _changes[key] = null;
    } else {
      _storage[key] = value;
      _changes[key] = value;
    }
    _scheduleStorageUpdate();
  }

  @override
  void clear() {
    _changes.addAll({for (final key in _storage.keys) key: null});
    _storage.clear();
    _scheduleStorageUpdate();
  }

  @override
  Iterable<String> get keys => _storage.keys;

  @override
  Object? remove(Object? key) {
    if (key is! String) return null;
    final value = _storage.remove(key);
    _changes[key] = null;
    _scheduleStorageUpdate();
    return value;
  }

  final Map<String, Object?> _changes = <String, Object?>{};
  Future<void>? _updade;
  void _scheduleStorageUpdate() {
    _updade ??= Future<void>.delayed(Duration.zero, () async {
      try {
        final upsert = const StorageEncoder().convert(_changes);
        _updade = null;
        _changes.clear();
        _clientSocket?.add(api.Command(
          id: _nextId(),
          client: clientId,
          update: api.Update(upsert: upsert),
        ).writeToBuffer());
      } on Object {/* ignore */}
    });
  }
}
