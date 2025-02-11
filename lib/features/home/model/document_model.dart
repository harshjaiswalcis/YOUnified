class Document {
  final String id;
  final String name;
  final String docType;
  final String url;

  Document({
    required this.id,
    required this.name,
    required this.docType,
    required this.url,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'] as String,
      name: json['name'] as String,
      docType: json['docType'] as String,
      url: json['url'] as String,
    );
  }
}

class GetAllDocuments {
  final int total;
  final List<Document> documents;

  GetAllDocuments({
    required this.total,
    required this.documents,
  });

  factory GetAllDocuments.fromJson(Map<String, dynamic> json) {
    // Use an empty list if 'documents' is null.
    final docs = json['documents'] as List<dynamic>? ?? [];

    return GetAllDocuments(
      total: json['total'] as int? ?? 0,
      documents: docs.map((doc) => Document.fromJson(doc)).toList(),
    );
  }
}

class PaginatedDocuments {
  List<Document> documents;
  int currentPage;
  int totalPages;
  bool isLoading; // true when the very first page is loading
  bool isLoadingMore; // true when additional pages are loading
  String? errorMessage;

  PaginatedDocuments({
    required this.documents,
    required this.currentPage,
    required this.totalPages,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.errorMessage,
  });
}
