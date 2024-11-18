import 'package:younified/utils/exports/common_exports.dart';

import 'package:younified/features/services/model/election_option.dart';
import 'package:younified/features/services/view/voting/constants/election_stepper_scaffold.dart';
import 'package:younified/features/services/view/voting/constants/option_list_tile.dart';

// lib/features/election/screens/election_stepper_third.dart
class ElectionStepperThird extends StatelessWidget {
  final List<ElectionOption> options = const [
    ElectionOption(name: "Blue"),
    ElectionOption(name: "Red"),
    ElectionOption(name: "Yellow"),
    ElectionOption(name: "Black"),
    ElectionOption(name: "White"),
  ];

  const ElectionStepperThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesProvider>(
      builder: (context, provider, _) {
        return ElectionStepperScaffold(
          currentStep: 3,
          onBack: () => context.pop(),
          onNext: provider.canProceedFromThird
              ? () => context.pushNamed(Routes.electionSummaryScreen)
              : () {},
          nextButtonText: 'Finish',
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return OptionListTile(
                index: index,
                title: option.name,
                isSelected: provider.selectedColorCombo.contains(option.name),
                isMultiSelect: true,
                onTap: () => provider.toggleColorCombo(option.name),
              );
            },
          ),
        );
      },
    );
  }
}

// class ElectionStepperThird extends StatelessWidget {
//   final List<String> colors = ["Blue", "Red", "Yellow", "Black", "White"];
//   final ValueNotifier<List<String>> selectedColors =
//       ValueNotifier<List<String>>([]);

//   ElectionStepperThird({super.key});

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
//             onPressed: () => Navigator.pop(context),
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
//                           text: '3/3 ',
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
//                         value: 3 / 3,
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
//                   'Which color combo?',
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
//                         text: 'multiple ',
//                         style: context.textTheme.headlineSmall!
//                             .copyWith(fontWeight: FontWeight.w400),
//                       ),
//                       const TextSpan(text: 'options'),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: RadioIconListTileExample(selectedColors: selectedColors),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text('Back'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Show selected colors
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Selected Colors'),
//                           content: ValueListenableBuilder<List<String>>(
//                             valueListenable: selectedColors,
//                             builder: (context, selectedColorsList, child) {
//                               return Text(selectedColorsList.isNotEmpty
//                                   ? selectedColorsList.join(', ')
//                                   : 'No colors selected');
//                             },
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: const Text('OK'),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     child: const Text('Finish'),
//                   ),
//                 ],
//               ),
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
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SizedBox(
//                         height: 45,
//                         child: OutlinedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: ButtonStyle(
//                             side: WidgetStateProperty.all(
//                                 const BorderSide(color: AppColors.themeColor)),
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 8, horizontal: 24.0),
//                             child: Text('Back'),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 45,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Handle next button press
//                             context.pushNamed(Routes.electionSummaryScreen);
//                           },
//                           child: const Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 8, horizontal: 24.0),
//                             child: Text('Finish'),
//                           ),
//                         ),
//                       ),
//                     ],
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

// class RadioIconListTileExample extends StatelessWidget {
//   final ValueNotifier<List<String>> selectedColors;
//   final List<String> colors = ["Blue", "Red", "Yellow", "Black", "White"];

//   RadioIconListTileExample({required this.selectedColors, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<String>>(
//       valueListenable: selectedColors,
//       builder: (context, selectedColorsList, child) {
//         return ListView(
//           children: colors.asMap().entries.map((clr) {
//             int index = clr.key;
//             String color = clr.value;
//             bool isSelected = selectedColorsList.contains(color);

//             return Container(
//               margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color:
//                       isSelected ? AppColors.themeColor : Colors.grey.shade300,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: ListTile(
//                 onTap: () {
//                   if (isSelected) {
//                     selectedColors.value = List.from(selectedColorsList)
//                       ..remove(color);
//                   } else {
//                     selectedColors.value = List.from(selectedColorsList)
//                       ..add(color);
//                   }
//                 },
//                 title: Row(
//                   children: [
//                     Text(
//                       '${index + 1}. $color',
//                       style: context.textTheme.labelMedium!.copyWith(
//                         fontWeight: FontWeight.w500,
//                         color: isSelected
//                             ? AppColors.themeColor
//                             : AppColors.tabTextColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 trailing: Icon(
//                   isSelected
//                       ? Icons.radio_button_checked
//                       : Icons.radio_button_unchecked,
//                   color: isSelected ? AppColors.themeColor : Colors.grey,
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
