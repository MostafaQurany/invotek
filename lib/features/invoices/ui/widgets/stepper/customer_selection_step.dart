import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/dialogs/customer_selection_dialog.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerSelectionStep extends StatefulWidget {
  final InvoiceFormController formController;
  final bool isReadOnly;

  const CustomerSelectionStep({
    super.key,
    required this.formController,
    this.isReadOnly = false,
  });

  @override
  State<CustomerSelectionStep> createState() => _CustomerSelectionStepState();
}

class _CustomerSelectionStepState extends State<CustomerSelectionStep>
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // Customer Selection Section
            _buildNewCustomerForm(s),
            // Manual Form Entry
            _buildCustomerSelectionSection(s),
          ],
        );
      },
    );
  }

  Widget _buildCustomerSelectionSection(S s) {
    // Show card if customer is selected OR if there's text in the name field
    final hasSelectedCustomer =
        widget.formController.selectedCustomerId != null;
    final hasCustomerName =
        widget.formController.customerNameController.text.trim().isNotEmpty ||
        widget.formController.selectedCustomerName != null;

    if (!hasSelectedCustomer && !hasCustomerName) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        _buildSelectedCustomerCard(s),
      ],
    );
  }

  Widget _buildSelectedCustomerCard(S s) {
    // Get customer name from selectedCustomerName or TextField
    final customerName =
        widget.formController.selectedCustomerName ??
        widget.formController.customerNameController.text.trim();
    final isSelectedCustomer = widget.formController.selectedCustomerId != null;

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
                  customerName.isNotEmpty ? customerName : s.customerName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                // Show email and phone only if customer is selected (not manual entry)
                if (isSelectedCustomer) ...[
                  if (widget.formController.selectedCustomerEmail != null &&
                      widget.formController.selectedCustomerEmail!.isNotEmpty)
                    Text(
                      widget.formController.selectedCustomerEmail!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  if (widget.formController.selectedCustomerPhone != null &&
                      widget.formController.selectedCustomerPhone!.isNotEmpty)
                    Text(
                      widget.formController.selectedCustomerPhone!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                ],
              ],
            ),
          ),
          if (!widget.isReadOnly)
            IconButton(
              onPressed: () {
                setState(() {
                  widget.formController.selectedCustomerId = null;
                  widget.formController.selectedCustomerName = null;
                  widget.formController.selectedCustomerEmail = null;
                  widget.formController.selectedCustomerPhone = null;
                  widget.formController.selectedCustomerAddress = null;
                  widget.formController.customerNameController.clear();
                });
              },
              icon: const Icon(Icons.close),
              color: AppColors.textSecondary,
            ),
        ],
      ),
    );
  }

  void _showCustomerSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => CustomerSelectionDialog(
        selectedCustomer: null,
        onCustomerSelected: (customer) {
          // Clear the TextField and use selected customer data
          widget.formController.customerNameController.clear();
          widget.formController.onCustomerSelected(
            customer.id,
            customer.name,
            customer.email,
            customer.phone ?? '',
            customer.address ?? '',
          );
          setState(() {});
        },
      ),
    ).then((value) {
      if (mounted) {
        setState(() {});
      }
    });
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

        // Customer Name Field with Add Customer Button
        Row(
          children: [
            // Customer Name TextField
            Expanded(
              child: TextFormField(
                controller: widget.formController.customerNameController,
                onChanged: widget.isReadOnly
                    ? null
                    : (value) {
                        // When user types, clear selected customer and update name
                        if (widget.formController.selectedCustomerId != null) {
                          widget.formController.selectedCustomerId = null;
                          widget.formController.selectedCustomerEmail = null;
                          widget.formController.selectedCustomerPhone = null;
                          widget.formController.selectedCustomerAddress = null;
                        }
                        widget.formController.selectedCustomerName = value.trim();
                        widget.formController.notifyCustomerFieldsChanged();
                        setState(() {});
                      },
                readOnly: widget.isReadOnly,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.isReadOnly
                      ? AppColors.grey.withOpacity(0.1)
                      : AppColors.white,
                  labelText: s.customerName,
                  hintText: s.enterCustomerName,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 16.h,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Add Customer Button
            ElevatedButton.icon(
              onPressed: widget.isReadOnly
                  ? null
                  : () => _showCustomerSelectionDialog(),
              icon: const Icon(Icons.person_add),
              label: Text(s.selectCustomer),
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.isReadOnly
                    ? AppColors.grey
                    : AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
