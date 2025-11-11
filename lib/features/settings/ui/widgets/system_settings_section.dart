import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/cubits/localization_cubit.dart';
import '../../../../core/cubits/currency_cubit.dart';
import '../../../../core/utils/app_api_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../generated/l10n.dart';

class SystemSettingsSection extends StatefulWidget {
  const SystemSettingsSection({super.key});

  @override
  State<SystemSettingsSection> createState() => _SystemSettingsSectionState();
}

class _SystemSettingsSectionState extends State<SystemSettingsSection> {
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadSystemSettings();
  }

  void _loadSystemSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
    });
  }

  void _saveNotificationsSetting(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', value);
    setState(() {
      _notificationsEnabled = value;
    });
  }

  void _changeLanguage() {
    final currentLocale = context.read<LocalizationCubit>().state.locale;
    final newLanguageCode = currentLocale.languageCode == 'ar' ? 'en' : 'ar';

    context.read<LocalizationCubit>().changeLanguage(newLanguageCode);

    // إخفاء SnackBar الحالي قبل عرض واحد جديد لتجنب تعارض Hero tags
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          newLanguageCode == 'ar'
              ? S.of(context).languageChangedToArabic
              : S.of(context).languageChangedToEnglish,
        ),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // إعدادات اللغة
        _buildSettingTile(
          title: S.of(context).language,
          subtitle:
              context.read<LocalizationCubit>().state.locale.languageCode ==
                  'ar'
              ? S.of(context).arabic
              : S.of(context).english,
          icon: Icons.language,
          onTap: _changeLanguage,
        ),

        SizedBox(height: 8.h),

        // إعدادات العملة
        BlocBuilder<CurrencyCubit, CurrencyState>(
          builder: (context, currencyState) {
            final currencyCubit = context.read<CurrencyCubit>();
            final languageCode = context
                .read<LocalizationCubit>()
                .getCurrentLanguage();
            final currentCurrency = currencyState.currencyCode;
            final currencyName = AppCurrency.getCurrencyName(
              currentCurrency,
              languageCode,
            );

            return _buildSettingTile(
              title: S.of(context).currency,
              subtitle: currencyName,
              icon: Icons.attach_money,
              onTap: () => _showCurrencyDialog(context, currencyCubit),
            );
          },
        ),

        SizedBox(height: 8.h),

        // // إعدادات الثيم
        // _buildSwitchTile(
        //   title: S.of(context).darkMode,
        //   subtitle: S.of(context).enableDarkMode,
        //   icon: Icons.dark_mode,
        //   value: _isDarkMode,
        //   onChanged: _saveThemeSetting,
        // ),
        SizedBox(height: 8.h),

        // إعدادات الإشعارات
        _buildSwitchTile(
          title: S.of(context).notifications,
          subtitle: S.of(context).receiveNotifications,
          icon: Icons.notifications,
          value: _notificationsEnabled,
          onChanged: _saveNotificationsSetting,
        ),
      ],
    );
  }

  Widget _buildSettingTile({
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

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
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
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: AppColors.primary,
      ),
    );
  }

  void _showCurrencyDialog(BuildContext context, CurrencyCubit currencyCubit) {
    final languageCode = context.read<LocalizationCubit>().getCurrentLanguage();
    final currentCurrency = currencyCubit.getCurrentCurrency();
    final currencies = AppCurrency.getAllCurrencies();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).currency),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: currencies.map((currencyCode) {
            final currencyName = AppCurrency.getCurrencyName(
              currencyCode,
              languageCode,
            );

            return RadioListTile<String>(
              title: Text(currencyName),
              subtitle: Text(
                AppCurrency.getCurrencySymbol(currencyCode, languageCode),
              ),
              value: currencyCode,
              groupValue: currentCurrency,
              onChanged: (value) {
                if (value != null) {
                  currencyCubit.changeCurrency(value);
                  Navigator.pop(context);
                  // إخفاء SnackBar الحالي قبل عرض واحد جديد لتجنب تعارض Hero tags
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${S.of(context).currency}: $currencyName'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                }
              },
              activeColor: AppColors.primary,
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }
}
