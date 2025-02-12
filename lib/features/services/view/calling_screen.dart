import 'package:younified/utils/exports/common_exports.dart';
import 'package:url_launcher/url_launcher.dart';

class CallingScreen extends StatelessWidget {
  const CallingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CallingModel> callingListData = ServicesProvider.callingListData;

    makingPhoneCall(String phone) async {
      var url = Uri.parse("tel:$phone");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: CommonAppBar(title: context.strings.clickToCall),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: callingListData.length,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      callingListData[index].callingTitle,
                      style: context.textTheme.headlineLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.strings.startsOn,
                                style: context.textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                              Text(
                                servicesProvider.formatDateString(
                                    callingListData[index]
                                        .startDate
                                        .toString()),
                                style: context.textTheme.bodySmall!
                                    .copyWith(color: AppColors.replyTextGround),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.strings.endsOn,
                                style: context.textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                              Text(
                                servicesProvider.formatDateString(
                                    callingListData[index].endDate.toString()),
                                style: context.textTheme.bodySmall!
                                    .copyWith(color: AppColors.replyTextGround),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 56.0,
                            child: ElevatedButton(
                                onPressed: () {
                                  // context.pushNamed(Routes.app);
                                  makingPhoneCall(
                                      callingListData[index].phoneNumber);
                                },
                                child: Text(
                                    "${context.strings.call} ${callingListData[index].phoneNumber}")),
                          ),
                        ),
                      ],
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
