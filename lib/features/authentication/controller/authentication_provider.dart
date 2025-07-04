import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_mutations/authentication_mutation.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  /// -------------------- login --------------------
  Future<String?> login(String username, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await appProvider.fetchData<String?>(
        query: gql(AuthenticationMutation.login),
        variables: {
          "input": {
            "unionID": StorageServices.getString('unionId'),
            "username": username,
            "password": password,
          },
          "device": "mobile",
        },
        parse: _parseLogin,
      );

      if (result == null) {
        errorMessage = 'Invalid credentials';
      }

      return result;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String? _parseLogin(Map<String, dynamic>? data) {
    final loginData = data?['login'];
    final token = loginData?['token'];
    final userData = loginData?['User'];
    if (loginData != null && userData != null) {
      StorageServices.setString('userId', userData['id']);
      StorageServices.setString('token', token);
      return token;
    }
    return null;
  }

  /// -------------------- signup --------------------
  Future<String?> signup(
    String email,
    String firstname,
    String lastname,
    String password,
    String phone,
    String dob,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await appProvider.fetchData<String?>(
        query: gql(AuthenticationMutation.signup),
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
          },
        },
        parse: _parseSignup,
      );
      return result;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String? _parseSignup(Map<String, dynamic>? data) {
    final signupData = data?['registerUser'];
    return signupData != null ? signupData['id'] as String? : null;
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

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
