import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';

class MarkAllNotificationsAsReadUseCase
    implements UseCase<bool, NoParams> {
  final NotificationsRepository _repository;

  MarkAllNotificationsAsReadUseCase(this._repository);

  @override
  Future<ApiResult<bool>> call(NoParams params) async {
    return await _repository.markAllNotificationsAsRead();
  }
}


