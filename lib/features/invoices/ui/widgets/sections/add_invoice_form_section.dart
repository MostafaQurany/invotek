import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class AddInvoiceFormSection extends StatefulWidget {
  final TextEditingController invoiceNumberController;
  final TextEditingController customerNameController;
  final TextEditingController customerEmailController;
  final TextEditingController customerPhoneController;
  final TextEditingController subtotalController;
  final TextEditingController taxAmountController;
  final TextEditingController totalController;
  final TextEditingController descriptionController;
  final TextEditingController issueDateController;
  final String selectedStatus;
  final String selectedPaymentMethod;
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;
  final Function(String) onStatusChanged;
  final Function(String) onPaymentMethodChanged;
  final Function(String) onSubtotalChanged;
  final Function(String) onTaxAmountChanged;

  const AddInvoiceFormSection({
    super.key,
    required this.invoiceNumberController,
    required this.customerNameController,
    required this.customerEmailController,
    required this.customerPhoneController,
    required this.subtotalController,
    required this.taxAmountController,
    required this.totalController,
    required this.descriptionController,
    required this.issueDateController,
    required this.selectedStatus,
    required this.selectedPaymentMethod,
    required this.selectedDate,
    required this.onDateChanged,
    required this.onStatusChanged,
    required this.onPaymentMethodChanged,
    required this.onSubtotalChanged,
    required this.onTaxAmountChanged,
  });

  @override
  State<AddInvoiceFormSection> createState() => _AddInvoiceFormSectionState();
}

class _AddInvoiceFormSectionState extends State<AddInvoiceFormSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Basic Information Section
          _buildSectionHeader(
            title: S.of(context).basicInformation,
            icon: Icons.info_outline,
          ),
          SizedBox(height: 16.h),
          _buildBasicInformationSection(),

          SizedBox(height: 24.h),

          // Customer Information Section
          _buildSectionHeader(
            title: S.of(context).customerInformation,
            icon: Icons.person_outline,
          ),
          SizedBox(height: 16.h),
          _buildCustomerInformationSection(),

          SizedBox(height: 24.h),

          // Amount Information Section
          _buildSectionHeader(
            title: S.of(context).amountInformation,
            icon: Icons.attach_money,
          ),
          SizedBox(height: 16.h),
          _buildAmountInformationSection(),

          SizedBox(height: 24.h),

          // Additional Information Section
          _buildSectionHeader(
            title: S.of(context).additionalInformation,
            icon: Icons.note_outlined,
          ),
          SizedBox(height: 16.h),
          _buildAdditionalInformationSection(),

          SizedBox(height: 100.h), // Bottom spacing
        ],
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required IconData icon}) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: AppColors.primary),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildBasicInformationSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Invoice Number
          TextField(
            controller: widget.invoiceNumberController,
            decoration: InputDecoration(
              labelText: S.current.invoiceNumber,
              hintText: S.current.enterInvoiceNumber,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Issue Date
          TextField(
            controller: widget.issueDateController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: S.current.issueDate,
              hintText: S.current.selectDate,
              suffixIcon: IconButton(
                onPressed: () => _selectDate(context),
                icon: Icon(Icons.calendar_today),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Status
          DropdownButtonFormField<String>(
            initialValue: widget.selectedStatus,
            decoration: InputDecoration(
              labelText: S.current.status,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            items: [
              DropdownMenuItem(value: 'draft', child: Text(S.current.draft)),
              DropdownMenuItem(
                value: 'pending',
                child: Text(S.current.pending),
              ),
              DropdownMenuItem(value: 'paid', child: Text(S.current.paid)),
            ],
            onChanged: (value) {
              if (value != null) widget.onStatusChanged(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerInformationSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Customer Name
          TextField(
            controller: widget.customerNameController,
            decoration: InputDecoration(
              labelText: S.current.customerName,
              hintText: S.current.enterCustomerName,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Customer Email
          TextField(
            controller: widget.customerEmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: S.current.customerEmail,
              hintText: S.current.enterCustomerEmail,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Customer Phone
          TextField(
            controller: widget.customerPhoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: S.current.customerPhone,
              hintText: S.current.enterCustomerPhone,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountInformationSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Subtotal
          TextField(
            controller: widget.subtotalController,
            keyboardType: TextInputType.number,
            onChanged: widget.onSubtotalChanged,
            decoration: InputDecoration(
              labelText: S.current.subtotal,
              hintText: S.current.enterSubtotal,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Tax Amount
          TextField(
            controller: widget.taxAmountController,
            keyboardType: TextInputType.number,
            onChanged: widget.onTaxAmountChanged,
            decoration: InputDecoration(
              labelText: S.current.taxAmount,
              hintText: S.current.enterTaxAmount,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Total (Read-only)
          TextField(
            controller: widget.totalController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: S.current.total,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Payment Method
          DropdownButtonFormField<String>(
            initialValue: widget.selectedPaymentMethod,
            decoration: InputDecoration(
              labelText: S.current.paymentMethod,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            items: [
              DropdownMenuItem(value: 'cash', child: Text(S.current.cash)),
              DropdownMenuItem(value: 'card', child: Text(S.current.card)),
              DropdownMenuItem(
                value: 'bank_transfer',
                child: Text(S.current.bankTransfer),
              ),
              DropdownMenuItem(value: 'check', child: Text(S.current.check)),
            ],
            onChanged: (value) {
              if (value != null) widget.onPaymentMethodChanged(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInformationSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Description
          TextField(
            controller: widget.descriptionController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: S.current.description,
              hintText: S.current.enterDescription,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      widget.onDateChanged(date);
    }
  }
}
