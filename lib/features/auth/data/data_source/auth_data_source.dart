import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';

class AuthDataSource {
  final ApiClient apiClient;
  AuthDataSource(this.apiClient);

  Future<ApiResult<UserModel>> login(LoginRequest request) async {
    try {
      final response = await apiClient.login(request);
      if (response.user == null) {
        return ApiResult.failure(response.message!);
      }
      if (response.token == null) {
        return ApiResult.failure(response.message!);
      }
      UserModel userModel = UserModel(
        user: User(
          id: response.user?.id,
          name: response.user?.name,
          email: response.user?.email,
          googleId: response.user?.googleId,
          emailVerifiedAt: response.user?.emailVerifiedAt,
          status: response.user?.status,
          currentTeamId: response.user?.currentTeamId,
          profilePhotoPath: response.user?.profilePhotoPath,
          phone: response.user?.phone,
          position: response.user?.position,
          role: response.user?.role,
          twoFactorConfirmedAt: response.user?.twoFactorConfirmedAt,
          companyId: response.user?.companyId,
          createdAt: response.user?.createdAt,
          updatedAt: response.user?.updatedAt,
          profilePhotoUrl: response.user?.profilePhotoUrl,
        ),
        token: response.token,
      );
      return ApiResult<UserModel>.success(userModel);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<UserModel>> register(RegisterRequest request) async {
    try {
      final response = await apiClient.register(request);
      if (response.user == null) {
        return ApiResult.failure(response.message!);
      }
      if (response.token == null) {
        return ApiResult.failure(response.message!);
      }
      UserModel userModel = UserModel(
        user: User(
          id: response.user?.id,
          name: response.user?.name,
          email: response.user?.email,
          status: response.user?.status,
          role: response.user?.role,
          companyId: response.user?.companyId,
          createdAt: response.user?.createdAt,
          updatedAt: response.user?.updatedAt,
          profilePhotoUrl: response.user?.profilePhotoUrl,
        ),
        token: response.token,
      );

      return ApiResult<UserModel>.success(userModel);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
