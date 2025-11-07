import 'package:flutter/material.dart';
import 'package:hotelino/core/constants/constants.dart' show AppColors;

class AppTheme {
  static ThemeData get lightTheme {
    final baseLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'sahel',
      colorSchemeSeed: AppColors.primary,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.lightText,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      textTheme: TextTheme(
        // Onboarding Screen
        displayLarge: TextStyle(
          fontSize: 24,
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 17,
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: AppColors.lightText,
          fontWeight: FontWeight.w400,
        ),

        // Hotel Detail
        headlineLarge: TextStyle(
          fontSize: 24,
          color: AppColors.lightText,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.lightText,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: AppColors.lightText,
          fontWeight: FontWeight.w400,
        ),
      ),

      //elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      //input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.lightFocusedBorder,
            width: 1.5,
          ),
        ),
        hintStyle: const TextStyle(color: AppColors.lightHint, fontSize: 14),
        labelStyle: const TextStyle(
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return baseLight.copyWith(
      colorScheme: baseLight.colorScheme.copyWith(
        outline: Colors.grey[500],
        primaryFixed: AppColors.primary,
        surfaceContainerLow: Colors.grey[200],
      ),
      inputDecorationTheme: baseLight.inputDecorationTheme.copyWith(
        fillColor: baseLight.colorScheme.surface,
      ),
    );
  }
  // ---------------------------------------------------------------------------

  static ThemeData get darkTheme {
    final baseDark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'sahel',
      colorSchemeSeed: AppColors.primary,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        // Onboarding Screen
        displayLarge: TextStyle(
          fontSize: 24,
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 17,
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.w400,
        ),

        // Hotel Detail
        headlineLarge: TextStyle(
          fontSize: 24,
          color: AppColors.darkText,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.darkText,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInputFill,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.darkFocusedBorder,
            width: 1.5,
          ),
        ),
        hintStyle: const TextStyle(color: AppColors.darkHint, fontSize: 14),
        labelStyle: const TextStyle(
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return baseDark.copyWith(
      colorScheme: baseDark.colorScheme.copyWith(
        outline: Colors.grey[500],
        primaryFixed: AppColors.primary,
      ),
      inputDecorationTheme: baseDark.inputDecorationTheme.copyWith(
        fillColor: baseDark.colorScheme.surface,
      ),
    );
  }
}
