import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/generated/l10n.dart';

class QuickActionsSection extends StatefulWidget {
  const QuickActionsSection({super.key});

  @override
  State<QuickActionsSection> createState() => _QuickActionsSectionState();
}

class _QuickActionsSectionState extends State<QuickActionsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quickActions,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                context,
                title: S.of(context).createInvoice,
                icon: Icons.receipt_long,
                color: AppColors.primary,
                onTap: () {
                  if (PermissionChecker.hasPermission(
                    context,
                    PermissionKeys.taxInvoicesCreate,
                  )) {
                    Navigator.pushNamed(context, AppRoutes.invoicesListRoute);
                  } else {
                    _showPermissionDeniedSnackBar(S.of(context).createInvoice);
                  }
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildQuickActionCard(
                context,
                title: S.of(context).addCustomer,
                icon: Icons.person_add,
                color: AppColors.info,
                onTap: () {
                  if (PermissionChecker.hasPermission(
                    context,
                    PermissionKeys.customersCreate,
                  )) {
                    Navigator.pushNamed(context, '/customers/list');
                  } else {
                    _showPermissionDeniedSnackBar(S.of(context).addCustomer);
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                context,
                title: S.of(context).addProduct,
                icon: Icons.add_shopping_cart,
                color: Color(0xFF8B5CF6), // Purple color
                onTap: () {
                  if (PermissionChecker.hasPermission(
                    context,
                    PermissionKeys.productsCreate,
                  )) {
                    Navigator.pushNamed(context, '/products/list');
                  } else {
                    _showPermissionDeniedSnackBar(S.of(context).addProduct);
                  }
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildQuickActionCard(
                context,
                title: S.of(context).addExpense,
                icon: Icons.account_balance_wallet,
                color: Color(0xFFF59E0B), // Orange color
                onTap: () {
                  if (PermissionChecker.hasPermission(
                    context,
                    PermissionKeys.expensesCreate,
                  )) {
                    Navigator.pushNamed(context, AppRoutes.addExpenseRoute);
                  } else {
                    _showPermissionDeniedSnackBar(S.of(context).addExpense);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showPermissionDeniedSnackBar(String featureName) {
    final s = S.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.lock_outline, color: Colors.white),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    s.homeAccessDenied,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    s.homeNoPermissionToAccess(featureName),
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.error,
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //  constraints: BoxConstraints(minHeight: 80.h, maxHeight: 100.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color.withOpacity(0.2), width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 24.sp),
              SizedBox(height: 8.h),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
