import 'package:younified/utils/exports/common_exports.dart';

class ElectionStepperSecond extends StatelessWidget {
  final List<Map<String, dynamic>> seasons = [
    {
      'name': 'Winter',
      'image': 'https://picsum.photos/200' // Replace with your winter image URL
    },
    {
      'name': 'Spring',
      'image': 'https://picsum.photos/200' // Replace with your spring image URL
    }
  ];

  final ValueNotifier<String?> selectedSeason = ValueNotifier<String?>(null);

  ElectionStepperSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Election Name",
          style: context.textTheme.headlineLarge,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
        ),
        leadingWidth: 30,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredBox(
                color: const Color(0xFFF1F2F6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '2/3 ',
                          style: context.textTheme.labelMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Questions',
                              style: context.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 2 / 3,
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.greenContainerbg,
                        backgroundColor: AppColors.white,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Favourite season?',
                  style: context.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: RichText(
                  text: TextSpan(
                    text: 'You must select ',
                    style: context.textTheme.headlineSmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: '1 ',
                        style: context.textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      const TextSpan(text: 'option'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ValueListenableBuilder<String?>(
                  valueListenable: selectedSeason,
                  builder: (context, selectedSeasonValue, child) {
                    return ListView(
                      children: seasons.map((season) {
                        return RadioListTile<String>(
                          title: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(season['name'],
                                        style: const TextStyle(fontSize: 18)),
                                    const SizedBox(height: 8),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        season['image'],
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          value: season['name'],
                          groupValue: selectedSeasonValue,
                          onChanged: (String? value) {
                            selectedSeason.value = value;
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text(
          //         '2/3 Questions',
          //         style: TextStyle(fontSize: 18),
          //       ),
          //       const SizedBox(height: 8),
          //       LinearProgressIndicator(
          //         value: 2 / 3,
          //         backgroundColor: Colors.grey[300],
          //         color: Colors.green,
          //       ),
          //       const SizedBox(height: 16),
          //       const Text(
          //         'Favourite season?',
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //       ),
          //       const Text(
          //         'You must select 1 option',
          //         style: TextStyle(fontSize: 14, color: Colors.grey),
          //       ),
          //       const SizedBox(height: 16),

          //       const SizedBox(height: 16),
          //     ],
          //   ),
          // ),
          Positioned(
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -2),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
                color: AppColors.white,
              ),
              child: SizedBox(
                width: 1.0.getScreenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 45,
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle back button press
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            side: WidgetStateProperty.all(
                                const BorderSide(color: AppColors.themeColor)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text('Back'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            context.pushNamed(Routes.electionStepperThird);
                            // Handle next button press
                            // showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     title: const Text('Selected Season'),
                            //     content: ValueListenableBuilder<String?>(
                            //       valueListenable: selectedSeason,
                            //       builder:
                            //           (context, selectedSeasonValue, child) {
                            //         return Text(selectedSeasonValue ??
                            //             'No season selected');
                            //       },
                            //     ),
                            //     actions: [
                            //       TextButton(
                            //         onPressed: () {
                            //           context.pushNamed(
                            //               Routes.electionStepperThird);
                            //         },
                            //         child: const Text('OK'),
                            //       ),
                            //     ],
                            //   ),
                            // );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text('Next'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
