import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceBasicInfoStep extends StatefulWidget {
  final InvoiceFormController formController;

  const InvoiceBasicInfoStep({super.key, required this.formController});

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
      padding: EdgeInsets.all(16.w),
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
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          initialValue: widget.formController.selectedPaymentMethod,
          decoration: InputDecoration(
            fillColor: AppColors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
          ),
          items: [
            DropdownMenuItem(value: 'cash', child: Text(s.cash)),
            DropdownMenuItem(value: 'card', child: Text(s.card)),
            DropdownMenuItem(
              value: 'bank_transfer',
              child: Text(s.bankTransfer),
            ),
            DropdownMenuItem(value: 'check', child: Text(s.check)),
          ],
          onChanged: (value) {
            if (value != null) {
              widget.formController.onPaymentMethodChanged(value);
            }
          },
        ),
      ],
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
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () => _selectDate(),
            ),
          ),
          readOnly: true,
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
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,

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
