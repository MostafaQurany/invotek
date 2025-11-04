import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/features/auth/ui/widgets/confirm_password_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/password_auth_text_field.dart';
import 'package:invotek/features/settings/cubit/settings_cubit.dart';
import 'package:invotek/features/settings/cubit/settings_state.dart';
import 'package:invotek/generated/l10n.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleChangePassword() {
    if (_formKey.currentState!.validate()) {
      _showConfirmationDialog();
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(S.of(context).changePassword),
          content: Text(S.of(context).changePasswordConfirmation),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<SettingsCubit>().changePassword(
                  currentPassword: _currentPasswordController.text,
                  newPassword: _newPasswordController.text,
                  newPasswordConfirmation: _confirmPasswordController.text,
                );
              },
              child: Text(S.of(context).ok),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
            size: 24.sp,
          ),
        ),
        title: Text(
          S.of(context).changePassword,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
            if (state is ChangePasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                ),
              );
              Navigator.of(context).pop();
            } else if (state is ChangePasswordError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenUtils.paddingLarge),

                  // Current Password
                  Text(
                    S.of(context).currentPassword,
                    style: textTheme.titleSmall!.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: ScreenUtils.paddingSmall),
                  PasswordAuthTextField(controller: _currentPasswordController),

                  SizedBox(height: ScreenUtils.paddingLarge),

                  // New Password
                  Text(
                    S.of(context).newPassword,
                    style: textTheme.titleSmall!.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: ScreenUtils.paddingSmall),
                  PasswordAuthTextField(controller: _newPasswordController),

                  SizedBox(height: ScreenUtils.paddingLarge),

                  // Confirm New Password
                  Text(
                    S.of(context).confirmNewPassword,
                    style: textTheme.titleSmall!.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: ScreenUtils.paddingSmall),
                  ConfirmPasswordTextField(
                    controller: _confirmPasswordController,
                    passwordController: _newPasswordController,
                  ),

                  SizedBox(height: 60.h),

                  // Change Password Button
                  SizedBox(
                    width: ScreenUtils.screenWidth,
                    child: BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        return LoadingButton(
                          text: S.of(context).changePasswordButton,
                          onPressed: _handleChangePassword,
                          isLoading: state is SettingsLoading,
                          backgroundColor: colorScheme.primary,
                          textColor: colorScheme.onPrimary,
                          indicatorColor: colorScheme.onPrimary,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
