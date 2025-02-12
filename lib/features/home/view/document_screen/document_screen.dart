import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/features/home/view/document_screen/document_list_widget.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  DocumentScreenState createState() => DocumentScreenState();
}

class DocumentScreenState extends State<DocumentScreen>
    with SingleTickerProviderStateMixin {
  late Future<List<String>?> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    // Start fetching categories immediately.
    _categoriesFuture = documentProvider.fetchDocumentCategories();
  }

  @override
  void dispose() {
    // The TabController is created once the categories are loaded.
    // It will be disposed automatically in the FutureBuilder branch.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>?>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        // While loading, show a scaffold with a loading indicator.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: AppColors.backGround,
            appBar: CommonAppBar(title: context.strings.documents),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        // If there is an error or no categories, show an error message.
        if (snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          final errorMsg =
              documentProvider.errorMessage ?? 'No categories available.';
          return Scaffold(
            backgroundColor: AppColors.backGround,
            appBar: CommonAppBar(title: context.strings.documents),
            body: Center(child: Text(errorMsg)),
          );
        }

        // Categories loaded successfully.
        final categories = snapshot.data!;
        final TabController tabController =
            TabController(length: categories.length, vsync: this);

        return Scaffold(
          backgroundColor: AppColors.backGround,
          appBar: AppBar(
            title: Text(
              context.strings.documents,
              style: context.textTheme.headlineLarge,
            ),
            backgroundColor: AppColors.backGround,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            leadingWidth: 30,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: ColoredBox(
                color: AppColors.tabbackGround,
                child: SizedBox(
                  height: 60,
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    tabAlignment: TabAlignment.start,
                    labelPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    indicator: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF34519A),
                          width: 3,
                        ),
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: categories.map((cat) => Tab(text: cat)).toList(),
                  ),
                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.notificationScreen),
                child: Stack(
                  children: [
                    SvgPicture.asset(AppIcons.bell),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Consumer<NotificationProvider>(
                        builder: (context, provider, child) {
                          final hasUnread = provider.notificationList
                              .any((notification) => !notification['isRead']);
                          return hasUnread
                              ? Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  constraints: const BoxConstraints(
                                      minWidth: 12, minHeight: 12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    constraints: const BoxConstraints(
                                        minWidth: 8, minHeight: 8),
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
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.messageScreen),
                child: SvgPicture.asset(AppIcons.notification),
              ),
              const SizedBox(width: 26),
            ],
          ),
          body: TabBarView(
            controller: tabController,
            children: categories
                .map((category) => DocumentsListWidget(
                      docType: category,
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
