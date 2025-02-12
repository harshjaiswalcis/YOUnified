import 'package:younified/utils/exports/common_exports.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

class GrievanceTopicScreen extends StatelessWidget {
  const GrievanceTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperData = List.generate(
        3,
        (index) => StepperItemData(
              id: '$index',
              content: ({
                'name': 'Subhash Chandra Shukla',
                'occupation': 'Flutter Development',
                'mobileNumber': '7318459902',
                'email': 'subhashchandras7318@gmail.com',
                'born_date': '12\nAug',
                "contact_list": {
                  "LinkedIn": "https://www.linkedin.com/in/subhashcs/",
                  "Portfolio": "https://subhashdev121.github.io/subhash/#/",
                }
              }),
              avatar: 'https://avatars.githubusercontent.com/u/70679949?v=4',
            )).toList();
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: CommonAppBar(title: context.strings.grievancetopic),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
        child: SingleChildScrollView(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('23/2/2023-131-CQ',
                              style: context.textTheme.bodyMedium),
                          const SizedBox(height: 4),
                          // Title
                          Text('Grievance topic',
                              style: context.textTheme.labelMedium!
                                  .copyWith(fontWeight: FontWeight.w700)),
                        ],
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.yellowContainerbg,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          child: Text(
                            'Stage 2',
                            style: context.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.yellowTextColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),

                  // Details Grid
                  Wrap(
                    spacing: 24,
                    runSpacing: 16,
                    children: [
                      _buildDetailItem(
                          context, 'Submitted on:', 'Jul 10, 2023'),
                      _buildDetailItem(
                          context, 'Last updated on:', 'Jul 15, 2023'),
                      _buildDetailItem(context, 'Steward:', 'Fred Vecchio'),
                      _buildDetailItem(context, 'SubSteward:', 'Lina Vecchio'),
                      _buildDetailItem(context, 'Members:', 'Frankie Ward'),
                      _buildDetailItem(context, 'Union:', 'Union Strategies'),
                      _buildDetailItem(context, 'Result:',
                          'Frankie was let go for barking on the job'),
                      _buildDetailItem(context, 'Request:',
                          'The employer re-instates the employee immediately'),
                      _buildDetailItem(context, 'Favour of Employee:', 'NO'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Documents Section
                  Text(
                    'Documents',
                    style: context.textTheme.labelSmall!
                        .copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 12),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: Row(
                        children: [
                          Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red.shade400,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Screenshot_2365.png',
                            style: context.textTheme.labelMedium!.copyWith(
                                color: AppColors.documentListTileColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Updates Section
                  Text(
                    'Updates',
                    style: context.textTheme.labelSmall!
                        .copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 16),
                  // _buildUpdate(),
                  // _buildUpdate(),
                  // _buildUpdate(),
                  SizedBox(height: 300, child: updatesStepper(stepperData)),
                  const SizedBox(height: 24),

                  // Signatures Section
                  _buildSignature(context, 'Grievor signature'),
                  const SizedBox(height: 16),
                  _buildSignature(context, 'Signature of union representative'),
                  const SizedBox(height: 16),
                  _buildSignature(context, 'Union officer signature'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  StepperListView updatesStepper(List<StepperItemData> stepperData) {
    return StepperListView(
      showStepperInLast: false,
      stepperData: stepperData,
      stepAvatar: (_, data) {
        return const PreferredSize(
          preferredSize: Size.fromRadius(10),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 12.0, 12.0, 12.0),
            child: Center(
              child: CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage(
                  AppIcons.stepper,
                ),
              ),
            ),
          ),
        );
      },
      stepContentWidget: (_, data) {
        return _buildUpdate();
      },
      stepperThemeData: const StepperThemeData(
        lineColor: Color(0x335884F0),
        lineWidth: 1,
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value) {
    return SizedBox(
      width: value.length > 22 ? 300 : 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          Text(
            value,
            style: context.textTheme.bodySmall!
                .copyWith(color: AppColors.tabTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdate() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://via.placeholder.com/40'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name Surname',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  'Jul 21, 2023, 12:26 AM',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lorem ipsum dolor sit amet consectetur adipiscing elit',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignature(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.labelSmall!.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: CustomPaint(
            painter: SignaturePainter(),
          ),
        ),
      ],
    );
  }
}

// Simple signature painter for demonstration
class SignaturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.3,
        size.width * 0.5,
        size.height * 0.6,
      )
      ..quadraticBezierTo(
        size.width * 0.65,
        size.height * 0.9,
        size.width * 0.8,
        size.height * 0.4,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
