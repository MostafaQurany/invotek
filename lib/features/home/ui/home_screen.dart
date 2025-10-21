import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/home/cubit/dashboard_cubit.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';
import 'package:invotek/features/home/ui/widgets/dashboard_statistics_card.dart';
import 'package:invotek/features/home/ui/widgets/quick_actions_section.dart';
import 'package:invotek/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // تحميل بيانات لوحة التحكم
    context.read<DashboardCubit>().loadDashboard();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(Icons.menu, color: colorScheme.onSurface, size: 24.sp),
        ),
        title: Image(image: AssetImage(AppImages.logoGreen), height: 40.h),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                // Welcome Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).welcome,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          S.of(context).chooseFeature,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),

                // Statistics Cards
                if (state is DashboardLoaded) ...[
                  _buildStatisticsCards(context, state.data),
                ] else if (state is DashboardLoading) ...[
                  _buildLoadingCards(),
                ] else if (state is DashboardError) ...[
                  _buildErrorWidget(context, state.message),
                ] else ...[
                  _buildLoadingCards(),
                ],

                // Quick Actions Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: QuickActionsSection(),
                  ),
                ),

                // Recent Data Section (if data is loaded)
                if (state is DashboardLoaded) ...[
                  _buildRecentDataSection(context, state.data),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatisticsCards(BuildContext context, DashboardData data) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            // First Row - Main Statistics
            Row(
              children: [
                Expanded(
                  child: DashboardStatisticsCard(
                    title: S.of(context).totalInvoices,
                    value: '${data.invoicesCount} ${S.of(context).currency}',
                    subtitle:
                        '${data.newInvoicesCount} ${S.of(context).newInvoices}',
                    icon: Icons.receipt_long,
                    color: AppColors.primary,
                    onTap: () {
                      context.read<NavigationCubit>().navigateToRoute(
                        AppRoutes.invoicesListRoute,
                      );

                      // إغلاق الدرج
                      ZoomDrawer.of(context)?.close();
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: DashboardStatisticsCard(
                    title: S.of(context).taxInvoices,
                    value: '${data.taxInvoicesCount} ${S.of(context).currency}',
                    subtitle:
                        '${data.taxInvoicesTotal} ${S.of(context).currency}',
                    icon: Icons.receipt,
                    color: AppColors.secondary,
                    onTap: () {
                      context.read<NavigationCubit>().navigateToRoute(
                        AppRoutes.invoicesListRoute,
                      );

                      // إغلاق الدرج
                      ZoomDrawer.of(context)?.close();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            // Second Row - Sales & Expenses
            Row(
              children: [
                Expanded(
                  child: DashboardStatisticsCard(
                    title: S.of(context).totalSales,
                    value: '${data.salesTotal} ${S.of(context).currency}',
                    subtitle:
                        '${S.of(context).growth} ${data.salesGrowthPercentage.toStringAsFixed(1)}%',
                    icon: Icons.trending_up,
                    color: AppColors.success,
                    // onTap: () {},
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: DashboardStatisticsCard(
                    title: S.of(context).totalExpenses,
                    value: '${data.expensesTotal} ${S.of(context).currency}',
                    subtitle:
                        '${S.of(context).thisMonth}: ${data.monthlyExpensesTotal} ${S.of(context).currency}',
                    icon: Icons.account_balance_wallet,
                    color: AppColors.warning,
                    onTap: () {
                      context.read<NavigationCubit>().navigateToRoute(
                        AppRoutes.expensesListRoute,
                      );

                      // إغلاق الدرج
                      ZoomDrawer.of(context)?.close();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            // Third Row - Customers & Products
            Row(
              children: [
                Expanded(
                  child: DashboardStatisticsCard(
                    title: S.of(context).totalCustomers,
                    value: '${data.customersCount} ${S.of(context).currency}',
                    subtitle:
                        '${data.newCustomersCount} ${S.of(context).newCustomers}',
                    icon: Icons.people,
                    color: AppColors.info,
                    // onTap: () {
                    //   Navigator.pushNamed(context, '/customers/list');
                    // },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: DashboardStatisticsCard(
                    title: S.of(context).totalProducts,
                    value: '${data.productsCount} ${S.of(context).currency}',
                    subtitle:
                        '${data.newProductsCount} ${S.of(context).newProducts}',
                    icon: Icons.inventory,
                    color: AppColors.primary,
                    // onTap: () {
                    //   Navigator.pushNamed(context, '/products/list');
                    // },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            // Fourth Row - Profit & Returns
            Row(
              children: [
                Expanded(
                  child: DashboardStatisticsCard(
                    title: S.of(context).netProfit,
                    value:
                        '${data.netProfit.toStringAsFixed(2)} ${S.of(context).currency}',
                    subtitle:
                        '${S.of(context).growth} ${data.profitGrowthPercentage.toStringAsFixed(1)}%',
                    icon: Icons.account_balance,
                    color: data.netProfit >= 0
                        ? AppColors.success
                        : AppColors.error,
                    // onTap: () {},
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: DashboardStatisticsCard(
                    title: S.of(context).returnedInvoices,
                    value:
                        '${data.returnedInvoicesCount} ${S.of(context).currency}',
                    subtitle:
                        '${data.returnedInvoicesTotal} ${S.of(context).currency}',
                    icon: Icons.undo,
                    color: AppColors.error,
                    // onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingCards() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, String message) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.error.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Icon(Icons.error_outline, color: AppColors.error, size: 48.sp),
              SizedBox(height: 16.h),
              Text(
                S.of(context).dashboardError,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.error,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardCubit>().loadDashboard();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: Text(S.of(context).retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentDataSection(BuildContext context, DashboardData data) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).topSellingProducts,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            ...data.topProducts
                .take(5)
                .map(
                  (product) => Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.inventory,
                            color: AppColors.primary,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.product?.name ??
                                    S.of(context).uncategorized,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                '${S.of(context).quantity}: ${product.totalQuantity}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${product.totalAmount.toStringAsFixed(0)} ${S.of(context).currency}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
