import 'package:younified/features/app_bar_screens/model/notification_model.dart';
import 'package:younified/utils/exports/common_exports.dart';

class NotificationProvider extends ChangeNotifier {
  // Instance member
  List<Map<String, dynamic>> notificationList = [
    {
      'title': 'Lorem ipsum dolor sit amet 1',
      'time': '2023-07-08 09:03:14',
      'isRead': false
    },
    {
      'title': 'Lorem ipsum dolor sit amet 2',
      'time': '2023-07-08 09:03:14',
      'isRead': true
    },
    {
      'title': 'Lorem ipsum dolor sit amet 3',
      'time': '2023-07-08 09:03:14',
      'isRead': true
    },
    {
      'title': 'Lorem ipsum dolor sit amet 4',
      'time': '2023-07-08 09:03:14',
      'isRead': false
    },
  ];

  // Instance member to hold the mapped data
  List<NotificationItem> notificationListData = [];

  // Constructor to initialize notificationListData
  NotificationProvider() {
    notificationListData = notificationList
        .map((mapData) => NotificationItem.fromJson(mapData))
        .toList();
  }

  // Check if there are any unread notifications
  bool hasUnreadNotifications() {
    return notificationList.any((notification) => !notification['isRead']);
  }

  // Delete Notification
  void deleteNotification(int index) {
    notificationList.removeAt(index);
    notificationListData.removeAt(index);
    notifyListeners();
  }

  // All Notification Read at one time
  void markAllAsRead() {
    notificationList = notificationListData
        .map((notification) => notification.toJson())
        .toList();
    notificationList = notificationList.map((notification) {
      notification['isRead'] = true;
      return notification;
    }).toList();
    notificationListData = notificationList
        .map((mapData) => NotificationItem.fromJson(mapData))
        .toList();
    notifyListeners();
  }
}
