import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final String? errorText;
  final String? helperText;
  final bool isRequired;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixPressed,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.errorText,
    this.helperText,
    this.isRequired = false,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            if (isRequired) ...[
              SizedBox(width: 4.w),
              Text(
                '*',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.error,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 8.h),

        // Text Field
        Container(
          decoration: BoxDecoration(
            color: enabled ? AppColors.white : AppColors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: errorText != null
                  ? AppColors.error
                  : AppColors.grey.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              if (enabled && !readOnly)
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction ?? TextInputAction.next,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            readOnly: readOnly,
            enabled: enabled,
            maxLines: maxLines,
            maxLength: maxLength,
            onTap: onTap,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, size: 20.sp, color: AppColors.grey)
                  : null,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: onSuffixPressed,
                      icon: Icon(
                        suffixIcon,
                        size: 20.sp,
                        color: AppColors.grey,
                      ),
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: maxLines == 1 ? 16.h : 12.h,
              ),
              counterText: '',
            ),
          ),
        ),

        // Error Text or Helper Text
        if (errorText != null || helperText != null) ...[
          SizedBox(height: 8.h),
          Text(
            errorText ?? helperText ?? '',
            style: TextStyle(
              fontSize: 12.sp,
              color: errorText != null ? AppColors.error : AppColors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    );
  }
}
