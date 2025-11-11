import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';

class MarkNotificationAsReadUseCase
    implements UseCase<bool, MarkNotificationAsReadParams> {
  final NotificationsRepository _repository;

  MarkNotificationAsReadUseCase(this._repository);

  @override
  Future<ApiResult<bool>> call(MarkNotificationAsReadParams params) async {
    return await _repository.markNotificationAsRead(params.id);
  }
}

class MarkNotificationAsReadParams {
  final int id;

  const MarkNotificationAsReadParams({required this.id});
}


