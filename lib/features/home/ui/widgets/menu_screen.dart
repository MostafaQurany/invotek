import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/home/data/models/menu_item.dart';
import 'package:invotek/features/home/data/models/navigation_state.dart';
import 'package:invotek/generated/l10n.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildMenuItems()),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40.sp, color: AppColors.primary),
          ),
          SizedBox(height: 10.h),
          Text(
            'Invotek',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, navigationState) {
        return ListView.builder(
          itemCount: navigationState.menuItems.length,
          itemBuilder: (context, index) {
            final item = navigationState.menuItems[index];
            return _buildMenuItem(item, index, navigationState);
          },
        );
      },
    );
  }

  Widget _buildMenuItem(MenuItem item, int index, NavigationState state) {
    final isSelected = state.selectedIndex == index;
    final isExpanded = state.expandedItemIndex == index;

    return Column(
      children: [
        ListTile(
          leading: Icon(item.icon, color: Colors.white, size: 24.sp),
          title: Text(
            item.getLocalizedTitle(S.of(context)),
            style: TextStyle(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.normal,
              fontSize: isSelected ? 16.sp : 14.sp,
            ),
          ),
          trailing: item.hasSubItems
              ? Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                  size: 24.sp,
                )
              : null,
          onTap: () => _onMenuItemTap(item, index),
        ),
        if (item.hasSubItems && isExpanded)
          _buildSubMenuItems(item.subItems, index, state),
      ],
    );
  }

  Widget _buildSubMenuItems(
    List<MenuItem> subItems,
    int parentIndex,
    NavigationState state,
  ) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      child: Column(
        children: subItems.asMap().entries.map((entry) {
          final subIndex = entry.key;
          final subItem = entry.value;
          final isSubSelected =
              state.selectedIndex == parentIndex &&
              state.selectedSubIndex == subIndex;

          return ListTile(
            leading: Icon(
              subItem.icon,
              color: isSubSelected ? Colors.white : Colors.white70,
              size: 20.sp,
            ),
            title: Text(
              subItem.getLocalizedTitle(S.of(context)),
              style: TextStyle(
                color: isSubSelected ? Colors.white : Colors.white70,
                fontWeight: isSubSelected ? FontWeight.w500 : FontWeight.normal,
                fontSize: isSubSelected ? 14.sp : 12.sp,
              ),
            ),
            onTap: () => _onSubMenuItemTap(subItem, parentIndex, subIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Divider(color: Colors.white.withOpacity(0.3)),
          SizedBox(height: 10.h),

          // زر تسجيل الخروج
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white, size: 24.sp),
            title: Text(
              S.of(context).logout,
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            onTap: _showLogoutDialog,
          ),

          SizedBox(height: 10.h),
          Text(
            S.of(context).homeVersion('1.0.0'),
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  void _onMenuItemTap(MenuItem item, int index) {
    if (item.hasSubItems) {
      // إذا كان العنصر موسع، أغلق القائمة الفرعية
      // إذا كان مغلق، افتح القائمة الفرعية
      context.read<NavigationCubit>().expandMenuItem(index);
    } else {
      // التحقق من الصلاحية قبل التنقل
      if (item.permissionKey != null) {
        final hasPermission = context.read<PermissionsCubit>().hasPermission(
          item.permissionKey!,
        );

        if (!hasPermission && !item.route.contains(AppRoutes.homeRoute)) {
          _showPermissionDeniedSnackBar(item.getLocalizedTitle(S.of(context)));
          return;
        }
      }

      // إغلاق جميع العناصر الموسعة عند التنقل
      context.read<NavigationCubit>().collapseAllItems();
      _navigateToScreen(item.route, index);
    }
  }

  void _onSubMenuItemTap(MenuItem subItem, int parentIndex, int subIndex) {
    // التحقق من الصلاحية قبل التنقل
    if (subItem.permissionKey != null) {
      final hasPermission = context.read<PermissionsCubit>().hasPermission(
        subItem.permissionKey!,
      );
      if (!hasPermission) {
        _showPermissionDeniedSnackBar(subItem.getLocalizedTitle(S.of(context)));
        return;
      }
    }

    _navigateToScreen(subItem.route, parentIndex, subIndex);
  }

  void _navigateToScreen(String route, int index, [int? subIndex]) {
    // تحديث حالة التنقل
    context.read<NavigationCubit>().setSelectedMenuItem(
      index,
      subIndex: subIndex,
    );
    context.read<NavigationCubit>().navigateToRoute(route);

    // إغلاق الدرج
    ZoomDrawer.of(context)?.close();
  }

  void _showPermissionDeniedSnackBar(String featureName) {
    final s = S.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.lock_outline, color: Colors.white, size: 24.sp),
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

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(S.of(context).logout),
          content: Text(S.of(context).homeAreYouSureLogout),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _performLogout();
              },
              child: Text(
                S.of(context).logout,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _performLogout() async {
    // حذف التوكن وبيانات المستخدم من التخزين المحلي
    await context.read<AuthCubit>().logout();

    // التنقل إلى شاشة تسجيل الدخول وحذف جميع الشاشات السابقة
    if (mounted) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(AppRoutes.authRoute, (route) => false);
    }
  }
}
