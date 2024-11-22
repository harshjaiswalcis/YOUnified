import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageServices.initSharedPreferences();
  await initHiveForFlutter();
  // Initialize Hive

  runApp(mainApp);
}

// final ValueNotifier<String> languageId =
//     ValueNotifier(StorageServices.contains("langId")
//         ? StorageServices.getString("langId").toString().isNotEmpty
//             ? StorageServices.getString("langId").toString()
//             : "1"
//         : "1");
final ValueNotifier<String> currentLanguage =
    ValueNotifier(StorageServices.contains("lang")
        ? StorageServices.getString("lang").toString().isNotEmpty
            ? StorageServices.getString("lang").toString()
            : "en"
        : "en");

StatelessWidget mainApp = MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AppProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => FeedProvider()),
    ChangeNotifierProvider(create: (_) => UnionProvider()),
    ChangeNotifierProvider(create: (_) => MessageProvider()),
    ChangeNotifierProvider(create: (_) => ServicesProvider()),
    ChangeNotifierProvider(create: (context) => NotificationProvider())
  ],
  child: ValueListenableBuilder(
    valueListenable: currentLanguage,
    builder: (context, value, child) {
      return MaterialApp(
        title: "YOUnified",
        locale: Locale(value),
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: NavigationService().generateRoute,
        supportedLocales: <Locale>[
          ...S.delegate.supportedLocales,
        ],
        localizationsDelegates: const [
          S.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (context, widget) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: widget!,
        ),
      );
    },
  ),
);
