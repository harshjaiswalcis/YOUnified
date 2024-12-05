// class Feed {
//   final String id;
//   final String fullName;
//   final DateTime postedTime;
//   final String feedProfileImage;
//   final String postDetails;
//   final String postImages;
//   final int numberOfLikes;
//   final int numberOfComments;

//   Feed({
//     required this.id,
//     required this.fullName,
//     required this.postedTime,
//     required this.feedProfileImage,
//     required this.postDetails,
//     required this.postImages,
//     required this.numberOfLikes,
//     required this.numberOfComments,
//   });

//   // Factory constructor to create a Feed instance from JSON
//   factory Feed.fromJson(Map<String, dynamic> json) {
//     return Feed(
//       id: json['id'],
//       fullName: json['fullName'],
//       postedTime: DateTime.parse(json['postedTime']),
//       feedProfileImage: json['feedProfileImage'],
//       postDetails: json['postDetails'],
//       postImages: json['postImages'],
//       numberOfLikes: json['numberOfLikes'],
//       numberOfComments: json['numberOfComments'],
//     );
//   }

//   // Method to convert a Feed instance back to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'fullName': fullName,
//       'postedTime': postedTime.toIso8601String(),
//       'feedProfileImage': feedProfileImage,
//       'postDetails': postDetails,
//       'postImages': postImages,
//       'numberOfLikes': numberOfLikes,
//       'numberOfComments': numberOfComments,
//     };
//   }
// }

// // Helper function to parse a List of Feeds from JSON
// List<Feed> parseFeeds(List<dynamic> jsonList) {
//   return jsonList.map((json) => Feed.fromJson(json)).toList();
// }

class NewsFeedResponse {
  final NewsFeedResponseData data;

  NewsFeedResponse({required this.data});

