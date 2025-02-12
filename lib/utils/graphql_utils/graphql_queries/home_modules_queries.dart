class HomeModulesQueries {
  // Executive
  static const String getExecutives = '''
     query GetExecutives(\$unionId: ObjectID!, \$page: Int64!, \$limit: Int64!) {
        getExecutives(unionID: \$unionId, page: \$page, limit: \$limit) {
          Count
          Users {
            id
          display {
            email
            extension
            mobile
          }
          extension
          profile {
            email
            phone
            mobile
            imageURL
          }
          firstName
          lastName
          unionPosition
          }
        }
      }
    ''';

  // Profile
  static const String profile = '''
     query LoginWithToken(\$token: String) {
        loginWithToken(token: \$token) {
          User {
            unit
            status
            lastName
            username
            firstName
            unionPosition
            employmentStatus
            profile {
              imageURL
            }
            callOpOut
            emailOpOut
            textOpOut
            pushOpOut
            regEmailOpOut
          }
        }
      }
  ''';
}
