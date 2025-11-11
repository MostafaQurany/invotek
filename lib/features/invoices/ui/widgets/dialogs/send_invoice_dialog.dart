import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/generated/l10n.dart';

class SendInvoiceDialog extends StatefulWidget {
  final InvoiceModel invoice;
  final VoidCallback onSend;

  const SendInvoiceDialog({
    super.key,
    required this.invoice,
    required this.onSend,
  });

  @override
  State<SendInvoiceDialog> createState() => _SendInvoiceDialogState();
}

class _SendInvoiceDialogState extends State<SendInvoiceDialog> {
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  String _selectedMethod = 'email';
  bool _includePDF = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final s = S.of(context);
    _emailController.text = widget.invoice.customer?.email ?? s.invoicesEmail;
    _subjectController.text = s.invoicesInvoiceNumberPlaceholder(
      widget.invoice.invoiceNumber ?? '',
    );
    _messageController.text = s.invoicesPleaseFindAttachedInvoice;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
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
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.send, color: AppColors.primary, size: 24.sp),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).sendInvoice,
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

          // Send Method Selection
          _buildSendMethodSelection(),

          SizedBox(height: 20.h),

          // Email Form
          if (_selectedMethod == 'email') _buildEmailForm(),

          SizedBox(height: 20.h),

          // Options
          _buildOptions(),
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

        // Send Button
        ElevatedButton(
          onPressed: _isLoading ? null : _onSend,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
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
                  S.of(context).send,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildSendMethodSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).sendMethod,
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
              child: _buildMethodOption(
                icon: Icons.email,
                label: S.of(context).email,
                value: 'email',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildMethodOption(
                icon: Icons.sms,
                label: S.of(context).sms,
                value: 'sms',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMethodOption({
    required IconData icon,
    required String label,
    required String value,
  }) {
    final isSelected = _selectedMethod == value;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _selectedMethod = value),
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.1)
                : AppColors.background,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.border,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 24.sp,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
              SizedBox(height: 8.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).emailDetails,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),

        // Email Field
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: S.of(context).email,
            hintText: S.of(context).enterEmail,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // Subject Field
        TextField(
          controller: _subjectController,
          decoration: InputDecoration(
            labelText: S.of(context).subject,
            hintText: S.of(context).enterSubject,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // Message Field
        TextField(
          controller: _messageController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: S.of(context).message,
            hintText: S.of(context).enterMessage,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        // Include PDF Option
        Row(
          children: [
            Checkbox(
              value: _includePDF,
              onChanged: (value) =>
                  setState(() => _includePDF = value ?? false),
              activeColor: AppColors.primary,
            ),
            Expanded(
              child: Text(
                S.of(context).includePDF,
                style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onSend() {
    setState(() {
      _isLoading = true;
    });

    // TODO: Implement send logic
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        widget.onSend();
      }
    });
  }
}
