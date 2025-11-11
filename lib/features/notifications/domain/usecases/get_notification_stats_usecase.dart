import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/notifications/data/models/response/get_notification_stats_response.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';

class GetNotificationStatsUseCase
    implements UseCase<GetNotificationStatsResponse, NoParams> {
  final NotificationsRepository _repository;

  GetNotificationStatsUseCase(this._repository);

  @override
  Future<ApiResult<GetNotificationStatsResponse>> call(NoParams params) async {
    return await _repository.getNotificationStats();
  }
}


