import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextStyles.lightTextTheme,
    package: 'sub_project',
    fontFamily: 'poppins',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextStyles.darkTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
    ),
  );
}

class AppTextStyles {
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 57, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: TextStyle(
        fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
    headlineLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black),
    headlineMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
    titleMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black87),
    bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black87),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
    labelMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
    labelSmall: TextStyle(
        fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 57, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(
        fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
    displaySmall: TextStyle(
        fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
    headlineLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.w600, color: Colors.white),
    headlineMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
    titleMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white70),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
    bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white70),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
    labelMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    labelSmall: TextStyle(
        fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
  );
}
