# unix_preferences

Shared preferences between multiple Dart instances.
This package provides a simple way to share preferences between multiple Dart instances.
It uses a Unix domain socket (IPC) to communicate between the instances.

A Unix domain socket aka UDS or IPC socket (inter-process communication socket)
is a data communications endpoint for exchanging data between processes executing on the same host operating system.

## Usage

Create a server instance and bind it to a Unix Domain Socket.

```dart
final server = UnixPreferencesServer();
await server.bind(); // Bind to a Unix Domain Socket
```

Then create a client instance and connect to the server.

```dart
final client = UnixPreferencesClient();
await client.connect(); // Connect to the server
```

And now you can use the client to get and set preferences.

```dart
client['key'] = 'value'; // Set a preference any JSON serializable value or Uint8List
client.push('Hellow world'); // Push a message (String / Uint8List / Map<String, Object?>)
```
