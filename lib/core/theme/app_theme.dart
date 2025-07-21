import 'package:flutter/material.dart';
import 'package:invotek/core/theme/text_form_field_theme.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Almarai',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: Colors.white,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onError: Colors.white,
    ),
    textTheme: AppTextTheme.textTheme,
    inputDecorationTheme: TextFormFieldTheme.inputDecorationThemeLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.button,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Almarai',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onError: Colors.black,
    ),
    textTheme: AppTextTheme.textTheme,
    inputDecorationTheme: TextFormFieldTheme.inputDecorationThemeDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.button,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
