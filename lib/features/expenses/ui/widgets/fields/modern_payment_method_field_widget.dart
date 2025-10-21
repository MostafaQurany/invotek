import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class ModernPaymentMethodFieldWidget extends StatelessWidget {
  final String selectedPaymentMethod;
  final Function(String) onChanged;

  const ModernPaymentMethodFieldWidget({
    super.key,
    required this.selectedPaymentMethod,
    required this.onChanged,
  });

  // Payment method options
  static const List<String> _paymentMethods = [
    'cash',
    'credit_card',
    'bank_transfer',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paymentMethod,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.grey.withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedPaymentMethod,
              isExpanded: true,
              items: _paymentMethods.map((method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          _getPaymentMethodIcon(method),
                          color: AppColors.textSecondary,
                          size: 16.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        _formatPaymentMethod(method, context),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  onChanged(newValue);
                }
              },
              icon: Icon(
                Icons.arrow_drop_down,
                color: AppColors.textSecondary,
                size: 20.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  IconData _getPaymentMethodIcon(String method) {
    switch (method) {
      case 'cash':
        return Icons.money;
      case 'credit_card':
        return Icons.credit_card;
      case 'debit_card':
        return Icons.credit_card;
      case 'bank_transfer':
        return Icons.account_balance;
      case 'check':
        return Icons.receipt_long;
      case 'other':
        return Icons.more_horiz;
      default:
        return Icons.payment;
    }
  }

  String _formatPaymentMethod(String method, BuildContext context) {
    switch (method) {
      case 'cash':
        return S.of(context).cash;
      case 'credit_card':
        return S.of(context).creditCard;
      case 'debit_card':
        return S.of(context).debitCard;
      case 'bank_transfer':
        return S.of(context).bankTransfer;
      case 'check':
        return S.of(context).check;
      case 'other':
        return S.of(context).other;
      default:
        return method;
    }
  }
}
