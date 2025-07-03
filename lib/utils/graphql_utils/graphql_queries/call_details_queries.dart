class CallDetailsQueries {
  static const String getCallDetails = '''
     query GetCallDetails {
          getCallDetails {
              id
              startTime
              endDate
              phone
              script
              creatorID
              title
          }
      }
  ''';
}
