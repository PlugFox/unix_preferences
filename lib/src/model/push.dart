/// Callback for messages
typedef OnUnixMessage = void Function(Push push);

/// Push model class
class Push {
  /// Push model class
  Push({
    required this.topic,
    required this.message,
    required this.isBroadcast,
    required this.hasTopic,
  });

  /// The topic of the message, if null, message will be broadcasted.
  final String? topic;

  /// The message to be sent,
  /// can be either String or Uint8List or Map<String, Object?>.
  final Object /* String | Uint8List | Map<String, Object?> */ message;

  /// Whether the message is broadcasted.
  final bool isBroadcast;

  /// Whether the message has a topic.
  final bool hasTopic;
}
