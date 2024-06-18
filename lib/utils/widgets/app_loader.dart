import 'package:flutter/cupertino.dart';
import 'package:younified/utils/exports/common_exports.dart';

class AppLoader extends StatelessWidget {
  final Color? colors;
  const AppLoader({super.key, this.colors = AppColors.themeColor});

  @override
  Widget build(BuildContext context) => Center(
        child: context.isIOS
            ? CupertinoActivityIndicator(
                color: colors,
              )
            : CircularProgressIndicator(
                color: colors,
              ),
      );
}
