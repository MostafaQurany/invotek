import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

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
          S.of(context).languageSettings,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          final currentLanguage = state.locale.languageCode;

          return ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              SettingsCard(
                title: S.of(context).selectLanguage,
                showDivider: true,
                child: Column(
                  children: [
                    RadioListTile<String>(
                      title: Text(
                        S.of(context).arabic,
                        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        S.of(context).arabicDescription,
                        style: AppTextTheme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      value: 'ar',
                      groupValue: currentLanguage,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        if (value != null) {
                          context.read<LocalizationCubit>().changeLanguage(
                            value,
                          );
                        }
                      },
                    ),
                    Divider(height: 1, color: AppColors.border),
                    RadioListTile<String>(
                      title: Text(
                        S.of(context).english,
                        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        S.of(context).englishDescription,
                        style: AppTextTheme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      value: 'en',
                      groupValue: currentLanguage,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        if (value != null) {
                          context.read<LocalizationCubit>().changeLanguage(
                            value,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                S.of(context).languageChangedToEnglish,
                              ),
                              backgroundColor: AppColors.success,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              SettingsCard(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.primary,
                        size: 24.sp,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          S.of(context).languageChangeNote,
                          style: AppTextTheme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 32.h),
            ],
          );
        },
      ),
    );
  }
}
