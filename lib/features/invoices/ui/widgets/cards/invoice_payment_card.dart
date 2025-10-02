import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/generated/l10n.dart';

class InvoicePaymentCard extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback? onPaymentMethodTap;
  final VoidCallback? onMarkPaid;

  const InvoicePaymentCard({
    super.key,
    required this.invoice,
    this.onPaymentMethodTap,
    this.onMarkPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  Icons.payment,
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
                      S.current.payment,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      S.current.paymentDetails,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Payment Method
          _buildPaymentMethodSection(),

          SizedBox(height: 16.h),

          // Amount Breakdown
          _buildAmountBreakdown(),

          SizedBox(height: 20.h),

          // Action Buttons
          // if (invoice.status?.toLowerCase() != 'paid') _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            _getPaymentMethodIcon(invoice.paymentMethodCode ?? ""),
            size: 20.sp,
            color: AppColors.primary,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.paymentMethod,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  _getPaymentMethodText(invoice.paymentMethodCode ?? ""),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          // if (onPaymentMethodTap != null)
          //   IconButton(
          //     onPressed: onPaymentMethodTap,
          //     icon: Icon(Icons.edit, size: 16.sp, color: AppColors.primary),
          //   ),
        ],
      ),
    );
  }

  Widget _buildAmountBreakdown() {
    final subtotal = double.tryParse(invoice.subtotal ?? '0.00') ?? 0.0;
    final taxAmount = double.tryParse(invoice.taxAmount ?? '0.00') ?? 0.0;
    final total = double.tryParse(invoice.total ?? '0.00') ?? 0.0;

    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.current.subtotal,
              style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            ),
            Text(
              subtotal.toString(),
              // NumberFormat.currency(symbol: 'ر.س').format(subtotal),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),

        // Tax
        if (taxAmount > 0) ...[
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.tax,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                taxAmount.toString(),
                // NumberFormat.currency(symbol: 'ر.س').format(taxAmount),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.warning,
                ),
              ),
            ],
          ),
        ],

        // Divider
        SizedBox(height: 12.h),
        Container(height: 1.h, color: AppColors.border),
        SizedBox(height: 12.h),

        // Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.current.total,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              total.toString(),
              // NumberFormat.currency(symbol: 'ر.س').format(total),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget _buildActionButtons() {
  //   return Row(
  //     children: [
  //       // Mark as Paid Button
  //       Expanded(
  //         child: Material(
  //           color: Colors.transparent,
  //           child: InkWell(
  //             onTap: onMarkPaid,
  //             borderRadius: BorderRadius.circular(8.r),
  //             child: Container(
  //               padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
  //               decoration: BoxDecoration(
  //                 color: AppColors.success.withOpacity(0.1),
  //                 borderRadius: BorderRadius.circular(8.r),
  //                 border: Border.all(
  //                   color: AppColors.success.withOpacity(0.3),
  //                   width: 1,
  //                 ),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(
  //                     Icons.check_circle,
  //                     size: 16.sp,
  //                     color: AppColors.success,
  //                   ),
  //                   SizedBox(width: 6.w),
  //                   Text(
  //                     S.current.markAsPaid,
  //                     style: TextStyle(
  //                       fontSize: 14.sp,
  //                       fontWeight: FontWeight.w600,
  //                       color: AppColors.success,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  IconData _getPaymentMethodIcon(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case 'cash':
        return Icons.money;
      case 'card':
        return Icons.credit_card;
      case 'bank_transfer':
        return Icons.account_balance;
      case 'check':
        return Icons.receipt;
      default:
        return Icons.payment;
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
}
