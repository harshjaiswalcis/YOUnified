import 'package:flutter/gestures.dart';
import 'package:younified/utils/exports/common_exports.dart';

class LoginForm extends StatefulWidget {
  final String unionName;

  const LoginForm({super.key, required this.unionName});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        child: Consumer<AuthenticationProvider>(
          builder: (context, authProvider, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.unionName, style: context.textTheme.displayLarge),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _usernameController,
                  style: context.textTheme.titleMedium,
                  decoration: InputDecoration(hintText: context.strings.login),
                  validator: (value) =>
                      value!.isEmpty ? context.strings.pleaseEnterEmail : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  style: context.textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintText: context.strings.password,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Image.asset(
                        _obscureText ? AppIcons.hidePNG : AppIcons.hidePNG,
                      ),
                    ),
                  ),
                  obscureText: _obscureText,
                  validator: (value) => value!.isEmpty
                      ? context.strings.pleaseEnterPassword
                      : null,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => context.pushNamed(Routes.forgetPassword),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        context.strings.forgetPassword,
                        style: context.textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: authProvider.isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              authProvider
                                  .login(
                                _usernameController.text,
                                _passwordController.text,
                              )
                                  .then((value) {
                                if (value != null && value.isNotEmpty) {
                                  context.pushNamedAndRemoveUntil(Routes.app);
                                } else {
                                  context.showAppSnackBar(
                                    title: authProvider.errorMessage ??
                                        'Unknown error',
                                    textColor: AppColors.redText,
                                  );

                                  authProvider.errorMessage = null;
                                  authProvider.clearError();
                                }
                              });
                            }
                          },
                    child: authProvider.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(context.strings.signIn),
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
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
                          color: AppColors.skyBlueText,
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
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
