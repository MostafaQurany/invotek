import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/notifications/domain/entities/notification_entity.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';

class GetSingleNotificationUseCase
    implements UseCase<NotificationEntity, GetSingleNotificationParams> {
  final NotificationsRepository _repository;

  GetSingleNotificationUseCase(this._repository);

  @override
  Future<ApiResult<NotificationEntity>> call(
    GetSingleNotificationParams params,
  ) async {
    return await _repository.getNotificationById(params.id);
  }
}

class GetSingleNotificationParams {
  final int id;

  const GetSingleNotificationParams({required this.id});
}


