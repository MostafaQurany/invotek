import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_cubit.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() =>
      _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState
    extends State<NotificationsSettingsScreen> {
  bool _generalNotifications = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _generalNotifications = prefs.getBool('notifications_enabled') ?? true;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveSetting(String key, bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
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
          S.of(context).notificationsSettings,
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
                SettingsCard(
                  title: S.of(context).notificationTypes,
                  showDivider: true,
                  child: Column(
                    children: [
                      _buildSwitchTile(
                        title: S.of(context).generalNotifications,
                        subtitle: S.of(context).generalNotificationsDescription,
                        value: _generalNotifications,
                        onChanged: (value) async {
                          setState(() => _generalNotifications = value);
                          await _saveSetting('notifications_enabled', value);
                          // Control polling via NotificationsCubit
                          final notificationsCubit =
                              getIt<NotificationsCubit>();
                          if (value) {
                            notificationsCubit.startPolling();
                          } else {
                            notificationsCubit.stopPolling();
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
                            S.of(context).notificationsSettingsNote,
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
            ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextTheme.textTheme.bodySmall?.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeTrackColor: AppColors.primary,
      activeThumbColor: AppColors.white,
    );
  }
}
