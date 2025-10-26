import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class HomeDashboardSectionShortcut extends StatefulWidget {
  final String title;
  final IconData icon;
  final String route;
  final int index;
  final String permissionKey;

  const HomeDashboardSectionShortcut({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
    required this.index,
    required this.permissionKey,
  });

  @override
  State<HomeDashboardSectionShortcut> createState() =>
      _HomeDashboardSectionShortcutState();
}

class _HomeDashboardSectionShortcutState
    extends State<HomeDashboardSectionShortcut>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    // Start animation with delay based on index
    Future.delayed(Duration(milliseconds: widget.index * 50), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    final permissionsCubit = context.read<PermissionsCubit>();
    final hasPermission = permissionsCubit.hasPermission(widget.permissionKey);
    
    if (hasPermission) {
      context.read<NavigationCubit>().navigateToRoute(widget.route);
    } else {
      _showPermissionDeniedSnackBar();
    }
  }

  void _showPermissionDeniedSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.lock_outline, color: AppColors.white),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).accessDenied,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    S.of(context).noPermissionMessage(widget.title),
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: GestureDetector(
              onTap: _onTap,
              child: BlocBuilder<PermissionsCubit, PermissionsState>(
                builder: (context, state) {
                  final hasPermission = state.maybeWhen(
                    loaded: (permissions) => permissions.hasPermission(widget.permissionKey),
                    orElse: () => true, // افتراضياً نعرض العنصر
                  );
                  
                  return Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: hasPermission 
                          ? AppColors.primary 
                          : AppColors.primary.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 12.w,
                          top: 12.h,
                          child: Transform.rotate(
                            angle: 0.5236, // 30 degrees in radians
                            child: Icon(
                              widget.icon,
                              color: hasPermission 
                                  ? AppColors.white.withValues(alpha: 0.3)
                                  : AppColors.white.withValues(alpha: 0.2),
                              size: 40.sp,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              color: hasPermission 
                                  ? AppColors.white 
                                  : AppColors.white.withValues(alpha: 0.8),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // أيقونة القفل
                        if (!hasPermission)
                          Positioned(
                            top: 8.h,
                            right: 8.w,
                            child: Icon(
                              Icons.lock_outline,
                              color: AppColors.white.withValues(alpha: 0.8),
                              size: 16.sp,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
