import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/validation/validators.dart';
import 'package:invotek/features/auth/ui/widgets/auth_text_filed.dart';

class PasswordAuthTextField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordAuthTextField({super.key, required this.controller});

  @override
  State<PasswordAuthTextField> createState() => _PasswordAuthTextFieldState();
}

class _PasswordAuthTextFieldState extends State<PasswordAuthTextField> {
  bool isFeces = false;
  bool isObscure = true;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFeces = focusNode.hasFocus;
        // Focus state changed
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTextFiled(
      focusNode: focusNode,
      suffixIcon: isFeces
          ? IconButton(
              icon: isObscure
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage(AppImages.showPasswordIcon),
                        color: AppColors.primary,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage(AppImages.hidePasswordIcon),
                        color: AppColors.primary,
                      ),
                    ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            )
          : null,
      hint: "*************************",
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ImageIcon(
          AssetImage(AppImages.passwordIcon),
          size: 8.sp,
          color: AppColors.primary,
        ),
      ),
      obscureText: isObscure,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      validator: Validators.validatePassword,
    );
  }
}
