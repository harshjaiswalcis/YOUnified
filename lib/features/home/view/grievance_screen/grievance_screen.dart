import 'package:younified/features/home/view/grievance_screen/grievances_list.dart';
import 'package:younified/utils/exports/common_exports.dart';

class GrievanceScreen extends StatefulWidget {
  const GrievanceScreen({super.key});

  @override
  State<GrievanceScreen> createState() => _GrievanceScreenState();
}

class _GrievanceScreenState extends State<GrievanceScreen> {
  @override
  void initState() {
    super.initState();

    // 👇 Trigger fetch when screen is pushed
    Future.microtask(() {
      context.read<GrievanceProvider>().fetchGrievances(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: CommonAppBar(title: context.strings.grievances),
      body: DefaultTabController(
        length: 2, // Two tabs: Open grievances and Closed grievances
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.grievanceTabBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: 56,
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    dividerColor: Colors.transparent,
                    labelColor: AppColors.tabTextColor,
                    labelStyle: context.textTheme.labelMedium,
                    unselectedLabelColor: AppColors.tabTextColor,
                    unselectedLabelStyle: context.textTheme.labelMedium,
                    indicatorPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                          text:
                              '${context.strings.open} ${context.strings.grievances.toLowerCase()}'),
                      Tab(
                          text:
                              '${context.strings.closed} ${context.strings.grievances.toLowerCase()}'),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  // Open grievances tab content
                  GrievancesList(isOpen: true),
                  // Closed grievances tab content
                  GrievancesList(isOpen: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
