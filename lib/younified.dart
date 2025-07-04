import 'package:younified/utils/exports/common_exports.dart';

class Younified extends StatefulWidget {
  const Younified({super.key});

  @override
  State<Younified> createState() => _YounifiedState();
}

class _YounifiedState extends State<Younified> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    /// FIRST INITIALIZE THE PROVIDERS
    appProvider = context.read();
    homeProvider = context.read();
    feedProvider = context.read();
    unionProvider = context.read();
    messageProvider = context.read();
    documentProvider = context.read();
    servicesProvider = context.read();
    grievanceProvider = context.read();
    settingController = context.read();
    callDetailsProvider = context.read();
    notificationProvider = context.read();
    authenticationProvider = context.read();

    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.index == 1) {
      // Index 1 is FeedScreen
      Provider.of<FeedProvider>(context, listen: false).resetAndRefetchFeeds();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      // backgroundColor: AppColors.cardBgColor,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x4D4468C1), // Shadow color with transparency
                spreadRadius: 0,
                blurRadius: 12,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: AppBar(
            leadingWidth: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Image.asset(
              width: 164,
              AppIcons.cupePNG,
            ),
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
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: ValueListenableBuilder(
        valueListenable: context.appProvider.appNavIndex,
        builder: (_, index, __) {
          return [
            const HomeScreen(),
            const FeedScreen(),
            const ServicesScreen(),
            const SettingScreen(),
          ][index];
        },
      ),
    );
  }
}
