import 'customer_api_model.dart';

class PaginationResult {
  final List<CustomerApiModel> customers;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNextPage;
  final bool hasPreviousPage;

  PaginationResult({
    required this.customers,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PaginationResult.fromResponse(dynamic response) {
    final currentPage = response.currentPage ?? 1;
    final lastPage = response.lastPage ?? 1;
    final total = response.total ?? 0;
    final customers = response.data ?? [];

    return PaginationResult(
      customers: customers,
      currentPage: currentPage,
      totalPages: lastPage,
      totalItems: total,
      hasNextPage: response.nextPageUrl != null,
      hasPreviousPage: response.prevPageUrl != null,
    );
  }
}


