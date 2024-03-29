// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io' as io;

import 'package:unix_preferences/unix_preferences.dart';

/// Example how to share data between a server and clients
void main() => Future<void>(() async {
      // Run a server
      final server = await runServer(serverId: 'Server');

      // Run clients
      final clients = await Future.wait<UnixPreferencesClient>([
        for (var i = 1; i < 4; i++) runClient(clientId: 'Client$i'),
      ]);
      final [c1, c2, c3] = clients;

      Future<void> sleep([int ms = 50]) =>
          Future<void>.delayed(Duration(milliseconds: ms));

      c1['name'] = 'Alice';
      c2['age'] = 12.34;
      c2['friends'] = {'Bob': 34, 'Charlie': 56};
      c3['isAlive'] = true;
      server['items'] = [1, 2, 3, 4, 5];

      await sleep(); // Need to wait for the server

      print('${server.serverId}  data: $server');
      print('${c1.clientId} data: $c1');
      print('${c2.clientId} data: $c2');
      print('${c3.clientId} data: $c3');

      // Close all clients and server
      for (final client in clients) await client.close();
      await server.close();
      io.exit(0);
    });

/// Run a server
Future<UnixPreferencesServer> runServer({String? serverId, String? path}) {
  final server = UnixPreferencesServer(serverId: serverId);
  return server.bind(path: path).then<UnixPreferencesServer>((_) => server);
}

/// Run a client
Future<UnixPreferencesClient> runClient({String? clientId, String? path}) {
  final client = UnixPreferencesClient(clientId: clientId);
  return client.connect(path: path).then<UnixPreferencesClient>((_) => client);
}
