//
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use commandDescriptor instead')
const Command$json = {
  '1': 'Command',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'client', '3': 2, '4': 1, '5': 9, '10': 'client'},
    {
      '1': 'ping',
      '3': 101,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.Ping',
      '10': 'ping'
    },
    {
      '1': 'update',
      '3': 102,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.Update',
      '10': 'update'
    },
    {
      '1': 'push',
      '3': 103,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.Push',
      '10': 'push'
    },
    {
      '1': 'subscribe',
      '3': 105,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.Subscribe',
      '10': 'subscribe'
    },
    {
      '1': 'unsubscribe',
      '3': 106,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.Unsubscribe',
      '10': 'unsubscribe'
    },
  ],
  '9': [
    {'1': 3, '2': 101},
  ],
};

/// Descriptor for `Command`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commandDescriptor = $convert.base64Decode(
    'CgdDb21tYW5kEg4KAmlkGAEgASgEUgJpZBIWCgZjbGllbnQYAiABKAlSBmNsaWVudBIzCgRwaW'
    '5nGGUgASgLMh8udW5peC5wcmVmZXJlbmNlcy5wcm90b2NvbC5QaW5nUgRwaW5nEjkKBnVwZGF0'
    'ZRhmIAEoCzIhLnVuaXgucHJlZmVyZW5jZXMucHJvdG9jb2wuVXBkYXRlUgZ1cGRhdGUSMwoEcH'
    'VzaBhnIAEoCzIfLnVuaXgucHJlZmVyZW5jZXMucHJvdG9jb2wuUHVzaFIEcHVzaBJCCglzdWJz'
    'Y3JpYmUYaSABKAsyJC51bml4LnByZWZlcmVuY2VzLnByb3RvY29sLlN1YnNjcmliZVIJc3Vic2'
    'NyaWJlEkgKC3Vuc3Vic2NyaWJlGGogASgLMiYudW5peC5wcmVmZXJlbmNlcy5wcm90b2NvbC5V'
    'bnN1YnNjcmliZVILdW5zdWJzY3JpYmVKBAgDEGU=');

@$core.Deprecated('Use replyDescriptor instead')
const Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'server', '3': 2, '4': 1, '5': 9, '10': 'server'},
    {
      '1': 'pong',
      '3': 101,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.Pong',
      '10': 'pong'
    },
    {
      '1': 'storage',
      '3': 102,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.Storage',
      '10': 'storage'
    },
    {
      '1': 'push',
      '3': 103,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.Push',
      '10': 'push'
    },
  ],
  '9': [
    {'1': 3, '2': 101},
  ],
};

/// Descriptor for `Reply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyDescriptor = $convert.base64Decode(
    'CgVSZXBseRIOCgJpZBgBIAEoBFICaWQSFgoGc2VydmVyGAIgASgJUgZzZXJ2ZXISMwoEcG9uZx'
    'hlIAEoCzIfLnVuaXgucHJlZmVyZW5jZXMucHJvdG9jb2wuUG9uZ1IEcG9uZxI8CgdzdG9yYWdl'
    'GGYgASgLMiIudW5peC5wcmVmZXJlbmNlcy5wcm90b2NvbC5TdG9yYWdlUgdzdG9yYWdlEjMKBH'
    'B1c2gYZyABKAsyHy51bml4LnByZWZlcmVuY2VzLnByb3RvY29sLlB1c2hSBHB1c2hKBAgDEGU=');

@$core.Deprecated('Use pingDescriptor instead')
const Ping$json = {
  '1': 'Ping',
};

/// Descriptor for `Ping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingDescriptor = $convert.base64Decode('CgRQaW5n');

@$core.Deprecated('Use pongDescriptor instead')
const Pong$json = {
  '1': 'Pong',
};

/// Descriptor for `Pong`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pongDescriptor = $convert.base64Decode('CgRQb25n');

@$core.Deprecated('Use pushDescriptor instead')
const Push$json = {
  '1': 'Push',
  '2': [
    {'1': 'topic', '3': 101, '4': 1, '5': 9, '10': 'topic'},
    {'1': 'text_data', '3': 102, '4': 1, '5': 9, '9': 0, '10': 'textData'},
    {'1': 'binary_data', '3': 103, '4': 1, '5': 12, '9': 0, '10': 'binaryData'},
  ],
  '8': [
    {'1': 'data'},
  ],
  '9': [
    {'1': 1, '2': 101},
  ],
};

/// Descriptor for `Push`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pushDescriptor = $convert.base64Decode(
    'CgRQdXNoEhQKBXRvcGljGGUgASgJUgV0b3BpYxIdCgl0ZXh0X2RhdGEYZiABKAlIAFIIdGV4dE'
    'RhdGESIQoLYmluYXJ5X2RhdGEYZyABKAxIAFIKYmluYXJ5RGF0YUIGCgRkYXRhSgQIARBl');

@$core.Deprecated('Use updateDescriptor instead')
const Update$json = {
  '1': 'Update',
  '2': [
    {
      '1': 'upsert',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.unix.preferences.protocol.MapEntry',
      '10': 'upsert'
    },
  ],
};

