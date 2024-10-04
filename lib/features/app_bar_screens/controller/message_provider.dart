import 'package:intl/intl.dart';
import 'package:younified/features/app_bar_screens/model/message_item.dart';
import 'package:younified/utils/exports/common_exports.dart';

class MessageProvider extends ChangeNotifier {
  // Instance member
  List<Map<String, dynamic>> messageList = [
  {
    'name': 'John Doe',
    'message': 'Hey, how are you?',
    'time': '2023-09-27 09:03:14',
    'isRead': false,
    'avatarUrl': 'https://api.multiavatar.com/Binx Bond.png',
  },
  {
    'name': 'Jane Smith',
    'message': 'Let’s catch up tomorrow!',
    'time': '2023-09-27 08:45:10',
    'isRead': true,
    'avatarUrl': 'https://api.multiavatar.com/Binx Bond.png',
  },
  {
    'name': 'Emily Johnson',
    'message': 'Can you send me the report?',
    'time': '2023-09-27 08:15:00',
    'isRead': true,
    'avatarUrl': 'https://api.multiavatar.com/Binx Bond.png',
  },
  {
    'name': 'Michael Brown',
    'message': 'Meeting postponed to 4 PM.',
    'time': '2024-09-26 17:30:00',
    'isRead': false,
    'avatarUrl': 'https://api.multiavatar.com/Binx Bond.png',
  },
  {
    'name': 'Olivia Davis',
    'message': 'Happy Birthday! Have a great day!',
    'time': '2023-09-26 10:20:30',
    'isRead': true,
    'avatarUrl': 'https://api.multiavatar.com/Binx Bond.png',
  },
];

  // Instance member to hold the mapped data
  List<MessageItem> messageListData = [];

  // Constructor to initialize messageListData
  MessageProvider() {
    messageListData = messageList
        .map((mapData) => MessageItem.fromJson(mapData))
        .toList();
  }

  String calculateHoursAgo(String pastTimeString) {
    DateTime pastTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(pastTimeString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(pastTime);
    if (difference.inMinutes < 60) {
      // Less than 1 hour, return in minutes
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      // Less than 24 hours, return in hours
      return '${difference.inHours} hours ago';
    } else {
      // More than 24 hours, return in days
      return '${difference.inDays} days ago';
    }
    // return difference.inHours;
  }

  // Check if there are any unread notifications
  bool hasUnreadNotifications() {
    return messageList.any((notification) => !notification['isRead']);
  }

  // Delete Notification
  void deleteNotification(int index) {
    messageList.removeAt(index);
    messageListData.removeAt(index);
    notifyListeners();
  }

  // All Notification Read at one time
  void markAllAsRead() {
    messageList = messageListData
        .map((notification) => notification.toJson())
        .toList();
    messageList = messageList.map((notification) {
      notification['isRead'] = true;
      return notification;
    }).toList();
    messageListData = messageList
        .map((mapData) => MessageItem.fromJson(mapData))
        .toList();
    notifyListeners();
  }
}
