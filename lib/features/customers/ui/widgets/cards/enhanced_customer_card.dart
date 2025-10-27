import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';

class EnhancedCustomerCard extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const EnhancedCustomerCard({
    super.key,
    required this.customer,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                // Avatar
                _buildAvatar(),
                SizedBox(width: 12.w),

                // Customer Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and Status Chip
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              customer.name ?? 'Unnamed Customer',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          _buildStatusChip(),
                        ],
                      ),

                      SizedBox(height: 4.h),

                      // Email
                      if (customer.email.isNotEmpty)
                        Text(
                          customer.email,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.greyDark,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                      SizedBox(height: 8.h),

                      // Phone
                      if (customer.phone != null && customer.phone!.isNotEmpty)
                        Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 16.sp,
                              color: AppColors.greyDark,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              customer.phone!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.greyDark,
                              ),
                            ),
                          ],
                        ),

                      SizedBox(height: 4.h),

                      // Address
                      if (customer.address != null &&
                          customer.address!.isNotEmpty)
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16.sp,
                              color: AppColors.greyDark,
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Text(
                                customer.address!,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.greyDark,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),

                // Action Menu
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        onEdit?.call();
                        break;
                      case 'delete':
                        onDelete?.call();
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined, size: 18.sp),
                          SizedBox(width: 8.w),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outlined,
                            size: 18.sp,
                            color: AppColors.error,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Delete',
                            style: TextStyle(color: AppColors.error),
                          ),
                        ],
                      ),
                    ),
                  ],
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.greyDark,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    final name = customer.name ?? 'U';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'U';

    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          initial,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    final isActive = customer.status.toLowerCase() == 'active';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.success.withOpacity(0.1)
            : AppColors.greyLight,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        customer.status.toUpperCase() ?? 'INACTIVE',
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.success : AppColors.greyDark,
        ),
      ),
    );
  }
}
