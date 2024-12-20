class FeedQueries {
  static const String feeds = '''
     query NewsFeed(\$unionId: UnifiedID!, \$page: Int, \$limit: Int) {
      newsFeed(unionID: \$unionId, page:\$page, limit: \$limit) {
        data {
          id
          images
          content
          likes
          createdOn
          creator {
            firstName
            profile {
              imageURL
            }
            lastName
            id
          }
          showComments
          showLikes
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
        total
      }
    }
  ''';

  static const String likes = '''
     mutation LikeNewsItem(\$unionId: UnifiedID!, \$newsId: UnifiedID!, \$userId: UnifiedID!) {
        likeNewsItem(unionID: \$unionId, newsID: \$newsId, userID: \$userId) {
          likes
        }
      }
  ''';

  static const String addComment = '''
     mutation NewComment(\$unionId: UnifiedID!, \$newsId: UnifiedID!, \$comment: CommentInput!) {
        newComment(unionID: \$unionId, newsID: \$newsId, comment: \$comment) {
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
