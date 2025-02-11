import 'package:younified/utils/exports/common_exports.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  DocumentScreenState createState() => DocumentScreenState();
}

class DocumentScreenState extends State<DocumentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _categories = [];
  bool _isLoadingCategories = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Fetch categories once the widget is built.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<DocumentProvider>(context, listen: false);
      final cats = await provider.fetchDocumentCategories();
      if (cats != null && cats.isNotEmpty) {
        setState(() {
          _categories = cats;
          _isLoadingCategories = false;
          _tabController =
              TabController(length: _categories.length, vsync: this);
        });
      } else {
        setState(() {
          _isLoadingCategories = false;
          _errorMessage = provider.errorMessage ?? 'No categories available.';
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    if (_isLoadingCategories) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }
    return TabBarView(
      controller: _tabController,
      children: _categories
          .map((category) => DocumentsListWidget(docType: category))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          context.strings.documents,
          style: context.textTheme.headlineLarge,
        ),
        bottom: _isLoadingCategories || _errorMessage != null
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: ColoredBox(
                  color: AppColors.tabbackGround,
                  child: SizedBox(
                    height: 60,
                    child: TabBar(
                      controller: _tabController,
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
                      tabs: _categories.map((cat) => Tab(text: cat)).toList(),
                    ),
                  ),
                ),
              ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        leadingWidth: 30,
        elevation: 0,
        backgroundColor: AppColors.backGround,
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
                      bool hasUnread = provider.notificationList
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
            onTap: () => Navigator.of(context).pushNamed(Routes.messageScreen),
            child: SvgPicture.asset(AppIcons.notification),
          ),
          const SizedBox(width: 26),
        ],
      ),
      body: _buildBody(),
    );
  }
}

//
// DOCUMENTS LIST WIDGET (for each tab)
//

class DocumentsListWidget extends StatefulWidget {
  final String docType;
  final int limit;
  const DocumentsListWidget(
      {super.key, required this.docType, this.limit = 10});

  @override
  DocumentsListWidgetState createState() => DocumentsListWidgetState();
}

class DocumentsListWidgetState extends State<DocumentsListWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // On widget initialization, load (or refresh) the first page for this document type.
    final provider = Provider.of<DocumentProvider>(context, listen: false);
    provider.loadDocumentsForCategory(widget.docType,
        refresh: true, limit: widget.limit);

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final provider = Provider.of<DocumentProvider>(context, listen: false);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      // Trigger load of next page when scrolled near the bottom.
      provider.loadDocumentsForCategory(widget.docType, limit: widget.limit);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentProvider>(
      builder: (context, provider, child) {
        PaginatedDocuments paginated =
            provider.getPaginatedDocuments(widget.docType);

        if (paginated.isLoading && paginated.documents.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (paginated.errorMessage != null && paginated.documents.isEmpty) {
          return Center(child: Text(paginated.errorMessage!));
        }

        return RefreshIndicator(
          onRefresh: () => provider.loadDocumentsForCategory(widget.docType,
              refresh: true, limit: widget.limit),
          child: ListView.builder(
            controller: _scrollController,
            itemCount:
                paginated.documents.length + (paginated.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < paginated.documents.length) {
                final document = paginated.documents[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                          horizontal: 12.0, vertical: 6),
                      child: ListTile(
                        leading: SvgPicture.asset(AppIcons.jpg),
                        title: Text(
                          document.name,
                          style: context.textTheme.labelMedium?.copyWith(
                              color: AppColors.documentListTileColor),
                        ),
                        subtitle: Text(document.docType),
                        onTap: () {
                          // Handle document tap (open/download, etc.)
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      },
    );
  }
}
