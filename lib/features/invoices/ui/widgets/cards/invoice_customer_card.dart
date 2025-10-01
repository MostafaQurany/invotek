import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceCustomerCard extends StatelessWidget {
  final InvoiceCustomerModel customer;
  final VoidCallback? onCustomerTap;

  const InvoiceCustomerCard({
    super.key,
    required this.customer,
    this.onCustomerTap,
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
                  Icons.person,
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
                      S.of(context).customer,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      customer.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              if (onCustomerTap != null)
                IconButton(
                  onPressed: onCustomerTap,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 16.sp,
                  ),
                ),
            ],
          ),

          SizedBox(height: 20.h),

          // Customer Details
          Column(
            children: [
              // Email
              if (customer.email.isNotEmpty)
                _buildDetailRow(
                  icon: Icons.email,
                  label: S.of(context).email,
                  value: customer.email,
                ),

              if (customer.email.isNotEmpty) SizedBox(height: 12.h),

              // Phone
              if (customer.phone.isNotEmpty)
                _buildDetailRow(
                  icon: Icons.phone,
                  label: S.of(context).phone,
                  value: customer.phone,
                ),

              if (customer.phone.isNotEmpty) SizedBox(height: 12.h),

              // Address
              if (customer.address.isNotEmpty)
                _buildDetailRow(
                  icon: Icons.location_on,
                  label: S.of(context).address,
                  value: customer.address,
                ),

              if (customer.address.isNotEmpty) SizedBox(height: 12.h),

              // Tax Number
              if (customer.taxNumber.isNotEmpty)
                _buildDetailRow(
                  icon: Icons.receipt,
                  label: S.of(context).taxNumber,
                  value: customer.taxNumber,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16.sp, color: AppColors.textSecondary),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
