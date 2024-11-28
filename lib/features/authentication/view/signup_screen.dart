import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:younified/utils/exports/common_exports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController confirmPasswordController =
      TextEditingController();
  static final TextEditingController phoneController = TextEditingController();
  static final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imageURL = StorageServices.getString('imageURL');
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.07.getScreenWidth),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 36),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.15.getScreenWidth),
                        child: Text(
                          context.strings.signuptojoinyourUnioncommunity,
                          style: context.textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextFormField(
                          controller: emailController,
                          style: context.textTheme.titleMedium,
                          decoration: InputDecoration(
                              hintText: context.strings.personalEmail),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(' ')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.strings.pleaseEnterEmail;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextFormField(
                          controller: firstNameController,
                          style: context.textTheme.titleMedium,
                          decoration: InputDecoration(
                              hintText: context.strings.firstName),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.strings.pleaseEnterFirstName;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextFormField(
                          controller: lastNameController,
                          style: context.textTheme.titleMedium,
                          decoration: InputDecoration(
                              hintText: context.strings.lastName),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.strings.pleaseEnterLastName;
                            }
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
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: context.strings.password),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(' ')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.strings.pleaseEnterPassword;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          style: context.textTheme.titleMedium,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: context.strings.repeatpassword),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(' ')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.strings.pleaseEnterConfirmPassword;
                            }
                            if (value != passwordController.text) {
                              return context.strings.PasswordsDoNotMatch;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: IntlPhoneField(
                          style: context.textTheme.titleMedium,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            counterText: '', // This removes the "0/10" counter
                          ),
                          dropdownIconPosition: IconPosition.trailing,
                          flagsButtonPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          initialCountryCode:
                              'CA', // Default country code (Canada in this case)
                          onChanged: (phone) {
                            phoneController.text = phone.completeNumber;
                            print(phone
                                .completeNumber); // Full phone number + country code
                          },

                          // onSubmitted: (p0) => phoneController.text = p0,
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      //   child: TextFormField(
                      //     // controller: emailController,
                      //     style: context.textTheme.titleMedium,
                      //     decoration: const InputDecoration(hintText: "Cell phone"),
                      //     // textCapitalization: TextCapitalization.none,
                      //     textInputAction: TextInputAction.next,
                      //     inputFormatters: [
                      //       FilteringTextInputFormatter.deny(RegExp(' ')),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 16),
                      Consumer<AuthenticationProvider>(
                        builder: (context, dateProvider, child) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: TextFormField(
                              controller: authenticationProvider.dateController,
                              style: context.textTheme.titleMedium,
                              readOnly: true,
                              decoration: InputDecoration(
                                  hintText: context.strings.dateofbirth),
                              onTap: () => selectDate(context),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Consumer<AuthenticationProvider>(
                        builder: (context, state, child) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => context.pop(),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: 131, minHeight: 56),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0,
                                          color: AppColors.themeColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0))),
                                  child: Center(
                                    child: Text(
                                      context.strings.back,
                                      style: context.textTheme.headlineLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // ElevatedButton(onPressed: () {}, child: const Text("")),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(131, 56),
                              ),
                              onPressed: authenticationProvider.isLoading
                                  ? null // Disable button while loading
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        authenticationProvider
                                            .signup(
                                          emailController.text,
                                          firstNameController.text,
                                          lastNameController.text,
                                          confirmPasswordController.text,
                                          phoneController.text,
                                          authenticationProvider
                                              .dateController.text
                                              .toFormattedDateAccordingToBackend(),
                                        )
                                            .then(
                                          (value) {
                                            if (value != null &&
                                                value.isNotEmpty) {
                                              log(value.toString());
                                              context.pushNamedAndRemoveUntil(
                                                  Routes.loginScreen);
                                              context.showAppSnackBar(
                                                title:
                                                    "Account Created successfully",
                                              );
                                            } else {
                                              context.showAppSnackBar(
                                                title: authenticationProvider
                                                        .errorMessage ??
                                                    'Unknown error',
                                                textColor: AppColors.redText,
                                              );
                                              authenticationProvider
                                                  .errorMessage = null;
                                            }
                                          },
                                        );
                                      }
                                    },

                              child: authenticationProvider.isLoading
                                  ? const CircularProgressIndicator()
                                  : Text(context.strings.signUp),
                              // () {
                              //   log(phoneController.text);
                              //   log(authenticationProvider.dateController.text
                              //       .toFormattedDateAccordingToBackend());
                              // },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // DatePicker
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: authenticationProvider.selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != authenticationProvider.selectedDate) {
      authenticationProvider.updateDate(picked);
    }
  }
}
