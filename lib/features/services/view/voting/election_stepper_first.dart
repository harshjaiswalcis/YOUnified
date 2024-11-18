import 'package:younified/features/services/model/election_option.dart';
import 'package:younified/features/services/view/voting/constants/election_stepper_scaffold.dart';
import 'package:younified/features/services/view/voting/constants/option_list_tile.dart';
import 'package:younified/utils/exports/common_exports.dart';

// lib/features/election/screens/election_stepper_first.dart
class ElectionStepperFirst extends StatelessWidget {
  final List<ElectionOption> options = const [
    ElectionOption(name: "Blue"),
    ElectionOption(name: "Red"),
    ElectionOption(name: "Yellow"),
    ElectionOption(name: "Black"),
    ElectionOption(name: "White"),
  ];

  const ElectionStepperFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesProvider>(
      builder: (context, provider, _) {
        return ElectionStepperScaffold(
          currentStep: 1,
          showBackButton: false,
          onBack: () => context.pop(),
          onNext: provider.canProceedFromFirst
              ? () => context.pushNamed(Routes.electionStepperSecond)
              : () {},
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return OptionListTile(
                index: index,
                title: option.name,
                isSelected: provider.selectedColor == option.name,
                onTap: () => provider.setColor(option.name),
              );
            },
          ),
        );
      },
    );
  }
}

// class ElectionStepperFirst extends StatelessWidget {
//   final List<String> colors = ["Blue", "Red", "Yellow", "Black", "White"];
//   final ValueNotifier<String?> selectedColor = ValueNotifier<String?>(null);

//   ElectionStepperFirst({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backGround,
//       appBar: AppBar(
//         title: Text(
//           "Election Name",
//           style: context.textTheme.headlineLarge,
//         ),
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 10.0),
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new_rounded),
//             onPressed: () => context.pop(),
//           ),
//         ),
//         leadingWidth: 30,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ColoredBox(
//                 color: const Color(0xFFF1F2F6),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 16.0, horizontal: 24.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                           text: '1/3 ',
//                           style: context.textTheme.labelMedium!
//                               .copyWith(fontWeight: FontWeight.w600),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: 'Questions',
//                               style: context.textTheme.labelMedium,
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       LinearProgressIndicator(
//                         value: 1 / 3,
//                         minHeight: 8,
//                         borderRadius: BorderRadius.circular(8),
//                         color: AppColors.greenContainerbg,
//                         backgroundColor: AppColors.white,
//                       ),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Text(
//                   'Favourite color?',
//                   style: context.textTheme.labelMedium!.copyWith(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'You may select ',
//                     style: context.textTheme.headlineSmall,
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: '1 ',
//                         style: context.textTheme.headlineSmall!
//                             .copyWith(fontWeight: FontWeight.w400),
//                       ),
//                       const TextSpan(text: 'option'),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Expanded(child: RadioListTileExample()),
//               const SizedBox(height: 16),
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     offset: const Offset(0, -2),
//                     blurRadius: 6,
//                     spreadRadius: 1,
//                   ),
//                 ],
//                 color: AppColors.white,
//               ),
//               child: SizedBox(
//                 height: 80,
//                 width: 1.0.getScreenWidth,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 16),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Handle back button press
//                       context.pushNamed(Routes.electionStepperSecond);
//                     },
//                     child: const Text('Next'),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RadioListTileExample extends StatelessWidget {
//   final ValueNotifier<String?> selectedColor = ValueNotifier<String?>(null);
//   final List<String> colors = ["Blue", "Red", "Yellow", "Black", "White"];

//   RadioListTileExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<String?>(
//       valueListenable: selectedColor,
//       builder: (context, selectedColorValue, child) {
//         return ListView(
//           children: colors.asMap().entries.map((clr) {
//             int index = clr.key;
//             String color = clr.value;
//             return Container(
//               margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: selectedColorValue == color
//                       ? AppColors.themeColor
//                       : Colors.grey.shade300,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: ListTile(
//                 onTap: () {
//                   selectedColor.value = color;
//                 },
//                 title: Row(
//                   children: [
//                     Text(
//                       '${index + 1}. $color',
//                       style: context.textTheme.labelMedium!.copyWith(
//                         fontWeight: FontWeight.w500,
//                         color: selectedColorValue == color
//                             ? AppColors.themeColor
//                             : AppColors.tabTextColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 trailing: Radio<String>(
//                   value: color,
//                   groupValue: selectedColorValue,
//                   onChanged: (String? value) {
//                     selectedColor.value = value;
//                   },
//                   activeColor: AppColors.themeColor,
//                 ),
//                 contentPadding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
