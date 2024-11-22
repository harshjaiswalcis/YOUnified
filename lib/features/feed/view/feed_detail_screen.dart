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
  const FeedDetailScreen({super.key});

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
        appBar: AppBar(
          title: Text(
            context.strings.feed,
            style: context.textTheme.headlineLarge,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => context.pop(),
            ),
          ),
          leadingWidth: 30,
          elevation: 0,
          actions: [
            // ... (existing actions code remains the same)
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const PostSection(),
                      const Divider(),
                      CommentSection(),
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
                                InputDecorationTheme(), // Reset to default
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
                              contentPadding: EdgeInsets.symmetric(
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
  const PostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Use actual user image
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name Surname',
                    style: context.textTheme.labelMedium!.copyWith(
                        // height: 0,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'posted 2 hours ago',
                    style: context.textTheme.labelLarge!
                        .copyWith(height: 0, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: context.textTheme.labelMedium,
          ),
          const SizedBox(height: 10),
          // Image.network(
          //   'https://via.placeholder.com/400', // Use actual image here
          //   height: 244,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          CachedNetworkImage(
            imageUrl: 'https://via.placeholder.com/400',
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
                'https://via.placeholder.com/400',
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
              SvgPicture.asset(AppIcons.heart),
              const SizedBox(width: 5),
              Text(
                '7',
                style: context.textTheme.labelMedium,
              ),
              const SizedBox(width: 20),
              SvgPicture.asset(AppIcons.comment),
              const SizedBox(width: 5),
              Text(
                '3',
                style: context.textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  final List<Comment> comments = [
    Comment(
      user: 'Name Surname',
      text: 'This looks like a great idea!',
      replies: [
        Comment(
            user: 'Name Surname',
            text:
                'Yes, I think it opens a new perspective for us to consider for the future'),
      ],
    ),
    Comment(user: 'Name Surname', text: 'We have a topic to discuss'),
  ];

  CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return CommentWidget(comment: comments[index]);
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
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Use actual user image
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
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.user,
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: 0.7.getScreenWidth,
                            child: Text(
                              comment.text * 9,
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
                            '5h',
                            style: context.textTheme.labelLarge!
                                .copyWith(color: AppColors.replyTextGround),
                          ),
                          const SizedBox(width: 24),
                          Text(
                            'Reply',
                            style: context.textTheme.labelLarge!
                                .copyWith(color: AppColors.replyTextGround),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (comment.replies.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: comment.replies.length,
                itemBuilder: (context, index) {
                  return ReplyWidget(reply: comment.replies[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class ReplyWidget extends StatelessWidget {
  final Comment reply;

  const ReplyWidget({super.key, required this.reply});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Use actual user image
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
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reply.user,
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: 0.50.getScreenWidth,
                            child: Text(
                              reply.text,
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
                            '5h',
                            style: context.textTheme.labelLarge!
                                .copyWith(color: AppColors.replyTextGround),
                          ),
                          const SizedBox(width: 24),
                          Text(
                            'Reply',
                            style: context.textTheme.labelLarge!
                                .copyWith(color: AppColors.replyTextGround),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String user;
  final String text;
  final List<Comment> replies;

  Comment({required this.user, required this.text, this.replies = const []});
}
