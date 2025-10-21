import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceSummaryStep extends StatefulWidget {
  final InvoiceFormController formController;

  const InvoiceSummaryStep({super.key, required this.formController});

  @override
  State<InvoiceSummaryStep> createState() => _InvoiceSummaryStepState();
}

class _InvoiceSummaryStepState extends State<InvoiceSummaryStep> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Invoice Info Summary
          _buildInvoiceInfoSummary(s),
          SizedBox(height: 20.h),

          // Customer Info Summary
          _buildCustomerInfoSummary(s),
          SizedBox(height: 20.h),

          // Items Summary
          _buildItemsSummary(s),
          SizedBox(height: 20.h),

          // Financial Summary
          _buildFinancialSummary(s),
        ],
      ),
    );
  }

  Widget _buildInvoiceInfoSummary(S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.invoiceInfo,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),
          _buildSummaryRow(
            s.action,
            _getActionText(widget.formController.selectedAction),
          ),
          _buildSummaryRow(
            s.paymentMethod,
            _getPaymentMethodText(widget.formController.selectedPaymentMethod),
          ),
          _buildSummaryRow(
            s.invoiceStatus,
            _getStatusText(widget.formController.selectedStatus),
          ),
          _buildSummaryRow(
            s.issueDate,
            widget.formController.issueDateController.text,
          ),
          if (widget.formController.descriptionController.text.isNotEmpty)
            _buildSummaryRow(
              s.invoiceDescription,
              widget.formController.descriptionController.text,
            ),
        ],
      ),
    );
  }

  Widget _buildCustomerInfoSummary(S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.customerInfo,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),
          _buildSummaryRow(
            s.customerName,
            widget.formController.selectedCustomerName ?? 'غير محدد',
          ),
          if (widget.formController.selectedCustomerEmail != null)
            _buildSummaryRow(
              s.customerEmail,
              widget.formController.selectedCustomerEmail!,
            ),
          if (widget.formController.selectedCustomerPhone != null)
            _buildSummaryRow(
              s.customerPhone,
              widget.formController.selectedCustomerPhone!,
            ),
          if (widget.formController.selectedCustomerAddress != null)
            _buildSummaryRow(
              s.customerAddress,
              widget.formController.selectedCustomerAddress!,
            ),
        ],
      ),
    );
  }

  Widget _buildItemsSummary(S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${s.invoiceItems} (${widget.formController.items.length})',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),
          ...widget.formController.items.map(
            (item) => _buildItemSummaryRow(item),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialSummary(S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.financialInfo,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 12.h),
          _buildFinancialRow(
            s.subtotal,
            '${widget.formController.subtotalController.text} ${context.read<LocalizationCubit>().getCurrentLanguage() == 'ar' ? AppCurrency.currencyAr : AppCurrency.currencyEn}',
          ),
          _buildFinancialRow(
            s.taxAmount,
            '${widget.formController.taxAmountController.text} ${context.read<LocalizationCubit>().getCurrentLanguage() == 'ar' ? AppCurrency.currencyAr : AppCurrency.currencyEn}',
          ),
          _buildFinancialRow(
            s.discount,
            '${widget.formController.discountController.text} ${context.read<LocalizationCubit>().getCurrentLanguage() == 'ar' ? AppCurrency.currencyAr : AppCurrency.currencyEn}${context.read<LocalizationCubit>().getCurrentLanguage() == 'ar' ? AppCurrency.currencyAr : AppCurrency.currencyEn}',
          ),
          const Divider(),
          _buildFinancialRow(
            s.totalAmount,
            '${widget.formController.totalController.text} ${context.read<LocalizationCubit>().getCurrentLanguage() == 'ar' ? AppCurrency.currencyAr : AppCurrency.currencyEn}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemSummaryRow(InvoiceItemData item) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${item.quantity} × ${item.price}',
              style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${item.total} ${context.read<LocalizationCubit>().getCurrentLanguage() == 'ar' ? AppCurrency.currencyAr : AppCurrency.currencyEn}',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialRow(
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16.sp : 14.sp,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
              color: isTotal ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 16.sp : 14.sp,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
              color: isTotal ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  String _getActionText(String action) {
    switch (action) {
      case 'save_only':
        return 'حفظ فقط';
      case 'save_and_send':
        return 'حفظ وإرسال';
      default:
        return action;
    }
  }

  String _getPaymentMethodText(String method) {
    switch (method) {
      case 'cash':
        return 'نقداً';
      case 'card':
        return 'بطاقة';
      case 'bank_transfer':
        return 'تحويل بنكي';
      case 'check':
        return 'شيك';
      default:
        return method;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'draft':
        return 'مسودة';
      case 'sent':
        return 'مرسلة';
      case 'paid':
        return 'مدفوعة';
      default:
        return status;
    }
  }
}
