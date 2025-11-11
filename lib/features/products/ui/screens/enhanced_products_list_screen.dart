import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_extended_fab.dart';
import 'package:invotek/core/widgets/common_filter_row.dart';
import 'package:invotek/core/widgets/common_search_bar.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/cards/enhanced_product_card.dart';
import 'package:invotek/features/products/ui/widgets/dialogs/delete_product_dialog.dart';

class EnhancedProductsListScreen extends StatefulWidget {
  const EnhancedProductsListScreen({super.key});

  @override
  State<EnhancedProductsListScreen> createState() =>
      _EnhancedProductsListScreenState();
}

class _EnhancedProductsListScreenState
    extends State<EnhancedProductsListScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'all_category';
  String _selectedStatus = 'all_status';

  @override
  void initState() {
    super.initState();
    // Load products when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsCubit>().loadFirstPage();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final canPop = Navigator.of(context).canPop();
          if (canPop) {
            // السماح بالرجوع العادي بدون dialog
            Navigator.of(context).pop();
          } else {
            // فتح zoomDrawer والانتقال إلى home
            try {
              final zoomDrawer = ZoomDrawer.of(context);
              if (zoomDrawer != null) {
                // إغلاق zoomDrawer إذا كان مفتوحاً
                if (zoomDrawer.isOpen()) {
                  zoomDrawer.close();
                }
                // الانتقال إلى home باستخدام NavigationCubit
                context.read<NavigationCubit>().navigateToRoute(AppRoutes.homeRoute);
              } else {
                // Fallback: الانتقال إلى home مباشرة
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              }
            } catch (e) {
              // Fallback: الانتقال إلى home مباشرة
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            }
          }
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Column(
        children: [
          // Search Bar
          CommonSearchBar(
            controller: _searchController,
            hintText: 'Search products...',
            onChanged: _onSearchChanged,
          ),

          // Filter Row
          CommonFilterRow(
            filters: [
              FilterConfig(
                label: 'Category',
                selectedValue: _selectedCategory,
                options: [
                  FilterOption(value: 'all_category', label: 'All'),
                  // Add category options from cubit
                ],
                onChanged: _onCategoryChanged,
              ),
              FilterConfig(
                label: 'Status',
                selectedValue: _selectedStatus,
                options: [
                  FilterOption(value: 'all_status', label: 'All'),
                  FilterOption(value: 'active', label: 'Active'),
                  FilterOption(value: 'inactive', label: 'Inactive'),
                ],
                onChanged: _onStatusChanged,
              ),
            ],
          ),

          // Products List
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                return state.when(
                  initial:
                      (
                        products,
                        selectedProduct,
                        currentPage,
                        totalPages,
                        error,
                      ) => _buildEmptyState(),
                  loading:
                      (
                        products,
                        selectedProduct,
                        currentPage,
                        totalPages,
                        message,
                      ) => _buildLoadingState(),
                  loaded:
                      (products, selectedProduct, currentPage, totalPages) =>
                          _buildProductsList(products),
                  failure:
                      (
                        products,
                        selectedProduct,
                        currentPage,
                        totalPages,
                        error,
                      ) => _buildErrorState(error.message),
                  createSuccess: (products, _, __, ___, ____) =>
                      _buildProductsList(products),
                  updateSuccess: (products, _, __, ___, ____) =>
                      _buildProductsList(products),
                  deleteSuccess: (products, _, __, ___, ____) =>
                      _buildProductsList(products),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: CommonExtendedFAB(
        label: 'Add New Product',
        icon: Icons.add,
        onPressed: _addProduct,
      ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => ZoomDrawer.of(context)?.toggle(),
        icon: Icon(Icons.menu, size: 24.sp),
      ),
      title: Text(
        'Products List',
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(
          onPressed: _addProduct,
          icon: Icon(Icons.add, size: 24.sp),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 80.sp,
            color: AppColors.greyDark,
          ),
          SizedBox(height: 16.h),
          Text(
            'No products yet',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Add your first product to get started',
            style: TextStyle(fontSize: 14.sp, color: AppColors.greyDark),
          ),
          SizedBox(height: 24.h),
          ElevatedButton.icon(
            onPressed: _addProduct,
            icon: Icon(Icons.add),
            label: Text('Add Product'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(child: CircularProgressIndicator(color: AppColors.primary));
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 80.sp, color: AppColors.error),
          SizedBox(height: 16.h),
          Text(
            'Error loading products',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            error,
            style: TextStyle(fontSize: 14.sp, color: AppColors.greyDark),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton.icon(
            onPressed: () => context.read<ProductsCubit>().loadFirstPage(),
            icon: Icon(Icons.refresh),
            label: Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsList(List<ProductModel> products) {
    if (products.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductsCubit>().loadFirstPage();
      },
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 80.h), // Space for FAB
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return EnhancedProductCard(
            product: product,
            onTap: () => _navigateToProductDetails(product),
            onEdit: () => _editProduct(product),
            onDelete: () => _showDeleteConfirmation(product),
          );
        },
      ),
    );
  }

  // Event Handlers
  void _onSearchChanged(String query) {
    // Implement search logic
    context.read<ProductsCubit>().loadFirstPage(search: query);
  }

  void _onCategoryChanged(String? category) {
    setState(() {
      _selectedCategory = category ?? 'all_category';
    });
    // Implement category filtering
  }

  void _onStatusChanged(String? status) {
    setState(() {
      _selectedStatus = status ?? 'all_status';
    });
    // Implement status filtering
  }

  void _addProduct() {
    Navigator.pushNamed(context, AppRoutes.addProductRoute);
  }

  void _navigateToProductDetails(ProductModel product) {
    Navigator.pushNamed(
      context,
      AppRoutes.productDetailsRoute,
      arguments: product,
    ).then((result) {
      if (result == 'deleted') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product deleted successfully'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    });
  }

  void _editProduct(ProductModel product) {
    Navigator.pushNamed(
      context,
      AppRoutes.editProductRoute,
      arguments: product,
    );
  }

  void _showDeleteConfirmation(ProductModel product) {
    final productsCubit = context.read<ProductsCubit>();
    showDialog(
      context: context,
      builder: (context) => DeleteProductDialog(
        product: product,
        onConfirm: () {
          productsCubit.deleteProduct(product.id ?? 0);
        },
      ),
    );
  }
}
