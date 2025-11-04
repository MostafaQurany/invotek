import 'product_api_model.dart';

class ProductsPaginationResult {
  final List<ProductApiModel> products;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNextPage;
  final bool hasPreviousPage;

  ProductsPaginationResult({
    required this.products,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory ProductsPaginationResult.fromResponse(dynamic response) {
    final currentPage = response.currentPage ?? 1;
    final lastPage = response.lastPage ?? 1;
    final total = response.total ?? 0;
    final products = response.data ?? [];

    return ProductsPaginationResult(
      products: products,
      currentPage: currentPage,
      totalPages: lastPage,
      totalItems: total,
      hasNextPage: response.nextPageUrl != null,
      hasPreviousPage: response.prevPageUrl != null,
    );
  }
}
