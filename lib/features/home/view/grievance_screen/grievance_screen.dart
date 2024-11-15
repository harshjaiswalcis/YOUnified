import 'package:younified/features/home/view/grievance_screen/grievances_list.dart';
import 'package:younified/utils/exports/common_exports.dart';

class GrievanceScreen extends StatelessWidget {
  const GrievanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          context.strings.grievances,
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
      ),
      body: DefaultTabController(
        length: 2, // Two tabs: Open grievances and Closed grievances
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.grievanceTabBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: 56,
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    dividerColor: Colors.transparent,
                    labelColor: AppColors.tabTextColor,
                    labelStyle: context.textTheme.labelMedium,
                    unselectedLabelColor: AppColors.tabTextColor,
                    unselectedLabelStyle: context.textTheme.labelMedium,
                    indicatorPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                          text:
                              '${context.strings.open} ${context.strings.grievances.toLowerCase()}'),
                      Tab(
                          text:
                              '${context.strings.closed} ${context.strings.grievances.toLowerCase()}'),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  // Open grievances tab content
                  GrievancesList(isOpen: true),
                  // Closed grievances tab content
                  GrievancesList(isOpen: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
