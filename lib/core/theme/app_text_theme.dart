import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/screen_utils.dart';

class AppTextTheme {
  // Light Theme Text Styles
  static TextTheme get lightTextTheme => TextTheme(
    // Headlines
    displayLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeHeadline,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    displayMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeTitle,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    displaySmall: TextStyle(
      fontSize: ScreenUtils.fontSizeXXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),

    // Headlines
    headlineLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeHeadline,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    headlineMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeTitle,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    headlineSmall: TextStyle(
      fontSize: ScreenUtils.fontSizeXXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),

    // Titles
    titleLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    titleMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeLarge,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    titleSmall: TextStyle(
      fontSize: ScreenUtils.fontSizeMedium,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeLarge,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    bodyMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    bodySmall: TextStyle(
      fontSize: ScreenUtils.fontSizeSmall,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),

    // Labels
    labelLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeLarge,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    labelMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeMedium,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
    labelSmall: TextStyle(
      fontSize: ScreenUtils.fontSizeSmall,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      fontFamily: 'Almarai',
    ),
  );

  // Dark Theme Text Styles
  static TextTheme get darkTextTheme => TextTheme(
    // Headlines
    displayLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeHeadline,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    displayMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeTitle,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    displaySmall: TextStyle(
      fontSize: ScreenUtils.fontSizeXXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),

    // Headlines
    headlineLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeHeadline,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    headlineMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeTitle,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    headlineSmall: TextStyle(
      fontSize: ScreenUtils.fontSizeXXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),

    // Titles
    titleLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    titleMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeLarge,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    titleSmall: TextStyle(
      fontSize: ScreenUtils.fontSizeMedium,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeLarge,
      fontWeight: FontWeight.normal,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    bodyMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    bodySmall: TextStyle(
      fontSize: ScreenUtils.fontSizeSmall,
      fontWeight: FontWeight.normal,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),

    // Labels
    labelLarge: TextStyle(
      fontSize: ScreenUtils.fontSizeLarge,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    labelMedium: TextStyle(
      fontSize: ScreenUtils.fontSizeMedium,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
    labelSmall: TextStyle(
      fontSize: ScreenUtils.fontSizeSmall,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      fontFamily: 'Almarai',
    ),
  );

  // Default Text Theme (Light)
  static TextTheme get textTheme => lightTextTheme;

  // Custom Text Styles for specific use cases
  static TextStyle get buttonText => TextStyle(
    fontSize: ScreenUtils.fontSizeMedium,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontFamily: 'Almarai',
  );

  static TextStyle get buttonTextDark => TextStyle(
    fontSize: ScreenUtils.fontSizeMedium,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    fontFamily: 'Almarai',
  );

  static TextStyle get cardTitle => TextStyle(
    fontSize: ScreenUtils.fontSizeLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'Almarai',
  );

  static TextStyle get cardTitleDark => TextStyle(
    fontSize: ScreenUtils.fontSizeLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontFamily: 'Almarai',
  );

  static TextStyle get cardSubtitle => TextStyle(
    fontSize: ScreenUtils.fontSizeMedium,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
    fontFamily: 'Almarai',
  );

  static TextStyle get cardSubtitleDark => TextStyle(
    fontSize: ScreenUtils.fontSizeMedium,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
    fontFamily: 'Almarai',
  );

  static TextStyle get inputLabel => TextStyle(
    fontSize: ScreenUtils.fontSizeMedium,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: 'Almarai',
  );

  static TextStyle get inputLabelDark => TextStyle(
    fontSize: ScreenUtils.fontSizeMedium,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: 'Almarai',
  );

  static TextStyle get errorText => TextStyle(
    fontSize: ScreenUtils.fontSizeSmall,
    fontWeight: FontWeight.normal,
    color: AppColors.error,
    fontFamily: 'Almarai',
  );

  static TextStyle get successText => TextStyle(
    fontSize: ScreenUtils.fontSizeSmall,
    fontWeight: FontWeight.normal,
    color: Colors.green,
    fontFamily: 'Almarai',
  );

  static TextStyle get linkText => TextStyle(
    fontSize: ScreenUtils.fontSizeMedium,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
    fontFamily: 'Almarai',
  );

  static TextStyle get linkTextDark => TextStyle(
    fontSize: ScreenUtils.fontSizeMedium,
    fontWeight: FontWeight.w500,
    color: AppColors.accent,
    decoration: TextDecoration.underline,
    fontFamily: 'Almarai',
  );

  // Responsive Text Styles
  static TextStyle responsiveTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize != null
          ? ScreenUtils.responsiveFontSize(fontSize)
          : ScreenUtils.fontSizeMedium,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.textPrimary,
      fontFamily: fontFamily ?? 'Almarai',
      decoration: decoration,
    );
  }

  // Get text theme based on brightness
  static TextTheme getTextTheme(Brightness brightness) {
    return brightness == Brightness.dark ? darkTextTheme : lightTextTheme;
  }

  // Get text style based on brightness and type
  static TextStyle getTextStyle(
    TextTheme textTheme,
    TextStyle? Function(TextTheme) styleGetter, {
    Brightness brightness = Brightness.light,
  }) {
    final theme = brightness == Brightness.dark
        ? darkTextTheme
        : lightTextTheme;
    return styleGetter(theme) ?? theme.bodyMedium!;
  }
}
