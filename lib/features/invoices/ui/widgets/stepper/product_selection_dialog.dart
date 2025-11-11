import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class ProductSelectionDialog extends StatefulWidget {
  final ScrollController? scrollController;

  const ProductSelectionDialog({super.key, this.scrollController});

  @override
  State<ProductSelectionDialog> createState() => _ProductSelectionDialogState();
}

class _ProductSelectionDialogState extends State<ProductSelectionDialog> {
  late final ProductsCubit _cubit;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _internalScroll = ScrollController();
  Timer? _debounce;

  ScrollController get _scroll => widget.scrollController ?? _internalScroll;

  @override
  void initState() {
    super.initState();
    _cubit = ProductsCubit(getIt<ProductsRepository>());
    _cubit.loadFirstPage(
      refresh: true,
      status: 'active',
      // ملاحظة: منتجات الكمية 0 يتم إخفاؤها عبر minQuantity=1 إن كانت مدعومة
      // بعض الـ API لدينا تدعم minQuantity، سنمرره عبر usecase عند توفره
      // سنصفّي جانبياً أيضاً احتياطياً
      sortBy: 'created_at',
      sortOrder: 'desc',
    );
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _scroll.removeListener(_onScroll);
    _internalScroll.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent * 0.8 &&
        !_cubit.isLoadingPage) {
      _cubit.loadNextPage();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _cubit.loadFirstPage(
        refresh: true,
        search: value.isEmpty ? null : value,
        status: 'active',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider<ProductsCubit>.value(
      value: _cubit,
      child: Material(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              _buildHeader(context),
              _buildSearchBar(),
              Expanded(child: _buildList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              S.of(context).selectProduct,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: AppColors.searchBarBackground,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TextField(
          controller: _searchController,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: S.of(context).searchProducts,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return state.when(
          initial: (products, selected, currentPage, totalPages, error) =>
              _buildLoading(),
          loading: (products, selected, currentPage, totalPages, message) {
            final filtered = _filterOutOfStock(products);
            return _buildProductsList(filtered, isLoading: true);
          },
          loaded: (products, selectedProduct, currentPage, totalPages) {
            final filtered = _filterOutOfStock(products);
            if (filtered.isEmpty) return _buildEmpty();
            return _buildProductsList(filtered);
          },
          createSuccess:
              (products, created, selected, currentPage, totalPages) =>
                  _buildLoading(),
          updateSuccess:
              (products, updated, selected, currentPage, totalPages) =>
                  _buildLoading(),
          deleteSuccess:
              (products, deletedId, selected, currentPage, totalPages) =>
                  _buildLoading(),
          failure: (products, selected, currentPage, totalPages, failure) =>
              _buildError(failure.message),
        );
      },
    );
  }

  List<ProductModel> _filterOutOfStock(List<ProductModel> products) {
    try {
      return products.where((p) {
        final qty = (p.quantity ?? 0);
        return qty > 0;
      }).toList();
    } catch (_) {
      return products; // احتياطي
    }
  }

  Widget _buildProductsList(
    List<ProductModel> products, {
    bool isLoading = false,
  }) {
    return ListView.builder(
      controller: _scroll,
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      itemCount: products.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < products.length) {
          final product = products[index];
          return _buildProductTile(product);
        }
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildProductTile(ProductModel product) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(0.1),
          child: const Icon(Icons.inventory_2, color: AppColors.primary),
        ),
        title: Text(product.name ?? 'منتج'),
        subtitle: Row(
          children: [
            Icon(
              Icons.price_change,
              size: 16.sp,
              color: AppColors.textSecondary,
            ),
            SizedBox(width: 4.w),
            Text(
              CurrencyFormatter.formatCurrencyString(
                product.price?.toString() ?? '0',
                context,
              ),
            ),
            SizedBox(width: 12.w),
            Icon(Icons.storage, size: 16.sp, color: AppColors.textSecondary),
            SizedBox(width: 4.w),
            Text('${product.quantity ?? 0} ${S.of(context).quantity}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.check_circle, color: AppColors.success),
          onPressed: () => Navigator.pop(context, product),
        ),
        onTap: () => Navigator.pop(context, product),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
  Widget _buildEmpty() => Center(
    child: Padding(
      padding: EdgeInsets.all(24.w),
      child: Text(
        S.of(context).noProductsFound,
        style: TextStyle(color: AppColors.textSecondary),
      ),
    ),
  );
  Widget _buildError(String message) => Center(
    child: Padding(
      padding: EdgeInsets.all(24.w),
      child: Text(message, style: const TextStyle(color: AppColors.error)),
    ),
  );
}
