// lib/features/election/widgets/election_stepper_scaffold.dart
import 'package:younified/utils/exports/common_exports.dart';
import '../constants/election_constants.dart';

class ElectionStepperScaffold extends StatelessWidget {
  final int currentStep;
  final Widget child;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final String? nextButtonText;
  final bool showBackButton;

  const ElectionStepperScaffold({
    super.key,
    required this.currentStep,
    required this.child,
    required this.onBack,
    required this.onNext,
    this.nextButtonText = 'Next',
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressIndicator(context),
              _buildQuestionHeader(context),
              Expanded(child: child),
            ],
          ),
          _buildBottomButtons(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        ElectionConstants.appBarTitle,
        style: context.textTheme.headlineLarge,
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: onBack,
        ),
      ),
      leadingWidth: 30,
      elevation: 0,
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF1F2F6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: '$currentStep/${ElectionConstants.totalSteps} ',
                style: context.textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: ElectionConstants.questionsText,
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: currentStep / ElectionConstants.totalSteps,
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
              color: AppColors.greenContainerbg,
              backgroundColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ElectionConstants.questions[currentStep] ?? '',
            style: context.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            ElectionConstants.selectionHints[currentStep] ?? '',
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Positioned(
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
        child: SizedBox(
          width: 1.0.getScreenWidth,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (showBackButton)
                  SizedBox(
                    height: 45,
                    child: OutlinedButton(
                      onPressed: onBack,
                      style: ButtonStyle(
                        side: WidgetStateProperty.all(
                          const BorderSide(color: AppColors.themeColor),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text('Back'),
                      ),
                    ),
                  ),
                SizedBox(
                  height: showBackButton ? 45 : 50,
                  child: ElevatedButton(
                    onPressed: onNext,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              showBackButton ? 24.0 : 0.3.getScreenWidth),
                      child: Text(nextButtonText!),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
