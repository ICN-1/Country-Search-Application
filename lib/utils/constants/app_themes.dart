import 'package:flutter/material.dart';

import 'app_colours.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColours.black,
    checkboxTheme: const CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(AppColours.white,),
      checkColor: WidgetStatePropertyAll(AppColours.dark,),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColours.grey3
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColours.white,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColours.black,),
    ),
    scaffoldBackgroundColor: AppColours.white,
    textTheme: TextThemes.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColours.grey,
    checkboxTheme: const CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(AppColours.grey,),
      checkColor: WidgetStatePropertyAll(AppColours.dark,),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColours.grey2
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColours.dark,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColours.grey,),
    ),
    scaffoldBackgroundColor: AppColours.dark,
    textTheme: TextThemes.darkTextTheme,
  );
}

class TextThemes {
  TextThemes._();

  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(color: AppColours.black),
    displayMedium: TextStyle(color: AppColours.black),
    displaySmall: TextStyle(color: AppColours.black),
    headlineLarge: TextStyle(color: AppColours.black),
    headlineMedium: TextStyle(color: AppColours.black),
    headlineSmall: TextStyle(color: AppColours.black),
    titleLarge: TextStyle(color: AppColours.black),
    titleMedium: TextStyle(color: AppColours.black),
    titleSmall: TextStyle(color: AppColours.black),
    bodyLarge: TextStyle(color: AppColours.black),
    bodyMedium: TextStyle(color: AppColours.black),
    bodySmall: TextStyle(color: AppColours.black),
    labelLarge: TextStyle(color: AppColours.black),
    labelMedium: TextStyle(color: AppColours.black),
    labelSmall: TextStyle(color: AppColours.black),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(color: AppColours.grey),
    displayMedium: TextStyle(color: AppColours.grey),
    displaySmall: TextStyle(color: AppColours.grey),
    headlineLarge: TextStyle(color: AppColours.grey),
    headlineMedium: TextStyle(color: AppColours.grey),
    headlineSmall: TextStyle(color: AppColours.grey),
    titleLarge: TextStyle(color: AppColours.grey),
    titleMedium: TextStyle(color: AppColours.grey),
    titleSmall: TextStyle(color: AppColours.grey),
    bodyLarge: TextStyle(color: AppColours.grey),
    bodyMedium: TextStyle(color: AppColours.grey),
    bodySmall: TextStyle(color: AppColours.grey),
    labelLarge: TextStyle(color: AppColours.grey),
    labelMedium: TextStyle(color: AppColours.grey),
    labelSmall: TextStyle(color: AppColours.grey),
  );
}
