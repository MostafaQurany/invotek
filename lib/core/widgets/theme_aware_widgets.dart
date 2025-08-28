import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/screen_utils.dart';

class ThemeAwareText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool softWrap;

  const ThemeAwareText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textTheme = AppTextTheme.getTextTheme(brightness);

    return Text(
      text,
      style: style ?? textTheme.bodyMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}

class ThemeAwareCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final bool isLoading;

  const ThemeAwareCard({
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
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Container(
      margin:
          margin ?? ScreenUtils.responsiveMargin(all: ScreenUtils.marginSmall),
      child: Card(
        elevation: elevation ?? ScreenUtils.cardElevation,
        color:
            backgroundColor ?? (isDark ? AppColors.greyDark : AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(ScreenUtils.cardRadius),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius:
              borderRadius ?? BorderRadius.circular(ScreenUtils.cardRadius),
          child: Container(
            padding:
                padding ??
                ScreenUtils.responsivePadding(all: ScreenUtils.paddingMedium),
            child: isLoading
                ? Center(
                    child: SizedBox(
                      width: ScreenUtils.iconSizeLarge,
                      height: ScreenUtils.iconSizeLarge,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
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

class ThemeAwareButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double? height;
  final bool isOutlined;

  const ThemeAwareButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    final buttonTextStyle = isDark
        ? AppTextTheme.buttonTextDark
        : AppTextTheme.buttonText;
    final defaultBackgroundColor = isDark
        ? AppColors.accent
        : AppColors.primary;
    final defaultTextColor = isDark ? AppColors.primary : AppColors.white;

    return SizedBox(
      width: width ?? ScreenUtils.screenWidth,
      height: height ?? ScreenUtils.buttonHeightMedium,
      child: isOutlined
          ? OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: textColor ?? defaultTextColor,
                side: BorderSide(
                  color: backgroundColor ?? defaultBackgroundColor,
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
              child: _buildButtonContent(buttonTextStyle),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? defaultBackgroundColor,
                foregroundColor: textColor ?? defaultTextColor,
                elevation: ScreenUtils.cardElevation,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenUtils.radiusMedium),
                ),
                padding: ScreenUtils.responsivePadding(
                  horizontal: ScreenUtils.paddingMedium,
                  vertical: ScreenUtils.paddingSmall,
                ),
              ),
              child: _buildButtonContent(buttonTextStyle),
            ),
    );
  }

  Widget _buildButtonContent(TextStyle textStyle) {
    return isLoading
        ? SizedBox(
            width: ScreenUtils.iconSizeMedium,
            height: ScreenUtils.iconSizeMedium,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                textStyle.color ?? AppColors.white,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: ScreenUtils.iconSizeMedium),
                SizedBox(width: ScreenUtils.paddingSmall),
              ],
              Text(text, style: textStyle),
            ],
          );
  }
}

class ThemeAwareTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const ThemeAwareTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    final textTheme = AppTextTheme.getTextTheme(brightness);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      readOnly: readOnly,
      focusNode: focusNode,
      textInputAction: textInputAction,
      style: textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? SizedBox(
                width: ScreenUtils.iconSizeMedium,
                height: ScreenUtils.iconSizeMedium,
                child: prefixIcon!,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? SizedBox(
                width: ScreenUtils.iconSizeMedium,
                height: ScreenUtils.iconSizeMedium,
                child: suffixIcon!,
              )
            : null,
        contentPadding: ScreenUtils.responsivePadding(
          horizontal: ScreenUtils.paddingMedium,
          vertical: ScreenUtils.paddingSmall,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(
            color: isDark ? AppColors.grey : AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.error),
        ),
        labelStyle: isDark
            ? AppTextTheme.inputLabelDark
            : AppTextTheme.inputLabel,
        hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
        errorStyle: AppTextTheme.errorText,
      ),
    );
  }
}

class ThemeAwareIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;

  const ThemeAwareIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    final defaultColor = isDark ? AppColors.white : AppColors.textPrimary;

    final iconWidget = Icon(
      icon,
      size: size ?? ScreenUtils.iconSizeMedium,
      color: color ?? defaultColor,
    );

    if (onPressed != null) {
      return IconButton(onPressed: onPressed, icon: iconWidget);
    }

    return iconWidget;
  }
}
