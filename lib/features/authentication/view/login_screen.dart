import 'package:flutter/gestures.dart';
import 'package:younified/utils/exports/common_exports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.backGround,
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.07.getScreenWidth),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.1.getScreenHeight,
            left: 0.3.getScreenWidth,
            child: Text(
              context.strings.changeUnion,
              style: context.textTheme.headlineLarge!.copyWith(
                decoration: TextDecoration.underline,
                color: AppColors.themeColor,
                decorationColor: AppColors.themeColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.2.getScreenWidth),
                child: Image.asset(
                  AppIcons.cupePNG,
                  height: 24,
                  width: 164,
                ),
              ),
              const SizedBox(height: 40),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(
                          0x524468C1), // 0x52 is the alpha value for 32% opacity
                      offset: Offset(0, 40), // The x and y offset of the shadow
                      blurRadius: 44, // The blur radius of the shadow
                      spreadRadius: -20, // The spread radius of the shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 36),
                    Text(
                      context.strings.logintoyouraccount,
                      style: context.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        // controller: emailController,
                        style: context.textTheme.titleMedium,
                        decoration: InputDecoration(hintText: context.strings.login),
                        // textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(' ')),
                        ],
                        // validator: (value) {
                        //   if (value == null) {
                        //     return context.strings.pleaseEnterEmail;
                        //   } else if (!RegExp(Validations.emailPattern)
                        //       .hasMatch(value)) {
                        //     return context
                        //         .strings.pleaseEnterValidEmail;
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        // controller: emailController,
                        style: context.textTheme.titleMedium,

                        decoration: InputDecoration(
                          hintText: context.strings.password,
                          suffixIcon: Image.asset(AppIcons.hidePNG),
                        ),
                        // textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(' ')),
                        ],
                        // validator: (value) {
                        //   if (value == null) {
                        //     return context.strings.pleaseEnterEmail;
                        //   } else if (!RegExp(Validations.emailPattern)
                        //       .hasMatch(value)) {
                        //     return context
                        //         .strings.pleaseEnterValidEmail;
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => context.pushNamed(Routes.forgetPassword),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              context.strings.forgetPassword,
                              style: context.textTheme.displaySmall,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 56.0,
                              child: ElevatedButton(
                                  onPressed: () {
                                    context.pushNamed(Routes.app);
                                  },
                                  child: Text(context.strings.signIn)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  context.strings.ifyoudonthaveanaccountyoucansignup,
                              style: context.textTheme.displayMedium,
                            ),
                            TextSpan(
                              text: context.strings.here,
                              style: context.textTheme.displaySmall!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.skyBlueText,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushNamed(Routes.signUpScreen);
                                },
                            ),
                            TextSpan(
                              text: '.',
                              style: context.textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}