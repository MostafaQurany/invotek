part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loadingAuth() = _LoadingAuth;
  const factory AuthState.successLogin(UserModel userModel) = _SuccessLogin;
  const factory AuthState.errorAuth(Failure failure) = _ErrorAuth;
  const factory AuthState.successRegister(UserModel userModel) =
      _SuccessRegister;
  const factory AuthState.errorRegister(Failure failure) = _ErrorRegister;
  const factory AuthState.changeAuthScreenBody(DateTime timestamp) =
      _ChangeAuthScreenBody;
  const factory AuthState.successLogout() = _SuccessLogout;
  const factory AuthState.successForgetPassword(String message, String email) =
      _SuccessForgetPassword;
  const factory AuthState.successVerifyCode(String verifyToken) =
      _SuccessVerifyCode;
  const factory AuthState.successResetPassword(String message) =
      _SuccessResetPassword;
}
