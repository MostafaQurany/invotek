import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../generated/l10n.dart';

class AppInfoSection extends StatefulWidget {
  const AppInfoSection({super.key});

  @override
  State<AppInfoSection> createState() => _AppInfoSectionState();
}

class _AppInfoSectionState extends State<AppInfoSection> {
  String _appVersion = '';
  String _buildNumber = '';

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  void _loadAppInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _appVersion = packageInfo.version;
        _buildNumber = packageInfo.buildNumber;
      });
    } catch (e) {
      setState(() {
        _appVersion = '1.0.0';
        _buildNumber = '1';
      });
    }
  }

  void _launchSupportEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@invotek.com',
      query: 'subject=دعم فني - تطبيق إنفوتك',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).cannotOpenEmailApp),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _launchWebsite() async {
    final Uri websiteUri = Uri.parse('https://invotek.com');

    if (await canLaunchUrl(websiteUri)) {
      await launchUrl(websiteUri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).cannotOpenWebsite),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // معلومات التطبيق
        _buildInfoTile(
          title: S.of(context).appInfo,
          subtitle: S
              .of(context)
              .appVersionWithBuild(_appVersion, _buildNumber),
          icon: Icons.info,
        ),

        SizedBox(height: 8.h),

        // الدعم الفني
        _buildActionTile(
          title: S.of(context).supportEmail,
          subtitle: S.of(context).contactUsForSupport,
          icon: Icons.support_agent,
          onTap: _launchSupportEmail,
        ),

        SizedBox(height: 8.h),

        // الموقع الإلكتروني
        _buildActionTile(
          title: S.of(context).website,
          subtitle: S.of(context).visitInvotekWebsite,
          icon: Icons.language,
          onTap: _launchWebsite,
        ),

        SizedBox(height: 8.h),

        // سياسة الخصوصية
        _buildActionTile(
          title: S.of(context).privacyPolicy,
          subtitle: S.of(context).viewPrivacyPolicy,
          icon: Icons.privacy_tip,
          onTap: () {
            // TODO: Navigate to privacy policy
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).privacyPolicyComingSoon),
                backgroundColor: AppColors.info,
              ),
            );
          },
        ),

        SizedBox(height: 8.h),

        // شروط الاستخدام
        _buildActionTile(
          title: S.of(context).termsOfUse,
          subtitle: S.of(context).viewTermsOfUse,
          icon: Icons.description,
          onTap: () {
            // TODO: Navigate to terms of service
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).termsOfUseComingSoon),
                backgroundColor: AppColors.info,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.primary, size: 24.sp),
      title: Text(
        title,
        style: AppTextTheme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.primary, size: 24.sp),
      title: Text(
        title,
        style: AppTextTheme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.onSurfaceVariant,
        size: 16.sp,
      ),
      onTap: onTap,
    );
  }
}
