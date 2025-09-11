import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../generated/l10n.dart';
import '../widgets/settings_card.dart';
import '../widgets/company_settings_section.dart';
import '../widgets/system_settings_section.dart';
import '../widgets/app_info_section.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.onPrimary),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // إعدادات الشركة
            SettingsCard(
              title: S.of(context).companySettings,
              icon: Icons.business,
              child: const CompanySettingsSection(),
            ),

            SizedBox(height: 16.h),

            // إعدادات النظام
            SettingsCard(
              title: S.of(context).systemSettings,
              icon: Icons.settings,
              child: const SystemSettingsSection(),
            ),

            SizedBox(height: 16.h),

            // معلومات التطبيق
            SettingsCard(
              title: S.of(context).appInfo,
              icon: Icons.info,
              child: const AppInfoSection(),
            ),
          ],
        ),
      ),
    );
  }
}
