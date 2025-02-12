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
