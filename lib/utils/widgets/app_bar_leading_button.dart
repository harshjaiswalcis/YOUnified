import 'package:younified/utils/exports/common_exports.dart';

class AppBarLeadingButton extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final VoidCallback onTab;
  const AppBarLeadingButton(
      {super.key,
      required this.bgColor,
      required this.icon,
      required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          color: bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
