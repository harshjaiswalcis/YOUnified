import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';

class DocumentProvider extends ChangeNotifier {
  String? errorMessage;
  List<String>? categories;
  GetAllDocuments? documentsData;

  // Map to hold pagination state for each document type (category).
  final Map<String, PaginatedDocuments> paginatedDocumentsByCategory = {};

  /// -------------------- CATEGORY FETCHING --------------------
  /// Fetches the list of document categories from the GraphQL API.
  Future<List<String>?> fetchDocumentCategories() async {
    final result = await appProvider.fetchData<List<String>?>(
      query: gql(DocumentQueries.getDocumentCategories),
      parse: _parseDocumentCategories,
    );
    return result;
  }

  List<String>? _parseDocumentCategories(Map<String, dynamic>? data) {
    final rawCategories = data?['getDocumentCategories'];
    if (rawCategories != null && rawCategories is List) {
      categories = rawCategories.cast<String>();
      return categories;
    }
    return null;
  }

  /// -------------------- DOCUMENT FETCHING --------------------
  /// Fetches documents data based on page, limit, and an optional docType.
  Future<GetAllDocuments?> fetchDocuments({
    required int page,
    required int limit,
    String? docType,
  }) async {
    final result = await appProvider.fetchData<GetAllDocuments?>(
      query: gql(DocumentQueries.getAllDocuments),
      variables: {
        "page": page,
        "limit": limit,
        "input": {
          "docType": docType,
        }
      },
      parse: _parseDocumentsData,
    );
    return result;
  }

  GetAllDocuments? _parseDocumentsData(Map<String, dynamic>? data) {
    final rawData = data?['getAllDocuments'];
    if (rawData != null) {
      documentsData = GetAllDocuments.fromJson(rawData);
      return documentsData;
    }
    return null;
  }

  /// -------------------- PAGINATION FUNCTIONS --------------------
  /// Returns the current pagination state for a given document type (category).
  PaginatedDocuments getPaginatedDocuments(String docType) {
    if (!paginatedDocumentsByCategory.containsKey(docType)) {
      paginatedDocumentsByCategory[docType] =
          PaginatedDocuments(documents: [], currentPage: 0, totalPages: 1);
    }
    return paginatedDocumentsByCategory[docType]!;
  }

  /// Loads (or reloads) documents for a given document type.
  ///
  /// If [refresh] is true, the previous list is cleared.
  Future<void> loadDocumentsForCategory(String docType,
      {bool refresh = false, int limit = 10}) async {
    PaginatedDocuments state = getPaginatedDocuments(docType);
    if (refresh) {
      state.documents = [];
      state.currentPage = 0;
      state.totalPages = 1;
    }

    // Set loading flags based on whether this is the first load or a subsequent page.
    if (state.documents.isEmpty) {
      state.isLoading = true;
    } else {
      state.isLoadingMore = true;
    }

    int nextPage = state.currentPage + 1;

    GetAllDocuments? result =
        await fetchDocuments(page: nextPage, limit: limit, docType: docType);

    if (result != null) {
      state.totalPages = (result.total / limit).ceil();
      state.currentPage = nextPage;
      state.documents.addAll(result.documents);
      state.errorMessage = null;
    } else {
      state.errorMessage = errorMessage;
    }
    state.isLoading = false;
    state.isLoadingMore = false;
    paginatedDocumentsByCategory[docType] = state;
    notifyListeners();
  }
}
