import 'package:younified/utils/exports/common_exports.dart';

class ElectionSummaryScreen extends StatelessWidget {
  const ElectionSummaryScreen({super.key});

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredBox(
                color: const Color(0xFFF1F2F6),
                child: SizedBox(
                  width: 1.0.getScreenWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 24.0),
                    child: Text(
                      'Summary',
                      style: context.textTheme.headlineMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              colorListTile(
                  context: context, title: '1. Favourite color?', data: 'Blue'),
              const SizedBox(height: 16),
              colorListTile(
                  context: context,
                  title: '2. Favourite Season?',
                  data: 'Winter'),
              const SizedBox(height: 16),
              colorListTile(
                  context: context,
                  title: '3. Favourite color combo?',
                  data: 'yellow'),
              const SizedBox(height: 16),
            ],
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
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                AppColors.greenContainerbg)),
                        onPressed: () {
                          // Handle back button press
                          context.pushNamed(Routes.receiptScreen);
                        },
                        child: const Text('Submit'),
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
                        child: const Text('Change Selection'),
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
