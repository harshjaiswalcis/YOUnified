class GrievanceQueries {
  static const String getAllGrievance = '''
     query GetAllGrievance {
          getAllGrievance {
              id
              title
              lastUpdatedAt
              caseNumber
              status
              createdAt
          }
      }
  ''';
}
