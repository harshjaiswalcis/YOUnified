import 'package:younified/utils/exports/common_exports.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? format;
  final FormFieldValidator<String>? onValidate;

  const AppTextField({
    super.key,
    this.format,
    this.onValidate,
    required this.title,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: onValidate,
            controller: controller,
            inputFormatters: format,
            keyboardType: keyboardType,
            style: context.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
