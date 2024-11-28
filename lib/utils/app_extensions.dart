import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:younified/utils/exports/common_exports.dart';

extension ScreenSize on double {
  double get getScreenHeight =>
      MediaQuery.of(NavigationService.context).size.height * this;

  double get getScreenWidth =>
      MediaQuery.of(NavigationService.context).size.width * this;
}

extension AppLogger on Object? {
  void toLog() => log(toString());
}

extension BuildContextExtensions on BuildContext {
  AppProvider get appProvider => this.read();

  bool get isIOS => Platform.isIOS;
  S get strings => S.of(this);

  void postFrameCallback(VoidCallback callBack) =>
      WidgetsBinding.instance.addPostFrameCallback((_) => callBack());

  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  // void launchURL(String url) async {
  //   final Uri uri = url.toUri();
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw Exception('Could not launch $uri');
  //   }
  // }

  // void launchEmailURL({required String email, String? query}) async {
  //   final Uri emailLaunchUri = Uri(
  //     path: email,
  //     query: query,
  //     scheme: 'mailto',
  //   );
  //   if (await canLaunchUrl(emailLaunchUri)) {
  //     await launchUrl(emailLaunchUri);
  //   } else {
  //     throw Exception('Could not launch $emailLaunchUri');
  //   }
  // }

  String get liebherrText => "LiebherrText";

  String get liebherrHead => "LiebherrHead";

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Brightness get brightness => Theme.of(this).brightness;

  Color get hintColor => Theme.of(this).hintColor;

  Color get focusColor => Theme.of(this).focusColor;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get canvasColor => Theme.of(this).canvasColor;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get indicatorColor => Theme.of(this).indicatorColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get secondaryHeaderColor => Theme.of(this).secondaryHeaderColor;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  /// SCREEN RESOLUTION METHODS
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isTablet =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .size
          .shortestSide >
      600;

  String get iscurrentLang => Localizations.localeOf(this).languageCode;

  int getExtendedVersionNumber(String version) {
    List<int> result = [];
    final List<String> versionCells = version.split('.');
    result = versionCells.map((i) => int.parse(i.toString())).toList();
    return result[0] * 100000 + result[1] * 1000 + result[2];
  }

  /// NAVIGATION METHODS
  void pop() => Navigator.of(this).pop();

  void mayBePop() async => await Navigator.of(this).maybePop();

  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  void popAndPushNamed(String routeName, {Object? arguments}) =>
      Navigator.popAndPushNamed(this, routeName, arguments: arguments);

  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false,
          arguments: arguments);

  /// DIALOG AND SNACKBAR METHODS
  dynamic showAppGeneralDialog({
    required Widget child,
    Color? barrierColor,
  }) async =>
      await showGeneralDialog(
        context: NavigationService.context,
        barrierColor: barrierColor ?? Colors.transparent.withOpacity(0.1),
        pageBuilder: (context, animation, secondaryAnimation) => child,
      );

  ScaffoldMessengerState get _scaffoldMessenger =>
      ScaffoldMessenger.of(NavigationService.context);

  void hideSnackbar() => _scaffoldMessenger.hideCurrentSnackBar();

  void removeSnackbar() => _scaffoldMessenger.removeCurrentSnackBar();

  void showAppSnackBar({required String title, Color? textColor}) {
    hideSnackbar();
    removeSnackbar();
    _scaffoldMessenger.showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        margin: const EdgeInsets.all(2),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        backgroundColor: AppColors.white,
        elevation: 5,
        content: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                title,
                style: textTheme.headlineSmall!
                    .copyWith(color: textColor ?? AppColors.themeColor),
              )),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () => removeSnackbar(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension AppStringExtensions on String {
  Uri toUri() => Uri.parse(this);

  int toInt() => int.parse(this);

  num toNum() => num.parse(this);

  double toDouble() => double.parse(this);

  String get removeWhiteSpace => split(" ").join("");

  String get shuffle => (split('')..shuffle()).join('');

  String get replaceWithUnderscore => replaceRange(
      1, length - 1, List.generate(length - 2, (index) => "-").toList().join());

  Map<String, dynamic> toJsonDecodeToMapOfStringDynamic() =>
      (jsonDecode(toString()) as Map).toMapOfStringDynamic();

  List<Map<String, dynamic>> toJsonDecodeToListOfMapOfStringDynamic() =>
      (jsonDecode(toString()) as List<dynamic>).toListOfMapOfStringDynamic();

  dynamic toJsonDecode() => jsonDecode(this);
}

extension AppListExtensions<E> on List<E> {
  List<Map<String, dynamic>> toListOfMapOfStringDynamic() =>
      map((e) => e).toList().cast<Map<String, dynamic>>();

  List<String> toListOfString() => cast<String>();

  List<E> removeAll(Iterable<E> allToRemove) {
    if (allToRemove.isEmpty) {
      return this;
    } else {
      for (final element in allToRemove) {
        remove(element);
      }
      return this;
    }
  }

  // List<E> _distinctBy(E Function(E) predicate) {
  //   final HashSet<dynamic> set = HashSet();
  //   final List<E> list = [];
  //   toList().forEach((e) {
  //     final dynamic key = predicate(e);
  //     if (set.add(key)) {
  //       list.add(e);
  //     }
  //   });
  //   return list;
  // }

  // List<E> duplicates({E Function(E)? distinctBy}) {
  //   final List<E> dupes = List.from(this);
  //   if (distinctBy == null) {
  //     return dupes._removeAll(toSet().toList());
  //   }
  //   return dupes._removeAll(_distinctBy(distinctBy).toSet().toList());
  // }
}

extension DurationExtensions on num {
  Duration get ms => milliseconds;

  Duration get microseconds => Duration(microseconds: round());

  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  Duration get seconds => Duration(microseconds: (this * 1000 * 1000).round());

  Duration get minutes =>
      Duration(microseconds: (this * 1000 * 1000 * 60).round());

  Duration get hours =>
      Duration(microseconds: (this * 1000 * 1000 * 60 * 60).round());

  Duration get days =>
      Duration(microseconds: (this * 1000 * 1000 * 60 * 60 * 24).round());
}

extension DoubleExtension on double {
  String get toShortDoubleNumber =>
      "${toString().split(".").first}.${toString().split(".")[1].substring(0, 2)}";
}

extension MapParsing<T> on Map<T, T> {
  String castToJsonEncode() => jsonEncode(this);

  Map<String, dynamic> toMapOfStringDynamic() => cast<String, dynamic>();

  void renameKey(T previousName, T newName) {
    final T previousData = this[previousName] as T;
    this[newName] = previousData;
    remove(previousName);
  }
}

extension FormValidation on String {
  bool? get emailValidation => RegExp(Validations.emailPattern).hasMatch(this);
}

extension DateFormattingExtensions on String {
  String toFormattedDateAccordingToBackend() {
    try {
      // Parse the input date string
      DateTime dateTime = DateTime.parse(this);

      // Set the time to 18:00:00 (6:00 PM)
      dateTime =
          DateTime(dateTime.year, dateTime.month, dateTime.day, 18, 0, 0);

      // Format the DateTime object to ISO 8601 format with 'Z' for UTC
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime.toUtc());
    } catch (e) {
      // Handle parsing errors gracefully
      return "Invalid date format";
    }
  }

  String toDateOnly() {
    try {
      // Parse the input date string
      DateTime dateTime = DateTime.parse(this);

      // Format the DateTime object to extract only the date part
      return DateFormat("yyyy-MM-dd").format(dateTime);
    } catch (e) {
      // Handle parsing errors gracefully
      return "Invalid date format";
    }
  }
}
