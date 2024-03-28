import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:unix_preferences/src/protobuf/api.pb.dart' as api;

/*
  message MapEntry {
      string key = 1;
      MapEntryValue value = 2;
  }
  message MapEntryValue {
      int32 list_length = 2;
      repeated MapEntryValue list_value = 3;
      int32 map_length = 4;
      repeated MapEntry map_value = 5;
      oneof value {
          string text_value = 6;
          bytes binary_value = 7;
          bool bool_value = 8;
          int32 int32_value = 9;
          int64 int64_value = 10;
          double double_value = 11;
          float float_value = 12;
      }
  }
*/

/// Map<String, Object?> <--> List<api.MapEntry> codec
@internal
final class StorageCodec
    extends Codec<Map<String, Object?>, List<api.MapEntry>> {
  /// Map<String, Object?> <--> List<api.MapEntry> codec
  const StorageCodec();

  @override
  Converter<Map<String, Object?>, List<api.MapEntry>> get encoder =>
      const StorageEncoder();

  @override
  Converter<List<api.MapEntry>, Map<String, Object?>> get decoder =>
      const StorageDecoder();
}

/// Encode a map entries
@internal
final class StorageEncoder
    extends Converter<Map<String, Object?>, List<api.MapEntry>> {
  /// Encode a map entries
  const StorageEncoder();

  /// Encode a map entry value
  static api.MapEntryValue _$encodeMapEntryValue(Object? value) {
    final entry = api.MapEntryValue();
    if (value is String) {
      entry.textValue = value;
    } else if (value is List) {
      entry.listValue.addAll(value.map(_$encodeMapEntryValue));
    } else if (value is Map) {
      entry.mapValue.addAll(const StorageEncoder().convert({
        for (final entry in value.entries)
          if (entry.key case String key) key: entry.value
      }));
    } else if (value is bool) {
      entry.boolValue = value;
    } else if (value is int) {
      entry.int32Value = value;
    } else if (value is double) {
      entry.doubleValue = value;
    } else if (value is num) {
      entry.floatValue = value.toDouble();
    } else if (value is api.MapEntryValue) {
      return value;
    }
    return entry;
  }

  @override
  List<api.MapEntry> convert(Map<String, Object?> input) => input.entries
      .map<api.MapEntry>((entry) => api.MapEntry()
        ..key = entry.key
        ..value = _$encodeMapEntryValue(entry.value))
      .toList(growable: false);
}

/// Decode a map entries
@internal
final class StorageDecoder
    extends Converter<List<api.MapEntry>, Map<String, Object?>> {
  /// Decode a map entries
  const StorageDecoder();

  /// Decode a map entry value
  static Object? _$decodeMapEntryValue(api.MapEntryValue value) {
    if (value.hasTextValue()) {
      return value.textValue;
    } else if (value.hasBinaryValue()) {
      return value.binaryValue;
    } else if (value.hasInt64Value()) {
      return value.int64Value;
    } else if (value.hasFloatValue()) {
      return value.floatValue;
    } else if (value.hasBoolValue()) {
      return value.boolValue;
    } else if (value.hasInt32Value()) {
      return value.int32Value;
    } else if (value.hasDoubleValue()) {
      return value.doubleValue;
    } else if (value.hasMapLength()) {
      return const StorageDecoder().convert(value.mapValue);
    } else if (value.hasListLength()) {
      return value.listValue.map(_$decodeMapEntryValue).toList(growable: false);
    } else {
      return null;
    }
  }

  @override
  Map<String, Object?> convert(List<api.MapEntry> input) => <String, Object?>{
        for (final entry in input)
          if (entry.hasKey())
            entry.key:
                entry.hasValue() ? _$decodeMapEntryValue(entry.value) : null
      };
}
