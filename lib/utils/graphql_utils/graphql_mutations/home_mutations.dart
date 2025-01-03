class HomeMutations {
  static const updateUser = '''
     mutation UpdateUser(\$updateUserId: ObjectID!, \$unionId: ObjectID!, \$input: UserUpdateInput!) {
        updateUser(id: \$updateUserId, unionID: \$unionId, input: \$input) {
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
