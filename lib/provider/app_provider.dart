import 'package:younified/utils/exports/common_exports.dart';

class AppProvider extends ChangeNotifier with AppProviderStateMixins {
  void notify() => notifyListeners();
}
