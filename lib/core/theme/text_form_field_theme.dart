import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';

class TextFormFieldTheme {
  static const double borderRadius = 32.0;

  static InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: AppColors.primary, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: AppColors.error, width: 2.0),
    ),
  );
  static InputDecorationTheme inputDecorationThemeDark =
      inputDecorationThemeLight.copyWith();
}
