class NotificationItem {
  final String title;
  final String time;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.time,
    required this.isRead,
  });

  // Factory method to create an instance from JSON
  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      title: json['title'],
      time: json['time'],
      isRead: json['isRead'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'time': time,
      'isRead': isRead,
    };
  }
}
