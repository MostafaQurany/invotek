import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/customer details widgets/customer_info_tile.dart';

class CustomerContactInfoCard extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback onCopyEmail;
  final VoidCallback? onCall;
  final VoidCallback? onOpenMap;

  const CustomerContactInfoCard({
    super.key,
    required this.customer,
    required this.onCopyEmail,
    this.onCall,
    this.onOpenMap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.contact_phone, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 12.w),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Email
          CustomerInfoTile(
            icon: Icons.email_outlined,
            label: 'Email',
            value: customer.email,
            onAction: onCopyEmail,
            actionLabel: 'Copy',
          ),

          SizedBox(height: 16.h),

          // Phone
          CustomerInfoTile(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: customer.phone ?? 'Not provided',
            onAction: customer.phone != null ? onCall : null,
            actionLabel: 'Call',
          ),

          SizedBox(height: 16.h),

          // Address
          CustomerInfoTile(
            icon: Icons.location_on_outlined,
            label: 'Address',
            value: customer.address ?? 'Not provided',
            onAction: customer.address != null ? onOpenMap : null,
            actionLabel: 'Map',
          ),
        ],
      ),
    );
  }
}
