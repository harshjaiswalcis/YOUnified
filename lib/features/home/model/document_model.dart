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
    return GetAllDocuments(
      total: json['total'] as int,
      documents: (json['documents'] as List)
          .map((doc) => Document.fromJson(doc as Map<String, dynamic>))
          .toList(),
    );
  }
}
