import 'package:flutter/gestures.dart';
import 'package:younified/utils/exports/common_exports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  static final TextEditingController usernameController =
      TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final unionId = StorageServices.getString('unionId');
    final unionName = StorageServices.getString('unionName');
    final imageURL = StorageServices.getString('imageURL');
    return Scaffold(
        // backgroundColor: AppColors.backGround,
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.07.getScreenWidth),
      child: SingleChildScrollView(
        child: SizedBox(
          height: 1.0.getScreenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.2.getScreenWidth),
                child: Image.network(
                  imageURL!,
                  scale: 1,
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
                      color: Color(
                          0x524468C1), // 0x52 is the alpha value for 32% opacity
                      offset: Offset(0, 40), // The x and y offset of the shadow
                      blurRadius: 44, // The blur radius of the shadow
                      spreadRadius: -20, // The spread radius of the shadow
                    ),
                  ],
                ),
                child: Form(
                  key: _formKeyLogin,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 36),
                      Text(
                        // context.strings.logintoyouraccount,
                        unionName!,
                        style: context.textTheme.displayLarge,
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextFormField(
                          controller: usernameController,
                          style: context.textTheme.titleMedium,
                          decoration:
                              InputDecoration(hintText: context.strings.login),
                          // textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.deny(RegExp(' ')),
                          // ],
                          validator: (value) {
                            if (value == null) {
                              return context.strings.pleaseEnterEmail;
                            }
                            // else if (!RegExp(Validations.emailPattern)
                            //     .hasMatch(value)) {
                            //   return context
                            //       .strings.pleaseEnterValidEmail;
                            // }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextFormField(
                          controller: passwordController,
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
                          validator: (value) {
                            if (value == null) {
                              return context.strings.pleaseEnterPassword;
                            }
                            // else if (!RegExp(Validations.emailPattern)
                            //     .hasMatch(value)) {
                            //   return context
                            //       .strings.pleaseEnterValidEmail;
                            // }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                context.pushNamed(Routes.forgetPassword),
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
                        child: Consumer<AuthenticationProvider>(
                          builder: (context, state, child) => Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 56.0,
                                  child: ElevatedButton(
                                      onPressed: authenticationProvider
                                              .isLoading
                                          ? null // Disable button while loading
                                          : () {
                                              if (_formKeyLogin.currentState!
                                                  .validate()) {
                                                authenticationProvider
                                                    .login(
                                                        usernameController.text,
                                                        passwordController.text)
                                                    .then(
                                                  (value) {
                                                    if (value != null &&
                                                        value.isNotEmpty) {
                                                      log(value.toString());
                                                      context
                                                          .pushNamedAndRemoveUntil(
                                                              Routes.app);
                                                    } else {
                                                      context.showAppSnackBar(
                                                        title: authenticationProvider
                                                                .errorMessage ??
                                                            'Unknown error',
                                                        textColor:
                                                            AppColors.redText,
                                                      );
                                                      authenticationProvider
                                                          .errorMessage = null;
                                                    }
                                                  },
                                                );
                                              }
                                            },
                                      child: authenticationProvider.isLoading
                                          ? const CircularProgressIndicator(
                                              color: AppColors.white,
                                            )
                                          : Text(context.strings.signIn)),
                                ),
                              ),
                            ],
                          ),
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
                                text: context
                                    .strings.ifyoudonthaveanaccountyoucansignup,
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
              ),
              SizedBox(height: 0.1.getScreenHeight),
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
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
