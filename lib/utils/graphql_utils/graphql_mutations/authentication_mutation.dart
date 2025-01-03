class AuthenticationMutation {
  // Login
  static const String login = '''
     mutation Login(\$device: String,\$input: Credential) {
        login(device: \$device, input:\$input) {
          token
          User {
            id
          }
        }
      }
  ''';

  // Signup
  static const String signup = '''
     mutation RegisterUser(\$unionId: ObjectID!, \$input: UserInput!) {
        registerUser(unionID: \$unionId, input:\$input) {
          id
          username
          lastName
          firstName
          dateOfBirth
          profile {
            email
            phone
          }
        }
      }
    ''';
}
