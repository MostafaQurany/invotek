import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/currency_cubit.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/settings/constants/settings_permissions.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
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

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value
              ? S.of(context).settingsNotificationsEnabled
              : S.of(context).settingsNotificationsDisabled,
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _changeLanguage() {
    final currentLocale = context.read<LocalizationCubit>().state.locale;
    final newLanguageCode = currentLocale.languageCode == 'ar' ? 'en' : 'ar';

    context.read<LocalizationCubit>().changeLanguage(newLanguageCode);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          newLanguageCode == 'ar'
              ? S.of(context).languageChangedToArabic
              : S.of(context).languageChangedToEnglish,
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showCurrencyDialog(BuildContext context, CurrencyCubit currencyCubit) {
    final languageCode = context.read<LocalizationCubit>().getCurrentLanguage();
    final currentCurrency = currencyCubit.getCurrentCurrency();
    final currencies = AppCurrency.getAllCurrencies();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(context).currency),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
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
                  Navigator.pop(dialogContext);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${S.of(context).currency}: $currencyName'),
                      backgroundColor: AppColors.success,
                      behavior: SnackBarBehavior.floating,
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
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
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
          S.of(context).systemSettings,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: PermissionWidget(
        permission: SettingsPermissions.view,
        fallback: Center(
          child: EmptyStateWidget(
            icon: Icons.lock_outline,
            title: S.of(context).settingsNoPermissionToView,
            description: S.of(context).settingsNoPermissionToAct,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.w),
          children: [
            // Language & Currency Card
            SettingsCard(
              title: S.of(context).settingsRegionalSettings,
              showDivider: true,
              child: Column(
                children: [
                  // Language Setting
                  SettingsTile(
                    icon: Icons.language,
                    title: S.of(context).language,
                    subtitle:
                        context
                                .read<LocalizationCubit>()
                                .state
                                .locale
                                .languageCode ==
                            'ar'
                        ? S.of(context).arabic
                        : S.of(context).english,
                    onTap: _changeLanguage,
                  ),
                  Divider(height: 1, color: AppColors.border, indent: 56.w),
                  // Currency Setting
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

                      return SettingsTile(
                        icon: Icons.attach_money,
                        title: S.of(context).currency,
                        subtitle: currencyName,
                        onTap: () =>
                            _showCurrencyDialog(context, currencyCubit),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Notifications Card
            SettingsCard(
              title: S.of(context).notifications,
              showDivider: true,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: AppColors.textPrimary,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).notifications,
                          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          S.of(context).receiveNotifications,
                          style: AppTextTheme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _notificationsEnabled,
                    onChanged: _saveNotificationsSetting,
                    activeThumbColor: AppColors.primary,
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
