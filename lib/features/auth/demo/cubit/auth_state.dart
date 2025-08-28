part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loadingAuth() = _LoadingAuth;
  const factory AuthState.successLogin(UserModel userModel) = _SuccessLogin;
  const factory AuthState.errorAuth(String error) = _ErrorAuth;
  const factory AuthState.successRegister(UserModel userModel) =
      _SuccessRegister;
  const factory AuthState.errorRegister(String error) = _ErrorRegister;
  const factory AuthState.changeAuthScreenBody() = _ChangeAuthScreenBody;
}