/// Descriptor for `Update`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDescriptor = $convert.base64Decode(
    'CgZVcGRhdGUSOwoGdXBzZXJ0GAEgAygLMiMudW5peC5wcmVmZXJlbmNlcy5wcm90b2NvbC5NYX'
    'BFbnRyeVIGdXBzZXJ0');

@$core.Deprecated('Use subscribeDescriptor instead')
const Subscribe$json = {
  '1': 'Subscribe',
  '2': [
    {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
  ],
};

/// Descriptor for `Subscribe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeDescriptor =
    $convert.base64Decode('CglTdWJzY3JpYmUSFAoFdG9waWMYASABKAlSBXRvcGlj');

@$core.Deprecated('Use unsubscribeDescriptor instead')
const Unsubscribe$json = {
  '1': 'Unsubscribe',
  '2': [
    {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
  ],
};

/// Descriptor for `Unsubscribe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unsubscribeDescriptor =
    $convert.base64Decode('CgtVbnN1YnNjcmliZRIUCgV0b3BpYxgBIAEoCVIFdG9waWM=');

@$core.Deprecated('Use storageDescriptor instead')
const Storage$json = {
  '1': 'Storage',
  '2': [
    {
      '1': 'entries',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.unix.preferences.protocol.MapEntry',
      '10': 'entries'
    },
  ],
};

/// Descriptor for `Storage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storageDescriptor = $convert.base64Decode(
    'CgdTdG9yYWdlEj0KB2VudHJpZXMYASADKAsyIy51bml4LnByZWZlcmVuY2VzLnByb3RvY29sLk'
    '1hcEVudHJ5UgdlbnRyaWVz');

@$core.Deprecated('Use mapEntryDescriptor instead')
const MapEntry$json = {
  '1': 'MapEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.unix.preferences.protocol.MapEntryValue',
      '10': 'value'
    },
  ],
};

/// Descriptor for `MapEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mapEntryDescriptor = $convert.base64Decode(
    'CghNYXBFbnRyeRIQCgNrZXkYASABKAlSA2tleRI+CgV2YWx1ZRgCIAEoCzIoLnVuaXgucHJlZm'
    'VyZW5jZXMucHJvdG9jb2wuTWFwRW50cnlWYWx1ZVIFdmFsdWU=');

@$core.Deprecated('Use mapEntryValueDescriptor instead')
const MapEntryValue$json = {
  '1': 'MapEntryValue',
  '2': [
    {'1': 'list_length', '3': 2, '4': 1, '5': 5, '10': 'listLength'},
    {
      '1': 'list_value',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.unix.preferences.protocol.MapEntryValue',
      '10': 'listValue'
    },
    {'1': 'map_length', '3': 4, '4': 1, '5': 5, '10': 'mapLength'},
    {
      '1': 'map_value',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.unix.preferences.protocol.MapEntry',
      '10': 'mapValue'
    },
    {'1': 'text_value', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'textValue'},
    {'1': 'binary_value', '3': 7, '4': 1, '5': 12, '9': 0, '10': 'binaryValue'},
    {'1': 'bool_value', '3': 8, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    {'1': 'int32_value', '3': 9, '4': 1, '5': 5, '9': 0, '10': 'int32Value'},
    {'1': 'int64_value', '3': 10, '4': 1, '5': 3, '9': 0, '10': 'int64Value'},
    {'1': 'double_value', '3': 11, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    {'1': 'float_value', '3': 12, '4': 1, '5': 2, '9': 0, '10': 'floatValue'},
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `MapEntryValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mapEntryValueDescriptor = $convert.base64Decode(
    'Cg1NYXBFbnRyeVZhbHVlEh8KC2xpc3RfbGVuZ3RoGAIgASgFUgpsaXN0TGVuZ3RoEkcKCmxpc3'
    'RfdmFsdWUYAyADKAsyKC51bml4LnByZWZlcmVuY2VzLnByb3RvY29sLk1hcEVudHJ5VmFsdWVS'
    'CWxpc3RWYWx1ZRIdCgptYXBfbGVuZ3RoGAQgASgFUgltYXBMZW5ndGgSQAoJbWFwX3ZhbHVlGA'
    'UgAygLMiMudW5peC5wcmVmZXJlbmNlcy5wcm90b2NvbC5NYXBFbnRyeVIIbWFwVmFsdWUSHwoK'
    'dGV4dF92YWx1ZRgGIAEoCUgAUgl0ZXh0VmFsdWUSIwoMYmluYXJ5X3ZhbHVlGAcgASgMSABSC2'
    'JpbmFyeVZhbHVlEh8KCmJvb2xfdmFsdWUYCCABKAhIAFIJYm9vbFZhbHVlEiEKC2ludDMyX3Zh'
    'bHVlGAkgASgFSABSCmludDMyVmFsdWUSIQoLaW50NjRfdmFsdWUYCiABKANIAFIKaW50NjRWYW'
    'x1ZRIjCgxkb3VibGVfdmFsdWUYCyABKAFIAFILZG91YmxlVmFsdWUSIQoLZmxvYXRfdmFsdWUY'
    'DCABKAJIAFIKZmxvYXRWYWx1ZUIHCgV2YWx1ZQ==');
