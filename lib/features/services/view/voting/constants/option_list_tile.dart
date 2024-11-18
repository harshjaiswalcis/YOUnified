// lib/features/election/widgets/option_list_tile.dart
import 'package:younified/utils/exports/common_exports.dart';

class OptionListTile extends StatelessWidget {
  final int index;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final String? imageUrl;
  final bool isMultiSelect;

  const OptionListTile({
    super.key,
    required this.index,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.imageUrl,
    this.isMultiSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppColors.themeColor : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${index + 1}. $title',
              style: context.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color:
                    isSelected ? AppColors.themeColor : AppColors.tabTextColor,
              ),
            ),
            if (imageUrl != null) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ],
        ),
        trailing: Icon(
          isMultiSelect
              ? (isSelected ? Icons.check_box : Icons.check_box_outline_blank)
              : (isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked),
          color: isSelected ? AppColors.themeColor : Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
