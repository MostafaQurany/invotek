import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/features/settings/ui/screens/tac_integration_settings_screen.dart';
import 'package:invotek/generated/l10n.dart';

class TaxIntegrationCard extends StatelessWidget {
  const TaxIntegrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocBuilder<TaxIntegrationCubit, TaxIntegrationState>(
          builder: (context, state) {
            final isActive =
                state is TaxIntegrationLoaded &&
                state.status.taxIntegrationActive;
            final isLoading = state is TaxIntegrationLoading;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.receipt_long_rounded,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      S.of(context).settingsTaxIntegration,
                      style: AppTextTheme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    if (isLoading)
                      SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      Switch(
                        value: isActive,
                        activeThumbColor: AppColors.success,
                        onChanged: (value) {
                          if (value) {
                            // التحقق من وجود البيانات قبل التفعيل
                            if (state is TaxIntegrationLoaded) {
                              final status = state.status;
                              final hasMerchantCode = status.taxMerchantCode != null &&
                                  status.taxMerchantCode!.isNotEmpty;
                              final hasInvoiceType = status.taxInvoiceType != null &&
                                  status.taxInvoiceType!.isNotEmpty;

                              if (hasMerchantCode && hasInvoiceType) {
                                // تفعيل التكامل تلقائياً باستخدام البيانات الموجودة
                                context.read<TaxIntegrationCubit>().activate(
                                  taxMerchantCode: status.taxMerchantCode!,
                                  taxInvoiceType: status.taxInvoiceType!,
                                );
                              } else {
                                // البيانات غير موجودة، التنقل إلى شاشة الإعدادات
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const TacIntegrationSettingsScreen(),
                                  ),
                                );
                              }
                            } else {
                              // الحالة غير محملة، التنقل إلى شاشة الإعدادات
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const TacIntegrationSettingsScreen(),
                                ),
                              );
                            }
                          } else {
                            // تعطيل التكامل
                            context.read<TaxIntegrationCubit>().deactivate();
                          }
                        },
                      ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const TacIntegrationSettingsScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(S.of(context).settingsManage),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

}
