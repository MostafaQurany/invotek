part of 'products_cubit.dart';

class ProductsState {
  final List<Product> products;
  final Map<String, dynamic> statistics;
  final bool isLoading;
  final String? error;

  const ProductsState({
    this.products = const [],
    this.statistics = const {},
    this.isLoading = false,
    this.error,
  });

  ProductsState copyWith({
    List<Product>? products,
    Map<String, dynamic>? statistics,
    bool? isLoading,
    String? error,
  }) {
    return ProductsState(
      products: products ?? this.products,
      statistics: statistics ?? this.statistics,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
