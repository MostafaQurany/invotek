import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceBasicInfoStep extends StatefulWidget {
  final InvoiceFormController formController;
  final bool isReadOnly;

  const InvoiceBasicInfoStep({
    super.key,
    required this.formController,
    this.isReadOnly = false,
  });

  @override
  State<InvoiceBasicInfoStep> createState() => _InvoiceBasicInfoStepState();
}

class _InvoiceBasicInfoStepState extends State<InvoiceBasicInfoStep>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final s = S.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Payment Method
          _buildPaymentMethodSelection(s),
          SizedBox(height: 20.h),

          // Status
          //    _buildStatusSelection(s),
          SizedBox(height: 20.h),

          // Issue Date
          _buildIssueDateSelection(s),
          SizedBox(height: 20.h),

          // Description
          _buildDescriptionField(s),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSelection(S s) {
    final isCashSelected =
        widget.formController.selectedPaymentMethod == 'cash';
    final isDebtsSelected =
        widget.formController.selectedPaymentMethod == 'debts';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.paymentMethod,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            // Cash Card
            Expanded(
              child: _buildPaymentMethodCard(
                title: s.cash,
                isSelected: isCashSelected,
                onTap: () {
                  widget.formController.onPaymentMethodChanged('cash');
                  setState(() {});
                },
                icon: Icons.money,
              ),
            ),
            SizedBox(width: 12.w),
            // Debts Card
            Expanded(
              child: _buildPaymentMethodCard(
                title: s
                    .debts, // Will be replaced with s.debts after localization generation
                isSelected: isDebtsSelected,
                onTap: () {
                  widget.formController.onPaymentMethodChanged('debts');
                  setState(() {});
                },
                icon: Icons.account_balance_wallet,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodCard({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return InkWell(
      onTap: widget.isReadOnly ? null : onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: widget.isReadOnly
              ? AppColors.grey.withOpacity(0.1)
              : (isSelected
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.white),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: widget.isReadOnly
                ? AppColors.grey.withOpacity(0.3)
                : (isSelected
                      ? AppColors.primary
                      : AppColors.grey.withOpacity(0.3)),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              size: 32.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIssueDateSelection(S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.issueDate,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: widget.formController.issueDateController,
          enabled: !widget.isReadOnly,
          readOnly: true,
          decoration: InputDecoration(
            fillColor: widget.isReadOnly
                ? AppColors.grey.withOpacity(0.1)
                : AppColors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
            suffixIcon: widget.isReadOnly
                ? null
                : IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField(S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.invoiceDescription,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: widget.formController.descriptionController,
          readOnly: widget.isReadOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.isReadOnly
                ? AppColors.grey.withOpacity(0.1)
                : AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
            hintText: s.enterInvoiceDescription,
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.formController.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != widget.formController.selectedDate) {
      widget.formController.onDateChanged(picked);
    }
  }
}
