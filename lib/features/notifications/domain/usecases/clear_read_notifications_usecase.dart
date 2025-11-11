import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';

class ClearReadNotificationsUseCase implements UseCase<bool, NoParams> {
  final NotificationsRepository _repository;

  ClearReadNotificationsUseCase(this._repository);

  @override
  Future<ApiResult<bool>> call(NoParams params) async {
    return await _repository.clearReadNotifications();
  }
}


