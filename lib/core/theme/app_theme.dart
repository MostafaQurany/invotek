import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/screen_utils.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      textTheme: AppTextTheme.lightTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        titleTextStyle: AppTextTheme.lightTextTheme.titleLarge?.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        toolbarHeight: 70.h,
        iconTheme: IconThemeData(color: AppColors.white, size: 24.sp),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: ScreenUtils.cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtils.radiusMedium),
          ),
          textStyle: AppTextTheme.buttonText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.error),
        ),
        labelStyle: AppTextTheme.inputLabel,
        hintStyle: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
          color: AppColors.grey,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: ScreenUtils.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.cardRadius),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
      textTheme: AppTextTheme.darkTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextTheme.darkTextTheme.titleLarge?.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: ScreenUtils.cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtils.radiusMedium),
          ),
          textStyle: AppTextTheme.buttonText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.error),
        ),
        labelStyle: AppTextTheme.inputLabelDark,
        hintStyle: AppTextTheme.darkTextTheme.bodyMedium?.copyWith(
          color: AppColors.grey,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: ScreenUtils.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.cardRadius),
        ),
      ),
    );
  }
}
