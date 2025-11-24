import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/settings/cubit/settings_cubit.dart';
import 'package:invotek/features/settings/cubit/settings_state.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _handleDeleteAccount() {
    if (_formKey.currentState!.validate()) {
      _showFinalConfirmationDialog();
    }
  }

  void _showFinalConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.warning, color: AppColors.error),
              SizedBox(width: 8.w),
              Text(S.of(context).deleteAccount),
            ],
          ),
          content: Text(S.of(context).deleteAccountFinalConfirmation),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<SettingsCubit>().deleteAccount(
                  password: _passwordController.text,
                );
              },
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
              child: Text(S.of(context).yesDeleteAccount),
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
            color: AppColors.onPrimary,
            size: 24.sp,
          ),
        ),
        title: Text(
          S.of(context).deleteAccount,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
            if (state is DeleteAccountSuccess) {
              context.read<AuthCubit>().logout();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                ),
              );

              if (mounted) {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/auth', (route) => false);
              }
            } else if (state is DeleteAccountError) {
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
                // Warning Card
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.error.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: AppColors.error,
                        size: 64.sp,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        S.of(context).deleteAccountWarning,
                        style: AppTextTheme.textTheme.titleLarge?.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        S.of(context).deleteAccountConfirmation,
                        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // Consequences Card
                SettingsCard(
                  title: S.of(context).settingsWhatHappens,
                  showDivider: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildConsequenceItem(
                        icon: Icons.person_off,
                        text: S.of(context).settingsAccountDeleted,
                      ),
                      SizedBox(height: 12.h),
                      _buildConsequenceItem(
                        icon: Icons.delete_forever,
                        text: S.of(context).settingsDataDeleted,
                      ),
                      SizedBox(height: 12.h),
                      _buildConsequenceItem(
                        icon: Icons.block,
                        text: S.of(context).settingsCannotUndo,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // Password Confirmation Card
                SettingsCard(
                  title: S.of(context).enterPasswordToConfirm,
                  showDivider: true,
                  child: PasswordField(
                    label: S.of(context).password,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).passwordRequired;
                      }
                      return null;
                    },
                    hintText: S.of(context).enterPasswordToConfirm,
                  ),
                ),

                SizedBox(height: 24.h),

                // Delete Button
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    return ActionButton(
                      text: S.of(context).deleteAccountButton,
                      variant: ActionButtonVariant.danger,
                      icon: Icons.delete_forever,
                      onPressed: _handleDeleteAccount,
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

  Widget _buildConsequenceItem({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, size: 24.sp, color: AppColors.error),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
