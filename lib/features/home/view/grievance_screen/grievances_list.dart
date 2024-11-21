// A reusable widget that displays grievances
import 'package:younified/utils/exports/common_exports.dart';

class GrievancesList extends StatelessWidget {
  final bool isOpen;

  const GrievancesList({super.key, required this.isOpen});

  @override
  Widget build(BuildContext context) {
    // Dummy data for grievances
    List<Map<String, String>> grievances = [
      {
        'id': '23/2/2023-131-CO',
        'topic': 'Grievance topic 1',
        'submitted': 'Jul 10, 2023',
        'updated': 'Jul 15, 2023',
        'stage': 'Stage 2',
      },
      {
        'id': '23/2/2023-132-CO',
        'topic': 'Grievance topic 2',
        'submitted': 'Jul 10, 2023',
        'updated': 'Jul 15, 2023',
        'stage': 'Stage 2',
      },
      {
        'id': '23/2/2023-133-CO',
        'topic': 'Grievance topic 3',
        'submitted': 'Jul 10, 2023',
        'updated': 'Jul 15, 2023',
        'stage': 'Stage 2',
      },
      {
        'id': '23/2/2023-131-CO',
        'topic': 'Grievance topic 4',
        'submitted': 'Jul 10, 2023',
        'updated': 'Jul 15, 2023',
        'stage': 'Closed',
      },
      {
        'id': '23/2/2023-132-CO',
        'topic': 'Grievance topic 5',
        'submitted': 'Jul 10, 2023',
        'updated': 'Jul 15, 2023',
        'stage': 'Closed',
      },
      {
        'id': '23/2/2023-133-CO',
        'topic': 'Grievance topic 6',
        'submitted': 'Jul 10, 2023',
        'updated': 'Jul 15, 2023',
        'stage': 'Closed',
      },
    ];

    // Filter grievances based on whether `isOpen` is true or false
    List<Map<String, String>> filteredGrievances =
        grievances.where((grievance) {
      if (isOpen) {
        return grievance['stage'] ==
            'Stage 2'; // Show Stage 2 when `isOpen` is true
      } else {
        return grievance['stage'] ==
            'Closed'; // Show Closed when `isOpen` is false
      }
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: filteredGrievances.length,
      itemBuilder: (context, index) {
        var grievance = filteredGrievances[index];
        return InkWell(
          onTap: () => context.pushNamed(Routes.grievanceDetailScreen),
          child: Padding(
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              grievance['id']!,
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              grievance['topic']!,
                              style: context.textTheme.headlineLarge!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color:
                                isOpen == true && grievance['stage'] != "Closed"
                                    ? AppColors.yellowContainerbg
                                    : AppColors.greenContainerbg,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              grievance['stage']!,
                              style: context.textTheme.labelMedium!.copyWith(
                                  color: isOpen == true &&
                                          grievance['stage'] != "Closed"
                                      ? AppColors.yellowTextColor
                                      : AppColors.backGround),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.strings.submittedOn,
                                style: context.textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                              Text(
                                grievance['submitted'].toString(),
                                style: context.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.strings.lastUpdatedOn,
                                style: context.textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                              Text(
                                grievance['updated'].toString(),
                                style: context.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
