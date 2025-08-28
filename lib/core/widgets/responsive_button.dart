import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/screen_utils.dart';

class ResponsiveButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double? height;

  const ResponsiveButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? ScreenUtils.screenWidth,
      height: height ?? ScreenUtils.buttonHeightMedium,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? AppColors.white,
          elevation: ScreenUtils.cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtils.radiusMedium),
          ),
          padding: ScreenUtils.responsivePadding(
            horizontal: ScreenUtils.paddingMedium,
            vertical: ScreenUtils.paddingSmall,
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: ScreenUtils.iconSizeMedium,
                height: ScreenUtils.iconSizeMedium,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? AppColors.white,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: ScreenUtils.iconSizeMedium,
                    ),
                    SizedBox(width: ScreenUtils.paddingSmall),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: ScreenUtils.fontSizeMedium,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ResponsiveOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double? height;

  const ResponsiveOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.borderColor,
    this.textColor,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? ScreenUtils.screenWidth,
      height: height ?? ScreenUtils.buttonHeightMedium,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor ?? AppColors.primary,
          side: BorderSide(
            color: borderColor ?? AppColors.primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtils.radiusMedium),
          ),
          padding: ScreenUtils.responsivePadding(
            horizontal: ScreenUtils.paddingMedium,
            vertical: ScreenUtils.paddingSmall,
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: ScreenUtils.iconSizeMedium,
                height: ScreenUtils.iconSizeMedium,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? AppColors.primary,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: ScreenUtils.iconSizeMedium,
                    ),
                    SizedBox(width: ScreenUtils.paddingSmall),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: ScreenUtils.fontSizeMedium,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}


