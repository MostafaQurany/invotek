import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/states/products_empty_state.dart';
import 'package:invotek/features/products/ui/widgets/states/products_error_state.dart';
import 'package:invotek/features/products/ui/widgets/lists/products_list.dart';

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
            );
          },
        );
      },
    );
  }
}
