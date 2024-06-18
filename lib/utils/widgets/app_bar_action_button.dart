import 'package:younified/utils/exports/common_exports.dart';

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    const int cartItem = 0;
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              // color: AppColors.darkGreen,
            ),
            child: Padding(
              padding: EdgeInsets.all(9.0),
              child: Icon(Icons.delete),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 19,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: AppColors.yellowCart,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
              child: Text(
                cartItem.toString(),
                style: context.textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    // color: AppColors.black
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
