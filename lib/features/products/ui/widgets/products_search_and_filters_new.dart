import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/widgets/generic_search_and_filters.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';
import 'package:invotek/generated/l10n.dart';

/// Products-specific search and filters widget using the generic component
class ProductsSearchAndFilters extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedCategory;
  final String selectedStatus;
  final Function(String) onSearchChanged;
  final Function(String) onCategoryChanged;
  final Function(String) onStatusChanged;
  final VoidCallback? onClearFilters;

  const ProductsSearchAndFilters({
    super.key,
    required this.searchController,
    required this.selectedCategory,
    required this.selectedStatus,
    required this.onSearchChanged,
    required this.onCategoryChanged,
    required this.onStatusChanged,
    this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return GenericSearchAndFilters(
      searchController: searchController,
      searchHintText: s.searchProducts,
      onSearchChanged: onSearchChanged,
      showClearFilters: onClearFilters != null,
      onClearFilters: onClearFilters,
      filters: [
        FilterConfig(
          label: s.category,
          selectedValue: selectedCategory,
          options: _buildCategoryOptions(context),
          onChanged: onCategoryChanged,
        ),
        FilterConfig(
          label: s.status,
          selectedValue: selectedStatus,
          options: [
            FilterOptionExtensions.custom('all_status', s.allStatuses),
            FilterOptionExtensions.status('active', s.active),
            FilterOptionExtensions.status('inactive', s.inactive),
            FilterOptionExtensions.status('out_of_stock', s.outOfStock),
          ],
          onChanged: onStatusChanged,
        ),
      ],
    );
  }

  List<FilterOption> _buildCategoryOptions(BuildContext context) {
    final s = S.of(context);
    final categories = context.read<CategoriesCubit>().categories;

    final options = <FilterOption>[
      FilterOptionExtensions.custom('all_category', s.allCategories),
    ];

    options.addAll(
      categories.map(
        (category) => FilterOptionExtensions.custom(
          category.id.toString(),
          category.name,
        ),
      ),
    );

    return options;
  }
}
