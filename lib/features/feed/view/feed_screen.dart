import 'package:younified/utils/exports/common_exports.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int pageNumber = 2;
  final ScrollController _scrollController = ScrollController();
  bool _infiniteScrollLoader = false;

  set _setInfiniteScrollLoader(bool scrollLoaderValue) {
    _infiniteScrollLoader = scrollLoaderValue;
    feedProvider.notify();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !feedProvider.isInfiniteScrollLoading) {
      feedProvider.fetchNextPage();
    }
  }

  @override
  void initState() {
    super.initState();
    feedProvider.fetchFeeds(1);

    log(feedProvider.newsFeedListElement.value.length.toString());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBgColor,
      body: WillPopScope(
        onWillPop: () async {
          log(feedProvider.newsFeedListElement.value.length.toString());
          feedProvider.newsFeedListElement.value = [];
          return true;
        },
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: feedProvider.newsFeedListElement,
            builder: (context, snapshot, child) => feedProvider
                    .newsFeedListElement.value.isEmpty
                ? const Center(child: Text("Please go back, No Data is found"))
                : SizedBox(
                    height: 0.8.getScreenHeight,
                    child: Column(
                      children: [
                        Expanded(
                          child:
                              FeedListView(scrollController: _scrollController),
                        ),
                        if (_infiniteScrollLoader)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 40, top: 20),
                            child: AppLoader(),
                          ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class FeedListView extends StatelessWidget {
  final ScrollController scrollController;

  const FeedListView({required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    final feedProvider = Provider.of<FeedProvider>(context);

    return ValueListenableBuilder<List<Post>>(
      valueListenable: feedProvider.newsFeedListElement,
      builder: (context, feedList, child) {
        if (feedList.isEmpty) {
          return const Center(child: Text("No Data is found"));
        }

        return ListView.builder(
          controller: scrollController,
          itemCount: feedList.length,
          itemBuilder: (context, index) {
            return PostSection(feed: feedList[index], index: index);
          },
        );
      },
    );
  }
}

class PostSection extends StatelessWidget {
  final Post feed;
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
        child: Consumer<FeedProvider>(builder: (context, feedProvider, child) {
          bool isUserLiked =
              feed.likes.contains(StorageServices.getString('userId'));
          final isLoading = feedProvider.isLoadingPost(feed.id);
          return ExpansionTile(
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
                  // onTap: () => context.pushNamed(Routes.feedDetailScreen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: feed
                                        .creator.profile.imageURL.isNotEmpty &&
                                    feed.creator.profile.imageURL != ""
                                ? NetworkImage(feed.creator.profile.imageURL)
                                : const AssetImage(AppIcons.emptyProfile),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${feed.creator.firstName} ${feed.creator.lastName}',
                                style: context.textTheme.labelMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'posted ${feed.createdOn.timeAgo()}',
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
                          feed.content,
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
                onTap: () =>
                    context.pushNamed(Routes.feedDetailScreen, arguments: feed),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        feed.content,
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (feed.images != null && feed.images!.isNotEmpty)
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: CachedNetworkImage(
                            imageUrl: feed.images!.first,
                            placeholder: (context, url) => const SizedBox(
                                height: 244,
                                width: double.infinity,
                                child:
                                    Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) =>
                                const SizedBox(
                                    height: 244,
                                    width: double.infinity,
                                    child: Center(child: Icon(Icons.error))),
                            imageBuilder: (context, imageProvider) => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                feed.images!.first,
                                scale: 1,
                                height: 244,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: isLoading
                                ? null // Disable tap while loading
                                : () => feedProvider.fetchLikes(feed.id),
                            child: Opacity(
                              opacity: isLoading ? 0.5 : 1.0, // Visual feedback
                              child: SvgPicture.asset(
                                isUserLiked ? AppIcons.liked : AppIcons.heart,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          if (feed.showLikes)
                            Text(
                              feed.likes.length.toString(),
                              style: context.textTheme.labelMedium,
                            ),
                          const SizedBox(width: 20),
                          SvgPicture.asset(AppIcons.comment),
                          const SizedBox(width: 5),
                          if (feed.showComments)
                            Text(
                              feed.comments != null && feed.comments!.isNotEmpty
                                  ? feed.comments!.length.toString()
                                  : '0',
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
          );
        }),
      ),
    );
  }
}
