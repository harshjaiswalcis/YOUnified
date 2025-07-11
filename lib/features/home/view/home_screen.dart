import 'package:younified/utils/exports/common_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeListModel> homeListData = HomeProvider.homeListData;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ...List.generate(
                homeListData.length,
                (index) => Center(
                  child: GestureDetector(
                    onTap: () async {
                      switch (homeListData[index].title.toUpperCase()) {
                        case "DOCUMENTS":
                          context.pushNamed(Routes.documentScreen);
                          break;
                        case "EXECUTIVES":
                          context.pushNamed(Routes.executiveScreen);
                          break;
                        case "PROFILE":
                          await homeProvider.fetchProfile().then((value) {
                            if (homeProvider.errorMessage == null) {
                              context.pushNamed(Routes.profileScreen);
                            } else {
                              context.showAppSnackBar(
                                title:
                                    homeProvider.errorMessage ?? 'Unknown error',
                                textColor: AppColors.redText,
                              );
                              homeProvider.errorMessage = null;
                              StorageServices.delete('token');
                              StorageServices.delete('userId');
                              context.pushNamedAndRemoveUntil(Routes.loginScreen);
                            }
                          });
                          break;
                        case "GRIEVANCES":
                          context.pushNamed(Routes.grievanceScreen);
                          break;
                        case "PERKS":
                          context.pushNamed(Routes.perkScreen);
                          break;
                        default:
                          // Handle default case
                          break;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 10),
                      child: SizedBox(
                        width: 342,
                        height: 128,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Color(0xFFE5E7ED), // background color
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x4D000000), // rgba(0, 0, 0, 0.27)
                                offset: Offset(0, 20),
                                blurRadius: 20,
                                spreadRadius: -20,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 328,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        homeListData[index].title.toUpperCase(),
                                        style: context.textTheme.headlineLarge,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          homeListData[index].subtitle,
                                          style:
                                              context.textTheme.headlineSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -10,
                                right: -10,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color:
                                        Color(0xFFFFFFFF), // background color
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: SvgPicture.asset(
                                        homeListData[index].image,
                                        width: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80)
            ],
          ),
        ),
        Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            if (homeProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
