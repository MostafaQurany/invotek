abstract class SettingsState {
  const SettingsState();
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class ChangePasswordSuccess extends SettingsState {
  final String message;

  const ChangePasswordSuccess({required this.message});
}

class ChangePasswordError extends SettingsState {
  final String error;

  const ChangePasswordError({required this.error});
}

class DeleteAccountSuccess extends SettingsState {
  final String message;

  const DeleteAccountSuccess({required this.message});
}

class DeleteAccountError extends SettingsState {
  final String error;

  const DeleteAccountError({required this.error});
}
