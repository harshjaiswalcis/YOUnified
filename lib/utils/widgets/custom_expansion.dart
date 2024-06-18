import 'package:younified/utils/exports/common_exports.dart';

class CustomExpantionWidget extends StatelessWidget {
  final Widget title;
  final Widget content;
  final IconData expandIcon;
  final IconData expandedIcon;
  final bool initialExpandValue;
  final int animationMilliseconds;
  final EdgeInsets? contentPadding;

  const CustomExpantionWidget({
    super.key,
    required this.title,
    required this.content,
    this.initialExpandValue = false,
    this.animationMilliseconds = 300,
    this.contentPadding = EdgeInsets.zero,
    this.expandedIcon = Icons.arrow_drop_up,
    this.expandIcon = Icons.arrow_drop_down,
  });

  @override
  Widget build(BuildContext context) {
    bool expandContent = initialExpandValue;
    return StatefulBuilder(
      builder: (_, setStater) {
        return Container(
          margin: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => setStater(() => expandContent = !expandContent),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 13, 4, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      title,
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: expandContent
                            // ? Image.asset(
                            //     AppIcons.closeExpansion,
                            //     width: 16,
                            //     height: 16,
                            //   )
                            // : Image.asset(
                            //     AppIcons.openExpansion,
                            //     width: 16,
                            //     height: 16,
                            //   ),
                            ? SvgPicture.asset(
                                AppIcons.home,
                                width: 16,
                                height: 16,
                              )
                            : SvgPicture.asset(
                                AppIcons.home,
                                width: 16,
                                height: 16,
                              )
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: animationMilliseconds),
                child: !expandContent ? const SizedBox.shrink() : content,
              )
            ],
          ),
        );
      },
    );
  }
}
