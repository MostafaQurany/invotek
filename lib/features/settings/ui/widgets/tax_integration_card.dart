import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/features/settings/ui/screens/company_settings_screen.dart';
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
                            _showActivationDialog(context);
                          } else {
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
                          builder: (_) => const CompanySettingsScreen(),
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

  void _showActivationDialog(BuildContext context) {
    final merchantCodeController = TextEditingController();
    // Assuming invoice type is a simple text input for now, or use a dropdown if values are known
    String selectedInvoiceType = 'income'; // Default or from a list

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(context).settingsTaxIntegration),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: merchantCodeController,
              decoration: const InputDecoration(
                labelText: 'Merchant Code', // TODO: Add localization key
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.h),
            // Simple dropdown for invoice type example
            DropdownButtonFormField<String>(
              initialValue: selectedInvoiceType,
              items: [
                DropdownMenuItem<String>(
                  value: 'general',
                  child: Text(S.of(context).settingsGeneral),
                ),
                DropdownMenuItem<String>(
                  value: 'income',
                  child: Text(S.of(context).settingsIncome),
                ),
              ],
              onChanged: (newValue) {
                selectedInvoiceType = newValue!;
              },
              decoration: const InputDecoration(
                labelText: 'Invoice Type', // TODO: Add localization key
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          ElevatedButton(
            onPressed: () {
              if (merchantCodeController.text.isNotEmpty) {
                context.read<TaxIntegrationCubit>().activate(
                  taxMerchantCode: merchantCodeController.text,
                  taxInvoiceType: selectedInvoiceType,
                );
                Navigator.pop(dialogContext);
              }
            },
            child: Text(MaterialLocalizations.of(context).saveButtonLabel),
          ),
        ],
      ),
    );
  }
}
