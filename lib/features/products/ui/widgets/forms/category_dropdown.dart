import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';

import 'package:invotek/generated/l10n.dart';

class CategoryDropdown extends StatelessWidget {
  final String? selectedCategoryId;
  final Function(String?) onChanged;
  final ColorScheme colorScheme;
  final String label;

  const CategoryDropdown({
    super.key,
    required this.selectedCategoryId,
    required this.onChanged,
    required this.colorScheme,
    this.label = 'الفئة',
  });

  @override
  Widget build(BuildContext context) {
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
          return const Center(child: CircularProgressIndicator());
        }

        final items = <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: null,
            child: Text(
              S.of(context).category,
              overflow: TextOverflow.ellipsis,
            ),
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

        return DropdownButtonFormField<String>(
          value: effectiveValue,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            filled: true,
            fillColor: colorScheme.surfaceContainer,
          ),
          items: items,
          onChanged: onChanged,
          isExpanded: true,
        );
      },
    );
  }
}
