import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/widgets/exit_confirmation_dialog.dart';
import 'package:invotek/features/home/constants/home_permissions.dart';
import 'package:invotek/features/home/cubit/dashboard_cubit.dart';
import 'package:invotek/features/home/ui/widgets/home_dashboard_section.dart';
import 'package:invotek/features/home/ui/widgets/home_error_section.dart';
import 'package:invotek/features/home/ui/widgets/home_loading_section.dart';
import 'package:invotek/features/home/ui/widgets/home_subscription_required_section.dart';
import 'package:invotek/features/home/ui/widgets/home_welcome_header.dart';
import 'package:invotek/features/home/ui/widgets/quick_actions_section.dart';
import 'package:invotek/features/home/ui/widgets/top_products_section.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_cubit.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_state.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
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
    context.read<DashboardCubit>().loadDashboard();
    context.read<TaxIntegrationCubit>().loadStatus();
    _loadUserPermissions();
    // Load notification stats
    if (mounted) {
      getIt<NotificationsCubit>().loadNotificationStats();
    }
  }

  Future<void> _loadUserPermissions() async {
    final userData = StorageService.getUserData();
    if (userData?.roleId != null) {
      // جلب الصلاحيات مباشرة من السيرفر بدون cache
      context.read<PermissionsCubit>().loadPermissions(userData!.roleId!);
    } else {
      // إذا لم يكن هناك roleId، نستخدم صلاحيات كاملة للعرض
      context.read<PermissionsCubit>().loadCachedPermissions();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final userData = StorageService.getUserData();
    final companyLogo = userData?.user?.company?.logo;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final canPop = Navigator.of(context).canPop();
          if (canPop) {
            // السماح بالرجوع العادي بدون dialog
            Navigator.of(context).pop();
          } else {
            // السؤال عن إغلاق التطبيق فقط عندما لا توجد شاشات سابقة
            final shouldExit = await ExitConfirmationDialog.show(context);
            if (shouldExit == true) {
              SystemNavigator.pop();
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          elevation: 0,
          scrolledUnderElevation: 1,
          leadingWidth: 110.w,
          leading: Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w),
            child: _buildCompanyLogo(companyLogo),
          ),
          actions: [
            // Notifications Button with Badge
            BlocProvider.value(
              value: getIt<NotificationsCubit>(),
              child: BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  final unreadCount = _getUnreadCount(state);
                  return _buildNotificationsButton(
                    context,
                    unreadCount,
                    colorScheme,
                  );
                },
              ),
            ),
            IconButton(
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: Icon(Icons.menu, color: colorScheme.onSurface, size: 24.sp),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<PermissionsCubit, PermissionsState>(
            builder: (context, permissionsState) {
              return permissionsState.when(
                initial: () {
                  // أثناء التحميل الأولي، نحاول تحميل الصلاحيات من السيرفر
                  Future.microtask(() {
                    final userData = StorageService.getUserData();
                    if (userData?.roleId != null) {
                      // جلب الصلاحيات مباشرة من السيرفر بدون cache
                      context.read<PermissionsCubit>().loadPermissions(
                        userData!.roleId!,
                      );
                    } else {
                      // إذا لم يكن هناك roleId، نستخدم صلاحيات كاملة للعرض
                      context.read<PermissionsCubit>().loadCachedPermissions();
                    }
                  });
                  return const Center(child: CircularProgressIndicator());
                },
                loading: () {
                  // أثناء التحميل، نعرض loading
                  return const Center(child: CircularProgressIndicator());
                },
                loaded: (permissions) {
                  // بعد تحميل الصلاحيات، نتحقق من الصلاحية
                  final hasViewPermission = permissions.hasPermission(
                    HomePermissions.view,
                  );

                  if (!hasViewPermission) {
                    final colorScheme = Theme.of(context).colorScheme;
                    final s = S.of(context);
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_outline,
                              size: 64.sp,
                              color: colorScheme.error,
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              s.homeNoPermissionToView,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              s.homeNoPermissionToAct,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // إذا كانت الصلاحية موجودة، نعرض المحتوى
                  return BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                TopProductsSection(
                                  topProducts: data.topProducts,
                                ),
                              ],
                              error: (message) => [
                                HomeErrorSection(
                                  message: message,
                                  onRetry: () {
                                    context
                                        .read<DashboardCubit>()
                                        .loadDashboard();
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
                  );
                },
                error: (errorMessage) {
                  // في حالة الخطأ، نستخدم صلاحيات كاملة للعرض ونعرض المحتوى عاديًا
                  return BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                TopProductsSection(
                                  topProducts: data.topProducts,
                                ),
                              ],
                              error: (message) => [
                                HomeErrorSection(
                                  message: message,
                                  onRetry: () {
                                    context
                                        .read<DashboardCubit>()
                                        .loadDashboard();
                                  },
                                ),
                              ],
                              subscriptionRequired: (message, redirectUrl) => [
                                // نعرض رسالة الاشتراك في الأسفل
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
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  int _getUnreadCount(NotificationsState state) {
    return state.maybeWhen(
      statsLoaded:
          (
            notifications,
            selectedNotification,
            currentPage,
            totalPages,
            stats,
          ) => stats.unread ?? 0,
      loaded:
          (
            notifications,
            selectedNotification,
            currentPage,
            totalPages,
            stats,
          ) => stats?.unread ?? 0,
      markAsReadSuccess:
          (
            notifications,
            notificationId,
            selectedNotification,
            currentPage,
            totalPages,
            stats,
          ) => stats?.unread ?? 0,
      markAllAsReadSuccess:
          (
            notifications,
            selectedNotification,
            currentPage,
            totalPages,
            stats,
          ) => stats?.unread ?? 0,
      deleteSuccess:
          (
            notifications,
            deletedId,
            selectedNotification,
            currentPage,
            totalPages,
            stats,
          ) => stats?.unread ?? 0,
      clearReadSuccess:
          (
            notifications,
            selectedNotification,
            currentPage,
            totalPages,
            stats,
          ) => stats?.unread ?? 0,
      orElse: () => 0,
    );
  }

  Widget _buildNotificationsButton(
    BuildContext context,
    int unreadCount,
    ColorScheme colorScheme,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.notificationsListRoute);
          },
          icon: Icon(
            unreadCount > 0
                ? Icons.notifications_active
                : Icons.notifications_outlined,
            color: AppColors.primary,
            size: 24.sp,
          ),
          tooltip: S.of(context).notifications,
        ),
        if (unreadCount > 0)
          Positioned(
            right: 6.w,
            top: 6.h,
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.surface, width: 2),
              ),
              constraints: BoxConstraints(minWidth: 16.w, minHeight: 16.h),
              child: Center(
                child: Text(
                  unreadCount > 99 ? '99+' : unreadCount.toString(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCompanyLogo(dynamic logoUrl) {
    // إذا كان logo موجود وليس null وليس فارغ
    if (logoUrl != null && logoUrl.toString().trim().isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: logoUrl.toString(),
        height: 40.h,
        fit: BoxFit.contain,
        placeholder: (context, url) =>
            Image(image: AssetImage(AppImages.logoGreen), height: 40.h),
        errorWidget: (context, url, error) =>
            Image(image: AssetImage(AppImages.logoGreen), height: 40.h),
      );
    }

    // إذا لم يكن هناك logo، استخدم الشعار الافتراضي
    return Image(image: AssetImage(AppImages.logoGreen), height: 40.h);
  }
}
