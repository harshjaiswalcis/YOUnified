import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:younified/utils/exports/common_exports.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.15.getScreenWidth),
                child: Text(
                  context.strings.signuptojoinyourUnioncommunity,
                  style: context.textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              ..._buildFields(context),
              const SizedBox(height: 30),
              _buildButtons(context),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFields(BuildContext context) {
    return [
      _field(context,
          controller: emailController,
          hint: context.strings.personalEmail,
          validatorMsg: context.strings.pleaseEnterEmail),
      _field(context,
          controller: firstNameController,
          hint: context.strings.firstName,
          validatorMsg: context.strings.pleaseEnterFirstName),
      _field(context,
          controller: lastNameController,
          hint: context.strings.lastName,
          validatorMsg: context.strings.pleaseEnterLastName),
      _field(context,
          controller: passwordController,
          hint: context.strings.password,
          isObscure: true,
          validatorMsg: context.strings.pleaseEnterPassword),
      _field(context,
          controller: confirmPasswordController,
          hint: context.strings.repeatpassword,
          isObscure: true, validator: (value) {
        if (value?.isEmpty ?? true) {
          return context.strings.pleaseEnterConfirmPassword;
        }
        if (value != passwordController.text) {
          return context.strings.PasswordsDoNotMatch;
        }
        return null;
      }),
      _phoneField(context),
      _dateField(context),
    ]
        .map((e) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: e,
            ))
        .toList();
  }

  Widget _field(
    BuildContext context, {
    required TextEditingController controller,
    required String hint,
    String? validatorMsg,
    bool isObscure = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      style: context.textTheme.titleMedium,
      decoration: InputDecoration(hintText: hint),
      textInputAction: TextInputAction.next,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
      validator: validator ??
          (value) => (value?.isEmpty ?? true) ? validatorMsg : null,
    );
  }

  Widget _phoneField(BuildContext context) {
    return IntlPhoneField(
      style: context.textTheme.titleMedium,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        counterText: '',
      ),
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      initialCountryCode: 'CA',
      onChanged: (phone) => phoneController.text = phone.completeNumber,
    );
  }

  Widget _dateField(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, auth, _) {
        return TextFormField(
          controller: auth.dateController,
          readOnly: true,
          style: context.textTheme.titleMedium,
          decoration: InputDecoration(hintText: context.strings.dateofbirth),
          onTap: () => _selectDate(context, auth),
        );
      },
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, auth, _) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _backButton(context),
          _submitButton(context, auth),
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        height: 56,
        width: 131,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.themeColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            context.strings.back,
            style: context.textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context, AuthenticationProvider auth) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(131, 56),
      ),
      onPressed: auth.isLoading ? null : () => _onSubmit(context, auth),
      child: auth.isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                  strokeWidth: 2, color: AppColors.white),
            )
          : Text(context.strings.signUp),
    );
  }

  void _onSubmit(BuildContext context, AuthenticationProvider auth) {
    if (_formKey.currentState?.validate() ?? false) {
      auth
          .signup(
        emailController.text,
        firstNameController.text,
        lastNameController.text,
        confirmPasswordController.text,
        phoneController.text,
        auth.dateController.text.toFormattedDateAccordingToBackend(),
      )
          .then((value) {
        if (value != null && value.isNotEmpty) {
          _clearForm(auth);
          context.pushNamedAndRemoveUntil(Routes.loginScreen);
          context.showAppSnackBar(title: 'Account Created Successfully');
        } else {
          context.showAppSnackBar(
            title: auth.errorMessage ?? 'Unknown error',
            textColor: AppColors.redText,
          );
          auth.clearError();
        }
      });
    }
  }

  void _clearForm(AuthenticationProvider auth) {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    auth.dateController.clear();
    _formKey.currentState?.reset();
  }

  Future<void> _selectDate(
      BuildContext context, AuthenticationProvider auth) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: auth.selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) auth.updateDate(picked);
  }
}
