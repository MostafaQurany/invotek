import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      child: Card(
        margin: EdgeInsets.only(bottom: 12.h),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
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
                SizedBox(height: 12.h),
                _buildDetails(),
                if (customer.address != null &&
                    customer.address!.isNotEmpty) ...[
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
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        Icons.person,
        color: colorScheme.onPrimaryContainer,
        size: 28.sp,
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          customer.name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          customer.email,
          style: TextStyle(
            fontSize: 12.sp,
            color: colorScheme.onSurfaceVariant,
          ),
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
    final color = status == 'active' ? Colors.green : Colors.grey;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        _getStatusText(status),
        style: TextStyle(
          fontSize: 12.sp,
          color: color,
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
        Icon(icon, size: 16.sp, color: colorScheme.onSurfaceVariant),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildAddress() {
    return Text(
      customer.address!,
      style: TextStyle(fontSize: 12.sp, color: colorScheme.onSurfaceVariant),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
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
