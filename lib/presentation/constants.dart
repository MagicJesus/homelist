import 'package:flutter/material.dart';

class Labels {
  static const homePageTitle = 'HomeList';
}

class AppColors {
  static const textWhite = Color.fromARGB(255, 214, 214, 214);
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
);
