import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:younified/utils/exports/common_exports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.07.getScreenWidth),
      child: Column(
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
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.15.getScreenWidth),
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
                    // controller: emailController,
                    style: context.textTheme.titleMedium,
                    decoration:
                         InputDecoration(hintText: context.strings.personalEmail),
                    // textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    // controller: emailController,
                    style: context.textTheme.titleMedium,
                    decoration:  InputDecoration(hintText: context.strings.firstName),
                    // textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    // controller: emailController,
                    style: context.textTheme.titleMedium,
                    decoration: InputDecoration(hintText: context.strings.lastName),
                    // textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    // controller: emailController,
                    style: context.textTheme.titleMedium,
                    decoration: InputDecoration(hintText: context.strings.password),
                    // textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    // controller: emailController,
                    style: context.textTheme.titleMedium,
                    decoration:
                         InputDecoration(hintText: context.strings.repeatpassword),
                    // textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: IntlPhoneField(
                    decoration:  InputDecoration(
                      labelText: context.strings.cellphone,
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFA39F9F),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                      ),
                      border: const OutlineInputBorder(
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
                      print(phone
                          .completeNumber); // Full phone number + country code
                    },
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    // controller: emailController,
                    style: context.textTheme.titleMedium,
                    decoration:
                        InputDecoration(hintText: context.strings.dateofbirth),
                    // textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(minWidth: 131, minHeight: 56),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: AppColors.themeColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0))),
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
                      child: Text(context.strings.signUp),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
