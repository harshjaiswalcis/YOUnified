import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';

class AppProvider extends ChangeNotifier with AppProviderStateMixins {
  void notify() => notifyListeners();
  bool isLoading = false; // Global loading state
  String? errorMessage;

  /// -------------------- GRAPHQL API CALLING AND FETCHING DATA--------------------
  /// A generic method to perform a GraphQL query, handle errors, and update loading state.
  Future<T?> fetchData<T>({
    required dynamic query,
    Map<String, dynamic>? variables,
    required T? Function(Map<String, dynamic>? data) parse,
  }) async {
    isLoading = true;
    try {
      final result = await GraphQLService.client.query(
        QueryOptions(
          document: query,
          variables: variables ?? {},
          fetchPolicy: FetchPolicy.noCache,
        ),
      );
      if (result.hasException) {
        _handleGraphQLErrors(result.exception!);
        return null;
      }
      "fetchData------> ${result.data}".toLog();
      return parse(result.data);
    } catch (e, stackTrace) {
      _handleGenericError(e, stackTrace);
      return null;
    } finally {
      isLoading = false;
      notify();
    }
  }

  void _handleGraphQLErrors(OperationException exception) {
    List<String> errorMessages = [];
    if (exception.graphqlErrors.isNotEmpty) {
      errorMessages = exception.graphqlErrors.map((e) => e.message).toList();
    } else if (exception.linkException != null) {
      errorMessages.add(exception.linkException.toString());
    }
    errorMessage = errorMessages.isNotEmpty
        ? errorMessages.first
        : "Unknown GraphQL error occurred";
    log("_handleGraphQLErrors: $errorMessage");
  }

  void _handleGenericError(Object error, StackTrace stackTrace) {
    errorMessage = error.toString();
    log("_handleGenericError: $errorMessage",
        error: error, stackTrace: stackTrace);
  }
}
