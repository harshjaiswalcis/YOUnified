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
