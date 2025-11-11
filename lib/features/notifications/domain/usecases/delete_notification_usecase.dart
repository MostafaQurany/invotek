import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';

class DeleteNotificationUseCase
    implements UseCase<bool, DeleteNotificationParams> {
  final NotificationsRepository _repository;

  DeleteNotificationUseCase(this._repository);

  @override
  Future<ApiResult<bool>> call(DeleteNotificationParams params) async {
    return await _repository.deleteNotification(params.id);
  }
}

class DeleteNotificationParams {
  final int id;

  const DeleteNotificationParams({required this.id});
}


