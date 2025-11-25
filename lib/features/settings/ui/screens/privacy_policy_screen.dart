import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          S.of(context).privacyPolicy,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: SettingsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).privacyPolicyTitle,
                style: AppTextTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                S.of(context).privacyPolicyLastUpdatedPlaceholder,
                style: AppTextTheme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 24.h),
              _buildSection(
                context,
                title: S.of(context).privacyPolicyIntroductionTitle,
                content: S.of(context).privacyPolicyIntroductionContent,
              ),
              SizedBox(height: 24.h),
              _buildSection(
                context,
                title: S.of(context).privacyPolicyDataCollectionTitle,
                content: S.of(context).privacyPolicyDataCollectionContent,
              ),
              SizedBox(height: 24.h),
              _buildSection(
                context,
                title: S.of(context).privacyPolicyDataUsageTitle,
                content: S.of(context).privacyPolicyDataUsageContent,
              ),
              SizedBox(height: 24.h),
              _buildSection(
                context,
                title: S.of(context).privacyPolicyDataSecurityTitle,
                content: S.of(context).privacyPolicyDataSecurityContent,
              ),
              SizedBox(height: 24.h),
              _buildSection(
                context,
                title: S.of(context).privacyPolicyUserRightsTitle,
                content: S.of(context).privacyPolicyUserRightsContent,
              ),
              SizedBox(height: 24.h),
              _buildSection(
                context,
                title: S.of(context).privacyPolicyContactTitle,
                content: S.of(context).privacyPolicyContactContent,
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          content,
          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

