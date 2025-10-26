part of 'permissions_cubit.dart';

@freezed
class PermissionsState with _$PermissionsState {
  const factory PermissionsState.initial() = _Initial;
  const factory PermissionsState.loading() = _Loading;
  const factory PermissionsState.loaded(UserPermissions permissions) = _Loaded;
  const factory PermissionsState.error(String error) = _Error;
}
