/// Callback for messages
typedef OnUnixMessage = void Function(Push push);

/// Push model class
class Push {
  /// Push model class
  Push({
    required this.topic,
    required this.message,
    required this.isText,
    required this.isBinary,
    required this.isBroadcast,
    required this.hasTopic,
  });

  /// The topic of the message, if null, message will be broadcasted.
  final String? topic;

  /// The message to be sent, can be either String or Uint8List.
  final Object /*String|Uint8List*/ message;

  /// Whether the message is a text message.
  final bool isText;

  /// Whether the message is a binary message.
  final bool isBinary;

  /// Whether the message is broadcasted.
  final bool isBroadcast;

  ///
  final bool hasTopic;
}
