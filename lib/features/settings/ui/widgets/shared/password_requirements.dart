import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/generated/l10n.dart';

/// A checklist of password requirements
class PasswordRequirements extends StatelessWidget {
  final String password;

  const PasswordRequirements({super.key, required this.password});

  bool get _hasMinLength => password.length >= 8;
  bool get _hasUppercase => password.contains(RegExp(r'[A-Z]'));
  bool get _hasNumber => password.contains(RegExp(r'[0-9]'));
  bool get _hasSpecialChar =>
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).settingsPasswordRequirements,
          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        _buildRequirement(
          context,
          S.of(context).settingsPasswordMinLength,
          _hasMinLength,
        ),
        SizedBox(height: 4.h),
        _buildRequirement(
          context,
          S.of(context).settingsPasswordUppercase,
          _hasUppercase,
        ),
        SizedBox(height: 4.h),
        _buildRequirement(
          context,
          S.of(context).settingsPasswordNumber,
          _hasNumber,
        ),
        SizedBox(height: 4.h),
        _buildRequirement(
          context,
          S.of(context).settingsPasswordSpecial,
          _hasSpecialChar,
        ),
      ],
    );
  }

  Widget _buildRequirement(BuildContext context, String text, bool isMet) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.cancel,
          size: 16.sp,
          color: isMet ? AppColors.success : AppColors.textSecondary,
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: AppTextTheme.textTheme.bodySmall?.copyWith(
            color: isMet ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
