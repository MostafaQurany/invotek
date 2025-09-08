import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/widgets.dart';

import '../../../../generated/l10n.dart';

class ProductsListScreenWithProvider extends StatelessWidget {
  const ProductsListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductsListScreen();
  }
}

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'all';
  String _selectedStatus = 'all';
  final String _selectedBrand = 'all';

  @override
  void initState() {
    super.initState();
    // Products are now loaded at the app level
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    final cubit = context.read<ProductsCubit>();
    if (query.isEmpty &&
        _selectedCategory == 'all' &&
        _selectedStatus == 'all' &&
        _selectedBrand == 'all') {
      cubit.loadFirstPage();
    } else {
      cubit.loadFirstPage(
        search: query.isEmpty ? null : query,
        category: _selectedCategory == 'all' ? null : _selectedCategory,
        status: _selectedStatus == 'all' ? null : _selectedStatus,
      );
    }
  }

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _onSearch(_searchController.text);
  }

  void _onStatusChanged(String status) {
    setState(() {
      _selectedStatus = status;
    });
    _onSearch(_searchController.text);
  }

  void _showProductOptions(BuildContext context, ProductModel product) {
    final productsCubit = context.read<ProductsCubit>();
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      builder: (context) => ProductOptionsBottomSheet(
        product: product,
        onViewDetails: () {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            AppRoutes.productDetailsRoute,
            arguments: product,
          );
        },
        onEdit: () {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            AppRoutes.editProductRoute,
            arguments: product,
          );
        },
        onDelete: () {
          Navigator.pop(context);
          _confirmDeleteProduct(context, product, productsCubit);
        },
      ),
    );
  }

  void _confirmDeleteProduct(
    BuildContext context,
    ProductModel product,
    ProductsCubit cubit,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(S.of(context).deleteConfirmation),
        content: Text(
          S
              .of(context)
              .deleteProductConfirmation(product.name ?? S.of(context).noName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton.tonal(
            onPressed: () {
              Navigator.pop(context);
              cubit.deleteProduct(product.id ?? 0);
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error.withOpacity(0.1),
              foregroundColor: AppColors.error,
            ),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<ProductModel> products,
    bool isLoading,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Search and filters
        ProductsSearchAndFilters(
          searchController: _searchController,
          selectedCategory: _selectedCategory,
          selectedStatus: _selectedStatus,
          onSearch: _onSearch,
          onCategoryChanged: _onCategoryChanged,
          onStatusChanged: _onStatusChanged,
          colorScheme: colorScheme,
        ),
        // Products list
        Expanded(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(color: colorScheme.primary),
                )
              : products.isEmpty
              ? ProductsEmptyState(colorScheme: colorScheme)
              : RefreshIndicator(
                  onRefresh: () async {
                    context.read<ProductsCubit>().loadFirstPage(refresh: true);
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        colorScheme: colorScheme,
                        onTap: () => _showProductOptions(context, product),
                        onEdit: () => Navigator.pushNamed(
                          context,
                          AppRoutes.editProductRoute,
                          arguments: product,
                        ),
                        onDelete: () => _confirmDeleteProduct(
                          context,
                          product,
                          ProductsCubit.get(context),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        title: Text(
          S.of(context).products,
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: colorScheme.onSurface),
          onPressed: () {
            try {
              final zoomDrawer = ZoomDrawer.of(context);
              if (zoomDrawer != null) {
                zoomDrawer.toggle();
              } else {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushReplacementNamed('/home');
                }
              }
            } catch (e) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushReplacementNamed('/home');
              }
            }
          },
        ),
        // actionsPadding: EdgeInsetsDirectional.only(end: 16.w),
        // actions: [
        //   IconButton.filled(
        //     style: IconButton.styleFrom(
        //       backgroundColor: colorScheme.primary,
        //       foregroundColor: colorScheme.onPrimary,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(12.r),
        //       ),
        //     ),
        //     icon: Icon(Icons.add, size: 18.sp),
        //     onPressed: () {
        //       Navigator.pushNamed(context, AppRoutes.addProductRoute);
        //     },
        //   ),
        // ],
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          final messenger = ScaffoldMessenger.of(context);
          state.maybeWhen(
            failure:
                (products, selectedProduct, currentPage, totalPages, error) {
                  messenger.hideCurrentSnackBar();
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text(error),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                  context.read<ProductsCubit>().clearError();
                },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial:
                (products, selectedProduct, currentPage, totalPages, error) =>
                    _buildContent(context, products, false),
            loading:
                (products, selectedProduct, currentPage, totalPages, message) =>
                    _buildContent(context, products, true),
            loaded: (products, selectedProduct, currentPage, totalPages) =>
                _buildContent(context, products, false),
            createSuccess:
                (products, created, selectedProduct, currentPage, totalPages) =>
                    _buildContent(context, products, false),
            updateSuccess:
                (products, updated, selectedProduct, currentPage, totalPages) =>
                    _buildContent(context, products, false),
            deleteSuccess:
                (
                  products,
                  deletedId,
                  selectedProduct,
                  currentPage,
                  totalPages,
                ) => _buildContent(context, products, false),
            failure:
                (products, selectedProduct, currentPage, totalPages, error) =>
                    _buildContent(context, products, false),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addProductRoute);
        },
        icon: Icon(Icons.add, size: 18.sp),
        label: Text(
          S.of(context).addProduct,
          style: TextStyle(fontSize: 12.sp),
        ),
      ),
    );
  }
}
