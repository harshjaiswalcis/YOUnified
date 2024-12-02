import 'package:younified/utils/exports/common_exports.dart';

class FeedProvider extends ChangeNotifier {
  // PERK LIST DATA
  static final List<Map<String, dynamic>> feedList = [
    {
      "id": "1",
      "fullName": "John Doe",
      "postedTime": "2024-11-10T14:30:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "Enjoying the beautiful sunset at the beach!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 125,
      "numberOfComments": 23
    },
    {
      "id": "2",
      "fullName": "Jane Smith",
      "postedTime": "2024-11-10T12:45:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "Just tried out this amazing new restaurant in town!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 87,
      "numberOfComments": 10
    },
    {
      "id": "3",
      "fullName": "Emily Johnson",
      "postedTime": "2024-11-09T16:20:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "A lovely hike through the mountains. Nature is amazing!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 230,
      "numberOfComments": 45
    },
    {
      "id": "4",
      "fullName": "Chris Lee",
      "postedTime": "2024-11-09T08:00:00Z",
      "feedProfileImage": "https://picsum.photos/200",
      "postDetails": "Starting my day with a great cup of coffee!",
      "postImages": "https://picsum.photos/200",
      "numberOfLikes": 54,
      "numberOfComments": 7
    },
    {
      "id": "5",
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

// For Expansion
  final Map<int, bool> _expandedStates = {};

  bool isExpanded(int index) {
    return _expandedStates[index] ?? true;
  }

  void toggleExpanded(int index) {
    _expandedStates[index] = !(_expandedStates[index] ?? true);
    notifyListeners();
  }

  void setExpanded(int index, bool value) {
    _expandedStates[index] = value;
    notifyListeners();
  }
}
