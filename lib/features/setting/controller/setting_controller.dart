import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/features/home/model/login_with_token.dart';
import 'package:younified/main.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_mutations/setting_mutations.dart';

class SettingController extends ChangeNotifier {
  Map<String, Map<String, dynamic>> permissions = {};
  String? errorMessage;
  bool isLoading = false;

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

  /// -------------------- FETCH PERMISSION --------------------
  Future<UserData?> fetchPermissions(BuildContext context) async {
    final result = await appProvider.fetchData<UserData?>(
      query: gql(HomeModulesQueries.profile),
      variables: {
        'token': StorageServices.getString('token'),
      },
      parse: _parsePermissions,
    );
    // If fetchData returned null and the error message indicates that the session expired,
    // then perform the logout flow.
    if (result == null &&
        appProvider.errorMessage == "session expired please login again") {
      if (context.mounted) {
        context.showAppSnackBar(
          title: settingController.errorMessage ?? 'Unknown error',
          textColor: AppColors.redText,
        );
        settingController.errorMessage = null;
        StorageServices.delete('token');
        StorageServices.delete('userId');
        context.appProvider.appNavIndex.value = 0;
        context.pushNamed(Routes.loginScreen);
      }
    }
    return result;
  }

  UserData? _parsePermissions(Map<String, dynamic>? data) {
    if (data == null) return null;
    // Parse the generic response using your model.
    final genericResponse = GenericResponse.fromJson(data['loginWithToken']);
    final userData = genericResponse.user;
    // Build the permissions map based on the returned user data.
    permissions = {
      "unionOpOut": {
        "value": false,
        "label": "Union Notifications",
      },
      "callOpOut": {
        "value": userData.callOpOut ?? false,
        "label": "Allow Call Drops",
      },
      "textOpOut": {
        "value": userData.textOpOut ?? false,
        "label": "Allow Text Messages",
      },
      "emailOpOut": {
        "value": userData.emailOpOut ?? false,
        "label": "Allow Emails",
      },
      "pushOpOut": {
        "value": userData.pushOpOut ?? false,
        "label": "Allow Push Notifications",
      },
      "regEmailOpOut": {
        "value": userData.regEmailOpOut ?? false,
        "label": "Allow Registration Emails",
      },
    };
    return userData;
  }

  Future<void> updateBackendAndPermissions(
      String key, bool value, Function(String) onComplete) async {
    // Store the previous value.
    final previousValue = permissions[key]?["value"] ?? false;

    // Optimistically update the local state.
    permissions[key]?["value"] = value;
    notifyListeners();

    // Prepare the input object for the mutation.
    final updatedPermissions = {
      "callOpOut": permissions["callOpOut"]?["value"] ?? false,
      "emailOpOut": permissions["emailOpOut"]?["value"] ?? false,
      "textOpOut": permissions["textOpOut"]?["value"] ?? false,
      "pushOpOut": permissions["pushOpOut"]?["value"] ?? false,
      "regEmailOpOut": permissions["regEmailOpOut"]?["value"] ?? false,
      "unionOpOut": permissions["unionOpOut"]?["value"] ?? false,
    };

    // Prepare the mutation variables.
    final variables = {
      "input": updatedPermissions,
    };

    // Use the common mutateData function.
    final result = await appProvider.mutateData<bool>(
      query: gql(SettingMutations.setPermissions),
      variables: variables,
      parse: (data) {
        // On a successful mutation, simply return true.
        return true;
      },
    );

    // If result is null, the mutation failed.
    if (result == null) {
      // Revert to the previous value.
      permissions[key]?["value"] = previousValue;
      notifyListeners();
      onComplete("Failed to update permissions.");
    } else {
      onComplete("Permissions updated successfully.");
    }
  }
}
