import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtils {
  // Screen dimensions
  static double get screenWidth => ScreenUtil().screenWidth;
  static double get screenHeight => ScreenUtil().screenHeight;
  static double get statusBarHeight => ScreenUtil().statusBarHeight;
  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;
  static double get pixelRatio => ScreenUtil().pixelRatio ?? 1.0;
  static double get textScaleFactor => ScreenUtil().textScaleFactor;

  // Responsive dimensions
  static double get responsiveWidth => ScreenUtil().screenWidth;
  static double get responsiveHeight => ScreenUtil().screenHeight;

  // Common responsive sizes
  static double get paddingSmall => 8.w;
  static double get paddingMedium => 16.w;
  static double get paddingLarge => 24.w;
  static double get paddingXLarge => 32.w;

  static double get marginSmall => 8.w;
  static double get marginMedium => 16.w;
  static double get marginLarge => 24.w;
  static double get marginXLarge => 32.w;

  static double get radiusSmall => 4.r;
  static double get radiusMedium => 8.r;
  static double get radiusLarge => 12.r;
  static double get radiusXLarge => 16.r;
  static double get radiusXXLarge => 32.r;

  static double get iconSizeSmall => 16.w;
  static double get iconSizeMedium => 24.w;
  static double get iconSizeLarge => 32.w;
  static double get iconSizeXLarge => 48.w;

  // Font sizes
  static double get fontSizeSmall => 12.sp;
  static double get fontSizeMedium => 14.sp;
  static double get fontSizeLarge => 16.sp;
  static double get fontSizeXLarge => 18.sp;
  static double get fontSizeXXLarge => 20.sp;
  static double get fontSizeTitle => 24.sp;
  static double get fontSizeHeadline => 28.sp;

  // Button sizes
  static double get buttonHeightSmall => 40.h;
  static double get buttonHeightMedium => 48.h;
  static double get buttonHeightLarge => 56.h;

  // Input field sizes
  static double get inputFieldHeight => 48.h;
  static double get inputFieldRadius => 8.r;

  // Card sizes
  static double get cardRadius => 12.r;
  static double get cardElevation => 2.h;

  // AppBar sizes
  static double get appBarHeight => 56.h;
  static double get appBarElevation => 4.h;

  // Bottom navigation
  static double get bottomNavHeight => 56.h;

  // Check if device is tablet
  static bool get isTablet => ScreenUtil().screenWidth > 600;

  // Check if device is phone
  static bool get isPhone => ScreenUtil().screenWidth <= 600;

  // Responsive width percentage
  static double responsiveWidthPercent(double percent) {
    return (ScreenUtil().screenWidth * percent) / 100;
  }

  // Responsive height percentage
  static double responsiveHeightPercent(double percent) {
    return (ScreenUtil().screenHeight * percent) / 100;
  }

  // Responsive font size
  static double responsiveFontSize(double size) {
    return size.sp;
  }

  // Responsive padding
  static EdgeInsets responsivePadding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: left?.w ?? horizontal?.w ?? all?.w ?? 0,
      top: top?.h ?? vertical?.h ?? all?.h ?? 0,
      right: right?.w ?? horizontal?.w ?? all?.w ?? 0,
      bottom: bottom?.h ?? vertical?.h ?? all?.h ?? 0,
    );
  }

  // Responsive margin
  static EdgeInsets responsiveMargin({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: left?.w ?? horizontal?.w ?? all?.w ?? 0,
      top: top?.h ?? vertical?.h ?? all?.h ?? 0,
      right: right?.w ?? horizontal?.w ?? all?.w ?? 0,
      bottom: bottom?.h ?? vertical?.h ?? all?.h ?? 0,
    );
  }

  // Responsive border radius
  static BorderRadius responsiveBorderRadius({
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft?.r ?? all?.r ?? 0),
      topRight: Radius.circular(topRight?.r ?? all?.r ?? 0),
      bottomLeft: Radius.circular(bottomLeft?.r ?? all?.r ?? 0),
      bottomRight: Radius.circular(bottomRight?.r ?? all?.r ?? 0),
    );
  }

  // Responsive size
  static Size responsiveSize(double width, double height) {
    return Size(width.w, height.h);
  }

  // Responsive offset
  static Offset responsiveOffset(double dx, double dy) {
    return Offset(dx.w, dy.h);
  }
}
