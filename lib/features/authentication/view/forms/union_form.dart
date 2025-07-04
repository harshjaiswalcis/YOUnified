import 'package:younified/utils/exports/common_exports.dart';

class UnionForm extends StatefulWidget {
  const UnionForm({super.key});

  @override
  State<UnionForm> createState() => _UnionFormState();
}

class _UnionFormState extends State<UnionForm> {
  final _formKey = GlobalKey<FormState>();
  final _unionController = TextEditingController();
  final _localNumberController = TextEditingController();

  @override
  void dispose() {
    _unionController.dispose();
    _localNumberController.dispose();
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
          child: Consumer<UnionProvider>(
            builder: (context, state, _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.strings.findMyUnionLocal,
                      style: context.textTheme.displayLarge),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _unionController,
                    style: context.textTheme.titleMedium,
                    decoration:
                        InputDecoration(hintText: context.strings.union),
                    validator: (value) => value!.isEmpty
                        ? context.strings.pleaseEnterUnion
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _localNumberController,
                    style: context.textTheme.titleMedium,
                    decoration:
                        InputDecoration(hintText: context.strings.localNumber),
                    validator: (value) => value!.isEmpty
                        ? context.strings.pleaseEnterLocalNumber
                        : null,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                state
                                    .fetchUnionByName(_unionController.text)
                                    .then((value) {
                                  if (value != null) {
                                    context.pushNamedAndRemoveUntil(
                                        Routes.loginScreen);
                                  } else {
                                    context.showAppSnackBar(
                                      title:
                                          state.errorMessage ?? 'Unknown error',
                                      textColor: AppColors.redText,
                                    );
                                    state.clearError();
                                  }
                                });
                              }
                            },
                      child: state.isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(context.strings.continueText),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
