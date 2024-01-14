import 'package:flutter/material.dart';

class Labels {
  static const homePageTitle = 'HomeList';
  static const listsPageTitle = 'Your Lists';
}

class AppColors {
  static const textWhite = Color.fromARGB(255, 214, 214, 214);
  static const borderGrey = Color.fromARGB(255, 187, 189, 187);
  static const hintTextColor = Color.fromARGB(206, 133, 133, 133);
  static const debtRed = Color.fromARGB(255, 255, 51, 37);
  static const loanGreen = Color.fromARGB(255, 59, 216, 64);
}

final appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 178, 27, 247),
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
