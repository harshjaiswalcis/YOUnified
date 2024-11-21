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
              return PostSection(
                feed: feedListData[index],
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class PostSection extends StatelessWidget {
  final Feed feed;
  final int index;

  const PostSection({super.key, required this.feed, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child: Consumer<FeedProvider>(
          builder: (context, feedProvider, child) => ExpansionTile(
            initiallyExpanded: feedProvider.isExpanded(index),
            tilePadding: const EdgeInsets.only(left: 16),

            shape: Border.all(
                color: Colors.transparent), // Transparent border when collapsed
            collapsedShape: Border.all(color: Colors.transparent),
            onExpansionChanged: (value) {
              feedProvider.setExpanded(index, value);
            },
            trailing: const SizedBox(),
            title: Stack(
              children: [
                InkWell(
                  onTap: () => context.pushNamed(Routes.feedDetailScreen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(feed.feedProfileImage),
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
                                style: context.textTheme.labelLarge!.copyWith(
                                    height: 0, fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (!feedProvider.isExpanded(index))
                        Text(
                          feed.postDetails,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelMedium,
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        // pin Icon added
                        // Image.asset(AppIcons.pin),
                        // const SizedBox(width: 16),
                        Image.asset(feedProvider.isExpanded(index)
                            ? AppIcons.up
                            : AppIcons.down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(Routes.feedDetailScreen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        feed.postDetails,
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CachedNetworkImage(
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
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Row(
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
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ],
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
