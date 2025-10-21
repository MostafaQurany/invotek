import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class CategoryDropdown extends StatelessWidget {
  final String? selectedCategoryId;
  final Function(String?) onChanged;
  final String? errorText;

  const CategoryDropdown({
    super.key,
    required this.selectedCategoryId,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, catState) {
        final bool isLoading = catState.maybeWhen(
          loading: (_, __, ___, ____) => true,
          orElse: () => false,
        );

        final categories = catState.when(
          initial: (categories, currentPage, totalPages, error) => categories,
          loading: (categories, currentPage, totalPages, message) => categories,
          loaded: (categories, currentPage, totalPages) => categories,
          createSuccess: (categories, created, currentPage, totalPages) =>
              categories,
          updateSuccess: (categories, updated, currentPage, totalPages) =>
              categories,
          deleteSuccess: (categories, deletedId, currentPage, totalPages) =>
              categories,
          failure: (categories, currentPage, totalPages, error) => categories,
        );

        if (isLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    s.category,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '*',
                    style: TextStyle(
                      color: AppColors.error,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        }

        final items = <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: null,
            child: Text(s.category, overflow: TextOverflow.ellipsis),
          ),
        ];
        items.addAll(
          categories.map(
            (c) => DropdownMenuItem<String>(
              value: c.id.toString(),
              child: Text(c.name, overflow: TextOverflow.ellipsis),
            ),
          ),
        );

        final String? effectiveValue =
            items.where((item) => item.value == selectedCategoryId).isNotEmpty
            ? selectedCategoryId
            : null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  s.category,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  '*',
                  style: TextStyle(
                    color: AppColors.error,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            DropdownButtonFormField<String>(
              initialValue: effectiveValue,
              isExpanded: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.category_outlined,
                  color: AppColors.textSecondary,
                  size: 20.sp,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.grey.withOpacity(0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.grey.withOpacity(0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.error, width: 2),
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                errorText: errorText,
              ),
              items: items,
              onChanged: onChanged,
            ),
          ],
        );
      },
    );
  }
}
