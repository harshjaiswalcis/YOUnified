import 'package:younified/utils/exports/common_exports.dart';

// Message model
class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.text, required this.isUser, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}

class FeedDetailScreen extends StatefulWidget {
  final Post feed;
  const FeedDetailScreen({super.key, required this.feed});

  @override
  State<FeedDetailScreen> createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
  // Messages list
  List<Message> messages = [
    Message(text: "Hello! Welcome to our chat.", isUser: false),
  ];

  // Scroll controller for messages
  final ScrollController _scrollController = ScrollController();

  // Text controller for message input
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _messageFocusNode = FocusNode();

  // Method to send message
  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add(Message(
            text: messageText, isUser: true, timestamp: DateTime.now()));
        _messageController.clear();
      });

      // Scroll to bottom after sending message
      _scrollToBottom();

      // Optional: Add a response message
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          messages.add(Message(
              text: "Thanks for your message!",
              isUser: false,
              timestamp: DateTime.now()));
        });
        _scrollToBottom();
      });
    }
  }

  // Method to scroll to bottom of list
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _messageFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapping outside the input
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backGround,
        appBar: CommonAppBar(title: context.strings.feed),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      PostSection(feed: widget.feed),
                      const Divider(),
                      CommentSection(comments: widget.feed.comments),
                    ],
                  ),
                ),
              ),
              // Keyboard-aware bottom input
              ColoredBox(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      // Message input field
                      Expanded(
                        child: Theme(
                          data: ThemeData(
                            inputDecorationTheme:
                                const InputDecorationTheme(), // Reset to default
                          ),
                          child: TextField(
                            controller: _messageController,
                            focusNode: _messageFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Write a comment',
                              hintStyle: context.textTheme.labelMedium!
                                  .copyWith(color: AppColors.replyTextGround),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    25), // Custom border radius
                                borderSide: BorderSide.none, // No border
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => _sendMessage(),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Send button
                      InkWell(
                        onTap: _sendMessage,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.themeColor,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 2.0, top: 2.0),
                            child: Image.asset(AppIcons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostSection extends StatelessWidget {
  final Post feed;
  const PostSection({super.key, required this.feed});

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
                      SvgPicture.asset(AppIcons.comment),
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
    return comments != null
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments!.length,
            itemBuilder: (context, index) {
              return CommentWidget(comment: comments![index]);
            },
          )
        : const SizedBox();
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
                            comment.createdOn!.timeAgo(),
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
