import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class ExpensesEmptyState extends StatelessWidget {
  final VoidCallback onAddExpense;

  const ExpensesEmptyState({super.key, required this.onAddExpense});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty Icon
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: Icon(
                Icons.receipt_long_outlined,
                size: 60.sp,
                color: AppColors.greyDark,
              ),
            ),

            SizedBox(height: 24.h),

            // Title
            Text(
              'No expenses yet',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 8.h),

            // Description
            Text(
              'Start tracking your business expenses by adding your first expense',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),

            SizedBox(height: 32.h),

            // Add Button
            ElevatedButton.icon(
              onPressed: onAddExpense,
              icon: Icon(Icons.add, size: 20.sp),
              label: Text(
                'Add First Expense',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
