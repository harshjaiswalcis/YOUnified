import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/features/authentication/view/forms/union_form.dart';

class UnionEnterance extends StatelessWidget {
  const UnionEnterance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.07.getScreenWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.2.getScreenWidth),
              child: SvgPicture.asset(
                AppIcons.splashTitle,
                height: 24,
                width: 164,
              ),
            ),
            const SizedBox(height: 40),
            const UnionForm(),
          ],
        ),
      ),
    );
  }
}
