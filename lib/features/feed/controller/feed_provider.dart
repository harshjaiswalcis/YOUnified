import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_queries/feed_queries.dart';

class FeedProvider extends ChangeNotifier {
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
            'limit': 7,
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
          final updatedList = [
            ...newsFeedListElement.value,
            ...newsFeed.data!,
          ];

          // Remove duplicates by converting to a Set and back to List
          newsFeedListElement.value = updatedList.toSet().toList();
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

  Future<void> resetAndRefetchFeeds() async {
    newsFeedListElement.value = []; // Clear the existing list
    currentPage = 0; // Reset page number
    await fetchFeeds(1); // Fetch first page
  }

  Set<String> _loadingPosts = {}; // Tracks loading states for specific posts

  bool isLoadingPost(String postId) => _loadingPosts.contains(postId);

  Future<List<String>?> fetchLikes(String newsId) async {
    if (_loadingPosts.contains(newsId))
      return null; // Prevent duplicate calls for this item
    _loadingPosts.add(newsId); // Mark this post as loading
    notifyListeners();

    try {
      QueryResult result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(FeedQueries.likes),
          variables: {
            'unionId': StorageServices.getString('unionId'),
            'newsId': newsId,
            'userId': StorageServices.getString('userId'),
          },
          fetchPolicy: FetchPolicy.networkOnly,
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
        log(result.data.toString());
        final likesData =
            result.data!['likeNewsItem']['likes'] as List<dynamic>?;
        final likes = likesData?.map((e) => e.toString()).toList() ?? [];
        log(likes.toString());
        final userId = StorageServices.getString('userId');

        // Update the corresponding Post in the newsFeedListElement
        final updatedList = newsFeedListElement.value.map((post) {
          if (post.id == newsId) {
            final updatedLikes = List<String>.from(post.likes);
            if (updatedLikes.contains(userId)) {
              updatedLikes.remove(userId); // Unlike
            } else {
              updatedLikes.add(userId!); // Like
            }
            return post.copyWith(
                likes: updatedLikes); // Use copyWith if available
          }
          return post;
        }).toList();

        newsFeedListElement.value = updatedList;

        return likes;
      }

      return null;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      _loadingPosts.remove(newsId); // Remove the post from loading state
      notifyListeners();
    }
  }
}
