// Response wrapper class
class NewsFeedResponse {
  final NewsFeedResponseData data;

  NewsFeedResponse({required this.data});

  factory NewsFeedResponse.fromJson(Map<String, dynamic> json) {
    return NewsFeedResponse(
      data: NewsFeedResponseData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {'data': data.toJson()};
}

class NewsFeedResponseData {
  final NewsFeed newsFeed;

  NewsFeedResponseData({required this.newsFeed});

  factory NewsFeedResponseData.fromJson(Map<String, dynamic> json) {
    return NewsFeedResponseData(
      newsFeed: NewsFeed.fromJson(json['newsFeed']),
    );
  }

  Map<String, dynamic> toJson() => {'newsFeed': newsFeed.toJson()};
}

class NewsFeed {
  final List<Post>? data;
  final int total;

  NewsFeed({this.data, required this.total});

  factory NewsFeed.fromJson(Map<String, dynamic> json) {
    final newsFeedData = json['newsFeed'];
    final list = newsFeedData['data'] as List?;
    final postsList = list?.map((i) => Post.fromJson(i)).toList() ?? [];

    return NewsFeed(
      data: postsList,
      total: newsFeedData['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((post) => post.toJson()).toList() ?? [],
        'total': total,
      };
}

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
      id: json['id'] ?? '',
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      content: json['content'] ?? '',
      likes: List<String>.from(json['likes'] ?? []),
      createdOn:
          DateTime.parse(json['createdOn'] ?? DateTime.now().toIso8601String()),
      creator: UnionDefaultUser.fromJson(json['creator'] ?? {}),
      showComments: json['showComments'] ?? false,
      showLikes: json['showLikes'] ?? false,
      comments: json['comments'] != null
          ? (json['comments'] as List).map((i) => Comment.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
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

  // Equality comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Post && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  /// `copyWith` method
  Post copyWith({
    String? id,
    List<String>? images,
    String? content,
    List<String>? likes,
    DateTime? createdOn,
    UnionDefaultUser? creator,
    bool? showComments,
    bool? showLikes,
    List<Comment>? comments,
  }) {
    return Post(
      id: id ?? this.id,
      images: images ?? this.images,
      content: content ?? this.content,
      likes: likes ?? this.likes,
      createdOn: createdOn ?? this.createdOn,
      creator: creator ?? this.creator,
      showComments: showComments ?? this.showComments,
      showLikes: showLikes ?? this.showLikes,
      comments: comments ?? this.comments,
    );
  }
}

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

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'profile': profile.toJson(),
      };

  // Add equality comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnionDefaultUser &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Profile {
  final String imageURL;

  Profile({required this.imageURL});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      imageURL: json['imageURL'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'imageURL': imageURL};

  // Add equality comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          imageURL == other.imageURL;

  @override
  int get hashCode => imageURL.hashCode;
}

class Comment {
  final String id;
  final String content;
  final DateTime? createdOn;
  final String userID;
  final List<String> likes;
  final List<String> dislikes;
  final UnionDefaultUser creator;

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
      id: json['id'] ?? '',
      content: json['content'] ?? '',
      createdOn:
          json['createdOn'] != null ? DateTime.parse(json['createdOn']) : null,
      userID: json['userID'] ?? '',
      likes: List<String>.from(json['likes'] ?? []),
      dislikes: List<String>.from(json['dislikes'] ?? []),
      creator: UnionDefaultUser.fromJson(json['creator'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'createdOn': createdOn?.toIso8601String(),
        'userID': userID,
        'likes': likes,
        'dislikes': dislikes,
        'creator': creator.toJson(),
      };

  // Add equality comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Comment && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
