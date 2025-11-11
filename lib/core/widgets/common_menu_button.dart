import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';

class CommonMenuButton extends StatelessWidget {
  final Color? color;
  const CommonMenuButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        try {
          final zoomDrawer = ZoomDrawer.of(context);
          if (zoomDrawer != null) {
            zoomDrawer.toggle();
          } else {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pushReplacementNamed('/home');
            }
          }
        } catch (e) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }
      },
      icon: Icon(
        (ZoomDrawer.of(context) != null)
            ? Icons.menu
            : Icons.arrow_back_ios_new_rounded,
        color: color ?? AppColors.white,
        size: 24.sp,
      ),
    );
  }
}
