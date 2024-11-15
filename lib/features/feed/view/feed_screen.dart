import 'package:cached_network_image/cached_network_image.dart';
import 'package:younified/utils/exports/common_exports.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Feed> feedListData = FeedProvider.feedListData;
    return Scaffold(
      backgroundColor: AppColors.cardBgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView.builder(
            itemCount: feedListData.length,
            shrinkWrap: true, // Allows ListView inside SingleChildScrollView
            physics:
                const NeverScrollableScrollPhysics(), // Prevents ListView from scrolling independently
            itemBuilder: (context, index) {
              return PostSection(feed: feedListData[index]);
            },
          ),
        ),
      ),
    );
  }
}

class PostSection extends StatelessWidget {
  final Feed feed;

  const PostSection({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.feedDetailScreen),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Light black shadow
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
            color: AppColors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(feed.feedProfileImage),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feed.fullName,
                          style: context.textTheme.labelMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'posted ${_timeAgo(feed.postedTime)}',
                          style: context.textTheme.labelLarge!
                              .copyWith(height: 0, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  feed.postDetails,
                  style: context.textTheme.labelMedium,
                ),
                const SizedBox(height: 10),
                CachedNetworkImage(
                  imageUrl: feed.postImages,
                  placeholder: (context, url) => const SizedBox(
                      height: 244,
                      width: double.infinity,
                      child: Center(child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => const SizedBox(
                      height: 244,
                      width: double.infinity,
                      child: Center(child: Icon(Icons.error))),
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      feed.postImages,
                      scale: 1,
                      height: 244,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.heart),
                    const SizedBox(width: 5),
                    Text(
                      feed.numberOfLikes.toString(),
                      style: context.textTheme.labelMedium,
                    ),
                    const SizedBox(width: 20),
                    SvgPicture.asset(AppIcons.comment),
                    const SizedBox(width: 5),
                    Text(
                      feed.numberOfComments.toString(),
                      style: context.textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to calculate time ago
  String _timeAgo(DateTime postedTime) {
    final Duration difference = DateTime.now().difference(postedTime);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}
