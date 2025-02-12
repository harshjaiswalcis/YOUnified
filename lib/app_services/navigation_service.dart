import 'package:younified/younified.dart';
import 'package:younified/splash_screen.dart';
import 'package:younified/features/home/view/qr_screen.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/features/home/view/perk_screen.dart';
import 'package:younified/features/home/view/profile_screen.dart';
import 'package:younified/features/home/view/executive_screen.dart';
import 'package:younified/features/feed/view/feed_detail_screen.dart';
import 'package:younified/features/services/view/calling_screen.dart';
import 'package:younified/features/authentication/view/login_screen.dart';
import 'package:younified/features/authentication/view/signup_screen.dart';
import 'package:younified/features/authentication/view/change_password.dart';
import 'package:younified/features/authentication/view/forget_password.dart';
import 'package:younified/features/services/view/voting/voting_screen.dart';
import 'package:younified/features/authentication/view/union_enterance.dart';
import 'package:younified/features/services/view/voting/receipt_screen.dart';
import 'package:younified/features/app_bar_screens/view/message_screen.dart';
import 'package:younified/features/app_bar_screens/view/notification_screen.dart';
import 'package:younified/features/home/view/document_screen/document_screen.dart';
import 'package:younified/features/home/view/grievance_screen/grievance_screen.dart';
import 'package:younified/features/services/view/voting/election_stepper_third.dart';
import 'package:younified/features/services/view/voting/election_stepper_first.dart';
import 'package:younified/features/services/view/voting/election_stepper_second.dart';
import 'package:younified/features/services/view/voting/election_summary_screen.dart';
import 'package:younified/features/home/view/grievance_screen/grievance_topic_screen.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.app:
        return MaterialPageRoute(builder: (_) => const Younified());
      case Routes.qrScreen:
        return MaterialPageRoute(builder: (_) => const QRScreen());
      case Routes.perkScreen:
        return MaterialPageRoute(builder: (_) => const PerkScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.votingScreen:
        return MaterialPageRoute(builder: (_) => const VotingScreen());
      case Routes.messageScreen:
        return MaterialPageRoute(builder: (_) => const MessageScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.callingScreen:
        return MaterialPageRoute(builder: (_) => const CallingScreen());
      case Routes.receiptScreen:
        return MaterialPageRoute(builder: (_) => const ReceiptScreen());
      case Routes.unionEnterance:
        return MaterialPageRoute(builder: (_) => const UnionEnterance());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePassword());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.documentScreen:
        return MaterialPageRoute(builder: (_) => const DocumentScreen());
      case Routes.executiveScreen:
        return MaterialPageRoute(builder: (_) => const ExecutiveScreen());
      case Routes.grievanceScreen:
        return MaterialPageRoute(builder: (_) => const GrievanceScreen());
      case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.electionStepperFirst:
        return MaterialPageRoute(builder: (_) => const ElectionStepperFirst());
      case Routes.electionStepperThird:
        return MaterialPageRoute(builder: (_) => const ElectionStepperThird());
      case Routes.grievanceDetailScreen:
        return MaterialPageRoute(builder: (_) => const GrievanceTopicScreen());
      case Routes.electionStepperSecond:
        return MaterialPageRoute(builder: (_) => const ElectionStepperSecond());
      case Routes.electionSummaryScreen:
        return MaterialPageRoute(builder: (_) => const ElectionSummaryScreen());
      case Routes.feedDetailScreen:
        return MaterialPageRoute(
            builder: (_) => FeedDetailScreen(
                  feed: settings.arguments as Post,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
