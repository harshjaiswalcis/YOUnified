import 'package:younified/utils/exports/common_exports.dart';

class FeedDetailScreen extends StatefulWidget {
  final Post feed;
  const FeedDetailScreen({super.key, required this.feed});

  @override
  State<FeedDetailScreen> createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
  final _scrollController = ScrollController();
  final _messageController = TextEditingController();
  final _messageFocusNode = FocusNode();

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  void _focusOnTextField() {
    FocusScope.of(context).requestFocus(_messageFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    final updatedPost = _getUpdatedPost();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backGround,
        appBar: CommonAppBar(title: context.strings.feed),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: _buildPostAndComments(updatedPost)),
              _buildCommentInput(updatedPost),
            ],
          ),
        ),
      ),
    );
  }

  Post _getUpdatedPost() {
    return feedProvider.newsFeedListElement.value.firstWhere(
      (post) => post.id == widget.feed.id,
      orElse: () => widget.feed,
    );
  }

  Widget _buildPostAndComments(Post updatedPost) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          PostSection(feed: updatedPost, onFocus: _focusOnTextField),
          const Divider(),
          CommentSection(comments: updatedPost.comments),
        ],
      ),
    );
  }

  Widget _buildCommentInput(Post updatedPost) {
    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Expanded(
              child: _buildMessageTextField(updatedPost),
            ),
            const SizedBox(width: 12),
            _buildSendButton(updatedPost),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTextField(Post updatedPost) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(), // Reset to default
      ),
      child: TextField(
        controller: _messageController,
        focusNode: _messageFocusNode,
        decoration: InputDecoration(
          hintText: 'Write a comment',
          hintStyle: const TextStyle(color: AppColors.replyTextGround),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25), // Custom border radius
            borderSide: BorderSide.none, // No border
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
        textInputAction: TextInputAction.send,
        onSubmitted: (_) => _sendComment(updatedPost),
      ),
    );
  }

  Widget _buildSendButton(Post updatedPost) {
    return InkWell(
      onTap: () => _sendComment(updatedPost),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.themeColor,
        child: Padding(
          padding: const EdgeInsets.only(right: 2.0, top: 2.0),
          child: Image.asset(AppIcons.send),
        ),
      ),
    );
  }

  void _sendComment(Post updatedPost) async {
    final content = _messageController.text.trim();
    if (content.isEmpty) {
      context.showAppSnackBar(title: "Comment cannot be empty");
      return;
    }

    final newComment = await feedProvider.addComment(updatedPost.id, content);

    if (newComment != null) {
      _messageController.clear();
      if (!mounted) return;
      FocusScope.of(context).unfocus();
    } else {
      if (!mounted) return;
      context.showAppSnackBar(
        title: feedProvider.errorMessage ?? "Error adding comment",
      );
      feedProvider.errorMessage = null;
    }
  }
}

class PostSection extends StatelessWidget {
  final Post feed;
  final VoidCallback onFocus;
  const PostSection({super.key, required this.feed, required this.onFocus});

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedProvider>(builder: (context, feedProvider, child) {
      return ValueListenableBuilder<List<Post>>(
          valueListenable: feedProvider.newsFeedListElement,
          builder: (context, posts, child) {
            // Find the current post from the latest posts list
            final currentPost = posts.firstWhere(
              (post) => post.id == feed.id,
              orElse: () => feed,
            );

            bool isUserLiked =
                currentPost.likes.contains(StorageServices.getString('userId'));
            final isLoading = feedProvider.isLoadingPost(currentPost.id);

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: currentPost
                                    .creator.profile.imageURL.isNotEmpty &&
                                currentPost.creator.profile.imageURL != ""
                            ? NetworkImage(currentPost.creator.profile.imageURL)
                            : const AssetImage(
                                AppIcons.emptyProfile), // Use actual user image
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${currentPost.creator.firstName} ${currentPost.creator.lastName}',
                            style: context.textTheme.labelMedium!.copyWith(
                                // height: 0,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'posted ${currentPost.createdOn.timeAgo()}',
                            style: context.textTheme.labelLarge!.copyWith(
                                height: 0, fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentPost.content,
                    style: context.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 10),
                  // Image.network(
                  //   'https://via.placeholder.com/400', // Use actual image here
                  //   height: 244,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  if (currentPost.images != null &&
                      currentPost.images!.isNotEmpty)
                    CachedNetworkImage(
                      imageUrl: currentPost.images!.first,
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
                          currentPost.images!.first,
                          scale: 1,
                          height: 244,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: isLoading
                            ? null // Disable tap while loading
                            : () => feedProvider.fetchLikes(currentPost.id),
                        child: Opacity(
                          opacity: isLoading ? 0.5 : 1.0, // Visual feedback
                          child: SvgPicture.asset(
                            isUserLiked ? AppIcons.liked : AppIcons.heart,
                          ),
                        ),
                      ),
                      // SvgPicture.asset(AppIcons.heart),
                      const SizedBox(width: 5),
                      if (currentPost.showLikes)
                        Text(
                          currentPost.likes.length.toString(),
                          style: context.textTheme.labelMedium,
                        ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: onFocus,
                        child: SvgPicture.asset(AppIcons.comment),
                      ),
                      const SizedBox(width: 5),
                      if (currentPost.showComments)
                        Text(
                          currentPost.comments != null &&
                                  currentPost.comments!.isNotEmpty
                              ? currentPost.comments!.length.toString()
                              : '0',
                          style: context.textTheme.labelMedium,
                        ),
                    ],
                  ),
                ],
              ),
            );
          });
    });
  }
}

