import 'package:younified/utils/exports/common_exports.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<VotingModel> votingListData = ServicesProvider.votingListData;
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          context.strings.voting,
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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: votingListData.length,
        itemBuilder: (context, index) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      votingListData[index].electionName,
                      style: context.textTheme.headlineLarge!.copyWith(
                        fontWeight: votingListData[index].votingOpen
                            ? FontWeight.w600
                            : FontWeight.w700,
                        fontSize: votingListData[index].votingOpen ? 16 : 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${context.strings.endsIn} ${votingListData[index].endsInDays} ${context.strings.days}  | ${servicesProvider.formatDateString(votingListData[index].endDate)}",
                      style: context.textTheme.labelLarge,
                    ),
                    SizedBox(height: votingListData[index].votingOpen ? 12 : 6),
                    votingListData[index].votingOpen
                        ? Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 56.0,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        context.pushNamed(
                                            Routes.electionStepperFirst);
                                      },
                                      child: Text(context.strings.vote)),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            "${context.strings.receiptID}${votingListData[index].receiptId}",
                            style: context.textTheme.labelLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
