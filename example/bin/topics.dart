// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io' as io;

import 'package:unix_preferences/unix_preferences.dart';

/// Example how to send messages between a server and clients
void main() => Future<void>(() async {
      // Run a server
      final server = await runServer(serverId: 'Server');

      // Run clients
      final clients = await Future.wait<UnixPreferencesClient>([
        for (var i = 1; i < 4; i++) runClient(clientId: 'Client$i'),
      ]);
      final [c1, c2, c3] = clients;

      // Listen to all clients broadcast messages
      for (final client in clients) {
        client.addListener(
          (p) => print('${client.clientId}#Global: ${p.message}'),
        );
      }

      Future<void> sleep([int ms = 50]) =>
          Future<void>.delayed(Duration(milliseconds: ms));

      // Listen chat messages only for Client#1
      c1.addListener(
        (p) => print('${c1.clientId}#Chat: ${p.message}'),
        topic: 'chat',
      );

      await sleep(); // Need to wait for the server

      // Push from Client#3 to all clients without topic
      c3.push('Hello, World!');

      await sleep(); // Need to wait for the server

      // Push from Client#2 to all clients with topic "chat"
      c2.push('Hello, Chat!', topic: 'chat');

      await sleep(); // Need to wait for the server

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
