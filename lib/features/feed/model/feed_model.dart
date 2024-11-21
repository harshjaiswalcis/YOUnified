class Feed {
  final String id;
  final String fullName;
  final DateTime postedTime;
  final String feedProfileImage;
  final String postDetails;
  final String postImages;
  final int numberOfLikes;
  final int numberOfComments;

  Feed({
    required this.id,
    required this.fullName,
    required this.postedTime,
    required this.feedProfileImage,
    required this.postDetails,
    required this.postImages,
    required this.numberOfLikes,
    required this.numberOfComments,
  });

  // Factory constructor to create a Feed instance from JSON
  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      id: json['id'],
      fullName: json['fullName'],
      postedTime: DateTime.parse(json['postedTime']),
      feedProfileImage: json['feedProfileImage'],
      postDetails: json['postDetails'],
      postImages: json['postImages'],
      numberOfLikes: json['numberOfLikes'],
      numberOfComments: json['numberOfComments'],
    );
  }

  // Method to convert a Feed instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'postedTime': postedTime.toIso8601String(),
      'feedProfileImage': feedProfileImage,
      'postDetails': postDetails,
      'postImages': postImages,
      'numberOfLikes': numberOfLikes,
      'numberOfComments': numberOfComments,
    };
  }
}

// Helper function to parse a List of Feeds from JSON
List<Feed> parseFeeds(List<dynamic> jsonList) {
  return jsonList.map((json) => Feed.fromJson(json)).toList();
}
