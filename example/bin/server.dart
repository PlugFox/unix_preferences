// ignore_for_file: avoid_print

import 'dart:io' as io;

import 'package:unix_preferences/unix_preferences.dart';

/// Start a Unix Preferences server
void main() => Future<void>(() async {
      final server = UnixPreferencesServer();
      await server.bind();
      print('Server: ${server.serverId} is running, press [Ctrl+C] to stop');
      io.ProcessSignal.sigint.watch().listen((_) {
        server.close().ignore();
        print('Server: ${server.serverId} is stopped');
        io.exit(0);
      });
    });
