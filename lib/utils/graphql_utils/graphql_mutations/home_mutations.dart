class HomeMutations {
  static const updateUser = '''
     mutation Mutation(\$modifyUserId: UnifiedID!, \$input: UserInput, \$unionId: UnifiedID) {
        modifyUser(id: \$modifyUserId, input: \$input, unionID: \$unionId) {
          firstName
          lastName
          username
          status
          unit
          employmentStatus
          unionPosition
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
