import 'dart:io' as io;

import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

/// Config class
@internal
class Config {
  factory Config() => _internalSingleton;
  Config._internal();
  static final Config _internalSingleton = Config._internal();

  final String unixPreferencesPath =
      io.Platform.environment['UNIX_PREFERENCES_PATH'] ??
          String.fromEnvironment('UNIX_PREFERENCES_PATH',
              defaultValue:
                  p.join(io.Directory.systemTemp.path, 'UnixPreferences.sock'));
}
