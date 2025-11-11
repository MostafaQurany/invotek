import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/features/expenses/domain/entit/expense_model.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/expenses/constants/expenses_permissions.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class ExpenseOptionsBottomSheet extends StatelessWidget {
  final ExpenseModel expense;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ExpenseOptionsBottomSheet({
    super.key,
    required this.expense,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle Bar
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 12.h),
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          SizedBox(height: 20.h),

          // Expense Info
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.receipt_long,
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
                        expense.description ?? S.of(context).expensesNoDescription,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        CurrencyFormatter.formatCurrency(expense.amount, context),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // Options
          Builder(
            builder: (context) {
              final s = S.of(context);
              final hasViewPermission = PermissionChecker.hasPermission(
                context,
                ExpensesPermissions.view,
              );
              final hasEditPermission = PermissionChecker.hasPermission(
                context,
                ExpensesPermissions.edit,
              );
              final hasDeletePermission = PermissionChecker.hasPermission(
                context,
                ExpensesPermissions.delete,
              );

              return Column(
                children: [
                  _buildOptionItem(
                    icon: Icons.visibility,
                    title: s.expensesViewDetails,
                    onTap: hasViewPermission ? onView : null,
                    hasPermission: hasViewPermission,
                    permissionMessage: s.expensesNoPermissionToAct,
                  ),
                  _buildOptionItem(
                    icon: Icons.edit,
                    title: s.expensesEditExpense,
                    onTap: hasEditPermission ? onEdit : null,
                    hasPermission: hasEditPermission,
                    permissionMessage: s.expensesNoPermissionToAct,
                  ),
                  _buildOptionItem(
                    icon: Icons.delete,
                    title: s.expensesDeleteExpense,
                    onTap: hasDeletePermission ? onDelete : null,
                    hasPermission: hasDeletePermission,
                    permissionMessage: s.expensesNoPermissionToAct,
                    isDestructive: true,
                  ),
                ],
              );
            },
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String title,
    required VoidCallback? onTap,
    required bool hasPermission,
    required String permissionMessage,
    bool isDestructive = false,
  }) {
    final color = isDestructive ? AppColors.error : AppColors.primary;
    return Tooltip(
      message: hasPermission ? '' : permissionMessage,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            children: [
              Icon(
                hasPermission ? icon : Icons.lock_outline,
                size: 24.sp,
                color: hasPermission
                    ? color
                    : color.withOpacity(0.5),
              ),
              SizedBox(width: 16.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: hasPermission
                      ? (isDestructive ? AppColors.error : AppColors.textPrimary)
                      : color.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
