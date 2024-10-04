import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor materialColor = MaterialColor(
    0xFF34519A,
    <int, Color>{
      50: Color(0xFFE4E9F4),
      100: Color(0xFFBCC8E5),
      200: Color(0xFF8EA3D4),
      300: Color(0xFF607DC3),
      400: Color(0xFF3E62B5),
      500: Color(0xFF1C46A6),
      600: Color(0xFF18409E),
      700: Color(0xFF133894),
      800: Color(0xFF0F318B),
      900: Color(0xFF081F7B),
    },
  );
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF34519A),
        primarySwatch: materialColor,
        cardTheme: const CardTheme(
            color: Color(0xFFFFFFFF), shape: RoundedRectangleBorder()),
        primaryColorDark: const Color.fromRGBO(58, 64, 70, 100),
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF34519A)),
        listTileTheme: const ListTileThemeData(iconColor: Color(0xFFFFFFFF)),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Color(0xFF34519A)),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 20,
            color: Color(0xff242529),
            fontWeight: FontWeight.w700,
            fontFamily: "Lato",
          ),
          displayMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF242529),
            fontWeight: FontWeight.w300,
            fontFamily: "Inter",
          ),
          displaySmall: TextStyle(
            fontSize: 16,
            color: Color(0xff0A93E1),
            fontWeight: FontWeight.w300,
            fontFamily: "Inter",
          ),
          headlineLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF242529),
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            color: Color(0xFF242529),
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
          headlineSmall: TextStyle(
            fontSize: 14,
            color: Color(0xFF4E4E4E),
            fontWeight: FontWeight.w300,
            fontFamily: "Inter",
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            color: Color(0xFF545454),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            color: Color(0xFF545454),
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
          labelSmall: TextStyle(
            fontSize: 16,
            color: Color(0xFF0F3BAA),
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF242529),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            color: Color(0xFF848587),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            color: Color(0xFF7A7A7A),
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            color: Color(0xFF545458),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Color(0xFFF7F0DF),
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
        ),
        radioTheme: RadioThemeData(
          splashRadius: 20,
          fillColor: WidgetStateProperty.all(const Color(0xFF926824)),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 5,
          backgroundColor: Color(0xFFFFFFFF),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFF4468C1),
          unselectedItemColor: Color(0xFFA6A9B4),
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            color: Color(0xFF4468C1),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            color: Color(0xFFA6A9B4),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(
            color: Color(0xFF173D3D),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 3,
          centerTitle: false,
          foregroundColor: Color(0xFFFFFFFF),
          backgroundColor: Color(0xFFFFFFFF),
          
          iconTheme: IconThemeData(color: Color(0xFF173D3D), size: 20),
          actionsIconTheme: IconThemeData(color: Color(0xFF173D3D), size: 20),
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFF173D3D),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          hintStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFFA8A8AA),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          labelStyle: TextStyle(
            fontSize: 18,
            color: Color(0xFF545454),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          errorStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBFC2CD), // Border color
              width: 1.0, // Border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBFC2CD), // Border color
              width: 1.0, // Border width
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBFC2CD), // Border color
              width: 1.0, // Border width
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          // foregroundColor: Color(0xFF000000),
          backgroundColor: Color(0xFF5884F0),
          extendedTextStyle: TextStyle(
            fontSize: 18,
            color: Color(0xFF000000),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Color(0xFF34519A)),
            backgroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
            shape: WidgetStatePropertyAll(
              ContinuousRectangleBorder(
                side: BorderSide(color: Color(0xFF34519A), width: 5),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 16,
                color: Color(0xFF34519A),
                fontWeight: FontWeight.w700,
                fontFamily: "Inter",
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(Color(0xFFFFFFFF)),
            backgroundColor: const WidgetStatePropertyAll(Color(0xFF34519A)),
            shadowColor: const WidgetStatePropertyAll(Color(0xFF000000)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
            elevation: const WidgetStatePropertyAll(5),
            textStyle: const WidgetStatePropertyAll(
              TextStyle(
                fontSize: 16,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Color(0xFF242529),
          labelStyle: TextStyle(
            fontSize: 16,
            // letterSpacing: 0.78,
            fontWeight: FontWeight.w500,
            color: Color(0xFF242529),
            fontFamily: "Inter",
          ),
          
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3, color: Color(0xFF000000))),
          unselectedLabelColor: Color.fromRGBO(81, 88, 93, 100),
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            // letterSpacing: 0.78,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),

      );

  ThemeData get dark => ThemeData(brightness: Brightness.dark);
}
