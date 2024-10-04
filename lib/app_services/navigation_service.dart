import 'package:younified/features/app_bar_screens/view/message_screen.dart';
import 'package:younified/features/app_bar_screens/view/notification_screen.dart';
import 'package:younified/features/authentication/view/change_password.dart';
import 'package:younified/features/authentication/view/forget_password.dart';
import 'package:younified/features/authentication/view/signup_screen.dart';
import 'package:younified/features/authentication/view/union_enterance.dart';
import 'package:younified/features/home/view/document_screen.dart';
import 'package:younified/features/home/view/executive_screen.dart';
import 'package:younified/features/home/view/grievance_screen.dart';
import 'package:younified/features/home/view/perk_screen.dart';
import 'package:younified/features/home/view/profile_screen.dart';
import 'package:younified/splash_screen.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/features/authentication/view/login_screen.dart';
import 'package:younified/younified.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.app:
        return MaterialPageRoute(builder: (_) => const Younified());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.messageScreen:
        return MaterialPageRoute(builder: (_) => const MessageScreen());
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
      case Routes.perkScreen:
        return MaterialPageRoute(builder: (_) => const PerkScreen());
      case Routes.grievanceScreen:
        return MaterialPageRoute(builder: (_) => const GrievanceScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
