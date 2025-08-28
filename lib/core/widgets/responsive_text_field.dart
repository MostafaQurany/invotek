import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/screen_utils.dart';

class ResponsiveTextField extends StatelessWidget {
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
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;

  const ResponsiveTextField({
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
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      readOnly: readOnly,
      focusNode: focusNode,
      textInputAction: textInputAction,
      style: TextStyle(
        fontSize: ScreenUtils.fontSizeMedium,
        color: AppColors.textPrimary,
      ),
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
        contentPadding: contentPadding ??
            ScreenUtils.responsivePadding(
              horizontal: ScreenUtils.paddingMedium,
              vertical: ScreenUtils.paddingSmall,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.inputFieldRadius),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: TextStyle(
          fontSize: ScreenUtils.fontSizeMedium,
          color: AppColors.grey,
        ),
        hintStyle: TextStyle(
          fontSize: ScreenUtils.fontSizeMedium,
          color: AppColors.grey,
        ),
        errorStyle: TextStyle(
          fontSize: ScreenUtils.fontSizeSmall,
          color: AppColors.error,
        ),
      ),
    );
  }
}

class ResponsiveSearchField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final bool showClearButton;

  const ResponsiveSearchField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.showClearButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveTextField(
      hintText: hintText ?? 'البحث...',
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      prefixIcon: Icon(
        Icons.search,
        color: AppColors.grey,
        size: ScreenUtils.iconSizeMedium,
      ),
      suffixIcon: showClearButton && controller?.text.isNotEmpty == true
          ? IconButton(
              onPressed: () {
                controller?.clear();
                onClear?.call();
              },
              icon: Icon(
                Icons.clear,
                color: AppColors.grey,
                size: ScreenUtils.iconSizeMedium,
              ),
            )
          : null,
      textInputAction: TextInputAction.search,
    );
  }
}

class ResponsivePasswordField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const ResponsivePasswordField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<ResponsivePasswordField> createState() => _ResponsivePasswordFieldState();
}

class _ResponsivePasswordFieldState extends State<ResponsivePasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ResponsiveTextField(
      labelText: widget.labelText,
      hintText: widget.hintText,
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      prefixIcon: Icon(
        Icons.lock,
        color: AppColors.grey,
        size: ScreenUtils.iconSizeMedium,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.grey,
          size: ScreenUtils.iconSizeMedium,
        ),
      ),
    );
  }
}


