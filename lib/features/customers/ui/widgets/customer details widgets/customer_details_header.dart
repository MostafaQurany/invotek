import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/customer details widgets/customer_status_chip.dart';

class CustomerDetailsHeader extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback onBackPressed;
  final VoidCallback onHelpPressed;

  const CustomerDetailsHeader({
    super.key,
    required this.customer,
    required this.onBackPressed,
    required this.onHelpPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedEntryWidget(
      delay: Duration.zero,
      child: Container(
        height: 280.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.primary.withOpacity(0.6)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.r),
            bottomRight: Radius.circular(32.r),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                Row(
                  children: [
                    IconButton(
                      onPressed: onBackPressed,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: onHelpPressed,
                      icon: Icon(
                        Icons.help_outline,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Customer Info
                Row(
                  children: [
                    // Avatar
                    Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          customer.name.isNotEmpty
                              ? customer.name[0].toUpperCase()
                              : 'C',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 20.w),

                    // Customer Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customer.name,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            customer.companyName ?? 'Company',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.white.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          CustomerStatusChip(status: customer.status),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
