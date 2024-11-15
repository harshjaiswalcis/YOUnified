import 'package:younified/utils/exports/common_exports.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            settingsCard(
              context: context,
              title: context.strings.contacts,
              children: [
                contactItem(
                    context: context,
                    icon: AppIcons.phone,
                    text: "(647) 776 - 0950"),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                contactItem(
                    context: context,
                    icon: AppIcons.mail,
                    text: "Contact@unionstrategiesinc.com"),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                contactItem(
                    context: context,
                    icon: AppIcons.location,
                    text: "87 Caster Avenue Woodbridge,\nOntario L4L5Z2"),
              ],
            ),
            const SizedBox(height: 18),
            settingsCard(
              context: context,
              title: context.strings.unionNotifications,
              children: [
                switchItem(label: context.strings.unionNotifications),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                switchItem(label: context.strings.allowCallDrops),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                switchItem(label: context.strings.allowTextMessages),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                switchItem(label: context.strings.allowEmails),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                switchItem(label: context.strings.allowPushNotifications),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                switchItem(label: context.strings.allowRegistrationEmails),
              ],
            ),
            const SizedBox(height: 18),
            settingsCard(
              context: context,
              title: "Accessibility",
              children: [
                dropdownItem(
                    context: context, label: "Language", value: "English"),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                textSizeItem(context: context),
              ],
            ),
            const SizedBox(height: 18),
            settingsCard(
              context: context,
              title: "System settings",
              children: [
                systemItem(context: context, label: "System notifications"),
                const Divider(thickness: 1, color: AppColors.commentBgColor),
                systemItem(context: context, label: "Version - 1.6.17"),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget settingsCard(
          {required BuildContext context,
          required String title,
          required List<Widget> children}) =>
      DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF34519A),
              offset: Offset(0, 6),
              blurRadius: 20,
              spreadRadius: -20,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 8),
              child: Text(
                title,
                style: context.textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              thickness: 2,
              color: AppColors.radioColor,
            ),
            ...children,
          ],
        ),
      );

  Widget contactItem(
          {required BuildContext context,
          required String icon,
          required String text}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          children: [
            Image.asset(icon),
            const SizedBox(width: 20),
            Text(
              text,
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
      );

  Widget switchItem({required String label}) {
    bool isSwitched = false;
    return StatefulBuilder(
      builder: (context, setState) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.textTheme.labelMedium,
            ),
            const SizedBox(width: 20),
            SizedBox(
              height: 30,
              child: CustomSwitch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dropdownItem(
          {required BuildContext context,
          required String label,
          required String value}) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.textTheme.labelMedium,
            ),
            SizedBox(
              height: 30,
              child: DropdownButton<String>(
                value: value,
                onChanged: (String? newValue) {},
                underline: const SizedBox.shrink(),
                icon: const Icon(Icons.keyboard_arrow_down_outlined,
                    color: AppColors.tabTextColor),
                items: <String>['English', 'French', 'Spanish']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: context.textTheme.labelMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );

  Widget textSizeItem({required BuildContext context}) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Text size",
              style: context.textTheme.labelMedium,
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("a", style: TextStyle(fontSize: 12)),
                SizedBox(width: 8),
                Text("A", style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                Text("A", style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      );

  Widget systemItem({required BuildContext context, required String label}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.textTheme.labelMedium,
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      );
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 55.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: widget.value ? AppColors.themeColor : AppColors.radioColor,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              width: 24.0,
              height: 24.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
