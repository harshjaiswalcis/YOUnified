import 'package:younified/utils/exports/common_exports.dart';

class UnionEnterance extends StatelessWidget {
  const UnionEnterance({super.key});

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
            child: SvgPicture.asset(
              AppIcons.splashTitle,
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
                  context.strings.findMyUnionLocal,
                  style: context.textTheme.displayLarge,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    // controller: emailController,
                    style: context.textTheme.titleMedium,
                    decoration:
                        InputDecoration(hintText: context.strings.union),
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
                    decoration:
                        InputDecoration(hintText: context.strings.localNumber),
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
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          child: ElevatedButton(
                              onPressed: unionProvider.isLoading
                                  ? () => const Center(
                                      child: CircularProgressIndicator())
                                  : () {
                                      context.pushNamedAndRemoveUntil(
                                          Routes.loginScreen);
                                      // unionProvider
                                      //     .fetchUnionByName("downsyndrome.ca")
                                      //     .then(
                                      //   (value) {
                                      //     if (value != null &&
                                      //         value.id.isNotEmpty) {
                                      //       log(value.id);
                                      //       context.pushNamedAndRemoveUntil(
                                      //           Routes.loginScreen);
                                      //     } else {
                                      //       context.showAppSnackBar(
                                      //         title: "Error in login",
                                      //         // textColor: AppColors.redText
                                      //       );
                                      //       // authenticationProvider.errorMessage =
                                      //       null;
                                      //     }
                                      //   },
                                      // );
                                    },
                              child: Text(context.strings.continueText)),
                        ),
                      ),
                    ],
                  ),
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
