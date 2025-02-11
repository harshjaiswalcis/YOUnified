class DocumentQueries {
  static const String getDocumentCategories = '''
     query Query {
          getDocumentCategories
        }
    ''';

  static const String getAllDocuments = '''
     query GetAllDocuments(\$page: Int64!, \$limit: Int64!,  \$input: DocumentFilterInput) {
          getAllDocuments(page: \$page, limit: \$limit, input: \$input) {
            total
            documents {
              id
              name
              docType
              url
            }
          }
        }
  ''';
}
