import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';
import 'package:invotek/features/products/ui/widgets/cards/products_header_widget.dart';
import 'package:invotek/features/products/ui/widgets/lists/products_state_builder.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_options_bottom_sheet.dart';
import 'package:invotek/features/products/ui/widgets/dialogs/delete_product_dialog.dart';
import 'package:invotek/generated/l10n.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class ProductsListScreenWithProvider extends StatelessWidget {
  const ProductsListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductsListScreen();
  }
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  String? _selectedCategory;
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
    _scrollController.addListener(_onScroll);
  }

  void _initializeOptions() {
    _selectedCategory = 'all';
    _selectedStatus = 'all';
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Load more when user is 200 pixels from the bottom
      final cubit = context.read<ProductsCubit>();
      if (cubit.hasMore) {
        cubit.loadNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<ProductsCubit, ProductsState>(
        listener: (context, state) {
          print('🔄 ProductsListScreen received state: ${state.runtimeType}');
          state.whenOrNull(
            deleteSuccess:
                (
                  products,
                  deletedId,
                  selectedProduct,
                  currentPage,
                  totalPages,
                ) {
                  print(
                    '✅ DeleteSuccess received with ${products.length} products, deletedId: $deletedId',
                  );
                  // Product deleted successfully - UI will update automatically
                  // No need to show SnackBar here as it's handled in the delete confirmation
                },
          );
        },
        child: RefreshIndicator(
          onRefresh: () async {
            ProductsCubit.get(context).loadFirstPage(refresh: true);
            CategoriesCubit.get(context).loadFirstPage(refresh: true);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // Header Widget - Scrolls with content
                BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, categoriesState) {
                    return categoriesState.when(
                      initial: (categories, currentPage, totalPages, error) =>
                          _buildProductsHeader(categories),
                      loading: (categories, currentPage, totalPages, message) =>
                          _buildProductsHeader(categories),
                      loaded: (categories, currentPage, totalPages) =>
                          _buildProductsHeader(categories),
                      createSuccess:
                          (categories, created, currentPage, totalPages) =>
                              _buildProductsHeader(categories),
                      updateSuccess:
                          (categories, updated, currentPage, totalPages) =>
                              _buildProductsHeader(categories),
                      deleteSuccess:
                          (categories, deletedId, currentPage, totalPages) =>
                              _buildProductsHeader(categories),
                      failure: (categories, currentPage, totalPages, error) =>
                          _buildProductsHeader(categories),
                    );
                  },
                ),

                // Products List Content
                ProductsStateBuilder(
                  onProductTap: (product) =>
                      _showProductOptions(context, product),
                  onProductView: _navigateToProductDetails,
                  onProductEdit: _navigateToEditProduct,
                  onProductDelete: _showDeleteConfirmation,
                  onAddProduct: _navigateToAddProduct,
                  onRetry: _retry,
                  selectedCategory: _selectedCategory ?? '',
                  selectedStatus: _selectedStatus ?? '',
                  onCategoryChanged: _onCategoryChanged,
                  onStatusChanged: _onStatusChanged,
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProduct,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(Icons.add, size: 26.sp, color: AppColors.white),
      ),
    );
  }

  // Helper Methods
  Widget _buildProductsHeader(List<ProductCategoryApiModel> categories) {
    return ProductsHeaderWidget(
      onMenuPressed: _handleMenuPressed,
      searchController: _searchController,
      onSearchChanged: (query) {
        // ProductsCubit.get(context).loadFirstPage(
        //   refresh: true,
        //   search: query.isEmpty ? null : query,
        //   category: _selectedCategory == 'all'
        //       ? null
        //       : _selectedCategory,
        //   status: _selectedStatus == 'all'
        //       ? null
        //       : _selectedStatus,
        // );
      },
      selectedCategory: _selectedCategory ?? '',
      selectedStatus: _selectedStatus ?? '',
      onCategoryChanged: _onCategoryChanged,
      onStatusChanged: _onStatusChanged,
      categories: categories,
    );
  }

  // Event Handlers
  void _handleMenuPressed() {
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
        // ProductsCubit.get(context).loadFirstPage(
        //   refresh: true,
        //   search: " query.isEmpty ? null : query",
        //   category: _selectedCategory == 'all' ? null : _selectedCategory,
        //   status: _selectedStatus == 'all' ? null : _selectedStatus,
        // );
      }
    }
  }

  void _onCategoryChanged(String? category) {
    setState(() => _selectedCategory = category);
    // ProductsCubit.get(context).loadFirstPage(
    //   refresh: true,
    //   search: _searchController.text.isEmpty ? null : _searchController.text,
    //   category: _selectedCategory == 'all' ? null : _selectedCategory,
    //   status: _selectedStatus == 'all' ? null : _selectedStatus,
    // );
  }

  void _onStatusChanged(String? status) {
    setState(() => _selectedStatus = status);
    // ProductsCubit.get(context).loadFirstPage(
    //   refresh: true,
    //   search: _searchController.text.isEmpty ? null : _searchController.text,
    //   category: _selectedCategory == 'all' ? null : _selectedCategory,
    //   status: _selectedStatus == 'all' ? null : _selectedStatus,
    // );
  }

  void _retry() {
    //  ProductsCubit.get(context).loadFirstPage(refresh: true);
  }

  // Navigation Methods
  void _navigateToAddProduct() {
    Navigator.pushNamed(context, AppRoutes.addProductRoute);
  }

  void _navigateToProductDetails(ProductModel product) async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.productDetailsRoute,
      arguments: product,
    );

    // Handle deletion result
    if (result == 'deleted' && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).productDeletedSuccessfully),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
    }
  }

  void _navigateToEditProduct(ProductModel product) {
    Navigator.pushNamed(
      context,
      AppRoutes.editProductRoute,
      arguments: product,
    );
  }

  void _showProductOptions(BuildContext context, ProductModel product) {
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
          _showDeleteConfirmation(product);
        },
      ),
    );
  }

  void _showDeleteConfirmation(ProductModel product) {
    // Capture the cubit before showing the dialog
    final productsCubit = ProductsCubit.get(context);

    showDialog(
      context: context,
      builder: (context) => DeleteProductDialog(
        product: product,
        onConfirm: () {
          productsCubit.deleteProduct(product.id ?? 0);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).productDeletedSuccessfully),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );
        },
      ),
    );
  }
}
