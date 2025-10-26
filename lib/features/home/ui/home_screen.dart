import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/home/cubit/dashboard_cubit.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';
import 'package:invotek/features/home/ui/widgets/home_dashboard_section.dart';
import 'package:invotek/features/home/ui/widgets/quick_actions_section.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

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

    // تحميل الصلاحيات بشكل صامت
    _loadUserPermissions();
  }

  Future<void> _loadUserPermissions() async {
    final userData = StorageService.getUserData();
    if (userData?.roleId != null) {
      context.read<PermissionsCubit>().loadPermissionsWithCacheFallback(
        userData!.roleId!,
      );
    }
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
            onPressed: () {
              // TODO: إضافة وظيفة الإشعارات هنا
            },
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Welcome Header
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back, 👋",
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
                      ],
                    ),
                  ),

                  // Statistics Cards
                  HomeDashboardSection(),
                  // Quick Actions Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: QuickActionsSection(),
                  ),

                  // State-based content
                  ...state.when(
                    initial: () => [],
                    loading: () => [_buildLoadingSection(context)],
                    loaded: (data) => [_buildRecentDataSection(context, data)],
                    error: (message) => [_buildErrorSection(context, message)],
                    subscriptionRequired: (message, redirectUrl) => [
                      _buildSubscriptionRequiredSection(
                        context,
                        message,
                        redirectUrl,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRecentDataSection(BuildContext context, DashboardData data) {
    return Padding(
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
                              product.product?.name ?? 'منتج غير محدد',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              '${S.of(context).quantity}: ${product.totalQuantity.toStringAsFixed(0)}',
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
    );
  }

  Widget _buildLoadingSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 16.h),
            Text(
              S.of(context).loading,
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorSection(BuildContext context, String message) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 48.sp,
              color: Theme.of(context).colorScheme.error,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                context.read<DashboardCubit>().loadDashboard();
              },
              child: Text(S.of(context).retry),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionRequiredSection(
    BuildContext context,
    String message,
    String? redirectUrl,
  ) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.card_membership, size: 48.sp, color: Colors.orange[800]),
            SizedBox(height: 16.h),
            Text(
              'اختيار الباقة مطلوب',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: redirectUrl != null
                  ? () async {
                      // فتح رابط اختيار الباقة في المتصفح
                      final uri = Uri.parse(redirectUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        // إظهار رسالة خطأ إذا لم يتمكن من فتح الرابط
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('لا يمكن فتح رابط الباقة'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  : null,
              icon: Icon(Icons.card_membership),
              label: Text('اختيار الباقة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
