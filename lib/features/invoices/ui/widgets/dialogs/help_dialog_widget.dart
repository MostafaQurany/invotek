import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class HelpDialogWidget extends StatelessWidget {
  const HelpDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      contentPadding: EdgeInsets.all(24.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.help_outline,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).help,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      S.of(context).invoiceHelp,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Help Content
          _buildHelpContent(context),
        ],
      ),
      actions: [
        // Close Button
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            S.of(context).close,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildHelpContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Creating Invoices
        _buildHelpSection(
          title: S.of(context).creatingInvoices,
          items: [
            S.of(context).createInvoiceStep1,
            S.of(context).createInvoiceStep2,
            S.of(context).createInvoiceStep3,
            S.of(context).createInvoiceStep4,
          ],
        ),

        SizedBox(height: 20.h),

        // Managing Invoices
        _buildHelpSection(
          title: S.of(context).managingInvoices,
          items: [
            S.of(context).manageInvoiceStep1,
            S.of(context).manageInvoiceStep2,
            S.of(context).manageInvoiceStep3,
            S.of(context).manageInvoiceStep4,
          ],
        ),

        SizedBox(height: 20.h),

        // Payment Methods
        _buildHelpSection(
          title: S.of(context).paymentMethods,
          items: [
            S.of(context).paymentMethodCash,
            S.of(context).paymentMethodCard,
            S.of(context).paymentMethodBank,
            S.of(context).paymentMethodCheck,
          ],
        ),

        SizedBox(height: 20.h),

        // Tax Integration
        _buildHelpSection(
          title: S.of(context).taxIntegration,
          items: [
            S.of(context).taxIntegrationStep1,
            S.of(context).taxIntegrationStep2,
            S.of(context).taxIntegrationStep3,
          ],
        ),
      ],
    );
  }

  Widget _buildHelpSection({
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        ...items.map((item) => _buildHelpItem(item)),
      ],
    );
  }

  Widget _buildHelpItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6.h),
            width: 4.w,
            height: 4.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
