import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/auth/ui/widgets/auth_text_filed.dart';

import '../../../../core/validation/validators.dart';
import '../../../../generated/l10n.dart';

class EmailAuthTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailAuthTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AuthTextFiled(
      hint: S.of(context).enterEmail,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ImageIcon(
          AssetImage(AppImages.emailIcon),
          color: AppColors.primary,
          size: 8.sp,
        ),
      ),
      obscureText: false,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: Validators.validateEmail,
    );
  }
}
