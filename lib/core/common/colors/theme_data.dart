import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color primaryLight = Color(0xFF375668);
  static const Color backgroundLight = Color(0xFFFFFFFF);
}

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryLight,
    secondary: Color(0xFFAF9B78),
    surface: AppColors.backgroundLight,
    onPrimary: Colors.white,
    outline: Color(0xFFE9EDEE),
    tertiary: Color(0xFF3B464A),
    onSurface: Color(0xFF3B464A),
    // onSurface: Color(0xFFDEECF4),
  ),
  dividerColor: Color(0xFFE8E0D3),
  hintColor: Color(0xFF626D6F),
  scaffoldBackgroundColor: Color(0xFFF6F3EE),
  appBarTheme: const AppBarTheme(
    foregroundColor: Color(0xFF25292A),
    backgroundColor: Colors.transparent,
  ),
  listTileTheme: ListTileThemeData(
    leadingAndTrailingTextStyle: TextStyle(color: Color(0xFF3B464A)),
    textColor: Color(0xFF3B464A),
    selectedTileColor: Color(0xFFDEECF4),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF3B464A)),
    bodyMedium: TextStyle(color: Color(0xFF3B464A)),
    headlineSmall: TextStyle(color: Color(0xFF3B464A)),
  ),
);
