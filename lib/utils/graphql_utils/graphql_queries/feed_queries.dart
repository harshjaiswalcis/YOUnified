class FeedQueries {
  static const String feeds = '''
     query GetAllNewsPosts(\$unionId: ObjectID!, \$page: Int64!, \$limit: Int64!) {
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
     mutation LikeNewsItem( \$newsId: ObjectID!) {
        likeNewsItem(newsID: \$newsId) {
          likes
        }
      }
  ''';

  static const String addComment = '''
     mutation AddComment(\$newsId: ObjectID!, \$comment: CommentInput!) {
        addComment( newsID: \$newsId, comment: \$comment) {
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
