import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/home/cubit/dashboard_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class HomeDashboardSectionMain extends StatelessWidget {
  const HomeDashboardSectionMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: _buildCardWithIcon(
                  icon: Icons.receipt_long,
                  title: S.of(context).totalInvoices,
                  value: state.maybeWhen(
                    loaded: (data) => data.invoicesCount.toString(),
                    orElse: () => "0",
                  ),
                ),
              ),
              Flexible(
                child: _buildCardWithIcon(
                  icon: Icons.undo,
                  title: S.of(context).returnedInvoices,
                  value: state.maybeWhen(
                    loaded: (data) => data.returnedInvoicesCount.toString(),
                    orElse: () => "0",
                  ),
                ),
              ),
              Flexible(
                child: _buildCardWithIcon(
                  icon: Icons.inventory,
                  title: S.of(context).productsInStock,
                  value: state.maybeWhen(
                    loaded: (data) => data.productsCount.toString(),
                    orElse: () => "0",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCardWithIcon({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.white.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.white, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
