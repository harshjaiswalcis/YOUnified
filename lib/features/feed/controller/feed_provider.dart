import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_queries/feed_queries.dart';

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
  // static final List<Feed> feedListData =
  //     feedList.map((mapData) => Feed.fromJson(mapData)).toList();

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

  //FETCH FEEDS DATA
  bool isLoading = false;
  String? errorMessage;
  void notify() => notifyListeners();
  ValueNotifier<List<Post>> newsFeedListElement = ValueNotifier([]);
  int totalPage = 0;
  int currentPage = 0;

  Future<NewsFeed?> fetchFeeds(int pageNumber) async {
    isLoading = true;
    try {
      QueryResult result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(FeedQueries.feeds),
          variables: {
            'unionId': StorageServices.getString('unionId'),
            'page': pageNumber,
            'limit': 4,
          },
        ),
      );
      if (result.hasException) {
        List<String> errorMessages =
            GraphQLErrorHandler.extractErrorMessages(result.exception);
        errorMessage = errorMessages.isNotEmpty
            ? errorMessages.first
            : "Unknown error occurred.";
        log(errorMessage!);
        return null;
      }

      if (result.data != null) {
        final newsFeed = NewsFeed.fromJson(result.data!);
        totalPage = newsFeed.total;
        currentPage = pageNumber;

        if (newsFeed.data != null) {
          newsFeedListElement.value = [
            ...newsFeedListElement.value,
            ...newsFeed.data!
          ];
        }

        return newsFeed;
      }

      return null;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
