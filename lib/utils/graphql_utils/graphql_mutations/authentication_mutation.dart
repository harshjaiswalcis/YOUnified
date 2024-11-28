class AuthenticationMutation {
  // Login
  static const String login = '''
     mutation Login(\$input: Credential, \$device: String) {
        login(input: \$input, device: \$device) {
          user {
            unionStatus
            token
            id
          }
        }
      }
  ''';

  // Signup
  static const String signup = '''
     mutation MemberRegistration(\$unionId: UnifiedID, \$input: UserInput!) {
        memberRegistration(unionID: \$unionId, input: \$input) {
          username
          lastName
          firstName
          dateOfBirth
          profile {
            email
            phone
          }
          id
          token
        }
      }
    ''';
}
