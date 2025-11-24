import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/generated/l10n.dart';

enum PasswordStrength { weak, medium, strong }

/// A password strength indicator with visual feedback
class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({super.key, required this.password});

  PasswordStrength get _strength {
    if (password.isEmpty) return PasswordStrength.weak;

    int score = 0;

    // Length check
    if (password.length >= 8) score++;
    if (password.length >= 12) score++;

    // Uppercase check
    if (password.contains(RegExp(r'[A-Z]'))) score++;

    // Lowercase check
    if (password.contains(RegExp(r'[a-z]'))) score++;

    // Number check
    if (password.contains(RegExp(r'[0-9]'))) score++;

    // Special character check
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score++;

    if (score <= 2) return PasswordStrength.weak;
    if (score <= 4) return PasswordStrength.medium;
    return PasswordStrength.strong;
  }

  Color get _color {
    switch (_strength) {
      case PasswordStrength.weak:
        return AppColors.error;
      case PasswordStrength.medium:
        return Colors.orange;
      case PasswordStrength.strong:
        return AppColors.success;
    }
  }

  String _getStrengthText(BuildContext context) {
    switch (_strength) {
      case PasswordStrength.weak:
        return S.of(context).settingsPasswordWeak;
      case PasswordStrength.medium:
        return S.of(context).settingsPasswordMedium;
      case PasswordStrength.strong:
        return S.of(context).settingsPasswordStrong;
    }
  }

  double get _progress {
    switch (_strength) {
      case PasswordStrength.weak:
        return 0.33;
      case PasswordStrength.medium:
        return 0.66;
      case PasswordStrength.strong:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: AppColors.backgroundLight,
                  valueColor: AlwaysStoppedAnimation<Color>(_color),
                  minHeight: 6.h,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              _getStrengthText(context),
              style: AppTextTheme.textTheme.bodySmall?.copyWith(
                color: _color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
