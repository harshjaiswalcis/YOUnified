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
            color: Color(0xFFA8A8AA),

            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
          displaySmall: TextStyle(
            fontSize: 24,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
          headlineLarge: TextStyle(
            fontSize: 24,
            color: Color(0xFF173D3D),
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
          headlineMedium: TextStyle(
            fontSize: 22,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            color: Color(0xFF545454),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            color: Color(0xFFF7F0DF),
            fontWeight: FontWeight.w700,
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
            color: Color(0xFF545454),
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF333333),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            color: Color(0xFFD1AC70),
            fontWeight: FontWeight.w700,
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
          fillColor: MaterialStateProperty.all(const Color(0xFF926824)),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xFFFFFFFF),
          // backgroundColor: const Color(0xFF173D3D),
          unselectedItemColor: const Color(0xFFFFFFFF).withOpacity(0.4),
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFFFFFFFF),
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
          centerTitle: true,
          foregroundColor: Color(0xFFFFFFFF),
          backgroundColor: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
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
            fontSize: 18,
            color: Color(0xFF888E94),
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          errorStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              // width: 1,
              style: BorderStyle.solid,
              // color: Color(0xFFD1AC70),
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              // width: 1,
              style: BorderStyle.solid,
              // color: Color(0xFFD1AC70),
              color: Color(0xFFFFFFFF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Color(0xFFD1AC70),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Color(0xFF000000),
          backgroundColor: Color(0xFFFFD000),
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
            foregroundColor: MaterialStatePropertyAll(Color(0xFF000000)),
            backgroundColor: MaterialStatePropertyAll(Color(0xFFFFFFFF)),
            shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                side: BorderSide(color: Color(0xFF000000), width: 2))),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 14,
                color: Color(0xFF000000),
                fontStyle: FontStyle.normal,
                fontFamily: "Inter",
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const MaterialStatePropertyAll(Color(0xFFFFFFFF)),
            backgroundColor: const MaterialStatePropertyAll(Color(0xFF173D3D)),
            shadowColor: const MaterialStatePropertyAll(Color(0xFF000000)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.0))),
            elevation: const MaterialStatePropertyAll(5),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                fontSize: 18,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Color(0xFF000000),
          labelStyle: TextStyle(
            fontSize: 14,
            letterSpacing: 0.78,
            fontWeight: FontWeight.w700,
            color: Color(0xFF3A4046),
            fontFamily: "Inter",
          ),
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3, color: Color(0xFF000000))),
          unselectedLabelColor: Color.fromRGBO(81, 88, 93, 100),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            letterSpacing: 0.78,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
          ),
        ),
      );

  ThemeData get dark => ThemeData(brightness: Brightness.dark);
}
