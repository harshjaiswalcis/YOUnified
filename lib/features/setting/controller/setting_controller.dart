import 'package:younified/main.dart';
import 'package:younified/utils/exports/common_exports.dart';

class SettingController extends ChangeNotifier {
  // Map user-friendly labels to language codes
  final Map<String, String> languageMap = {
    'English': 'en',
    'French': 'fr',
  };

  // Get the display labels from the map
  List<String> get countryCodeSelection => languageMap.keys.toList();

  // Reference the globally shared ValueNotifier
  ValueNotifier<String> countryCode =
      currentLanguage; // Use the shared ValueNotifier
}
