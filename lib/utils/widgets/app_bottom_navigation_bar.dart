import 'package:younified/utils/exports/common_exports.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  Widget returnBottomNavIcon(String icon) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: SvgPicture.asset(
  icon
),
      );

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: context.read<AppProvider>().appNavIndex,
        builder: (_, currentIndex, __) => DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(153, 153, 153, 0.25),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              elevation: 5,
              showSelectedLabels: true,
              currentIndex: currentIndex,

              // backgroundColor: AppColors.darkGreen,
              onTap: (index) {
                context.read<AppProvider>().appNavIndex.value = index;
              },
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
              // unselectedLabelStyle: const TextStyle(
              //   fontSize: 10,
              //   fontWeight: FontWeight.w700,
              //   fontFamily: "LiebherrText",
              // ),
              items: [
                BottomNavigationBarItem(
                  label: context.strings.home,
                  // backgroundColor: AppColors.darkGreen,
                  icon: returnBottomNavIcon(AppIcons.home),
                  // activeIcon: returnBottomNavIcon(AppIcons.home),
                ),
                BottomNavigationBarItem(
                  label: context.strings.home,
                  // backgroundColor: AppColors.darkGreen,
                  icon: returnBottomNavIcon(AppIcons.home),
                  // activeIcon: returnBottomNavIcon(AppIcons.scan),
                ),
                // BottomNavigationBarItem(
                //   label: context.strings.shop,
                //   backgroundColor: AppColors.darkGreen,
                //   icon: returnBottomNavIcon(AppIcons.shop),
                //   activeIcon: returnBottomNavIcon(AppIcons.shop),
                // ),
                BottomNavigationBarItem(
                  label: context.strings.home,
                  // backgroundColor: AppColors.darkGreen,
                  icon: returnBottomNavIcon(AppIcons.home),
                  // activeIcon:
                  //     returnBottomNavIcon(AppIcons.bellIconForBottomBar),
                ),
                BottomNavigationBarItem(
                  label: context.strings.home,
                  // backgroundColor: AppColors.darkGreen,
                  icon: returnBottomNavIcon(AppIcons.home),
                  // activeIcon: returnBottomNavIcon(AppIcons.setting),
                ),
              ],
            ),
          ),
        ),
      );
}
