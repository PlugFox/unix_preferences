//
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

/// Command sent from a client to a server.
/// ProtocolVersion2 uses id and one of the possible request messages.
class Command extends $pb.GeneratedMessage {
  factory Command({
    $fixnum.Int64? id,
    $core.String? client,
    Ping? ping,
    Update? update,
    Push? push,
    Subscribe? subscribe,
    Unsubscribe? unsubscribe,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (client != null) {
      $result.client = client;
    }
    if (ping != null) {
      $result.ping = ping;
    }
    if (update != null) {
      $result.update = update;
    }
    if (push != null) {
      $result.push = push;
    }
    if (subscribe != null) {
      $result.subscribe = subscribe;
    }
    if (unsubscribe != null) {
      $result.unsubscribe = unsubscribe;
    }
    return $result;
  }
  Command._() : super();
  factory Command.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Command.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Command',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'client')
    ..aOM<Ping>(101, _omitFieldNames ? '' : 'ping', subBuilder: Ping.create)
    ..aOM<Update>(102, _omitFieldNames ? '' : 'update',
        subBuilder: Update.create)
    ..aOM<Push>(103, _omitFieldNames ? '' : 'push', subBuilder: Push.create)
    ..aOM<Subscribe>(105, _omitFieldNames ? '' : 'subscribe',
        subBuilder: Subscribe.create)
    ..aOM<Unsubscribe>(106, _omitFieldNames ? '' : 'unsubscribe',
        subBuilder: Unsubscribe.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Command clone() => Command()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Command copyWith(void Function(Command) updates) =>
      super.copyWith((message) => updates(message as Command)) as Command;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Command create() => Command._();
  Command createEmptyInstance() => create();
  static $pb.PbList<Command> createRepeated() => $pb.PbList<Command>();
  @$core.pragma('dart2js:noInline')
  static Command getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Command>(create);
  static Command? _defaultInstance;

  /// Id of command to let client match replies to commands.
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// Client ID.
  @$pb.TagNumber(2)
  $core.String get client => $_getSZ(1);
  @$pb.TagNumber(2)
  set client($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasClient() => $_has(1);
  @$pb.TagNumber(2)
  void clearClient() => clearField(2);

  /// Request to ping server.
  @$pb.TagNumber(101)
  Ping get ping => $_getN(2);
  @$pb.TagNumber(101)
  set ping(Ping v) {
    setField(101, v);
  }

  @$pb.TagNumber(101)
  $core.bool hasPing() => $_has(2);
  @$pb.TagNumber(101)
  void clearPing() => clearField(101);
  @$pb.TagNumber(101)
  Ping ensurePing() => $_ensure(2);

  /// Request to update storage.
  @$pb.TagNumber(102)
  Update get update => $_getN(3);
  @$pb.TagNumber(102)
  set update(Update v) {
    setField(102, v);
  }

  @$pb.TagNumber(102)
  $core.bool hasUpdate() => $_has(3);
  @$pb.TagNumber(102)
  void clearUpdate() => clearField(102);
  @$pb.TagNumber(102)
  Update ensureUpdate() => $_ensure(3);

  /// Push data to other clients.
  @$pb.TagNumber(103)
  Push get push => $_getN(4);
  @$pb.TagNumber(103)
  set push(Push v) {
    setField(103, v);
  }

  @$pb.TagNumber(103)
  $core.bool hasPush() => $_has(4);
  @$pb.TagNumber(103)
  void clearPush() => clearField(103);
  @$pb.TagNumber(103)
  Push ensurePush() => $_ensure(4);

  /// Subscribe to a topic.
  @$pb.TagNumber(105)
  Subscribe get subscribe => $_getN(5);
  @$pb.TagNumber(105)
  set subscribe(Subscribe v) {
    setField(105, v);
  }

  @$pb.TagNumber(105)
  $core.bool hasSubscribe() => $_has(5);
  @$pb.TagNumber(105)
  void clearSubscribe() => clearField(105);
  @$pb.TagNumber(105)
  Subscribe ensureSubscribe() => $_ensure(5);

  /// Unsubscribe from a topic.
  @$pb.TagNumber(106)
  Unsubscribe get unsubscribe => $_getN(6);
  @$pb.TagNumber(106)
  set unsubscribe(Unsubscribe v) {
    setField(106, v);
  }

  @$pb.TagNumber(106)
  $core.bool hasUnsubscribe() => $_has(6);
  @$pb.TagNumber(106)
  void clearUnsubscribe() => clearField(106);
  @$pb.TagNumber(106)
  Unsubscribe ensureUnsubscribe() => $_ensure(6);
}

/// Reply sent from a server to a client.
/// ProtocolVersion2 uses id and one of the possible concrete result messages.
class Reply extends $pb.GeneratedMessage {
  factory Reply({
    $fixnum.Int64? id,
    $core.String? server,
    Pong? pong,
    Storage? storage,
    Push? push,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (server != null) {
      $result.server = server;
    }
    if (pong != null) {
      $result.pong = pong;
    }
    if (storage != null) {
      $result.storage = storage;
    }
    if (push != null) {
      $result.push = push;
    }
    return $result;
  }
  Reply._() : super();
  factory Reply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Reply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Reply',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'server')
    ..aOM<Pong>(101, _omitFieldNames ? '' : 'pong', subBuilder: Pong.create)
    ..aOM<Storage>(102, _omitFieldNames ? '' : 'storage',
        subBuilder: Storage.create)
    ..aOM<Push>(103, _omitFieldNames ? '' : 'push', subBuilder: Push.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Reply clone() => Reply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Reply copyWith(void Function(Reply) updates) =>
      super.copyWith((message) => updates(message as Reply)) as Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply create() => Reply._();
  Reply createEmptyInstance() => create();
  static $pb.PbList<Reply> createRepeated() => $pb.PbList<Reply>();
  @$core.pragma('dart2js:noInline')
  static Reply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply>(create);
  static Reply? _defaultInstance;

  /// Id of command to let client match replies to commands.
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// Server ID.
  @$pb.TagNumber(2)
  $core.String get server => $_getSZ(1);
  @$pb.TagNumber(2)
  set server($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServer() => $_has(1);
  @$pb.TagNumber(2)
  void clearServer() => clearField(2);

  /// Reply to ping request.
  @$pb.TagNumber(101)
  Pong get pong => $_getN(2);
  @$pb.TagNumber(101)
  set pong(Pong v) {
    setField(101, v);
  }

  @$pb.TagNumber(101)
  $core.bool hasPong() => $_has(2);
  @$pb.TagNumber(101)
  void clearPong() => clearField(101);
  @$pb.TagNumber(101)
  Pong ensurePong() => $_ensure(2);

  /// Current storage state.
  @$pb.TagNumber(102)
  Storage get storage => $_getN(3);
  @$pb.TagNumber(102)
  set storage(Storage v) {
    setField(102, v);
  }

  @$pb.TagNumber(102)
  $core.bool hasStorage() => $_has(3);
  @$pb.TagNumber(102)
  void clearStorage() => clearField(102);
  @$pb.TagNumber(102)
  Storage ensureStorage() => $_ensure(3);

  /// Push data from other clients.
  @$pb.TagNumber(103)
  Push get push => $_getN(4);
  @$pb.TagNumber(103)
  set push(Push v) {
    setField(103, v);
  }

  @$pb.TagNumber(103)
  $core.bool hasPush() => $_has(4);
  @$pb.TagNumber(103)
  void clearPush() => clearField(103);
  @$pb.TagNumber(103)
  Push ensurePush() => $_ensure(4);
}

/// Ping the server.
class Ping extends $pb.GeneratedMessage {
  factory Ping() => create();
  Ping._() : super();
  factory Ping.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Ping.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Ping',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Ping clone() => Ping()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Ping copyWith(void Function(Ping) updates) =>
      super.copyWith((message) => updates(message as Ping)) as Ping;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ping create() => Ping._();
  Ping createEmptyInstance() => create();
  static $pb.PbList<Ping> createRepeated() => $pb.PbList<Ping>();
  @$core.pragma('dart2js:noInline')
  static Ping getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ping>(create);
  static Ping? _defaultInstance;
}

/// Reply to a ping request.
class Pong extends $pb.GeneratedMessage {
  factory Pong() => create();
  Pong._() : super();
  factory Pong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Pong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Pong',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Pong clone() => Pong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Pong copyWith(void Function(Pong) updates) =>
      super.copyWith((message) => updates(message as Pong)) as Pong;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Pong create() => Pong._();
  Pong createEmptyInstance() => create();
  static $pb.PbList<Pong> createRepeated() => $pb.PbList<Pong>();
  @$core.pragma('dart2js:noInline')
  static Pong getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pong>(create);
  static Pong? _defaultInstance;
}

enum Push_Data { textData, binaryData, mapData, notSet }

/// Push data to other clients.
class Push extends $pb.GeneratedMessage {
  factory Push({
    $core.String? topic,
    $core.String? textData,
    $core.List<$core.int>? binaryData,
    Storage? mapData,
  }) {
    final $result = create();
    if (topic != null) {
      $result.topic = topic;
    }
    if (textData != null) {
      $result.textData = textData;
    }
    if (binaryData != null) {
      $result.binaryData = binaryData;
    }
    if (mapData != null) {
      $result.mapData = mapData;
    }
    return $result;
  }
  Push._() : super();
  factory Push.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Push.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Push_Data> _Push_DataByTag = {
    102: Push_Data.textData,
    103: Push_Data.binaryData,
    104: Push_Data.mapData,
    0: Push_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Push',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..oo(0, [102, 103, 104])
    ..aOS(101, _omitFieldNames ? '' : 'topic')
    ..aOS(102, _omitFieldNames ? '' : 'textData')
    ..a<$core.List<$core.int>>(
        103, _omitFieldNames ? '' : 'binaryData', $pb.PbFieldType.OY)
    ..aOM<Storage>(104, _omitFieldNames ? '' : 'mapData',
        subBuilder: Storage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Push clone() => Push()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Push copyWith(void Function(Push) updates) =>
      super.copyWith((message) => updates(message as Push)) as Push;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Push create() => Push._();
  Push createEmptyInstance() => create();
  static $pb.PbList<Push> createRepeated() => $pb.PbList<Push>();
  @$core.pragma('dart2js:noInline')
  static Push getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Push>(create);
  static Push? _defaultInstance;

  Push_Data whichData() => _Push_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(101)
  $core.String get topic => $_getSZ(0);
  @$pb.TagNumber(101)
  set topic($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(101)
  $core.bool hasTopic() => $_has(0);
  @$pb.TagNumber(101)
  void clearTopic() => clearField(101);

  @$pb.TagNumber(102)
  $core.String get textData => $_getSZ(1);
  @$pb.TagNumber(102)
  set textData($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(102)
  $core.bool hasTextData() => $_has(1);
  @$pb.TagNumber(102)
  void clearTextData() => clearField(102);

  @$pb.TagNumber(103)
  $core.List<$core.int> get binaryData => $_getN(2);
  @$pb.TagNumber(103)
  set binaryData($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(103)
  $core.bool hasBinaryData() => $_has(2);
  @$pb.TagNumber(103)
  void clearBinaryData() => clearField(103);

  @$pb.TagNumber(104)
  Storage get mapData => $_getN(3);
  @$pb.TagNumber(104)
  set mapData(Storage v) {
    setField(104, v);
  }

  @$pb.TagNumber(104)
  $core.bool hasMapData() => $_has(3);
  @$pb.TagNumber(104)
  void clearMapData() => clearField(104);
  @$pb.TagNumber(104)
  Storage ensureMapData() => $_ensure(3);
}

/// Update storage data.
class Update extends $pb.GeneratedMessage {
  factory Update({
    $core.Iterable<MapEntry>? upsert,
  }) {
    final $result = create();
    if (upsert != null) {
      $result.upsert.addAll(upsert);
    }
    return $result;
  }
  Update._() : super();
  factory Update.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Update.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Update',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..pc<MapEntry>(1, _omitFieldNames ? '' : 'upsert', $pb.PbFieldType.PM,
        subBuilder: MapEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Update clone() => Update()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Update copyWith(void Function(Update) updates) =>
      super.copyWith((message) => updates(message as Update)) as Update;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Update create() => Update._();
  Update createEmptyInstance() => create();
  static $pb.PbList<Update> createRepeated() => $pb.PbList<Update>();
  @$core.pragma('dart2js:noInline')
  static Update getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Update>(create);
  static Update? _defaultInstance;

  /// Storage data to update.
  @$pb.TagNumber(1)
  $core.List<MapEntry> get upsert => $_getList(0);
}

/// Subscribe to a topic.
class Subscribe extends $pb.GeneratedMessage {
  factory Subscribe({
    $core.String? topic,
  }) {
    final $result = create();
    if (topic != null) {
      $result.topic = topic;
    }
    return $result;
  }
  Subscribe._() : super();
  factory Subscribe.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Subscribe.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Subscribe',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'topic')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Subscribe clone() => Subscribe()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Subscribe copyWith(void Function(Subscribe) updates) =>
      super.copyWith((message) => updates(message as Subscribe)) as Subscribe;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Subscribe create() => Subscribe._();
  Subscribe createEmptyInstance() => create();
  static $pb.PbList<Subscribe> createRepeated() => $pb.PbList<Subscribe>();
  @$core.pragma('dart2js:noInline')
  static Subscribe getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Subscribe>(create);
  static Subscribe? _defaultInstance;

  /// Topic to subscribe to.
  @$pb.TagNumber(1)
  $core.String get topic => $_getSZ(0);
  @$pb.TagNumber(1)
  set topic($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopic() => clearField(1);
}

/// Unsubscribe from a topic.
class Unsubscribe extends $pb.GeneratedMessage {
  factory Unsubscribe({
    $core.String? topic,
  }) {
    final $result = create();
    if (topic != null) {
      $result.topic = topic;
    }
    return $result;
  }
  Unsubscribe._() : super();
  factory Unsubscribe.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Unsubscribe.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Unsubscribe',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'topic')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Unsubscribe clone() => Unsubscribe()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Unsubscribe copyWith(void Function(Unsubscribe) updates) =>
      super.copyWith((message) => updates(message as Unsubscribe))
          as Unsubscribe;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Unsubscribe create() => Unsubscribe._();
  Unsubscribe createEmptyInstance() => create();
  static $pb.PbList<Unsubscribe> createRepeated() => $pb.PbList<Unsubscribe>();
  @$core.pragma('dart2js:noInline')
  static Unsubscribe getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Unsubscribe>(create);
  static Unsubscribe? _defaultInstance;

  /// Topic to unsubscribe from.
  @$pb.TagNumber(1)
  $core.String get topic => $_getSZ(0);
  @$pb.TagNumber(1)
  set topic($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopic() => clearField(1);
}

/// Current storage data at the server.
class Storage extends $pb.GeneratedMessage {
  factory Storage({
    $core.Iterable<MapEntry>? entries,
  }) {
    final $result = create();
    if (entries != null) {
      $result.entries.addAll(entries);
    }
    return $result;
  }
  Storage._() : super();
  factory Storage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Storage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Storage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..pc<MapEntry>(1, _omitFieldNames ? '' : 'entries', $pb.PbFieldType.PM,
        subBuilder: MapEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Storage clone() => Storage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Storage copyWith(void Function(Storage) updates) =>
      super.copyWith((message) => updates(message as Storage)) as Storage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Storage create() => Storage._();
  Storage createEmptyInstance() => create();
  static $pb.PbList<Storage> createRepeated() => $pb.PbList<Storage>();
  @$core.pragma('dart2js:noInline')
  static Storage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Storage>(create);
  static Storage? _defaultInstance;

  /// Storage data entries at the server.
  @$pb.TagNumber(1)
  $core.List<MapEntry> get entries => $_getList(0);
}

/// Storage entry.
class MapEntry extends $pb.GeneratedMessage {
  factory MapEntry({
    $core.String? key,
    MapEntryValue? value,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  MapEntry._() : super();
  factory MapEntry.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MapEntry.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MapEntry',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..aOM<MapEntryValue>(2, _omitFieldNames ? '' : 'value',
        subBuilder: MapEntryValue.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MapEntry clone() => MapEntry()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MapEntry copyWith(void Function(MapEntry) updates) =>
      super.copyWith((message) => updates(message as MapEntry)) as MapEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MapEntry create() => MapEntry._();
  MapEntry createEmptyInstance() => create();
  static $pb.PbList<MapEntry> createRepeated() => $pb.PbList<MapEntry>();
  @$core.pragma('dart2js:noInline')
  static MapEntry getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MapEntry>(create);
  static MapEntry? _defaultInstance;

  /// Storage key.
  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  /// Storage value.
  @$pb.TagNumber(2)
  MapEntryValue get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(MapEntryValue v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  MapEntryValue ensureValue() => $_ensure(1);
}

enum MapEntryValue_Value {
  textValue,
  binaryValue,
  boolValue,
  int32Value,
  int64Value,
  doubleValue,
  floatValue,
  notSet
}

/// Storage value.
class MapEntryValue extends $pb.GeneratedMessage {
  factory MapEntryValue({
    $core.int? listLength,
    $core.Iterable<MapEntryValue>? listValue,
    $core.int? mapLength,
    $core.Iterable<MapEntry>? mapValue,
    $core.String? textValue,
    $core.List<$core.int>? binaryValue,
    $core.bool? boolValue,
    $core.int? int32Value,
    $fixnum.Int64? int64Value,
    $core.double? doubleValue,
    $core.double? floatValue,
  }) {
    final $result = create();
    if (listLength != null) {
      $result.listLength = listLength;
    }
    if (listValue != null) {
      $result.listValue.addAll(listValue);
    }
    if (mapLength != null) {
      $result.mapLength = mapLength;
    }
    if (mapValue != null) {
      $result.mapValue.addAll(mapValue);
    }
    if (textValue != null) {
      $result.textValue = textValue;
    }
    if (binaryValue != null) {
      $result.binaryValue = binaryValue;
    }
    if (boolValue != null) {
      $result.boolValue = boolValue;
    }
    if (int32Value != null) {
      $result.int32Value = int32Value;
    }
    if (int64Value != null) {
      $result.int64Value = int64Value;
    }
    if (doubleValue != null) {
      $result.doubleValue = doubleValue;
    }
    if (floatValue != null) {
      $result.floatValue = floatValue;
    }
    return $result;
  }
  MapEntryValue._() : super();
  factory MapEntryValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MapEntryValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MapEntryValue_Value>
      _MapEntryValue_ValueByTag = {
    6: MapEntryValue_Value.textValue,
    7: MapEntryValue_Value.binaryValue,
    8: MapEntryValue_Value.boolValue,
    9: MapEntryValue_Value.int32Value,
    10: MapEntryValue_Value.int64Value,
    11: MapEntryValue_Value.doubleValue,
    12: MapEntryValue_Value.floatValue,
    0: MapEntryValue_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MapEntryValue',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'unix.preferences.protocol'),
      createEmptyInstance: create)
    ..oo(0, [6, 7, 8, 9, 10, 11, 12])
    ..a<$core.int>(2, _omitFieldNames ? '' : 'listLength', $pb.PbFieldType.O3)
    ..pc<MapEntryValue>(
        3, _omitFieldNames ? '' : 'listValue', $pb.PbFieldType.PM,
        subBuilder: MapEntryValue.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'mapLength', $pb.PbFieldType.O3)
    ..pc<MapEntry>(5, _omitFieldNames ? '' : 'mapValue', $pb.PbFieldType.PM,
        subBuilder: MapEntry.create)
    ..aOS(6, _omitFieldNames ? '' : 'textValue')
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'binaryValue', $pb.PbFieldType.OY)
    ..aOB(8, _omitFieldNames ? '' : 'boolValue')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'int32Value', $pb.PbFieldType.O3)
    ..aInt64(10, _omitFieldNames ? '' : 'int64Value')
    ..a<$core.double>(
        11, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        12, _omitFieldNames ? '' : 'floatValue', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MapEntryValue clone() => MapEntryValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MapEntryValue copyWith(void Function(MapEntryValue) updates) =>
      super.copyWith((message) => updates(message as MapEntryValue))
          as MapEntryValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MapEntryValue create() => MapEntryValue._();
  MapEntryValue createEmptyInstance() => create();
  static $pb.PbList<MapEntryValue> createRepeated() =>
      $pb.PbList<MapEntryValue>();
  @$core.pragma('dart2js:noInline')
  static MapEntryValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MapEntryValue>(create);
  static MapEntryValue? _defaultInstance;

  MapEntryValue_Value whichValue() =>
      _MapEntryValue_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  /// Storage list length (if null, list is not present)
  @$pb.TagNumber(2)
  $core.int get listLength => $_getIZ(0);
  @$pb.TagNumber(2)
  set listLength($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasListLength() => $_has(0);
  @$pb.TagNumber(2)
  void clearListLength() => clearField(2);

  /// Storage list value
  @$pb.TagNumber(3)
  $core.List<MapEntryValue> get listValue => $_getList(1);

  /// Storage map length (if null, map is not present)
  @$pb.TagNumber(4)
  $core.int get mapLength => $_getIZ(2);
  @$pb.TagNumber(4)
  set mapLength($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMapLength() => $_has(2);
  @$pb.TagNumber(4)
  void clearMapLength() => clearField(4);

  /// Storage map value
  @$pb.TagNumber(5)
  $core.List<MapEntry> get mapValue => $_getList(3);

  @$pb.TagNumber(6)
  $core.String get textValue => $_getSZ(4);
  @$pb.TagNumber(6)
  set textValue($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTextValue() => $_has(4);
  @$pb.TagNumber(6)
  void clearTextValue() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get binaryValue => $_getN(5);
  @$pb.TagNumber(7)
  set binaryValue($core.List<$core.int> v) {
    $_setBytes(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBinaryValue() => $_has(5);
  @$pb.TagNumber(7)
  void clearBinaryValue() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get boolValue => $_getBF(6);
  @$pb.TagNumber(8)
  set boolValue($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBoolValue() => $_has(6);
  @$pb.TagNumber(8)
  void clearBoolValue() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get int32Value => $_getIZ(7);
  @$pb.TagNumber(9)
  set int32Value($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasInt32Value() => $_has(7);
  @$pb.TagNumber(9)
  void clearInt32Value() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get int64Value => $_getI64(8);
  @$pb.TagNumber(10)
  set int64Value($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasInt64Value() => $_has(8);
  @$pb.TagNumber(10)
  void clearInt64Value() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get doubleValue => $_getN(9);
  @$pb.TagNumber(11)
  set doubleValue($core.double v) {
    $_setDouble(9, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDoubleValue() => $_has(9);
  @$pb.TagNumber(11)
  void clearDoubleValue() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get floatValue => $_getN(10);
  @$pb.TagNumber(12)
  set floatValue($core.double v) {
    $_setFloat(10, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasFloatValue() => $_has(10);
  @$pb.TagNumber(12)
  void clearFloatValue() => clearField(12);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
