import 'package:younified/utils/exports/common_exports.dart';

mixin AppProviderStateMixins {
  bool internetConnection = true;
  final ValueNotifier<int> appNavIndex = ValueNotifier(0);
}
