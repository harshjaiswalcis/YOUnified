import 'package:younified/utils/exports/common_exports.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeListModel> servicesListData = ServicesProvider.servicesListData;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ...List.generate(
            servicesListData.length,
            (index) => Center(
              child: GestureDetector(
                onTap: () {
                  switch (servicesListData[index].title.toUpperCase()) {
                    case "VOTING":
                      context.pushNamed(Routes.votingScreen);
                      break;
                    case "CLICK TO CALL":
                      context.pushNamed(Routes.callingScreen);
                      break;
                    default:
                      // Handle default case
                      break;
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  child: SizedBox(
                    width: 342,
                    height: 128,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Color(0xFFE5E7ED), // background color
                        image: DecorationImage(
                            image: AssetImage(AppIcons.servicesBackground),
                            fit: BoxFit.fill),
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
                                    servicesListData[index].title.toUpperCase(),
                                    style: context.textTheme.headlineLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      servicesListData[index].subtitle,
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
                                    servicesListData[index].image,
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
    );
  }
}
