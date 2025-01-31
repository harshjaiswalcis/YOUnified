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

  Future<UserData?> fetchPermissions(BuildContext context) async {
    isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners(); // Ensure this runs after the build phase
    });

    try {
      QueryResult result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(HomeModulesQueries.profile),
          variables: {
            'token': StorageServices.getString('token'),
          },
          fetchPolicy: FetchPolicy.noCache,
        ),
      );

      if (result.hasException) {
        GraphQLErrorHandler.extractErrorMessages(result.exception)
            .firstOrNull
            .toLog();
        errorMessage =
            GraphQLErrorHandler.extractErrorMessages(result.exception)
                    .firstOrNull ??
                "Unknown error occurred.";
        if (errorMessage == "session expired please login again") {
          context.showAppSnackBar(
            title: settingController.errorMessage ?? 'Unknown error',
            textColor: AppColors.redText,
          );
          settingController.errorMessage = null;
          StorageServices.delete('token');
          StorageServices.delete('userId');
          context.appProvider.appNavIndex.value = 0;
          context.pushNamed(Routes.loginScreen);
          isLoading = false;
          notifyListeners();
          return null;
        }

        isLoading = false;
        notifyListeners();
        return null;
      }

      if (result.data != null) {
        final data = GenericResponse.fromJson(result.data!['loginWithToken']);
        final userData = data.user;
        result.data.toLog();
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

        isLoading = false;
        notifyListeners();
        return userData;
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }

    return null;
  }

  Future<void> updateBackendAndPermissions(
      String key, bool value, Function(String) onComplete) async {
    // Update the local state
    permissions[key]?["value"] = value;
    notifyListeners(); // Reflect changes locally

    try {
      // Prepare the `input` object for the mutation
      final updatedPermissions = {
        "callOpOut": permissions["callOpOut"]?["value"] ?? false,
        "emailOpOut": permissions["emailOpOut"]?["value"] ?? false,
        "textOpOut": permissions["textOpOut"]?["value"] ?? false,
        "pushOpOut": permissions["pushOpOut"]?["value"] ?? false,
        "regEmailOpOut": permissions["regEmailOpOut"]?["value"] ?? false,
        "unionOpOut": permissions["unionOpOut"]?["value"] ?? false,
      };

      // Prepare the mutation variables
      final variables = {
        "updateSettingsId": StorageServices.getString('userId'),
        "unionId": StorageServices.getString('unionId'),
        "input": updatedPermissions,
      };

      // Call the mutation
      final result = await GraphQLService.client.mutate(
        MutationOptions(
          document: gql(SettingMutations.setPermissions),
          variables: variables,
        ),
      );

      // Handle exceptions
      if (result.hasException) {
        throw Exception(
            GraphQLErrorHandler.extractErrorMessages(result.exception)
                    .firstOrNull ??
                "Failed to update permissions");
      }

      // Call the success callback
      onComplete("Permissions updated successfully.");
    } catch (e) {
      // Call the failure callback
      onComplete("Failed to update: $e");
    }
  }
}
