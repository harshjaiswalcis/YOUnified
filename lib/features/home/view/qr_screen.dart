
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:younified/utils/exports/common_exports.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @protected
  late QrImage qrImage;

  @override
  void initState() {
    super.initState();

    final qrCode = QrCode(
      8,
      QrErrorCorrectLevel.H,
    )..addData('lorem ipsum dolor sit amet');

    qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          context.strings.backToProfile,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 8), // Spacer from appBar to content
            // Title and description
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.qrCardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      context.strings.scanQRCode,
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur adipiscing',
                      style: context.textTheme.labelMedium!.copyWith(color: AppColors.qrSubTitleColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            // QR Code
            SizedBox(
              width: 184,
              height: 184,
              child: PrettyQrView(
                qrImage: qrImage,
                decoration: const PrettyQrDecoration(),
              ),
            ),
            const SizedBox(height: 50),
            // Share as a link button
            OutlinedButton(
              onPressed: () {
                // Handle share action here
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: const BorderSide(color:  AppColors.themeColor),
              ),
              child: SizedBox(
                height: 30,
                width: 1.0.getScreenWidth,
                child: Center(
                  child: Text(
                    context.strings.shareAsALink,
                    style: context.textTheme.headlineLarge!.copyWith(color: AppColors.themeColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
