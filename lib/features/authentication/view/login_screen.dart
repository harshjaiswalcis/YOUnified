import 'package:flutter/gestures.dart';
import 'package:younified/features/authentication/view/forms/login_form.dart';
import 'package:younified/utils/exports/common_exports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final unionName = StorageServices.getString('unionName') ?? '';
    final imageURL = StorageServices.getString('imageURL') ?? '';

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.07.getScreenWidth),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 0.08.getScreenHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.2.getScreenWidth),
                child: Image.network(
                  imageURL,
                  fit: BoxFit.fill,
                  height: 50,
                  width: 180,
                ),
              ),
              const SizedBox(height: 40),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x524468C1),
                      offset: Offset(0, 40),
                      blurRadius: 44,
                      spreadRadius: -20,
                    ),
                  ],
                ),
                child: LoginForm(unionName: unionName),
              ),
              SizedBox(height: 0.05.getScreenHeight),
              GestureDetector(
                onTap: () {
                  StorageServices.delete('unionId');
                  context.pushNamedAndRemoveUntil(Routes.unionEnterance);
                },
                child: Text(
                  context.strings.changeUnion,
                  style: context.textTheme.headlineLarge!.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.themeColor,
                    decorationColor: AppColors.themeColor,
                  ),
                ),
              ),
              SizedBox(height: 0.05.getScreenHeight),
            ],
          ),
        ),
      ),
    );
  }
}
