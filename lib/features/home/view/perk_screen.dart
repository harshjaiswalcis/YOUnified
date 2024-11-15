import 'package:cached_network_image/cached_network_image.dart';
import 'package:younified/utils/exports/common_exports.dart';

class PerkScreen extends StatelessWidget {
  const PerkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PerkModel> perkListData = HomeProvider.perkListData;
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          context.strings.perks,
          style: context.textTheme.headlineLarge,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
        ),
        leadingWidth: 30,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () => context.pushNamed(Routes.notificationScreen),
            child: Stack(
              children: [
                SvgPicture.asset(AppIcons.bell), // Bell Icon
                Positioned(
                  right: 0,
                  top: 0,
                  child: Consumer<NotificationProvider>(
                    builder: (context, provider, child) {
                      bool hasUnread = provider.notificationList.any(
                        (notification) => !notification['isRead'],
                      );
                      return hasUnread
                          ? Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 8,
                                  minHeight: 8,
                                ),
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
            onTap: () => context.pushNamed(Routes.messageScreen),
            child: SvgPicture.asset(AppIcons.notification),
          ),
          const SizedBox(width: 26),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Opacity(
              opacity: 1.0, // Set to 0.0 if you want it fully transparent
              child: SizedBox(
                width: 342,
                height: 48,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blueIconColor.withOpacity(0.12),
                        spreadRadius: 2,
                        blurRadius: 30,
                        offset: const Offset(0, 17),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 12.0, 18.0, 12.0),
                        child: SvgPicture.asset(AppIcons.search),
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      border: InputBorder.none, // No border here
                      enabledBorder: InputBorder.none, // No border when enabled
                      focusedBorder: InputBorder.none, // No border when focused
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Category Filter Buttons
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChipWidget(label: 'New & Local', isSelected: true),
                  SizedBox(width: 8),
                  FilterChipWidget(
                      label: 'Health + Fitness', isSelected: false),
                  SizedBox(width: 8),
                  FilterChipWidget(label: 'Travel', isSelected: false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: AppColors.qrCardColor,
              thickness: 1.0,
            ),
            const SizedBox(height: 16),
            // Perks List
            Expanded(
              child: 
              ListView.builder 
              (
                itemCount: perkListData.length,
                itemBuilder: (context, index) => PerkItem(
                    imageUrl:
                        perkListData[index].imageUrl, // Placeholder Image URL
                    title: perkListData[index].title,
                    subtitle: perkListData[index].subtitle,
                    price: perkListData[index].price,
                    duration: perkListData[index].duration,
                    rating: perkListData[index].rating,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(
        label,
        style: context.textTheme.bodySmall!.copyWith(
          fontSize: 16,
          color: isSelected ? AppColors.backGround : AppColors.black,
        ),
      ),
      selected: isSelected,
      selectedColor: AppColors.themeColor,
      backgroundColor: AppColors.qrCardColor,
      showCheckmark: false,
      side: const BorderSide(color: Colors.transparent),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      ),
      onSelected: (selected) {
        // Handle selection
      },
    );
  }
}

class PerkItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  final String duration;
  final int rating;

  const PerkItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.duration,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => const SizedBox(
                    width: 86,
                    height: 86,
                    child: Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => const SizedBox(
                    width: 86,
                    height: 86,
                    child: Center(child: Icon(Icons.error))),
                imageBuilder: (context, imageProvider) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: 86,
                    height: 86,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: context.textTheme.labelLarge,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        // Rating Stars
                        for (int i = 1; i <= 5; i++)
                          Icon(
                            i <= rating ? Icons.star : Icons.star_border,
                            color: Colors.yellow[700],
                            size: 16,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: context.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    duration,
                    style: context.textTheme.headlineLarge!.copyWith(color: AppColors.greyIconColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
