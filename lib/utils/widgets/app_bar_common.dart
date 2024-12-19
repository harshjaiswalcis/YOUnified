import 'package:younified/utils/exports/common_exports.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CommonAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
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
        InkWell(
          onTap: () => context.pushNamed(Routes.notificationScreen),
          child: Stack(
            children: [
              SvgPicture.asset(AppIcons.bell), // Bell Icon
              Positioned(
                right: 0,
                top: 0,
                child: Consumer<NotificationProvider>(
                  builder: (context, provider, child) {
                    bool hasUnread = provider.notificationList.any(
                      (notification) => !notification['isRead'],
                    );
                    return hasUnread
                        ? Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 8,
                                minHeight: 8,
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 26),
        InkWell(
          onTap: () => context.pushNamed(Routes.messageScreen),
          child: SvgPicture.asset(AppIcons.notification),
        ),
        const SizedBox(width: 26),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
