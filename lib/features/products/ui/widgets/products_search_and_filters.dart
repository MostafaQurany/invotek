import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';

import '../../../../generated/l10n.dart';

class ProductsSearchAndFilters extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedCategory;
  final String selectedStatus;
  final Function(String) onSearch;
  final Function(String) onCategoryChanged;
  final Function(String) onStatusChanged;
  final ColorScheme colorScheme;

  const ProductsSearchAndFilters({
    super.key,
    required this.searchController,
    required this.selectedCategory,
    required this.selectedStatus,
    required this.onSearch,
    required this.onCategoryChanged,
    required this.onStatusChanged,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildSearchBar(),
          SizedBox(height: 16.h),
          _buildFilters(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return SearchBar(
      controller: searchController,
      hintText: S.current.searchProducts,
      leading: Icon(Icons.search, color: colorScheme.onSurfaceVariant),
      padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16.w)),
      onChanged: onSearch,
    );
  }

  Widget _buildFilters() {
    return Row(
      children: [
        Expanded(child: _buildCategoryFilter()),
        SizedBox(width: 12.w),
        Expanded(child: _buildStatusFilter()),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, _) {
        final _categories = context.read<CategoriesCubit>().categories;
        final items = <DropdownMenuItem<String>>[
          DropdownMenuItem(
            value: 'all',
            child: Text(
              S.current.allCategories,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ];
        items.addAll(
          _categories.map(
            (c) => DropdownMenuItem(
              value: c.id.toString(),
              child: Text(c.name, overflow: TextOverflow.ellipsis),
            ),
          ),
        );
        return DropdownButtonFormField<String>(
          value: items.any((item) => item.value == selectedCategory)
              ? selectedCategory
              : 'all',
          isExpanded: true,
          decoration: InputDecoration(
            labelText: S.current.category,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            filled: true,
            fillColor: colorScheme.surfaceContainer,
          ),
          items: items,
          onChanged: (value) {
            if (value != null) {
              onCategoryChanged(value);
            }
          },
        );
      },
    );
  }

  Widget _buildStatusFilter() {
    return DropdownButtonFormField<String>(
      value: selectedStatus,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: S.current.status,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        filled: true,
        fillColor: colorScheme.surfaceContainer,
      ),
      items: [
        DropdownMenuItem(
          value: 'all',
          child: Text(S.current.allStatuses, overflow: TextOverflow.ellipsis),
        ),
        DropdownMenuItem(
          value: 'active',
          child: Text(S.current.active, overflow: TextOverflow.ellipsis),
        ),
        DropdownMenuItem(
          value: 'inactive',
          child: Text(S.current.inactive, overflow: TextOverflow.ellipsis),
        ),
        DropdownMenuItem(
          value: 'out_of_stock',
          child: Text(S.current.outOfStock, overflow: TextOverflow.ellipsis),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          onStatusChanged(value);
        }
      },
    );
  }
}
