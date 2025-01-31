import 'package:younified/utils/exports/common_exports.dart';

class ExecutiveScreen extends StatelessWidget {
  const ExecutiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: CommonAppBar(title: context.strings.executives),
      body: FutureBuilder(
        future: homeProvider.fetchExecutive(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: AppLoader(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data!.count != 0) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: snapshot.data!.users.length,
              itemBuilder: (context, index) {
                final executive = snapshot.data!.users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blueIconColor.withOpacity(0.12),
                          spreadRadius: 2,
                          blurRadius: 30,
                          offset: const Offset(0, 17),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: (executive
                                        .profile.imageURL.isNotEmpty)
                                    ? NetworkImage(executive.profile.imageURL)
                                    : null,
                                child: (executive.profile.imageURL.isEmpty)
                                    ? Text(
                                        '${executive.firstName.isNotEmpty ? executive.firstName[0] : ''}${executive.lastName.isNotEmpty ? executive.lastName[0] : ''}',
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${executive.firstName} ${executive.lastName}',
                                    style: context.textTheme.titleLarge,
                                  ),
                                  Text(
                                    executive.unionPosition,
                                    style: context.textTheme.displaySmall!
                                        .copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              if (executive.display.email) ...[
                                Text(
                                  executive.profile.email,
                                  style: context.textTheme.displaySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              AppColors.skyBlueText),
                                ),
                                const SizedBox(height: 14),
                              ],
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${context.strings.office}:",
                                    style: context.textTheme.headlineLarge,
                                  ),
                                  // Text(
                                  //   executive.profile.phone
                                  //       ,
                                  //   style: context.textTheme.headlineLarge!
                                  //       .copyWith(fontWeight: FontWeight.w400),
                                  // ),
                                  RichText(
                                    text: TextSpan(
                                      text: executive.profile.phone,
                                      style: context.textTheme.headlineLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                      children: [
                                        if (executive.display.extension)
                                          TextSpan(
                                            text: ' EXT.${executive.extension}',
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              if (executive.display.mobile) ...[
                                const SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${context.strings.mobile}:",
                                      style: context.textTheme.headlineLarge,
                                    ),
                                    Text(
                                      executive.profile.phone,
                                      style: context.textTheme.headlineLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("Executive data is null"),
          );
        },
      ),
    );
  }
}
