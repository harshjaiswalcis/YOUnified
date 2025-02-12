class HomeMutations {
  static const updateUser = '''
     mutation UpdateUser(\$input: UserUpdateInput!) {
        updateUser(input: \$input) {
          unit
          status
          username
          lastName
          firstName
          unionPosition
          employmentStatus
          profile {
            imageURL
          }
        }
      }
    ''';

  static const uploadProfile = '''
     mutation UploadAvatar(\$unionId: UnifiedID!, \$file: Upload!, \$userId: UnifiedID!) {
        uploadAvatar(unionID:\$unionId, file: \$file, userID: \$userId)
      }
    ''';
}
