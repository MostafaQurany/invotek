import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/customer details widgets/customer_info_tile.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerAccountStatusCard extends StatelessWidget {
  final CustomerModel customer;
  final String Function(DateTime?) formatDate;

  const CustomerAccountStatusCard({
    super.key,
    required this.customer,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return AnimatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle_outlined,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                s.customersAccountStatus,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Status
          CustomerInfoTile(
            icon: Icons.flag_outlined,
            label: s.status,
            value: customer.status.toUpperCase(),
            valueColor: customer.status.toLowerCase() == 'active'
                ? AppColors.success
                : AppColors.error,
          ),

          SizedBox(height: 16.h),

          // Created Date
          CustomerInfoTile(
            icon: Icons.calendar_today_outlined,
            label: s.customersCreated,
            value: formatDate(customer.createdAt),
          ),

          SizedBox(height: 16.h),

          // Last Updated
          CustomerInfoTile(
            icon: Icons.update_outlined,
            label: s.customersLastUpdated,
            value: formatDate(customer.updatedAt),
          ),
        ],
      ),
    );
  }
}
