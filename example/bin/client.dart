// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io' as io;

import 'package:unix_preferences/unix_preferences.dart';

/// Start a Unix Preferences client
void main() => Future<void>(() async {
      final client = UnixPreferencesClient();
      await client.connect();
      client.addListener((p) => print('< ${p.message}'));
      print('Client: ${client.clientId} is running, press [Ctrl+C] to stop');
      io.ProcessSignal.sigint.watch().listen((_) {
        client.close().ignore();
        print('Client: ${client.clientId} is stopped');
        io.exit(0);
      });
      io.stdin.transform(utf8.decoder).listen((line) {
        print('> $line');
        client.push(line);
      });
    });
