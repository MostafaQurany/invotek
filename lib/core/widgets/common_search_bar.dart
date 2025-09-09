import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class CommonSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final bool showSuffix;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final bool enabled;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final bool autofocus;

  const CommonSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixPressed,
    this.showSuffix = false,
    this.height,
    this.contentPadding,
    this.backgroundColor,
    this.textColor,
    this.hintColor,
    this.iconColor,
    this.borderRadius,
    this.boxShadow,
    this.enabled = true,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.focusNode,
    this.onTap,
    this.onSubmitted,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        enabled: enabled,
        autofocus: autofocus,
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        style: TextStyle(
          fontSize: 14.sp,
          color: textColor ?? AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: hintColor ?? AppColors.textSecondary,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: iconColor ?? AppColors.textSecondary,
                  size: 20.sp,
                )
              : null,
          suffixIcon: showSuffix && suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: iconColor ?? AppColors.textSecondary,
                    size: 20.sp,
                  ),
                  onPressed: onSuffixPressed,
                )
              : null,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
            borderSide: BorderSide(color: AppColors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
            borderSide: BorderSide(color: AppColors.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
            borderSide: BorderSide(color: AppColors.error, width: 2),
          ),
          contentPadding:
              contentPadding ??
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          counterText: '', // Hide character counter
        ),
      ),
    );
  }
}

// Extension for common search bar configurations
extension CommonSearchBarExtensions on CommonSearchBar {
  static CommonSearchBar customersSearch({
    required TextEditingController controller,
    required Function(String) onChanged,
    required String hintText,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    bool showSuffix = false,
  }) {
    return CommonSearchBar(
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      prefixIcon: Icons.search,
      suffixIcon: suffixIcon,
      onSuffixPressed: onSuffixPressed,
      showSuffix: showSuffix,
    );
  }

  static CommonSearchBar productsSearch({
    required TextEditingController controller,
    required Function(String) onChanged,
    required String hintText,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    bool showSuffix = false,
  }) {
    return CommonSearchBar(
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      prefixIcon: Icons.search,
      suffixIcon: suffixIcon,
      onSuffixPressed: onSuffixPressed,
      showSuffix: showSuffix,
    );
  }

  static CommonSearchBar invoicesSearch({
    required TextEditingController controller,
    required Function(String) onChanged,
    required String hintText,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    bool showSuffix = false,
  }) {
    return CommonSearchBar(
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      prefixIcon: Icons.search,
      suffixIcon: suffixIcon,
      onSuffixPressed: onSuffixPressed,
      showSuffix: showSuffix,
    );
  }

  static CommonSearchBar expensesSearch({
    required TextEditingController controller,
    required Function(String) onChanged,
    required String hintText,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    bool showSuffix = false,
  }) {
    return CommonSearchBar(
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      prefixIcon: Icons.search,
      suffixIcon: suffixIcon,
      onSuffixPressed: onSuffixPressed,
      showSuffix: showSuffix,
      height: 48.h,
      backgroundColor: AppColors.searchBarBackground,
      borderRadius: 32.r,
      textColor: AppColors.textPrimary,
      hintColor: AppColors.textSecondary,
      iconColor: AppColors.textSecondary,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  static CommonSearchBar expenseCategoriesSearch({
    required TextEditingController controller,
    required Function(String) onChanged,
    required String hintText,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    bool showSuffix = false,
  }) {
    return CommonSearchBar(
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      prefixIcon: Icons.search,
      suffixIcon: suffixIcon,
      onSuffixPressed: onSuffixPressed,
      showSuffix: showSuffix,
      height: 48.h,
      backgroundColor: AppColors.searchBarBackground,
      borderRadius: 32.r,
      textColor: AppColors.textPrimary,
      hintColor: AppColors.textSecondary,
      iconColor: AppColors.textSecondary,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  static CommonSearchBar custom({
    required TextEditingController controller,
    required Function(String) onChanged,
    required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    bool showSuffix = false,
    double? height,
    EdgeInsetsGeometry? contentPadding,
    Color? backgroundColor,
    Color? textColor,
    Color? hintColor,
    Color? iconColor,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
    bool enabled = true,
    TextInputType? keyboardType,
    int? maxLines = 1,
    int? maxLength,
    FocusNode? focusNode,
    Function()? onTap,
    Function(String)? onSubmitted,
    bool autofocus = false,
  }) {
    return CommonSearchBar(
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onSuffixPressed: onSuffixPressed,
      showSuffix: showSuffix,
      height: height,
      contentPadding: contentPadding,
      backgroundColor: backgroundColor,
      textColor: textColor,
      hintColor: hintColor,
      iconColor: iconColor,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      focusNode: focusNode,
      onTap: onTap,
      onSubmitted: onSubmitted,
      autofocus: autofocus,
    );
  }
}
