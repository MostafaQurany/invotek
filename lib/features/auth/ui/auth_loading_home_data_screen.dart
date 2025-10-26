import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/home/cubit/dashboard_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class AuthLoadingHomeDataScreen extends StatelessWidget {
  final DashboardState dashboardState;

  const AuthLoadingHomeDataScreen({super.key, required this.dashboardState});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image(
              image: AssetImage(AppImages.logoGreen),
              width: 0.4.sw,
              height: 0.2.sh,
            ),
            SizedBox(height: 40.h),

            // Loading indicator
            CircularProgressIndicator(
              color: colorScheme.primary,
              strokeWidth: 3,
            ),
            SizedBox(height: 20.h),

            // Loading text based on dashboard state
            Text(
              _getLoadingText(),
              style: TextStyle(
                fontSize: 16.sp,
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),

            // Progress steps
            _buildProgressSteps(context),
          ],
        ),
      ),
    );
  }

  String _getLoadingText() {
    return dashboardState.when(
      initial: () => S.current.loading,
      loading: () => 'Loading dashboard data...',
      loaded: (data) => 'Loading complete!',
      error: (message) => 'Loading error',
      subscriptionRequired: (message, redirectUrl) => 'Subscription required',
    );
  }

  Widget _buildProgressSteps(BuildContext context) {
    return Column(
      children: [
        _buildStep(
          context,
          'Loading dashboard data...',
          dashboardState.when(
            initial: () => false,
            loading: () => true,
            loaded: (data) => true,
            error: (message) => false,
            subscriptionRequired: (message, redirectUrl) => false,
          ),
        ),
        SizedBox(height: 8.h),
        _buildStep(
          context,
          'Loading statistics...',
          dashboardState.when(
            initial: () => false,
            loading: () => false,
            loaded: (data) => true,
            error: (message) => false,
            subscriptionRequired: (message, redirectUrl) => false,
          ),
        ),
        SizedBox(height: 8.h),
        _buildStep(
          context,
          'Preparing home screen...',
          dashboardState.when(
            initial: () => false,
            loading: () => false,
            loaded: (data) => true,
            error: (message) => false,
            subscriptionRequired: (message, redirectUrl) => false,
          ),
        ),
      ],
    );
  }

  Widget _buildStep(BuildContext context, String text, bool completed) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.green : colorScheme.onSurfaceVariant,
          size: 16.sp,
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: completed ? Colors.green : colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