  factory NewsFeedResponse.fromJson(Map<String, dynamic> json) {
    return NewsFeedResponse(
      data: NewsFeedResponseData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class NewsFeedResponseData {
  final NewsFeed newsFeed;

  NewsFeedResponseData({required this.newsFeed});

  factory NewsFeedResponseData.fromJson(Map<String, dynamic> json) {
    return NewsFeedResponseData(
      newsFeed: NewsFeed.fromJson(json['newsFeed']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'newsFeed': newsFeed.toJson(),
    };
  }
}

// class NewsFeed {
//   final List<Post>? data;
//   final int total;

//   NewsFeed({this.data, required this.total});

//   factory NewsFeed.fromJson(Map<String, dynamic> json) {
//     var list = json['data'] as List;
//     List<Post> postsList = list.map((i) => Post.fromJson(i)).toList();

//     return NewsFeed(
//       data: postsList,
//       total: json['total'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': data!.map((post) => post.toJson()).toList(),
//       'total': total,
//     };
//   }
// }

// class Post {
//   final String id;
//   final List<String>? images;
//   final String content;
//   final List<String> likes;
//   final DateTime createdOn;
//   final Creator creator;
//   final bool showComments;
//   final bool showLikes;
//   final List<Comment>? comments;

//   Post({
//     required this.id,
//     required this.images,
//     required this.content,
//     required this.likes,
//     required this.createdOn,
//     required this.creator,
//     required this.showComments,
//     required this.showLikes,
//     required this.comments,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       images: json['images'] != null ? List<String>.from(json['images']) : null,
//       content: json['content'],
//       likes: List<String>.from(json['likes']),
//       createdOn: DateTime.parse(json['createdOn']),
//       creator: Creator.fromJson(json['creator']),
//       showComments: json['showComments'],
//       showLikes: json['showLikes'],
//       comments: json['comments'] != null
//           ? (json['comments'] as List).map((i) => Comment.fromJson(i)).toList()
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'images': images,
//       'content': content,
//       'likes': likes,
//       'createdOn': createdOn.toIso8601String(),
//       'creator': creator.toJson(),
//       'showComments': showComments,
//       'showLikes': showLikes,
//       'comments': comments?.map((comment) => comment.toJson()).toList(),
//     };
//   }
// }

// class Comment {
//   final String id;
//   final String content;
//   final DateTime? createdOn;
//   final String userID;
//   final List<String> likes;
//   final List<String> dislikes;
//   final Creator creator;

//   Comment({
//     required this.id,
//     required this.content,
//     required this.createdOn,
//     required this.userID,
//     required this.likes,
//     required this.dislikes,
//     required this.creator,
//   });

//   factory Comment.fromJson(Map<String, dynamic> json) {
//     return Comment(
//       id: json['id'],
//       content: json['content'],
//       createdOn:
//           json['createdOn'] != null ? DateTime.parse(json['createdOn']) : null,
//       userID: json['userID'],
//       likes: List<String>.from(json['likes']),
//       dislikes: List<String>.from(json['dislikes']),
//       creator: Creator.fromJson(json['creator']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'content': content,
//       'createdOn': createdOn?.toIso8601String(),
//       'userID': userID,
//       'likes': likes,
//       'dislikes': dislikes,
//       'creator': creator.toJson(),
//     };
//   }
// }

// class Creator {
//   final String id;
//   final String unionID;
//   final String lastName;
//   final String firstName;

//   Creator({
//     required this.id,
//     required this.unionID,
//     required this.lastName,
//     required this.firstName,
//   });

//   factory Creator.fromJson(Map<String, dynamic> json) {
//     return Creator(
//       id: json['id'],
//       unionID: json['unionID'],
//       lastName: json['lastName'],
//       firstName: json['firstName'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'unionID': unionID,
//       'lastName': lastName,
//       'firstName': firstName,
//     };
//   }
// }
// NewsFeed model
class NewsFeed {
  final List<Post>? data;
  final int total;

  NewsFeed({this.data, required this.total});

  factory NewsFeed.fromJson(Map<String, dynamic> json) {
    // The data is nested inside newsFeed.data
    var newsFeedData = json['newsFeed'];
    var list = newsFeedData['data'] as List;
    List<Post> postsList = list.map((i) => Post.fromJson(i)).toList();

    return NewsFeed(
      data: postsList,
      total: newsFeedData['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data!.map((post) => post.toJson()).toList(),
      'total': total,
    };
  }
}

// Post model
class Post {
  final String id;
  final List<String>? images;
  final String content;
  final List<String> likes;
  final DateTime createdOn;
  final UnionDefaultUser creator;
  final bool showComments;
  final bool showLikes;
  final List<Comment>? comments;

  Post({
    required this.id,
    this.images,
    required this.content,
    required this.likes,
    required this.createdOn,
    required this.creator,
    required this.showComments,
    required this.showLikes,
    this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      content: json['content'],
      likes: List<String>.from(json['likes']),
      createdOn: DateTime.parse(json['createdOn']),
      creator: UnionDefaultUser.fromJson(json['creator']),
      showComments: json['showComments'],
      showLikes: json['showLikes'],
      comments: json['comments'] != null
          ? (json['comments'] as List).map((i) => Comment.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': images,
      'content': content,
      'likes': likes,
      'createdOn': createdOn.toIso8601String(),
      'creator': creator.toJson(),
      'showComments': showComments,
      'showLikes': showLikes,
      'comments': comments?.map((comment) => comment.toJson()).toList(),
    };
  }
}

// UnionDefaultUser model
class UnionDefaultUser {
  final String id;
  final String firstName;
  final String lastName;
  final Profile profile;

  UnionDefaultUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profile,
  });

  factory UnionDefaultUser.fromJson(Map<String, dynamic> json) {
    return UnionDefaultUser(
      id: json['id'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      profile: Profile.fromJson(json['profile'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'profile': profile.toJson(),
    };
  }
}

//Profile model
class Profile {
  final String imageURL;

  Profile({required this.imageURL});

  // Factory constructor for creating a Profile instance from JSON
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      imageURL: json['imageURL'] as String? ?? '',
    );
  }

  // Method for converting Profile instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'imageURL': imageURL,
    };
  }
}

// Comment model
class Comment {
  final String id;
  final String content;
  final DateTime? createdOn;
  final String userID;
  final List<String> likes;
  final List<String> dislikes;
  final CommentCreator creator;

  Comment({
    required this.id,
    required this.content,
    required this.createdOn,
    required this.userID,
    required this.likes,
    required this.dislikes,
    required this.creator,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
      createdOn:
          json['createdOn'] != null ? DateTime.parse(json['createdOn']) : null,
      userID: json['userID'],
      likes: List<String>.from(json['likes']),
      dislikes: List<String>.from(json['dislikes']),
      creator: CommentCreator.fromJson(json['creator']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdOn': createdOn?.toIso8601String(),
      'userID': userID,
      'likes': likes,
      'dislikes': dislikes,
      'creator': creator.toJson(),
    };
  }
}

// CommentCreator model
class CommentCreator {
  final String id;
  final String unionID;
  final String lastName;
  final String firstName;

  CommentCreator({
    required this.id,
    required this.unionID,
    required this.lastName,
    required this.firstName,
  });

  factory CommentCreator.fromJson(Map<String, dynamic> json) {
    return CommentCreator(
      id: json['id'],
      unionID: json['unionID'],
      lastName: json['lastName'],
      firstName: json['firstName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unionID': unionID,
      'lastName': lastName,
      'firstName': firstName,
    };
  }
}
