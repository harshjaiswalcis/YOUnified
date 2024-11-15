import 'package:younified/features/home/controller/home_controller.dart';
import 'package:younified/utils/exports/common_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeListModel> homeListData = HomeProvider.homeListData;
    // return SizedBox(
    //   height: 200,
    //   child: ColoredBox(
    //     color: AppColors.cardBgColor,
    //     child: const Center(
    //         child: Text("Home"),
    //     ),
    //   ),
    // );
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            //     child: SizedBox(
            //       width: 342,
            //       height: 128,
            //       child: DecoratedBox(
            //         decoration: const BoxDecoration(
            //           color: Color(0xFFE5E7ED), // background color
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Color(0x4D000000), // rgba(0, 0, 0, 0.27)
            //               offset: Offset(0, 20),
            //               blurRadius: 20,
            //               spreadRadius: -20,
            //             ),
            //           ],
            //         ),
            //         child: Center(
            //           child: Stack(
            //             children: [
            //               Positioned(
            //                 bottom: -15,
            //                 right: -15,
            //                 child: DecoratedBox(
            //                   decoration: const BoxDecoration(
            //                     color: Color(0xFFFFFFFF), // background color
            //                     borderRadius: BorderRadius.only(
            //                       topLeft: Radius.circular(50),
            //                       topRight: Radius.circular(50),
            //                       bottomLeft: Radius.circular(50),
            //                       bottomRight: Radius.circular(20),
            //                     ),
            //                   ),
            //                   child: SizedBox(
            //                     width: 100,
            //                     height: 100,
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(32.0),
            //                       child: SvgPicture.asset(
            //                         AppIcons.document,
            //                         width: 18.0,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 width: double.infinity,
            //                 child: Column(
            //                   children: [
            //                     const Text('Your content here'),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const Center(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            //     child: SizedBox(
            //       width: 342,
            //       height: 128,
            //       child: DecoratedBox(
            //         decoration: BoxDecoration(
            //           color: Color(0xFFE5E7ED), // background color
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Color(0x4D000000), // rgba(0, 0, 0, 0.27)
            //               offset: Offset(0, 20),
            //               blurRadius: 20,
            //               spreadRadius: -20,
            //             ),
            //           ],
            //         ),
            //         child: Opacity(
            //           opacity: 0, // opacity
            //           child: Center(
            //             child: Text('Your content here'),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // //this is good
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            //     child: SizedBox(
            //       width: 342,
            //       height: 128,
            //       child: DecoratedBox(
            //         decoration: const BoxDecoration(
            //           color: Color(0xFFE5E7ED), // background color
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Color(0x4D000000), // rgba(0, 0, 0, 0.27)
            //               offset: Offset(0, 20),
            //               blurRadius: 20,
            //               spreadRadius: -20,
            //             ),
            //           ],
            //         ),
            //         child: Stack(
            //           children: [
            //             SizedBox(
            //               width: 328,
            //               child: Padding(
            //                 padding: const EdgeInsets.only(left: 16.0),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       "DOCUMENTS",
            //                       style: context.textTheme.headlineLarge,
            //                     ),
            //                     const SizedBox(
            //                       height: 10,
            //                     ),
            //                     Text(
            //                       "See your\ndocuments here.",
            //                       style: context.textTheme.headlineSmall,
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             Positioned(
            //               bottom: -10,
            //               right: -10,
            //               child: DecoratedBox(
            //                 decoration: const BoxDecoration(
            //                   color: Color(0xFFFFFFFF), // background color
            //                   borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(50),
            //                     topRight: Radius.circular(50),
            //                     bottomLeft: Radius.circular(50),
            //                     bottomRight: Radius.circular(20),
            //                   ),
            //                 ),
            //                 child: SizedBox(
            //                   width: 100,
            //                   height: 100,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(32.0),
            //                     child: SvgPicture.asset(
            //                       AppIcons.document,
            //                       width: 18.0,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 20),
            ...List.generate(
              homeListData.length,
              (index) => Center(
                child: GestureDetector(
                  onTap: () {
                    switch (homeListData[index].title.toUpperCase()) {
                      case "DOCUMENTS":
                        context.pushNamed(Routes.documentScreen);
                        break;
                      case "EXECUTIVES":
                        context.pushNamed(Routes.executiveScreen);
                        break;
                      case "PROFILE":
                        context.pushNamed(Routes.profileScreen);
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        style: context.textTheme.headlineSmall,
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
                                  color: Color(0xFFFFFFFF), // background color
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
    );
  }
}
