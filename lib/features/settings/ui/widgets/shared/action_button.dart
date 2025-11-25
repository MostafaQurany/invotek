import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';

enum ActionButtonVariant { primary, secondary, danger }

/// A standardized action button with different variants
class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ActionButtonVariant variant;
  final bool isLoading;
  final bool fullWidth;
  final IconData? icon;

  const ActionButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ActionButtonVariant.primary,
    this.isLoading = false,
    this.fullWidth = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final button = _buildButton();

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  Widget _buildButton() {
    if (variant == ActionButtonVariant.primary ||
        variant == ActionButtonVariant.danger) {
      return ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: variant == ActionButtonVariant.danger
              ? AppColors.error
              : AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          elevation: 0,
        ),
        child: _buildChild(),
      );
    } else {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: variant == ActionButtonVariant.danger
              ? AppColors.error
              : AppColors.primary,
          side: BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        ),
        child: _buildChild(),
      );
    }
  }

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        height: 20.h,
        width: 20.w,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == ActionButtonVariant.secondary
                ? AppColors.primary
                : variant == ActionButtonVariant.danger
                ? AppColors.error
                : AppColors.white,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20.sp),
          SizedBox(width: 8.w),
          Text(
            text,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: variant == ActionButtonVariant.danger
                  ? AppColors.white
                  : AppColors.primary,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: AppTextTheme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: variant == ActionButtonVariant.secondary
            ? AppColors.primary
            : AppColors.white,
      ),
    );
  }
}
