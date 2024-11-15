import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:younified/utils/exports/common_exports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          context.strings.notifications,
          style: context.textTheme.headlineLarge,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
        ),
        leadingWidth: 30,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              notificationProvider
                  .markAllAsRead();
            },
            child: Text(
              context.strings.readall,
              style: context.textTheme.labelSmall,
            ),
          ),
        ],
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, notificationProvider, child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: notificationProvider.notificationListData.length,
            itemBuilder: (context, index) {
              final notification =
                  notificationProvider.notificationListData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Slidable(
                  key: ValueKey(notification.title),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) =>
                            notificationProvider.deleteNotification(index),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blueIconColor.withOpacity(0.12),
                          spreadRadius: 2,
                          blurRadius: 30,
                          offset: const Offset(0, 17),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 12,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: notification.isRead
                                ? Colors.transparent
                                : AppColors.blueIconColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  notification.title,
                                  style: context.textTheme.labelMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  notification.time,
                                  style: context.textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
