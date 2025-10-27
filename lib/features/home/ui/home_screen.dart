import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/home/cubit/dashboard_cubit.dart';
import 'package:invotek/features/home/ui/widgets/home_dashboard_section.dart';
import 'package:invotek/features/home/ui/widgets/home_error_section.dart';
import 'package:invotek/features/home/ui/widgets/home_loading_section.dart';
import 'package:invotek/features/home/ui/widgets/home_subscription_required_section.dart';
import 'package:invotek/features/home/ui/widgets/home_welcome_header.dart';
import 'package:invotek/features/home/ui/widgets/quick_actions_section.dart';
import 'package:invotek/features/home/ui/widgets/top_products_section.dart';

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
                  HomeWelcomeHeader(),

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
                    loading: () => [HomeLoadingSection()],
                    loaded: (data) => [
                      TopProductsSection(topProducts: data.topProducts),
                    ],
                    error: (message) => [
                      HomeErrorSection(
                        message: message,
                        onRetry: () {
                          context.read<DashboardCubit>().loadDashboard();
                        },
                      ),
                    ],
                    subscriptionRequired: (message, redirectUrl) => [
                      HomeSubscriptionRequiredSection(
                        message: message,
                        redirectUrl: redirectUrl,
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
}
