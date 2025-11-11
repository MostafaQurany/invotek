import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/generated/l10n.dart';

class MarkPaidDialog extends StatefulWidget {
  final InvoiceModel invoice;
  final VoidCallback onMarkPaid;

  const MarkPaidDialog({
    super.key,
    required this.invoice,
    required this.onMarkPaid,
  });

  @override
  State<MarkPaidDialog> createState() => _MarkPaidDialogState();
}

class _MarkPaidDialogState extends State<MarkPaidDialog> {
  final _paymentDateController = TextEditingController();
  final _paymentMethodController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _selectedPaymentMethod = 'cash';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _paymentDateController.text = DateFormatter.toDisplayFormat(_selectedDate);
    _paymentMethodController.text = _getPaymentMethodText(
      _selectedPaymentMethod,
    );
  }

  @override
  void dispose() {
    _paymentDateController.dispose();
    _paymentMethodController.dispose();
    _notesController.dispose();
    super.dispose();
  }

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
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.success,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).markAsPaid,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      widget.invoice.invoiceNumber ?? S.of(context).invoicesInvoiceNumber,
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

          // Payment Details
          _buildPaymentDetails(),

          SizedBox(height: 20.h),

          // Notes
          _buildNotes(),
        ],
      ),
      actions: [
        // Cancel Button
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: Text(
            S.of(context).cancel,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),

        // Mark as Paid Button
        ElevatedButton(
          onPressed: _isLoading ? null : _onMarkPaid,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.success,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: _isLoading
              ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  S.of(context).markAsPaid,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildPaymentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paymentDetails,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),

        // Payment Date
        TextField(
          controller: _paymentDateController,
          readOnly: true,
          decoration: InputDecoration(
            labelText: S.of(context).paymentDate,
            suffixIcon: IconButton(
              onPressed: _selectDate,
              icon: Icon(Icons.calendar_today),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // Payment Method
        DropdownButtonFormField<String>(
          initialValue: _selectedPaymentMethod,
          decoration: InputDecoration(
            labelText: S.of(context).paymentMethod,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          items: [
            DropdownMenuItem(value: 'cash', child: Text(S.of(context).cash)),
            DropdownMenuItem(value: 'card', child: Text(S.of(context).card)),
            DropdownMenuItem(
              value: 'bank_transfer',
              child: Text(S.of(context).bankTransfer),
            ),
            DropdownMenuItem(value: 'check', child: Text(S.of(context).check)),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedPaymentMethod = value;
                _paymentMethodController.text = _getPaymentMethodText(value);
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).notes,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),

        TextField(
          controller: _notesController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: S.of(context).addNotes,
            hintText: S.of(context).enterNotes,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        _selectedDate = date;
        _paymentDateController.text = DateFormatter.toDisplayFormat(date);
      });
    }
  }

  String _getPaymentMethodText(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case 'cash':
        return S.current.cash;
      case 'card':
        return S.current.card;
      case 'bank_transfer':
        return S.current.bankTransfer;
      case 'check':
        return S.current.check;
      default:
        return paymentMethod;
    }
  }

  void _onMarkPaid() {
    setState(() {
      _isLoading = true;
    });

    // TODO: Implement mark as paid logic
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        widget.onMarkPaid();
      }
    });
  }
}
