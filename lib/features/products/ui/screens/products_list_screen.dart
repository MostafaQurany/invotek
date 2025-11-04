import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';
import 'package:invotek/features/products/domain/cubit/categories_cubit.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_options_bottom_sheet.dart';
import 'package:invotek/features/products/ui/widgets/cards/products_header_widget.dart';
import 'package:invotek/features/products/ui/widgets/dialogs/delete_product_dialog.dart';
import 'package:invotek/features/products/ui/widgets/lists/products_state_builder.dart';
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
  Timer? _debounceTimer;
  bool _isLoadingNextPage = false;

  @override
  void initState() {
    super.initState();
    _initializeOptions();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProductsCubit.get(context).loadFirstPage(refresh: true);
      CategoriesCubit.get(context).loadFirstPage(refresh: true);
    });
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
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    final pixels = position.pixels;
    final maxScrollExtent = position.maxScrollExtent;

    // Check if we're near the bottom (within 400 pixels)
    if (maxScrollExtent > 0 && pixels >= maxScrollExtent - 400) {
      // Don't depend on state - use direct cubit access and local flag
      if (!_isLoadingNextPage && mounted) {
        final cubit = context.read<ProductsCubit>();

        // Check if loading or has more pages by accessing cubit properties directly
        if (!cubit.isLoadingPage) {
          final currentPage = cubit.currentPage;
          final totalPages = cubit.totalPages;

          // Check if there are more pages without relying on state
          if (currentPage < totalPages) {
            _isLoadingNextPage = true;
            cubit
                .loadNextPage()
                .then((_) {
                  if (mounted) {
                    _isLoadingNextPage = false;
                  }
                })
                .catchError((error) {
                  if (mounted) {
                    _isLoadingNextPage = false;
                  }
                });
          }
        }
      }
    }
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _loadWithAllFilters(search: query.isEmpty ? null : query);
    });
  }

  void _loadWithAllFilters({String? search}) {
    try {
      final cubit = ProductsCubit.get(context);
      if (!cubit.isClosed) {
        cubit.loadFirstPage(
          refresh: true,
          search:
              search ??
              (_searchController.text.isEmpty ? null : _searchController.text),
          category: _selectedCategory == 'all' ? null : _selectedCategory,
          status: _selectedStatus == 'all' ? null : _selectedStatus,
        );
      }
    } catch (e) {
      print('❌ Error loading filters: $e');
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
            try {
              final productsCubit = ProductsCubit.get(context);
              final categoriesCubit = CategoriesCubit.get(context);
              if (!productsCubit.isClosed) {
                await productsCubit.loadFirstPage(refresh: true);
              }
              if (!categoriesCubit.isClosed) {
                await categoriesCubit.loadFirstPage(refresh: true);
              }
            } catch (e) {
              print('❌ Error refreshing: $e');
            }
          },
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.r),
                      topRight: Radius.circular(28.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.r),
                      topRight: Radius.circular(28.r),
                    ),
                    child: ProductsStateBuilder(
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
                      scrollController: _scrollController,
                    ),
                  ),
                ),
              ),
            ],
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
      onSearchChanged: _onSearchChanged,
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
      }
    }
  }

  void _onCategoryChanged(String? category) {
    setState(() => _selectedCategory = category);
    _loadWithAllFilters();
  }

  void _onStatusChanged(String? status) {
    setState(() => _selectedStatus = status);
    _loadWithAllFilters();
  }

  void _retry() {
    _loadWithAllFilters();
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
