import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/settings/cubit/company_cubit.dart';
import 'package:invotek/features/settings/ui/screens/company_settings_screen.dart';
import 'package:invotek/generated/l10n.dart';

class CompanyProfileCard extends StatelessWidget {
  const CompanyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocBuilder<CompanyCubit, CompanyState>(
          builder: (context, state) {
            final company = state is CompanyLoaded ? state.company : null;
            final isLoading = state is CompanyLoading;

            return Row(
              children: [
                // Logo
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backgroundLight,
                    border: Border.all(color: AppColors.border),
                    image: company?.logoUrl != null
                        ? DecorationImage(
                            image: NetworkImage('${company!.logoUrl}'),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: company?.logoUrl == null
                      ? Icon(
                          Icons.business,
                          size: 30.sp,
                          color: AppColors.primary,
                        )
                      : null,
                ),
                SizedBox(width: 16.w),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isLoading)
                        Container(
                          width: 120.w,
                          height: 20.h,
                          color: AppColors.backgroundLight,
                        )
                      else
                        Text(
                          company?.name ?? S.of(context).companyName,
                          style: AppTextTheme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      SizedBox(height: 4.h),
                      if (isLoading)
                        Container(
                          width: 80.w,
                          height: 14.h,
                          color: AppColors.backgroundLight,
                        )
                      else
                        Text(
                          company?.email ?? S.of(context).companyEmail,
                          style: AppTextTheme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),

                // Edit Button
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CompanySettingsScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.primary,
                    size: 24.sp,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.backgroundLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
