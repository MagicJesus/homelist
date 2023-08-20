import 'package:flutter/material.dart';

class Labels {
  static const homePageTitle = 'HomeList';
  static const listsPageTitle = 'Your Lists';
}

class AppColors {
  static const textWhite = Color.fromARGB(255, 214, 214, 214);
  static const borderGrey = Color.fromARGB(255, 187, 189, 187);
  static const hintTextColor = Color.fromARGB(206, 133, 133, 133);
}

final appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 179, 255, 0),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: AppColors.hintTextColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ));
