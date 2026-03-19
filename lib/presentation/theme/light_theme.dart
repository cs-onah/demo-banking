import 'package:demo_banking/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  const Color primaryColor = AppColors.primary;
  const secondaryColor = AppColors.secondary;

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: Colors.red,
  );

  final themeData = ThemeData(
    useMaterial3: false,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xffF2F2F2),
    cardColor: AppColors.cardColor,
    colorScheme: colorScheme,
    brightness: Brightness.light,
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadowColor: Colors.blue,
        elevation: 2,
        minimumSize: const Size(double.infinity, 48),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      isDense: false,
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey[400]!),
    ),
    // fontFamily: AppFont.quickSand,
    // textTheme: TextTheme(
    //   bodyLarge: _AppTextStyles.bodyLarge,
    //   bodyMedium: _AppTextStyles.bodyMedium, // default text styling
    //   bodySmall: _AppTextStyles.bodySmall,
    //   displayLarge: _AppTextStyles.displayLarge,
    //   displayMedium: _AppTextStyles.displayMedium,
    //   displaySmall: _AppTextStyles.displaySmall,
    //   headlineLarge: _AppTextStyles.headlineLarge,
    //   headlineMedium: _AppTextStyles.headlineMedium,
    //   headlineSmall: _AppTextStyles.headlineSmall,
    // ),
  );
  return themeData;
}
