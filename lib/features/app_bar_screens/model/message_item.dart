class MessageItem {
  final String name;
  final String message;
  final String time;
  final bool isRead;
  final String avatarUrl;

  MessageItem({
    required this.name,
    required this.message,
    required this.time,
    required this.isRead,
    required this.avatarUrl,
  });

  // Factory constructor to create a MessageItem from a Map (JSON)
  factory MessageItem.fromJson(Map<String, dynamic> json) {
    return MessageItem(
      name: json['name'],
      message: json['message'],
      time: json['time'],
      isRead: json['isRead'],
      avatarUrl: json['avatarUrl'],
    );
  }

  // Method to convert a MessageItem into a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      'time': time,
      'isRead': isRead,
      'avatarUrl': avatarUrl,
    };
  }
}
