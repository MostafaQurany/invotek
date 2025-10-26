import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/settings/cubit/settings_state.dart';
import 'package:invotek/features/settings/data/repository/settings_repository.dart';
import 'package:invotek/features/settings/data/models/change_password_request.dart';
import 'package:invotek/features/settings/data/models/delete_account_request.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository repository;

  SettingsCubit({required this.repository}) : super(SettingsInitial());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    emit(SettingsLoading());

    final request = ChangePasswordRequest(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );

    final result = await repository.changePassword(request);

    result.when(
      success: (response) {
        emit(ChangePasswordSuccess(message: response.message));
      },
      failure: (error) {
        emit(ChangePasswordError(error: error.message));
      },
    );
  }

  Future<void> deleteAccount({required String password}) async {
    emit(SettingsLoading());

    final request = DeleteAccountRequest(password: password);

    final result = await repository.deleteAccount(request);

    result.when(
      success: (response) {
        emit(DeleteAccountSuccess(message: response.message));
      },
      failure: (error) {
        emit(DeleteAccountError(error: error.message));
      },
    );
  }
}
