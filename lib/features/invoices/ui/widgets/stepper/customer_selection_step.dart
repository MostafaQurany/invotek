import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/dialogs/customer_selection_dialog.dart';
import 'package:invotek/features/invoices/ui/dialogs/add_customer_dialog.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerSelectionStep extends StatefulWidget {
  final InvoiceFormController formController;

  const CustomerSelectionStep({super.key, required this.formController});

  @override
  State<CustomerSelectionStep> createState() => _CustomerSelectionStepState();
}

class _CustomerSelectionStepState extends State<CustomerSelectionStep> {
  String _customerType = 'existing'; // 'existing' or 'new'

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Customer Type Selection
          _buildCustomerTypeSelection(s),
          SizedBox(height: 20.h),

          // Customer Selection Content
          if (_customerType == 'existing') ...[
            _buildExistingCustomerSelection(s),
          ] else ...[
            _buildNewCustomerForm(s),
          ],
        ],
      ),
    );
  }

  Widget _buildCustomerTypeSelection(S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.customerType,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text(s.selectCustomer),
                value: 'existing',
                groupValue: _customerType,
                onChanged: (value) {
                  setState(() {
                    _customerType = value!;
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text(s.addNewCustomer),
                value: 'new',
                groupValue: _customerType,
                onChanged: (value) {
                  setState(() {
                    _customerType = value!;
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExistingCustomerSelection(S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.selectCustomer,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),

        // Selected Customer Display
        if (widget.formController.selectedCustomerId != null)
          _buildSelectedCustomerCard(s)
        else
          _buildSelectCustomerButton(s),
      ],
    );
  }

  Widget _buildSelectedCustomerCard(S s) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          Icon(Icons.person, color: AppColors.primary, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.formController.selectedCustomerName ?? '',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (widget.formController.selectedCustomerEmail != null)
                  Text(
                    widget.formController.selectedCustomerEmail!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                if (widget.formController.selectedCustomerPhone != null)
                  Text(
                    widget.formController.selectedCustomerPhone!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.formController.selectedCustomerId = null;
                widget.formController.selectedCustomerName = null;
                widget.formController.selectedCustomerEmail = null;
                widget.formController.selectedCustomerPhone = null;
                widget.formController.selectedCustomerAddress = null;
              });
            },
            icon: const Icon(Icons.close),
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectCustomerButton(S s) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _showCustomerSelectionDialog(),
        icon: const Icon(Icons.search),
        label: Text(s.selectCustomer),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }

  Widget _buildNewCustomerForm(S s) {
    return Column(
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

        // Customer Name
        TextFormField(
          controller: widget.formController.customerNameController,
          decoration: InputDecoration(
            labelText: s.customerName,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
          ),
        ),
        SizedBox(height: 16.h),

        // Customer Email
        TextFormField(
          controller: widget.formController.customerEmailController,
          decoration: InputDecoration(
            labelText: s.customerEmail,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),

        // Customer Phone
        TextFormField(
          controller: widget.formController.customerPhoneController,
          decoration: InputDecoration(
            labelText: s.customerPhone,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
          ),
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 16.h),

        // Customer Address
        TextFormField(
          controller: widget.formController.customerAddressController,
          decoration: InputDecoration(
            labelText: s.customerAddress,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
          ),
          maxLines: 2,
        ),
      ],
    );
  }

  void _showCustomerSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => CustomerSelectionDialog(
        selectedCustomer: null,
        onCustomerSelected: (customer) {
          widget.formController.onCustomerSelected(
            customer.id ?? 0,
            customer.name ?? '',
            customer.email ?? '',
            customer.phone ?? '',
            customer.address ?? '',
          );
          setState(() {});
        },
        onAddNewCustomer: () {
          Navigator.pop(context);
          _showAddCustomerDialog();
        },
      ),
    );
  }

  void _showAddCustomerDialog() {
    showDialog(
      context: context,
      builder: (context) => AddCustomerDialog(
        onCustomerCreated: (customer) {
          widget.formController.onNewCustomerAdded(
            customer.name ?? '',
            customer.email ?? '',
            customer.phone ?? '',
            customer.address ?? '',
          );
          setState(() {});
        },
      ),
    );
  }
}
