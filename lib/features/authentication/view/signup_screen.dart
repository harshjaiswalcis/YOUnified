import 'package:younified/features/authentication/view/forms/sign_up_form.dart';
import 'package:younified/utils/exports/common_exports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageURL = StorageServices.getString('imageURL') ?? '';

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.07.getScreenWidth),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 0.06.getScreenHeight),
              Image.network(
                imageURL,
                height: 50,
                width: 180,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 24),
              const SignUpForm(),
              SizedBox(height: 0.06.getScreenHeight),
            ],
          ),
        ),
      ),
    );
  }
}
