class ChatMessage {
  final int id;
  final String senderName;
  final String time;
  final String replyMessage;

  ChatMessage({
    required this.id,
    required this.senderName,
    required this.time,
    required this.replyMessage,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderName: json['senderName'],
      time: json['time'],
      replyMessage: json['replymessage'],
    );
  }
}
