import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';

class CommonMenuButton extends StatelessWidget {
  final Color? color;
  const CommonMenuButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)?.toggle();
      },
      icon: Icon(Icons.menu, color: color ?? AppColors.white, size: 24),
    );
  }
}
