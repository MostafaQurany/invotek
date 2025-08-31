import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/auth/demo/cubit/auth_cubit.dart';
import 'package:invotek/features/home/data/models/menu_item.dart';
import 'package:invotek/features/home/demo/cubit/menu_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: SafeArea(
            child: Column(
              children: [
                // Header
                _buildHeader(context),

                SizedBox(height: 20.h),

                // Menu Items
                Expanded(child: _buildMenuItems(context, state)),

                // Footer
                _buildFooter(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          // Logo
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Image.asset(AppImages.logoGreen, fit: BoxFit.contain),
            ),
          ),

          SizedBox(height: 15.h),

          // App Name
          Text(
            'Invotek',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 5.h),

          // Subtitle
          Text(
            'نظام إدارة الفواتير',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, MenuState state) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      itemCount: state.menuItems.length,
      itemBuilder: (context, index) {
        final item = state.menuItems[index];
        return _buildMenuItem(context, item, index, state);
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    MenuItem item,
    int index,
    MenuState state,
  ) {
    final isExpanded = state.expandedItemIndex == index;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8.h),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (item.hasSubItems) {
                  context.read<MenuCubit>().toggleExpandedItem(index);
                } else {
                  context.read<MenuCubit>().selectMenuItem(index);
                  ZoomDrawer.of(context)!.close();
                }
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: item.isSelected
                      ? Colors.white.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: item.isSelected
                      ? Border.all(color: Colors.white.withOpacity(0.3))
                      : null,
                ),
                child: Row(
                  children: [
                    // Icon
                    Icon(item.icon, color: Colors.white, size: 20.sp),

                    SizedBox(width: 16.w),

                    // Title
                    Expanded(
                      child: Text(
                        item.getLocalizedTitle(S.of(context)),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: item.isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),

                    // Dropdown Arrow or Selected Indicator
                    if (item.hasSubItems)
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 20.sp,
                      )
                    else if (item.isSelected)
                      Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Sub Items
        if (item.hasSubItems && isExpanded)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Column(
              children: item.subItems.asMap().entries.map((entry) {
                final subIndex = entry.key;
                final subItem = entry.value;
                return _buildSubMenuItem(context, subItem, index, subIndex);
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildSubMenuItem(
    BuildContext context,
    MenuItem subItem,
    int parentIndex,
    int subIndex,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.h, left: 20.w),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.read<MenuCubit>().selectSubMenuItem(parentIndex, subIndex);
            ZoomDrawer.of(context)!.close();
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: subItem.isSelected
                  ? Colors.white.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: subItem.isSelected
                  ? Border.all(color: Colors.white.withOpacity(0.2))
                  : null,
            ),
            child: Row(
              children: [
                // Icon
                Icon(
                  subItem.icon,
                  color: Colors.white.withOpacity(0.8),
                  size: 18.sp,
                ),

                SizedBox(width: 12.w),

                // Title
                Expanded(
                  child: Text(
                    subItem.getLocalizedTitle(S.of(context)),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: subItem.isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),

                // Selected Indicator
                if (subItem.isSelected)
                  Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          // Divider
          Container(height: 1, color: Colors.white.withOpacity(0.2)),

          SizedBox(height: 20.h),

          // Logout Button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                context.read<AuthCubit>().logout();
                ZoomDrawer.of(context)!.close();
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.white, size: 20.sp),

                    SizedBox(width: 16.w),

                    Text(
                      S.of(context).logout,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
