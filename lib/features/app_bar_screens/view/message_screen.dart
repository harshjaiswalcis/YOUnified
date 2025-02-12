import 'package:younified/utils/exports/common_exports.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: CommonAppBar(title: context.strings.messages),
      body: Consumer<MessageProvider>(
        builder: (context, messageProvider, child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: messageProvider.messageListData.length,
            itemBuilder: (context, index) {
              final message = messageProvider.messageListData[index];
              final String hoursAgo =
                  messageProvider.calculateHoursAgo(message.time);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blueIconColor.withOpacity(0.12),
                        spreadRadius: 2,
                        blurRadius: 30,
                        offset: const Offset(0, 17),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor:
                            Colors.grey[200], // Placeholder background color
                        child: Image.asset("assets/images/profile.png",
                            fit: BoxFit.fill, width: 56),
                        // CachedNetworkImage(
                        //   imageUrl: message.avatarUrl,
                        //   placeholder: (context, url) =>
                        //       const CircularProgressIndicator(),
                        //   errorWidget: (context, url, error) =>
                        //       const Icon(Icons.error),
                        //   imageBuilder: (context, imageProvider) =>
                        //       CircleAvatar(
                        //     backgroundImage: imageProvider,
                        //     radius: 28,
                        //   ),
                        // ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              message.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    message.message,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  hoursAgo.toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
