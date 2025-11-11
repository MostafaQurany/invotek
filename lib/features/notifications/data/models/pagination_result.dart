import 'notification_api_model.dart';

class NotificationsPaginationResult {
  final List<NotificationApiModel> notifications;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNextPage;
  final bool hasPreviousPage;

  NotificationsPaginationResult({
    required this.notifications,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory NotificationsPaginationResult.fromResponse(dynamic response) {
    final currentPage = response.currentPage ?? 1;
    final lastPage = response.lastPage ?? 1;
    final total = response.total ?? 0;
    final notifications = response.data ?? [];

    return NotificationsPaginationResult(
      notifications: notifications,
      currentPage: currentPage,
      totalPages: lastPage,
      totalItems: total,
      hasNextPage: response.nextPageUrl != null,
      hasPreviousPage: response.prevPageUrl != null,
    );
  }
}


