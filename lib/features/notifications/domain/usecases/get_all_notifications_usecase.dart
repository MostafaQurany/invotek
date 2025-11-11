import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/notifications/data/models/pagination_result.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';

class GetAllNotificationsUseCase
    implements UseCase<NotificationsPaginationResult, GetAllNotificationsParams> {
  final NotificationsRepository _repository;

  GetAllNotificationsUseCase(this._repository);

  @override
  Future<ApiResult<NotificationsPaginationResult>> call(
    GetAllNotificationsParams params,
  ) async {
    return await _repository.getNotifications(
      search: params.search,
      type: params.type,
      isRead: params.isRead,
      dateFrom: params.dateFrom,
      dateTo: params.dateTo,
      perPage: params.perPage,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
      page: params.page,
    );
  }
}

class GetAllNotificationsParams {
  final String? search;
  final String? type;
  final bool? isRead;
  final String? dateFrom;
  final String? dateTo;
  final int? perPage;
  final String? sortBy;
  final String? sortOrder;
  final int? page;

  const GetAllNotificationsParams({
    this.search,
    this.type,
    this.isRead,
    this.dateFrom,
    this.dateTo,
    this.perPage,
    this.sortBy,
    this.sortOrder,
    this.page,
  });
}


