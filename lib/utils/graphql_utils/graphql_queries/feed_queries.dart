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
          }
          showComments
          showLikes
          comments {
            id
            content
            createdOn
            userID
            likes
            dislikes
            creator {
              id
              unionID
              lastName
              firstName
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
}
