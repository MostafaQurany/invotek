import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/home/ui/widgets/home_dashboard_section_main.dart';
import 'package:invotek/features/home/ui/widgets/home_dashboard_section_shortcut.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class HomeDashboardSection extends StatelessWidget {
  const HomeDashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: SizedBox(
        height: 240.h,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    height: 240.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.4),
                          AppColors.primary.withValues(alpha: 0.9),
                          AppColors.primary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.all(16.w),
                    child: HomeDashboardSectionMain(),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // الفواتير
                  HomeDashboardSectionShortcut(
                    title: S.of(context).invoices,
                    icon: Icons.receipt_long,
                    route: AppRoutes.invoicesListRoute,
                    index: 0,
                    permissionKey: PermissionKeys.taxInvoicesView,
                  ),
                  // المصروفات
                  HomeDashboardSectionShortcut(
                    title: S.of(context).expenses,
                    icon: Icons.payments,
                    route: AppRoutes.expensesListRoute,
                    index: 1,
                    permissionKey: PermissionKeys.expensesView,
                  ),
                  // المنتجات
                  HomeDashboardSectionShortcut(
                    title: S.of(context).products,
                    icon: Icons.inventory_2,
                    route: AppRoutes.productsListRoute,
                    index: 2,
                    permissionKey: PermissionKeys.productsView,
                  ),
                  // العملاء
                  HomeDashboardSectionShortcut(
                    title: S.of(context).customers,
                    icon: Icons.people,
                    route: AppRoutes.customersListRoute,
                    index: 3,
                    permissionKey: PermissionKeys.customersView,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
