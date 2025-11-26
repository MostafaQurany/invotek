import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceSummaryStep extends StatefulWidget {
  final InvoiceFormController formController;
  final InvoiceEntity? originalInvoice;
  final String? returnReason;

  const InvoiceSummaryStep({
    super.key,
    required this.formController,
    this.originalInvoice,
    this.returnReason,
  });

  @override
  State<InvoiceSummaryStep> createState() => _InvoiceSummaryStepState();
}

class _InvoiceSummaryStepState extends State<InvoiceSummaryStep>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final s = S.of(context);

    return ListenableBuilder(
      listenable: widget.formController,
      builder: (context, _) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Return Reason (if credit invoice)
              if (widget.returnReason != null &&
                  widget.returnReason!.isNotEmpty)
                _buildReturnReasonSummary(s),
              if (widget.returnReason != null &&
                  widget.returnReason!.isNotEmpty)
                SizedBox(height: 20.h),

              // Invoice Info Summary
              _buildInvoiceInfoSummary(s),
              SizedBox(height: 20.h),

              // Customer Info Summary (updates when customer changes)
              _buildCustomerInfoSummary(s),
              SizedBox(height: 20.h),

              // Items Summary (updates when items change)
              _buildItemsSummary(s),
              SizedBox(height: 20.h),

              // Financial Summary (updates when totals change)
              _buildFinancialSummary(s),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReturnReasonSummary(S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.warning),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.undo, size: 20.sp, color: AppColors.warning),
              SizedBox(width: 8.w),
              Text(
                s.returnReason,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.warning,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            widget.returnReason!,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
          ),
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
          // _buildSummaryRow(
          //   s.action,
          //   _getActionText(widget.formController.selectedAction),
          // ),
          _buildSummaryRow(
            s.paymentMethod,
            _getPaymentMethodText(widget.formController.selectedPaymentMethod),
          ),
          // _buildSummaryRow(
          //   s.invoiceStatus,
          //   _getStatusText(widget.formController.selectedStatus),
          // ),
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
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.formController.customerNameController,
      builder: (context, _, __) {
        // Get customer name from selectedCustomerName or TextField
        final customerName =
            widget.formController.selectedCustomerName ??
            widget.formController.customerNameController.text.trim();
        final hasCustomer =
            customerName.isNotEmpty ||
            widget.formController.selectedCustomerId != null;
        final isSelectedCustomer =
            widget.formController.selectedCustomerId != null;

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
              if (hasCustomer) ...[
                _buildSummaryRow(
                  s.customerName,
                  customerName.isNotEmpty ? customerName : s.notSpecified,
                ),
                // Show email and phone only if customer is selected (not manual entry)
                if (isSelectedCustomer) ...[
                  if (widget.formController.selectedCustomerEmail != null &&
                      widget.formController.selectedCustomerEmail!.isNotEmpty)
                    _buildSummaryRow(
                      s.customerEmail,
                      widget.formController.selectedCustomerEmail!,
                    ),
                  if (widget.formController.selectedCustomerPhone != null &&
                      widget.formController.selectedCustomerPhone!.isNotEmpty)
                    _buildSummaryRow(
                      s.customerPhone,
                      widget.formController.selectedCustomerPhone!,
                    ),
                  if (widget.formController.selectedCustomerAddress != null &&
                      widget.formController.selectedCustomerAddress!.isNotEmpty)
                    _buildSummaryRow(
                      s.customerAddress,
                      widget.formController.selectedCustomerAddress!,
                    ),
                ],
              ] else
                _buildSummaryRow(s.customerName, s.notSpecified),
            ],
          ),
        );
      },
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
            CurrencyFormatter.formatCurrencyString(
              widget.formController.subtotalController.text,
              context,
            ),
          ),
          _buildFinancialRow(
            s.taxAmount,
            CurrencyFormatter.formatCurrencyString(
              widget.formController.taxAmountController.text,
              context,
            ),
          ),
          _buildFinancialRow(
            s.discount,
            CurrencyFormatter.formatCurrencyString(
              widget.formController.discountController.text,
              context,
            ),
          ),
          const Divider(),
          _buildFinancialRow(
            s.totalAmount,
            CurrencyFormatter.formatCurrencyString(
              widget.formController.totalController.text,
              context,
            ),
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
              CurrencyFormatter.formatCurrencyString(item.total, context),
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

  String _getPaymentMethodText(String method) {
    final s = S.of(context);
    // Cash codes: 011 (income), 012 (general)
    if (method == '011' || method == '012') {
      return s.cash;
    }
    // Debts codes: 021 (income), 022 (general)
    if (method == '021' || method == '022') {
      return s.debts;
    }
    // Fallback for old codes
    switch (method.toLowerCase()) {
      case 'cash':
        return s.cash;
      case 'debts':
        return s.debts;
      case 'card':
        return s.card;
      case 'bank_transfer':
        return s.bankTransfer;
      case 'check':
        return s.check;
      default:
        return method;
    }
  }
}
