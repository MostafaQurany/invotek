import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerCard extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onView;
  final ColorScheme colorScheme;

  const CustomerCard({
    super.key,
    required this.customer,
    required this.onTap,
    this.onEdit,
    this.onDelete,
    this.onView,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(customer.id),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.55,
        children: [
          SlidableAction(
            onPressed: (_) => onEdit?.call(),
            backgroundColor: colorScheme.primary.withOpacity(0.1),
            foregroundColor: colorScheme.primary,
            icon: Icons.edit,
            autoClose: true,
            borderRadius: BorderRadius.circular(12.r),
          ),
          SlidableAction(
            onPressed: (_) => onDelete?.call(),
            backgroundColor: colorScheme.error.withOpacity(0.1),
            foregroundColor: colorScheme.error,
            icon: Icons.delete_outline,
            autoClose: true,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: AppColors.cardBackground, // White background
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                // SizedBox(height: 12.h),
                // _buildDetails(),
                if (customer.city != null && customer.city!.isNotEmpty) ...[
                  SizedBox(height: 12.h),
                  _buildAddress(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        _buildCustomerIcon(),
        SizedBox(width: 16.w),
        Expanded(child: _buildCustomerInfo()),
        _buildStatus(),
      ],
    );
  }

  Widget _buildCustomerIcon() {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(
          0.1,
        ), // Green background for avatar
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(Icons.person, color: AppColors.primary, size: 28.sp),
    );
  }

  Widget _buildCustomerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          customer.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          customer.phone ?? '',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 8.h),
        _buildStatusChip(),
      ],
    );
  }

  Widget _buildStatusChip() {
    final status = customer.status.toLowerCase();
    final isActive = status == 'active';
    final backgroundColor = isActive ? Color(0xFFE8F5E8) : Color(0xFFF5F5F5);
    final textColor = isActive ? AppColors.primary : AppColors.textSecondary;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        _getStatusText(status),
        style: TextStyle(
          fontSize: 12.sp,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Row(
      children: [
        if (customer.phone != null && customer.phone!.isNotEmpty)
          _buildDetailItem(icon: Icons.phone, text: customer.phone!),
      ],
    );
  }

  Widget _buildDetailItem({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.sp, color: AppColors.textSecondary),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  Widget _buildAddress() {
    return Row(
      children: [
        Icon(Icons.location_on, size: 16.sp, color: AppColors.textSecondary),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            customer.city ?? '',
            style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return S.current.customerStatusActive;
      case 'inactive':
        return S.current.customerStatusInactive;
      default:
        return status;
    }
  }
}
