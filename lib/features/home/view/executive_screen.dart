import 'package:younified/utils/exports/common_exports.dart';

class ExecutiveScreen extends StatelessWidget {
  const ExecutiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          context.strings.executives,
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
      body: FutureBuilder(
        future: homeProvider.fetchExecutive(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: AppLoader(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: snapshot.data!.executives.length,
              itemBuilder: (context, index) {
                final executive = snapshot.data!.executives[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    executive.memberData.profile.imageURL),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${executive.memberData.firstName} ${executive.memberData.lastName}',
                                    style: context.textTheme.titleLarge,
                                  ),
                                  Text(
                                    executive.position,
                                    style: context.textTheme.displaySmall!
                                        .copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              if (executive.display.email) ...[
                                Text(
                                  executive.memberData.profile.email,
                                  style: context.textTheme.displaySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              AppColors.skyBlueText),
                                ),
                                const SizedBox(height: 14),
                              ],
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${context.strings.office}:",
                                    style: context.textTheme.headlineLarge,
                                  ),
                                  // Text(
                                  //   executive.memberData.profile.phone
                                  //       ,
                                  //   style: context.textTheme.headlineLarge!
                                  //       .copyWith(fontWeight: FontWeight.w400),
                                  // ),
                                  RichText(
                                    text: TextSpan(
                                      text: executive.memberData.profile.phone,
                                      style: context.textTheme.headlineLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                      children: [
                                        if (executive.display.extension)
                                          TextSpan(
                                            text: ' EXT.${executive.extension}',
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              if (executive.display.mobile) ...[
                                const SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${context.strings.mobile}:",
                                      style: context.textTheme.headlineLarge,
                                    ),
                                    Text(
                                      executive.memberData.profile.phone,
                                      style: context.textTheme.headlineLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("Data is null"),
          );
        },
      ),
    );
  }
}
