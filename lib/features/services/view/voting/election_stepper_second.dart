import 'package:younified/features/services/model/election_option.dart';
import 'package:younified/features/services/view/voting/constants/election_stepper_scaffold.dart';
import 'package:younified/features/services/view/voting/constants/option_list_tile.dart';
import 'package:younified/utils/exports/common_exports.dart';

class ElectionStepperSecond extends StatelessWidget {
  final List<ElectionOption> seasons = const [
    ElectionOption(
      name: 'Winter',
      imageUrl: 'https://picsum.photos/200',
    ),
    ElectionOption(
      name: 'Spring',
      imageUrl: 'https://picsum.photos/200',
    ),
  ];

  const ElectionStepperSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesProvider>(
      builder: (context, provider, _) {
        return ElectionStepperScaffold(
          currentStep: 2,
          onBack: () => context.pop(),
          onNext: provider.canProceedFromSecond
              ? () => context.pushNamed(Routes.electionStepperThird)
              : () {},
          child: ListView.builder(
            itemCount: seasons.length,
            itemBuilder: (context, index) {
              final season = seasons[index];
              return OptionListTile(
                index: index,
                title: season.name,
                imageUrl: season.imageUrl,
                isSelected: provider.selectedSeason == season.name,
                onTap: () => provider.setSeason(season.name),
              );
            },
          ),
        );
      },
    );
  }
}
