import 'dart:async';
import 'package:younified/utils/exports/common_exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final unionId = StorageServices.getString('unionId');
    final token = StorageServices.getString('token');
    // checkIsActive();
    Timer(const Duration(seconds: 3), () {
      if (unionId != null && token != null) {
        context.pushNamedAndRemoveUntil(Routes.app);
      } else if (unionId != null) {
        context.pushNamedAndRemoveUntil(Routes.loginScreen);
      } else {
        context.pushNamedAndRemoveUntil(Routes.unionEnterance);
      }
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 3), () {
  //     context.pushNamedAndRemoveUntil(Routes.unionEnterance);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backGround,
      body: Center(
        child: SvgPicture.asset(AppIcons.splashTitle),
      ),
    );
  }
}
