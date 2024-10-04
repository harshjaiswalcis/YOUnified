import 'package:younified/utils/exports/common_exports.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
                    context.strings.changepassword,
                    style: context.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    style: context.textTheme.titleMedium,
                    decoration: InputDecoration(hintText: context.strings.newpasword),
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: context.textTheme.titleMedium,
                    decoration:
                        InputDecoration(hintText: context.strings.repeatnewpassword),
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(1.0.getScreenWidth, 56),
                    ),
                    onPressed: () {},
                    child: Text(context.strings.continueText),
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