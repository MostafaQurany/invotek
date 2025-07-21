import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/auth/ui/widgets/auth_text_filed.dart';
import 'package:invotek/generated/l10n.dart';

class NameAuthTextField extends StatelessWidget {
  const NameAuthTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTextFiled(
      hint: S.of(context).fullName,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ImageIcon(
          AssetImage(AppImages.personalIcon),
          size: 8.sp,
          color: AppColors.primary,
        ),
      ),
      obscureText: false,
      controller: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}
