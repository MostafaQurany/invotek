import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/widgets/common_menu_button.dart';

class UsersAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback? onNotificationPressed;

  const UsersAppBarWidget({
    super.key,
    required this.onMenuPressed,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      toolbarHeight: 70.h,
      leading: const CommonMenuButton(),
      title: Image(image: AssetImage(AppImages.logoGreen), height: 34.h),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: AppColors.primary,
            size: 20.sp,
          ),
          onPressed: onNotificationPressed,
        ),
        SizedBox(width: 4.w),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
