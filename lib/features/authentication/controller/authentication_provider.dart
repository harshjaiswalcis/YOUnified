import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_mutations/authentication_mutation.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<String?> login(String username, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      QueryResult result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(AuthenticationMutation.login),
          variables: {
            "input": {
              "unionID": StorageServices.getString('unionId'),
              "username": username,
              "password": password
            },
            "device": "mobile"
          },
        ),
      );

      if (result.hasException) {
        // Extract GraphQL errors
        if (result.exception?.graphqlErrors.isNotEmpty ?? false) {
          final firstError = result.exception!.graphqlErrors.first;
          errorMessage = firstError.message; // Get "internal system error"
        } else {
          // Fallback if no graphqlErrors exist
          errorMessage = "Unknown error occurred.";
        }

        log(errorMessage!);
        isLoading = false;
        notifyListeners();
        return null;
      }

      final data = result.data?['login']['user'];
      if (data != null) {
        StorageServices.setString('userId', data['id']);
        StorageServices.setString('token', data['token']);
        isLoading = false;
        notifyListeners();
        return data['token'];
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
    return null;
  }

  Future<String?> signup(String email, String firstname, String lastname,
      String password, String phone, String dob) async {
    isLoading = true;
    notifyListeners();

    try {
      QueryResult result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(AuthenticationMutation.signup),
          variables: {
            "unionId": StorageServices.getString('unionId'),
            "input": {
              "firstName": firstname,
              "lastName": lastname,
              "password": password,
              "username": email,
              "profile": {
                "email": email,
                "mobile": phone,
              },
              "dateOfBirth": dob,
            }
          },
        ),
      );

      if (result.hasException) {
        // Extract GraphQL errors
        if (result.exception?.graphqlErrors.isNotEmpty ?? false) {
          final firstError = result.exception!.graphqlErrors.first;
          errorMessage = firstError.message; // Get "internal system error"
          log(result.exception!.graphqlErrors.first.toString());
        } else {
          // Fallback if no graphqlErrors exist
          errorMessage = "Unknown error occurred.";
          log(result.exception!.graphqlErrors.first.toString());
        }

        log(errorMessage!);
        isLoading = false;
        notifyListeners();
        return null;
      }

      final data = result.data?['memberRegistration'];
      if (data != null) {
        log(data.toString());
        log(data['token']);
        // StorageServices.setString('userId', data['id']);
        // StorageServices.setString('token', data['token']);
        isLoading = false;
        notifyListeners();
        return data['id'];
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
    }
    notifyListeners();
    return null;
  }

  DateTime _selectedDate = DateTime.now();
  final TextEditingController dateController = TextEditingController();

  DateProvider() {
    dateController.text = _formatDate(_selectedDate);
  }

  DateTime get selectedDate => _selectedDate;

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    dateController.text = _formatDate(newDate);
    notifyListeners();
  }

  static String _formatDate(DateTime date) {
    return "${date.toLocal()}".split(' ')[0]; // Formats date as YYYY-MM-DD
  }
}
