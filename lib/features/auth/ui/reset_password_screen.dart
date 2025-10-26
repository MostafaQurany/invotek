import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';

import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/generated/l10n.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String verifyToken;

  const ResetPasswordScreen({super.key, required this.verifyToken});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleResetPassword() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().resetPassword(
        widget.verifyToken,
        _passwordController.text,
        _confirmPasswordController.text,
        context,
      );
    }
  }

  String _getPasswordStrength(String password) {
    if (password.isEmpty) return '';
    if (password.length < 6) return S.of(context).passwordStrengthWeak;
    if (password.length < 8) return S.of(context).passwordStrengthMedium;
    return S.of(context).passwordStrengthStrong;
  }

  Color _getPasswordStrengthColor(String password) {
    if (password.isEmpty) return Colors.grey;
    if (password.length < 6) return Colors.red;
    if (password.length < 8) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                successResetPassword: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  // التنقل إلى شاشة تسجيل الدخول
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.authRoute,
                    (route) => false,
                  );
                },
                errorAuth: (error) {
                  SnackBarHelper.showFailureSnackBar(context, error);
                },
                orElse: () {},
              );
            },
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenUtils.paddingLarge),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(AppImages.logoGreen),
                            width: ScreenUtils.responsiveWidthPercent(45),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child:
                                BlocBuilder<
                                  LocalizationCubit,
                                  LocalizationState
                                >(
                                  builder: (context, state) {
                                    return TextButton(
                                      child: Text(
                                        state.locale.languageCode == 'ar'
                                            ? S.of(context).english
                                            : S.of(context).arabic,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize:
                                                  ScreenUtils.fontSizeMedium,
                                            ),
                                      ),
                                      onPressed: () {
                                        if (state.locale.languageCode == 'ar') {
                                          context
                                              .read<LocalizationCubit>()
                                              .changeLanguageToEnglish();
                                        } else {
                                          context
                                              .read<LocalizationCubit>()
                                              .changeLanguageToArabic();
                                        }
                                      },
                                    );
                                  },
                                ),
                          ),
                        ],
                      ),

                      SizedBox(height: ScreenUtils.paddingXLarge),
                      Text(
                        S.of(context).resetPasswordTitle,
                        style: textTheme.headlineMedium?.copyWith(
                          fontSize: ScreenUtils.fontSizeTitle,
                        ),
                      ),
                      SizedBox(height: ScreenUtils.paddingMedium),
                      Text(
                        S.of(context).resetPasswordDesc,
                        style: textTheme.titleSmall!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: ScreenUtils.paddingLarge),

                      // New Password Field
                      Text(
                        S.of(context).newPassword,
                        style: textTheme.titleSmall!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: ScreenUtils.paddingSmall),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        onChanged: (value) {
                          setState(() {}); // لإعادة بناء مؤشر قوة كلمة المرور
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).password,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).passwordRequired;
                          }
                          if (value.length < 6) {
                            return S.of(context).passwordShort;
                          }
                          return null;
                        },
                      ),

                      // Password Strength Indicator
                      if (_passwordController.text.isNotEmpty) ...[
                        SizedBox(height: ScreenUtils.paddingSmall),
                        Row(
                          children: [
                            Text(
                              '${S.of(context).passwordStrengthWeak}: ',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              _getPasswordStrength(_passwordController.text),
                              style: textTheme.bodySmall?.copyWith(
                                color: _getPasswordStrengthColor(
                                  _passwordController.text,
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],

                      SizedBox(height: ScreenUtils.paddingLarge),

                      // Confirm Password Field
                      Text(
                        S.of(context).confirmNewPassword,
                        style: textTheme.titleSmall!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: ScreenUtils.paddingSmall),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        decoration: InputDecoration(
                          hintText: S.of(context).confirmNewPassword,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).confirmPasswordRequired;
                          }
                          if (value != _passwordController.text) {
                            return S.of(context).passwordsNotMatch;
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 60.h),

                      // Reset Password Button
                      SizedBox(
                        width: ScreenUtils.screenWidth,
                        child: BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return LoadingButton(
                              text: S.of(context).resetPassword,
                              onPressed: _handleResetPassword,
                              isLoading: state.maybeWhen(
                                loadingAuth: () => true,
                                orElse: () => false,
                              ),
                              backgroundColor: colorScheme.primary,
                              textColor: colorScheme.onPrimary,
                              indicatorColor: colorScheme.onPrimary,
                            );
                          },
                        ),
                      ),

                      SizedBox(height: ScreenUtils.paddingMedium),

                      // Back to Login
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.authRoute,
                            (route) => false,
                          ),
                          child: Text(
                            S.of(context).login,
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
