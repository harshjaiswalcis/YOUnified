import 'package:younified/utils/exports/common_exports.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          "Election Name",
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
      ),
      body: Stack(
        children: [
          SizedBox(
            width: 1.0.getScreenWidth,
            height: 1.0.getScreenHeight,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.12.getScreenHeight, horizontal: 24),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.1.getScreenHeight,
                          horizontal: 0.18.getScreenWidth),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: AppColors.greenLightbg,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.greenContainerbg,
                              child: SvgPicture.asset(AppIcons.checkIcon),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            context.strings.allDone,
                            style: context.textTheme.titleLarge!
                                .copyWith(color: AppColors.greenContainerbg),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            context.strings.yourReceiptIDIs,
                            style: context.textTheme.labelMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "asdfg-asdasdg-asdg-sfg-asgasg-sfgdfg-fgafg",
                            textAlign: TextAlign.center,
                            style: context.textTheme.labelMedium!
                                .copyWith(color: AppColors.replyTextGround),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -2),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 66,
                    width: 1.0.getScreenWidth,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle back button press
                          // context.pushNamed(Routes.electionStepperSecond);
                        },
                        child: Text(context.strings.finish),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 1.0.getScreenWidth,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 16),
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle back button press
                        },
                        style: ButtonStyle(
                          side: WidgetStateProperty.all(
                              const BorderSide(color: AppColors.themeColor)),
                        ),
                        child: Text(context.strings.sendEmail),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column colorListTile(
      {required BuildContext context,
      required String title,
      required String data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: context.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  data,
                  style: context.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
