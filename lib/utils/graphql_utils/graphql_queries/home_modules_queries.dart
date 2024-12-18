class HomeModulesQueries {
  // Executive
  static const String executive = '''
     query executives(\$category: String!, \$unionId: UnifiedID!) {
        executives(category: \$category, unionID: \$unionId) {
          id
          position
          display {
            email
            extension
            mobile
            __typename
          }
          extension
          memberData {
            profile {
              email
              phone
              mobile
              imageURL
              __typename
            }
            firstName
            lastName
            unionPosition
            __typename
          }
          __typename
        }
      }
  ''';

  // Profile
  static const String profile = '''
     query LoginWithToken(\$token: String!, \$device: String) {
      loginWithToken(token: \$token, device: \$device) {
        user {
          username
          status
          lastName
          firstName
          unit
          employmentStatus
          unionPosition
          profile {
            imageURL
          }
        }
      }
    }
  ''';
}
