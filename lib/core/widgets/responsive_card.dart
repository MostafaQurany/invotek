import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/screen_utils.dart';

class ResponsiveCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final bool isLoading;

  const ResponsiveCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? ScreenUtils.responsiveMargin(all: ScreenUtils.marginSmall),
      child: Card(
        elevation: elevation ?? ScreenUtils.cardElevation,
        color: backgroundColor ?? AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(ScreenUtils.cardRadius),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(ScreenUtils.cardRadius),
          child: Container(
            padding: padding ?? ScreenUtils.responsivePadding(all: ScreenUtils.paddingMedium),
            child: isLoading
                ? Center(
                    child: SizedBox(
                      width: ScreenUtils.iconSizeLarge,
                      height: ScreenUtils.iconSizeLarge,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    ),
                  )
                : child,
          ),
        ),
      ),
    );
  }
}

class ResponsiveInfoCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? description;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool isLoading;

  const ResponsiveInfoCard({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveCard(
      backgroundColor: backgroundColor,
      onTap: onTap,
      isLoading: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: ScreenUtils.iconSizeLarge,
              color: iconColor ?? AppColors.primary,
            ),
            SizedBox(height: ScreenUtils.paddingSmall),
          ],
          Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtils.fontSizeLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: ScreenUtils.paddingSmall),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: ScreenUtils.fontSizeMedium,
                color: AppColors.grey,
              ),
            ),
          ],
          if (description != null) ...[
            SizedBox(height: ScreenUtils.paddingSmall),
            Text(
              description!,
              style: TextStyle(
                fontSize: ScreenUtils.fontSizeSmall,
                color: AppColors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ResponsiveActionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool isLoading;
  final Widget? trailing;

  const ResponsiveActionCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
    this.isLoading = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveCard(
      backgroundColor: backgroundColor,
      onTap: onTap,
      isLoading: isLoading,
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: ScreenUtils.iconSizeLarge,
              color: iconColor ?? AppColors.primary,
            ),
            SizedBox(width: ScreenUtils.paddingMedium),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: ScreenUtils.fontSizeLarge,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: ScreenUtils.paddingSmall),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: ScreenUtils.fontSizeMedium,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            SizedBox(width: ScreenUtils.paddingSmall),
            trailing!,
          ],
        ],
      ),
    );
  }
}


