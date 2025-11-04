import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class ProductSelectionDialog extends StatefulWidget {
  final ProductModel? selectedProduct;
  final Function(ProductModel) onProductSelected;
  final Function()? onAddNewProduct;

  const ProductSelectionDialog({
    super.key,
    this.selectedProduct,
    required this.onProductSelected,
    this.onAddNewProduct,
  });

  @override
  State<ProductSelectionDialog> createState() => _ProductSelectionDialogState();
}

class _ProductSelectionDialogState extends State<ProductSelectionDialog> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: double.maxFinite,
        height: 600.h,
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Header
            _buildHeader(),
            SizedBox(height: 16.h),

            // Search Bar
            _buildSearchBar(),
            SizedBox(height: 16.h),

            // Products List
            Expanded(
              child: BlocProvider.value(
                value: context.read<ProductsCubit>(),
                child: _buildProductsList(),
              ),
            ),

            // Bottom Actions
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.inventory_2, color: AppColors.primary, size: 24.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            S.of(context).selectProduct,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: AppColors.textSecondary, size: 24.sp),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: S.of(context).searchProducts,
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textSecondary,
          size: 20.sp,
        ),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                onPressed: () {
                  _searchController.clear();
                },
                icon: Icon(
                  Icons.clear,
                  color: AppColors.textSecondary,
                  size: 20.sp,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return state.when(
          initial:
              (products, selectedProduct, currentPage, totalPages, error) =>
                  _buildProductsListContent(products),
          loading:
              (products, selectedProduct, currentPage, totalPages, message) =>
                  _buildLoadingState(),
          loaded: (products, selectedProduct, currentPage, totalPages) =>
              _buildProductsListContent(products),
          createSuccess:
              (products, created, selectedProduct, currentPage, totalPages) =>
                  _buildProductsListContent(products),
          updateSuccess:
              (products, updated, selectedProduct, currentPage, totalPages) =>
                  _buildProductsListContent(products),
          deleteSuccess:
              (products, deletedId, selectedProduct, currentPage, totalPages) =>
                  _buildProductsListContent(products),
          failure:
              (products, selectedProduct, currentPage, totalPages, error) =>
                  _buildErrorState(error.message),
        );
      },
    );
  }

  Widget _buildProductsListContent(List<ProductModel> products) {
    // Filter products based on search query
    final filteredProducts = products.where((product) {
      if (_searchQuery.isEmpty) return true;
      return product.name?.toLowerCase().contains(_searchQuery.toLowerCase()) ==
              true ||
          product.sku?.toLowerCase().contains(_searchQuery.toLowerCase()) ==
              true;
    }).toList();

    if (filteredProducts.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        final isSelected = widget.selectedProduct?.id == product.id;

        return _buildProductItem(product, isSelected);
      },
    );
  }

  Widget _buildProductItem(ProductModel product, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ListTile(
        onTap: () {
          widget.onProductSelected(product);
          Navigator.pop(context);
        },
        leading: CircleAvatar(
          backgroundColor: isSelected
              ? AppColors.primary
              : AppColors.backgroundLight,
          child: Text(
            (product.name?.isNotEmpty == true)
                ? product.name![0].toUpperCase()
                : 'P',
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(
          product.name ?? '',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.sku?.isNotEmpty == true)
              Text(
                'SKU: ${product.sku}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            if (product.price?.isNotEmpty == true)
              Text(
                '${S.of(context).price}: ${product.price}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            if (product.quantity != null)
              Text(
                '${S.of(context).quantity}: ${product.quantity}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: AppColors.primary, size: 24.sp)
            : null,
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.primary),
          SizedBox(height: 16.h),
          Text(
            S.of(context).loadingProducts,
            style: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: AppColors.error, size: 48.sp),
          SizedBox(height: 16.h),
          Text(
            S.of(context).errorLoadingProducts,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            error,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              context.read<ProductsCubit>().loadFirstPage(refresh: true);
            },
            child: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2, color: AppColors.textSecondary, size: 48.sp),
          SizedBox(height: 16.h),
          Text(
            _searchQuery.isEmpty
                ? S.of(context).noProductsFound
                : S.of(context).noProductsMatchSearch,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            _searchQuery.isEmpty
                ? S.of(context).addFirstProduct
                : S.of(context).tryDifferentSearch,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Row(
      children: [
        // Add New Product Button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: widget.onAddNewProduct,
            icon: Icon(Icons.add_box, size: 20.sp),
            label: Text(S.of(context).addNewProduct),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Cancel Button
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textSecondary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: Text(S.of(context).cancel),
          ),
        ),
      ],
    );
  }
}
