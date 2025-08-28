import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/home/demo/cubit/menu_cubit.dart';
import 'package:invotek/features/home/ui/home_screen.dart';
import 'package:invotek/features/home/ui/widgets/menu_screen.dart';

class HomeScreenWithDrawer extends StatelessWidget {
  const HomeScreenWithDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(),
      child: ZoomDrawer(
        controller: ZoomDrawerController(),
        menuScreen: const MenuScreen(),
        mainScreen: const HomeScreenWithAppBar(),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        slideWidth: MediaQuery.of(context).size.width * 0.85,
        menuBackgroundColor: AppColors.primary,
        duration: const Duration(milliseconds: 275),
        mainScreenScale: 0.3,
        mainScreenTapClose: true,
      ),
    );
  }
}

class HomeScreenWithAppBar extends StatelessWidget {
  const HomeScreenWithAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.primary, size: 24.sp),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        title: Row(
          children: [
            Image(image: AssetImage(AppImages.logoGreen), height: 40.h),
            SizedBox(width: 10.w),
            Text(
              'Invotek',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: AppColors.primary,
              size: 24.sp,
            ),
            onPressed: () {
              // TODO: إضافة الإشعارات
            },
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: const HomeScreen(),
    );
  }
}
