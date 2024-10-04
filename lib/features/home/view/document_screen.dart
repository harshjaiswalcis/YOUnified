import 'package:cached_network_image/cached_network_image.dart';
import 'package:younified/utils/exports/common_exports.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        // appBar: AppBar(
        //   title: Text('Documents'),
        //   bottom: TabBar(
        //     tabs: [
        //       Tab(text: 'YOUunified tutorials'),
        //       Tab(text: 'VOIP'),
        //       Tab(text: 'General'),
        //     ],
        //   ),
        // ),
        appBar: AppBar(
          title: Text(
            context.strings.documents,
            style: context.textTheme.headlineLarge,
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: ColoredBox(
              color: AppColors.tabbackGround,
              child: SizedBox(
                height: 60,
                child: TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  tabAlignment: TabAlignment.start,
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF34519A),
                        width: 3,
                      ),
                    ),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'YOUunified tutorials'),
                    Tab(text: 'VOIP'),
                    Tab(text: 'General'),
                  ],
                ),
              ),
            ),
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
          backgroundColor: AppColors.backGround,
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
        body: TabBarView(
          children: [
            buildDocumentList(),
            Center(child: Text('VOIP content here')),
            Center(child: Text('General content here')),
          ],
        ),
      ),
    );
  }

  Widget buildDocumentList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blueIconColor.withOpacity(0.12),
                    spreadRadius: 2,
                    blurRadius: 30,
                    offset: const Offset(0, 17),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: ListTile(
                  // leading: doc['type'] == 'SVG'
                  //     ? SvgPicture.asset(doc['icon'], width: 40, height: 40)
                  //     : Image.asset(doc['icon'], width: 40, height: 40),
                  leading: SvgPicture.asset(AppIcons.jpg),
                  title: Text("Screenshot_2365.jpg", style: context.textTheme.labelMedium!.copyWith(color: AppColors.documentListTileColor),),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
