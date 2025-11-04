import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/delete_account_request.dart';
import 'package:invotek/features/settings/data/models/delete_account_response.dart';
import 'package:invotek/features/settings/domain/repositories/settings_repository.dart';

class DeleteAccount implements UseCase<DeleteAccountResponse, DeleteAccountRequest> {
  final ISettingsRepository repository;

  DeleteAccount(this.repository);

  @override
  Future<ApiResult<DeleteAccountResponse>> call(DeleteAccountRequest params) {
    return repository.deleteAccount(params);
  }
}


