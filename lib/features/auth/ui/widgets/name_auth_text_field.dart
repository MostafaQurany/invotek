import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/validation/validators.dart';
import 'package:invotek/features/auth/ui/widgets/auth_text_filed.dart';

import '../../../../generated/l10n.dart';

class NameAuthTextField extends StatelessWidget {
  final TextEditingController controller;
  const NameAuthTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AuthTextFiled(
      hint: S.of(context).enterUsername,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ImageIcon(
          AssetImage(AppImages.personalIcon),
          size: 8.sp,
          color: AppColors.primary,
        ),
      ),
      obscureText: false,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: Validators.validateName,
    );
  }
}
