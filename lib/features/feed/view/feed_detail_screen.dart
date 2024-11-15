import 'package:cached_network_image/cached_network_image.dart';
import 'package:younified/utils/exports/common_exports.dart';

class FeedDetailScreen extends StatelessWidget {
  const FeedDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          InkWell(
            onTap: () => context.pushNamed(Routes.notificationScreen),
            child: Stack(
              children: [
                SvgPicture.asset(AppIcons.bell), // Bell Icon
                Positioned(
                  right: 0,
                  top: 0,
                  child: Consumer<NotificationProvider>(
                    builder: (context, provider, child) {
                      bool hasUnread = provider.notificationList.any(
                        (notification) => !notification['isRead'],
                      );
                      return hasUnread
                          ? Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 8,
                                  minHeight: 8,
                                ),
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 26),
          InkWell(
            onTap: () => context.pushNamed(Routes.messageScreen),
            child: SvgPicture.asset(AppIcons.notification),
          ),
          const SizedBox(width: 26),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PostSection(),
              const Divider(),
              CommentSection(),
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
                            width: 0.54.getScreenWidth,
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
