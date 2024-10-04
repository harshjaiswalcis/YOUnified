import 'package:younified/utils/exports/common_exports.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 36),
                  Text(
                    context.strings.enteryourEmail,
                    style: context.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    // controller: emailController,
                    style: context.textTheme.titleMedium,
                    decoration: InputDecoration(hintText: context.strings.email),
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
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(1.0.getScreenWidth, 56),
                    ),
                    onPressed: () {
                      context.pushNamed(Routes.changePassword);
                    },
                    child: Text(context.strings.requestpasswordreset),
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
}
