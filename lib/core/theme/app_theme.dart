import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';

class AppTheme {
  // Material 3 Color Schemes
  static ColorScheme get _lightColorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      // Customize Material 3 colors
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.primary.withOpacity(0.1),
      onPrimaryContainer: AppColors.primary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.secondary.withOpacity(0.1),
      onSecondaryContainer: AppColors.secondary,
      tertiary: AppColors.accent,
      onTertiary: AppColors.white,
      tertiaryContainer: AppColors.accent.withOpacity(0.1),
      onTertiaryContainer: AppColors.accent,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.error.withOpacity(0.1),
      onErrorContainer: AppColors.error,
      surface: AppColors.white,
      onSurface: AppColors.black,
      surfaceContainer: AppColors.whiteGray,
      outline: Colors.grey.shade300,
      outlineVariant: Colors.grey.shade200,
    );
  }

  static ColorScheme get _darkColorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      // Customize Material 3 colors for dark mode
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.primary.withOpacity(0.2),
      onPrimaryContainer: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.secondary.withOpacity(0.2),
      onSecondaryContainer: AppColors.white,
      tertiary: AppColors.accent,
      onTertiary: AppColors.white,
      tertiaryContainer: AppColors.accent.withOpacity(0.2),
      onTertiaryContainer: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.error.withOpacity(0.2),
      onErrorContainer: AppColors.white,
      surface: const Color(0xFF121212),
      onSurface: AppColors.white,
      surfaceContainer: const Color(0xFF1E1E1E),
      outline: Colors.grey.shade700,
      outlineVariant: Colors.grey.shade800,
    );
  }

  static ThemeData get lightTheme {
    final colorScheme = _lightColorScheme;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTextTheme.lightTextTheme,

      // AppBar Theme - Material 3
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
        titleTextStyle: AppTextTheme.lightTextTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
        toolbarHeight: 70.h,
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24.sp),
        actionsIconTheme: IconThemeData(
          color: colorScheme.onSurface,
          size: 24.sp,
        ),
      ),

      // Elevated Button Theme - Material 3
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppTextTheme.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        ),
      ),

      // Filled Button Theme - Material 3
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppTextTheme.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        ),
      ),

      // Outlined Button Theme - Material 3
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppTextTheme.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        ),
      ),

      // Text Button Theme - Material 3
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppTextTheme.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        ),
      ),

      // Input Decoration Theme - Material 3
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        labelStyle: AppTextTheme.inputLabel.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        hintStyle: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),

      // Card Theme - Material 3
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
        margin: EdgeInsets.zero,
      ),

      // Dialog Theme - Material 3
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        titleTextStyle: AppTextTheme.lightTextTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      // Bottom Sheet Theme - Material 3
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        ),
        showDragHandle: true,
        dragHandleColor: Colors.grey.shade300,
        dragHandleSize: Size(40.w, 4.h),
      ),

      // SnackBar Theme - Material 3
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.surface,

        contentTextStyle: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
          color: AppColors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),

      // Floating Action Button Theme - Material 3
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),

      // Icon Theme - Material 3
      iconTheme: IconThemeData(
        color: colorScheme.onSurfaceVariant,
        size: 24.sp,
      ),

      // Divider Theme - Material 3
      dividerTheme: DividerThemeData(
        color: colorScheme.outline.withOpacity(0.1),
        thickness: 1,
        space: 1,
      ),

      // Switch Theme - Material 3
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary.withOpacity(0.5);
          }
          return colorScheme.outline.withOpacity(0.3);
        }),
      ),

      // Checkbox Theme - Material 3
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
        side: BorderSide(color: colorScheme.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),

      // Radio Theme - Material 3
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
      ),

      // Slider Theme - Material 3
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.outline.withOpacity(0.3),
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withOpacity(0.1),
      ),

      // Progress Indicator Theme - Material 3
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.outline.withOpacity(0.3),
        circularTrackColor: colorScheme.outline.withOpacity(0.3),
      ),
      // scaffold - Updated to match image description
      scaffoldBackgroundColor: AppColors.backgroundLight,
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = _darkColorScheme;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTextTheme.darkTextTheme,

      // AppBar Theme - Material 3
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
        titleTextStyle: AppTextTheme.darkTextTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
        toolbarHeight: 70.h,
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24.sp),
        actionsIconTheme: IconThemeData(
          color: colorScheme.onSurface,
          size: 24.sp,
        ),
      ),

      // Elevated Button Theme - Material 3
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppTextTheme.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        ),
      ),

      // Filled Button Theme - Material 3
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppTextTheme.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        ),
      ),

      // Outlined Button Theme - Material 3
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppTextTheme.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        ),
      ),

      // Text Button Theme - Material 3
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppTextTheme.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        ),
      ),

      // Input Decoration Theme - Material 3
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        labelStyle: AppTextTheme.inputLabelDark.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        hintStyle: AppTextTheme.darkTextTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),

      // Card Theme - Material 3
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
        margin: EdgeInsets.zero,
      ),

      // Dialog Theme - Material 3
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        titleTextStyle: AppTextTheme.darkTextTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: AppTextTheme.darkTextTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      // Bottom Sheet Theme - Material 3
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        ),
        showDragHandle: true,
        dragHandleColor: Colors.grey.shade600,
        dragHandleSize: Size(40.w, 4.h),
      ),

      // SnackBar Theme - Material 3
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.surface,
        contentTextStyle: AppTextTheme.darkTextTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),

      // Floating Action Button Theme - Material 3
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),

      // Icon Theme - Material 3
      iconTheme: IconThemeData(
        color: colorScheme.onSurfaceVariant,
        size: 24.sp,
      ),

      // Divider Theme - Material 3
      dividerTheme: DividerThemeData(
        color: colorScheme.outline.withOpacity(0.1),
        thickness: 1,
        space: 1,
      ),

      // Switch Theme - Material 3
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary.withOpacity(0.5);
          }
          return colorScheme.outline.withOpacity(0.3);
        }),
      ),

      // Checkbox Theme - Material 3
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
        side: BorderSide(color: colorScheme.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),

      // Radio Theme - Material 3
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
      ),

      // Slider Theme - Material 3
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.outline.withOpacity(0.3),
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withOpacity(0.1),
      ),

      // Progress Indicator Theme - Material 3
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.outline.withOpacity(0.3),
        circularTrackColor: colorScheme.outline.withOpacity(0.3),
      ),
    );
  }
}
