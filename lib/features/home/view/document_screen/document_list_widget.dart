import 'package:younified/utils/exports/common_exports.dart';

class DocumentsListWidget extends StatefulWidget {
  final String docType;
  final int limit;
  const DocumentsListWidget({
    super.key,
    required this.docType,
    this.limit = 10,
  });

  @override
  DocumentsListWidgetState createState() => DocumentsListWidgetState();
}

class DocumentsListWidgetState extends State<DocumentsListWidget>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // Load or refresh the first page for this document type.
    documentProvider.loadDocumentsForCategory(widget.docType,
        refresh: true, limit: widget.limit);

    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      // Load the next page when near the bottom.
      documentProvider.loadDocumentsForCategory(widget.docType,
          limit: widget.limit);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true; // Preserve state when switching tabs.

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin.
    return Consumer<DocumentProvider>(
      builder: (context, provider, child) {
        final PaginatedDocuments paginated =
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