class CommentSection extends StatelessWidget {
  final List<Comment>? comments;

  const CommentSection({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    if (comments == null || comments!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            "No comments yet. Be the first to comment!",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comments!.length,
      itemBuilder: (context, index) {
        final comment = comments![index];
        return CommentWidget(comment: comment);
      },
    );
  }
}

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: comment.creator.profile.imageURL.isNotEmpty &&
                        comment.creator.profile.imageURL != ""
                    ? NetworkImage(comment.creator.profile.imageURL)
                    : const AssetImage(AppIcons.emptyProfile),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.commentBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${comment.creator.firstName} ${comment.creator.lastName}',
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: 0.7.getScreenWidth,
                            child: Text(
                              comment.content,
                              style: context.textTheme.labelMedium!
                                  .copyWith(fontSize: 14),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle reply action here
                      print("Reply button clicked");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            comment.createdOn != null
                                ? comment.createdOn!.timeAgo()
                                : 'Unknown time',
                            style: context.textTheme.labelLarge!
                                .copyWith(color: AppColors.replyTextGround),
                          ),
                          const SizedBox(width: 24),
                          // // IF REPLY MODULE IS ADDED IN FEEDS THEN UNCOMMENT THIS
                          // Text(
                          //   'Reply',
                          //   style: context.textTheme.labelLarge!
                          //       .copyWith(color: AppColors.replyTextGround),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // // IF REPLY MODULE IS ADDED IN FEEDS THEN UNCOMMENT THIS
          // if (comment.replies.isNotEmpty)
          //   Padding(
          //     padding: const EdgeInsets.only(left: 40.0),
          //     child: ListView.builder(
          //       shrinkWrap: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: comment.replies.length,
          //       itemBuilder: (context, index) {
          //         return ReplyWidget(reply: comment.replies[index]);
          //       },
          //     ),
          //   ),
        ],
      ),
    );
  }
}

// // IF REPLY MODULE IS ADDED IN FEEDS THEN UNCOMMENT THIS
// class ReplyWidget extends StatelessWidget {
//   final Comment reply;

//   const ReplyWidget({super.key, required this.reply});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const CircleAvatar(
//                 radius: 20,
//                 backgroundImage: NetworkImage(
//                     'https://via.placeholder.com/150'), // Use actual user image
//               ),
//               const SizedBox(width: 10),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   DecoratedBox(
//                     decoration: BoxDecoration(
//                       color: AppColors.commentBgColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 10.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             reply.user,
//                             style: context.textTheme.titleMedium,
//                           ),
//                           SizedBox(
//                             width: 0.50.getScreenWidth,
//                             child: Text(
//                               reply.text,
//                               style: context.textTheme.labelMedium!
//                                   .copyWith(fontSize: 14),
//                               softWrap: true,
//                               overflow: TextOverflow.visible,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Handle reply action here
//                       print("Reply button clicked");
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12.0, vertical: 4),
//                       child: Row(
//                         children: [
//                           Text(
//                             '5h',
//                             style: context.textTheme.labelLarge!
//                                 .copyWith(color: AppColors.replyTextGround),
//                           ),
//                           const SizedBox(width: 24),
//                           Text(
//                             'Reply',
//                             style: context.textTheme.labelLarge!
//                                 .copyWith(color: AppColors.replyTextGround),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
