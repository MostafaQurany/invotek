import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/lists/products_list.dart';
import 'package:invotek/features/products/ui/widgets/states/products_empty_state.dart';
import 'package:invotek/features/products/ui/widgets/states/products_error_state.dart';

class ProductsStateBuilder extends StatelessWidget {
  final Function(ProductModel) onProductTap;
  final Function(ProductModel) onProductView;
  final Function(ProductModel) onProductEdit;
  final Function(ProductModel) onProductDelete;
  final VoidCallback onAddProduct;
  final VoidCallback onRetry;
  final String selectedCategory;
  final String selectedStatus;
  final Function(String) onCategoryChanged;
  final Function(String) onStatusChanged;
  final ScrollController? scrollController;

  const ProductsStateBuilder({
    super.key,
    required this.onProductTap,
    required this.onProductView,
    required this.onProductEdit,
    required this.onProductDelete,
    required this.onAddProduct,
    required this.onRetry,
    required this.selectedCategory,
    required this.selectedStatus,
    required this.onCategoryChanged,
    required this.onStatusChanged,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        print(
          '🏗️ ProductsStateBuilder building with state: ${state.runtimeType}',
        );

        return state.when(
          initial: (products, selectedProduct, currentPage, totalPages, error) {
            if (products.isEmpty) {
              return ProductsEmptyState(onAddProduct: onAddProduct);
            }
            return ProductsList(
              products: products,
              onProductTap: onProductTap,
              onProductView: onProductView,
              onProductEdit: onProductEdit,
              onProductDelete: onProductDelete,
              scrollController: scrollController,
              isLoadingMore: false,
            );
          },
          loading:
              (products, selectedProduct, currentPage, totalPages, message) {
                if (products.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return ProductsList(
                  products: products,
                  onProductTap: onProductTap,
                  onProductView: onProductView,
                  onProductEdit: onProductEdit,
                  onProductDelete: onProductDelete,
                  isLoadingMore: message == 'loading_more',
                  scrollController: scrollController,
                );
              },
          loaded: (products, selectedProduct, currentPage, totalPages) {
            if (products.isEmpty) {
              return ProductsEmptyState(onAddProduct: onAddProduct);
            }
            return ProductsList(
              products: products,
              onProductTap: onProductTap,
              onProductView: onProductView,
              onProductEdit: onProductEdit,
              onProductDelete: onProductDelete,
              scrollController: scrollController,
              isLoadingMore: false,
            );
          },
          createSuccess:
              (products, created, selectedProduct, currentPage, totalPages) {
                if (products.isEmpty) {
                  return ProductsEmptyState(onAddProduct: onAddProduct);
                }
                return ProductsList(
                  products: products,
                  onProductTap: onProductTap,
                  onProductView: onProductView,
                  onProductEdit: onProductEdit,
                  onProductDelete: onProductDelete,
                  scrollController: scrollController,
                  isLoadingMore: false,
                );
              },
          updateSuccess:
              (products, updated, selectedProduct, currentPage, totalPages) {
                if (products.isEmpty) {
                  return ProductsEmptyState(onAddProduct: onAddProduct);
                }
                return ProductsList(
                  products: products,
                  onProductTap: onProductTap,
                  onProductView: onProductView,
                  onProductEdit: onProductEdit,
                  scrollController: scrollController,
                  isLoadingMore: false,
                  onProductDelete: onProductDelete,
                );
              },
          deleteSuccess:
              (products, deletedId, selectedProduct, currentPage, totalPages) {
                if (products.isEmpty) {
                  return ProductsEmptyState(onAddProduct: onAddProduct);
                }
                return ProductsList(
                  products: products,
                  onProductTap: onProductTap,
                  onProductView: onProductView,
                  onProductEdit: onProductEdit,
                  onProductDelete: onProductDelete,
                  scrollController: scrollController,
                  isLoadingMore: false,
                );
              },
          failure: (products, selectedProduct, currentPage, totalPages, error) {
            if (products.isEmpty) {
              return ProductsErrorState(error: error.message, onRetry: onRetry);
            }
            return ProductsList(
              products: products,
              onProductTap: onProductTap,
              onProductView: onProductView,
              onProductEdit: onProductEdit,
              onProductDelete: onProductDelete,
              scrollController: scrollController,
              isLoadingMore: false,
            );
          },
        );
      },
    );
  }
}
