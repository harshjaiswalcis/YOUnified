import 'package:younified/utils/exports/common_exports.dart';

// class AppBottomNavigationBar extends StatelessWidget {
//   const AppBottomNavigationBar({super.key});

//   Widget returnBottomNavIcon(String icon, Color colors) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         child: Image.asset(
//           icon,
//           color: colors,
//         ),
//         // SvgPicture.asset(
//         //   icon,
//         //   color: colors,
//         // ),
//       );

//   @override
//   Widget build(BuildContext context) => ValueListenableBuilder(
//         valueListenable: context.read<AppProvider>().appNavIndex,
//         builder: (_, currentIndex, __) => DecoratedBox(
//           decoration: const BoxDecoration(
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                 color: Color.fromRGBO(153, 153, 153, 0.25),
//                 spreadRadius: 0,
//                 blurRadius: 20,
//                 offset: Offset(0, 8),
//               ),
//             ],
//           ),
//           child: BottomNavigationBar(
//             elevation: 5,
//             showSelectedLabels: true,
//             currentIndex: currentIndex,
//             onTap: (index) {
//               context.read<AppProvider>().appNavIndex.value = index;
//             },
//             selectedLabelStyle: const TextStyle(
//               fontSize: 12,
//               color: AppColors.blueIconColor,
//               fontWeight: FontWeight.w500,
//             ),
//             unselectedLabelStyle: const TextStyle(
//               fontSize: 12,
//               color: AppColors.greyIconColor,
//               fontWeight: FontWeight.w500,
//             ),
//             items: [
//               BottomNavigationBarItem(
//                 label: context.strings.home,
//                 icon:
//                     returnBottomNavIcon(AppIcons.home, AppColors.greyIconColor),
//                 activeIcon:
//                     returnBottomNavIcon(AppIcons.home, AppColors.blueIconColor),
//               ),
//               BottomNavigationBarItem(
//                 label: context.strings.feed,
//                 icon: returnBottomNavIcon(
//                     AppIcons.feedIcon, AppColors.greyIconColor),
//                 activeIcon: returnBottomNavIcon(
//                     AppIcons.feedIcon, AppColors.blueIconColor),
//               ),
//               BottomNavigationBarItem(
//                 label: context.strings.services,
//                 icon: returnBottomNavIcon(
//                     AppIcons.servicesIcon, AppColors.greyIconColor),
//                 activeIcon: returnBottomNavIcon(
//                     AppIcons.servicesIcon, AppColors.blueIconColor),
//               ),
//               BottomNavigationBarItem(
//                 label: context.strings.settings,
//                 icon: returnBottomNavIcon(
//                     AppIcons.settingIcon, AppColors.greyIconColor),
//                 activeIcon: returnBottomNavIcon(
//                     AppIcons.settingIcon, AppColors.blueIconColor),
//               ),
//             ],
//           ),
//         ),
//       );
// }

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  Widget returnBottomNavIcon(String icon, Color colors) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Image.asset(
          icon,
          color: colors,
        ),
      );

  void _handleNavigation(BuildContext context, int index) {
    final previousIndex = context.read<AppProvider>().appNavIndex.value;
    context.read<AppProvider>().appNavIndex.value = index;

    // Check if navigating to FeedScreen (index 1)
    if (index == 1) {
      // Only refresh if we're coming from a different screen or it's the first load
      if (previousIndex != 1) {
        // Reset and fetch feeds using the provider
        context.read<FeedProvider>().resetAndRefetchFeeds();
      }
    }
  }

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
          child: BottomNavigationBar(
            elevation: 5,
            showSelectedLabels: true,
            currentIndex: currentIndex,
            onTap: (index) => _handleNavigation(context, index),
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.blueIconColor,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.greyIconColor,
              fontWeight: FontWeight.w500,
            ),
            items: [
              BottomNavigationBarItem(
                label: context.strings.home,
                icon:
                    returnBottomNavIcon(AppIcons.home, AppColors.greyIconColor),
                activeIcon:
                    returnBottomNavIcon(AppIcons.home, AppColors.blueIconColor),
              ),
              BottomNavigationBarItem(
                label: context.strings.feed,
                icon: returnBottomNavIcon(
                    AppIcons.feedIcon, AppColors.greyIconColor),
                activeIcon: returnBottomNavIcon(
                    AppIcons.feedIcon, AppColors.blueIconColor),
              ),
              BottomNavigationBarItem(
                label: context.strings.services,
                icon: returnBottomNavIcon(
                    AppIcons.servicesIcon, AppColors.greyIconColor),
                activeIcon: returnBottomNavIcon(
                    AppIcons.servicesIcon, AppColors.blueIconColor),
              ),
              BottomNavigationBarItem(
                label: context.strings.settings,
                icon: returnBottomNavIcon(
                    AppIcons.settingIcon, AppColors.greyIconColor),
                activeIcon: returnBottomNavIcon(
                    AppIcons.settingIcon, AppColors.blueIconColor),
              ),
            ],
          ),
        ),
      );
}
