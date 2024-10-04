import 'package:younified/utils/exports/common_exports.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  Widget returnBottomNavIcon(String icon, Color colors) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: SvgPicture.asset(
          icon,
          color: colors,
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
                icon: returnBottomNavIcon(
                    AppIcons.home, AppColors.greyIconColor),
                activeIcon: returnBottomNavIcon(
                    AppIcons.home, AppColors.blueIconColor),
              ),
              BottomNavigationBarItem(
                label: context.strings.home,
                icon: returnBottomNavIcon(
                    AppIcons.home, AppColors.greyIconColor),
                activeIcon: returnBottomNavIcon(
                    AppIcons.home, AppColors.blueIconColor),
              ),
              BottomNavigationBarItem(
                label: context.strings.home,
                icon: returnBottomNavIcon(
                    AppIcons.home, AppColors.greyIconColor),
                activeIcon: returnBottomNavIcon(
                    AppIcons.home, AppColors.blueIconColor),
              ),
              BottomNavigationBarItem(
                label: context.strings.home,
                icon: returnBottomNavIcon(
                    AppIcons.home, AppColors.greyIconColor),
                activeIcon: returnBottomNavIcon(
                    AppIcons.home, AppColors.blueIconColor),
              ),
            ],
          ),
        ),
      );
}
