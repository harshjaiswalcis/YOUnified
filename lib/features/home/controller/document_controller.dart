import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';

class DocumentProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  List<String>? categories;
  GetAllDocuments? documentsData;

  /// Fetches the list of document categories from the GraphQL API.
  Future<List<String>?> fetchDocumentCategories() async {
    final result = await _fetchData<List<String>?>(
      query: gql(r'''
        query Query {
          getDocumentCategories
        }
      '''),
      parse: _parseDocumentCategories,
    );
    return result;
  }

  /// Fetches documents data based on page, limit, and an optional docType.
  Future<GetAllDocuments?> fetchDocuments({
    required int page,
    required int limit,
    String? docType,
  }) async {
    final result = await _fetchData<GetAllDocuments?>(
      query: gql(r'''
        query GetAllDocuments($page: Int64!, $limit: Int64!, $docType: String) {
          getAllDocuments(page: $page, limit: $limit, docType: $docType) {
            total
            documents {
              id
              name
              docType
              url
            }
          }
        }
      '''),
      variables: {
        "page": page,
        "limit": limit,
        "docType": docType,
      },
      parse: _parseDocumentsData,
    );
    return result;
  }

  /// A generic method to perform a GraphQL query, handle errors, and update loading state.
  Future<T?> _fetchData<T>({
    required dynamic query,
    Map<String, dynamic>? variables,
    required T? Function(Map<String, dynamic>? data) parse,
  }) async {
    isLoading = true;
    // notifyListeners();

    try {
      final result = await GraphQLService.client.query(
        QueryOptions(
          document: query,
          variables: variables ?? {},
        ),
      );

      if (result.hasException) {
        _handleGraphQLErrors(result.exception! as GraphQLError);
        return null;
      }

      return parse(result.data);
    } catch (e, stackTrace) {
      _handleGenericError(e, stackTrace);
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Parses the GraphQL response data to extract the list of categories.
  List<String>? _parseDocumentCategories(Map<String, dynamic>? data) {
    final rawCategories = data?['getDocumentCategories'];
    if (rawCategories != null && rawCategories is List) {
      categories = rawCategories.cast<String>();
      return categories;
    }
    return null;
  }

  /// Parses the GraphQL response to a GetAllDocuments model.
  GetAllDocuments? _parseDocumentsData(Map<String, dynamic>? data) {
    final rawData = data?['getAllDocuments'];
    if (rawData != null) {
      documentsData = GetAllDocuments.fromJson(rawData);
      return documentsData;
    }
    return null;
  }

  /// Handles GraphQL-specific errors.
  void _handleGraphQLErrors(GraphQLError exception) {
    final errors = GraphQLErrorHandler.extractErrorMessages(exception);
    errorMessage =
        errors.isNotEmpty ? errors.first : "Unknown GraphQL error occurred";
    log(errorMessage!);
  }

  /// Handles generic errors.
  void _handleGenericError(Object error, StackTrace stackTrace) {
    errorMessage = error.toString();
    log(errorMessage!, error: error, stackTrace: stackTrace);
  }
}
