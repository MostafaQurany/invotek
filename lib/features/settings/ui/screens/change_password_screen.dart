import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/cubit/settings_cubit.dart';
import 'package:invotek/features/settings/cubit/settings_state.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
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
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
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
        backgroundColor: AppColors.white,
        elevation: 0,
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
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                // Current Password Card
                SettingsCard(
                  title: S.of(context).currentPassword,
                  showDivider: true,
                  child: PasswordField(
                    label: S.of(context).currentPassword,
                    controller: _currentPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).passwordRequired;
                      }
                      return null;
                    },
                    hintText: S.of(context).enterCurrentPassword,
                  ),
                ),

                SizedBox(height: 16.h),

                // New Password Card
                SettingsCard(
                  title: S.of(context).newPassword,
                  showDivider: true,
                  child: Column(
                    children: [
                      PasswordField(
                        label: S.of(context).newPassword,
                        controller: _newPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).passwordRequired;
                          }
                          if (value.length < 8) {
                            return S.of(context).settingsPasswordMinLength;
                          }
                          return null;
                        },
                        hintText: S.of(context).enterNewPassword,
                      ),
                      SizedBox(height: 16.h),
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _newPasswordController,
                        builder: (context, value, child) {
                          return PasswordStrengthIndicator(
                            password: value.text,
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _newPasswordController,
                        builder: (context, value, child) {
                          return PasswordRequirements(password: value.text);
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // Confirm Password Card
                SettingsCard(
                  title: S.of(context).confirmNewPassword,
                  showDivider: true,
                  child: PasswordField(
                    label: S.of(context).confirmNewPassword,
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).passwordRequired;
                      }
                      if (value != _newPasswordController.text) {
                        return S.of(context).passwordsDoNotMatch;
                      }
                      return null;
                    },
                    hintText: S.of(context).confirmNewPassword,
                  ),
                ),

                SizedBox(height: 24.h),

                // Action Button
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    return ActionButton(
                      text: S.of(context).changePasswordButton,
                      onPressed: _handleChangePassword,
                      isLoading: state is SettingsLoading,
                      fullWidth: true,
                    );
                  },
                ),

                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
