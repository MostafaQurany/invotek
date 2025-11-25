import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  PackageInfo? _packageInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  Future<void> _loadPackageInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _packageInfo = packageInfo;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _shareApp() async {
    try {
      await Share.share(
        'Check out Invotek - Invoice Management App',
        subject: 'Invotek App',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).errorOccurred),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
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
          S.of(context).aboutUs,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: AppColors.primary))
          : ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                // App Logo/Icon Card
                SettingsCard(
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: CircleAvatar(
                          child: Image.asset(
                            AppImages.logoGreenSold,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Invotek',
                        style: AppTextTheme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        S.of(context).aboutUsDescription,
                        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // App Information Card
                SettingsCard(
                  title: S.of(context).appInformation,
                  showDivider: true,
                  child: Column(
                    children: [
                      _buildInfoRow(S.of(context).appName, 'Invotek'),
                      SizedBox(height: 12.h),
                      _buildInfoRow(
                        S.of(context).version,
                        _packageInfo?.version ?? '1.0.0',
                      ),
                      SizedBox(height: 12.h),
                      _buildInfoRow(
                        S.of(context).buildNumber,
                        _packageInfo?.buildNumber ?? '-',
                      ),
                      // SizedBox(height: 12.h),
                      // _buildInfoRow(
                      //   S.of(context).packageName,
                      //   _packageInfo?.packageName ?? '-',
                      // ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // Company Information Card
                SettingsCard(
                  title: S.of(context).companyInformation,
                  showDivider: true,
                  child: Column(
                    children: [
                      _buildInfoRow(S.of(context).companyName, 'Invotek'),
                      SizedBox(height: 12.h),
                      _buildInfoRow(
                        S.of(context).copyright,
                        '© ${DateTime.now().year} Invotek. All rights reserved.',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // // Share App Button
                // SettingsCard(
                //   child: ActionButton(
                //     text: S.of(context).shareApp,
                //     variant: ActionButtonVariant.primary,
                //     onPressed: _shareApp,
                //     fullWidth: true,
                //   ),
                // ),

                // SizedBox(height: 32.h),
              ],
            ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
