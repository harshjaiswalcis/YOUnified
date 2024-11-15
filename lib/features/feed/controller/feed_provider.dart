import 'package:younified/utils/exports/common_exports.dart';

class FeedProvider extends ChangeNotifier {
  // PERK LIST DATA
  static final List<Map<String, dynamic>> feedList = [
    {
      "fullName": "John Doe",
      "postedTime": "2024-11-10T14:30:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "Enjoying the beautiful sunset at the beach!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 125,
      "numberOfComments": 23
    },
    {
      "fullName": "Jane Smith",
      "postedTime": "2024-11-10T12:45:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "Just tried out this amazing new restaurant in town!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 87,
      "numberOfComments": 10
    },
    {
      "fullName": "Emily Johnson",
      "postedTime": "2024-11-09T16:20:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "A lovely hike through the mountains. Nature is amazing!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 230,
      "numberOfComments": 45
    },
    {
      "fullName": "Chris Lee",
      "postedTime": "2024-11-09T08:00:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "Starting my day with a great cup of coffee!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 54,
      "numberOfComments": 7
    },
    {
      "fullName": "Alex Morgan",
      "postedTime": "2024-11-08T21:15:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "Weekend vibes are the best vibes!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 300,
      "numberOfComments": 50
    }
  ];

//MAPPING
  static final List<Feed> feedListData =
      feedList.map((mapData) => Feed.fromJson(mapData)).toList();
}
