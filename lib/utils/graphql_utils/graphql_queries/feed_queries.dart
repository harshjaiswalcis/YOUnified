class FeedQueries {
  static const String feeds = '''
     query GetAllNewsPosts(\$unionId: ObjectID!, \$page: Int!, \$limit: Int!) {
        getAllNewsPosts(unionID:\$unionId, page: \$page, limit: \$limit) {
          total
          data {
            id
            images
            content
            likes
            createdOn
            showLikes
            showComments
            creator {
              id
              firstName
              lastName
              profile {
                imageURL
              }
            }
            comments {
              id
              content
              createdOn
              creator {
                id
                firstName
                lastName
                profile {
                  imageURL
                }
              }
            }
          }
        }
      }
  ''';

  static const String likes = '''
     mutation LikeNewsItem(\$unionId: ObjectID!, \$newsId: ObjectID!, \$userId: ObjectID!) {
        likeNewsItem(unionID: \$unionId, newsID: \$newsId, userID: \$userId) {
          likes
        }
      }
  ''';

  static const String addComment = '''
     mutation AddComment(\$unionId: ObjectID!, \$newsId: ObjectID!, \$comment: CommentInput!) {
        addComment(unionID: \$unionId, newsID: \$newsId, comment: \$comment) {
          id
          content
          createdOn
          creator {
            id
            firstName
            lastName
            profile {
              imageURL
            }
          }
        }
      }
  ''';
}
