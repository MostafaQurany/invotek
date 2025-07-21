import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextTheme {
  static const TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.textPrimary),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
  );
}
