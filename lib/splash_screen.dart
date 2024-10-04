import 'dart:async';
import 'package:younified/utils/exports/common_exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   final bool isLogin = authenticationProvider.isLogged();
  //   // checkIsActive();
  //   Timer(const Duration(seconds: 3), () {
  //     if (isLogin) {
  //       checkIsActive()
  //           .then((_) => context.pushNamedAndRemoveUntil(Routes.app));
  //     } else {
  //       context.pushNamedAndRemoveUntil(Routes.languageScreen);
  //     }
  //   });
  // }
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.pushNamedAndRemoveUntil(Routes.unionEnterance);
    });
  }

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