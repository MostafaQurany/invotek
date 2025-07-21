import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/auth/ui/widgets/auth_text_filed.dart';
import 'package:invotek/generated/l10n.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  const ConfirmPasswordTextField({super.key});

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  final TextEditingController controller = TextEditingController();
  bool isFeces = false;
  bool isObscure = true;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFeces = focusNode.hasFocus;
        print(isFeces ? 'Focused' : 'Not Focused');
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
      controller: controller,
      hint: S.of(context).confirmPassword,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ImageIcon(
          AssetImage(AppImages.passwordIcon),
          color: AppColors.primary,
          size: 8.sp,
        ),
      ),
      obscureText: isObscure,
      suffixIcon: isFeces
          ? IconButton(
              icon: isObscure
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        color: AppColors.primary,
                        AssetImage(AppImages.showPasswordIcon),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        color: AppColors.primary,
                        AssetImage(AppImages.hidePasswordIcon),
                      ),
                    ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            )
          : null,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }
}
