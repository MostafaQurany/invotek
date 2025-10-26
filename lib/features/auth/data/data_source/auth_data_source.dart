import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/features/auth/data/models/forget_password_request.dart';
import 'package:invotek/features/auth/data/models/forget_password_respond.dart';
import 'package:invotek/features/auth/data/models/verify_code_request.dart';
import 'package:invotek/features/auth/data/models/verify_code_response.dart';
import 'package:invotek/features/auth/data/models/reset_password_request.dart';
import 'package:invotek/features/auth/data/models/reset_password_response.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/data/models/google_login_request.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';

class AuthDataSource {
  final ApiClient apiClient;
  AuthDataSource(this.apiClient);

  Future<ApiResult<UserModel>> login(LoginRequest request) async {
    try {
      final response = await apiClient.login(request);
      if (response.user == null) {
        return ApiResult.failure(Failure.server(message: response.message!));
      }
      if (response.token == null) {
        return ApiResult.failure(Failure.server(message: response.message!));
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
        roleId: response.roleId,
      );
      return ApiResult<UserModel>.success(userModel);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<UserModel>> register(RegisterRequest request) async {
    try {
      final response = await apiClient.register(request);
      if (response.user == null) {
        return ApiResult.failure(Failure.server(message: response.message!));
      }
      if (response.token == null) {
        return ApiResult.failure(Failure.server(message: response.message!));
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
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    try {
      final response = await apiClient.forgetPassword(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<VerifyCodeResponse>> verifyCode(
    VerifyCodeRequest request,
  ) async {
    try {
      final response = await apiClient.verifyCode(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await apiClient.resetPassword(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<UserModel>> googleLogin(GoogleLoginRequest request) async {
    try {
      final response = await apiClient.googleLogin(request);

      // التحقق من نجاح العملية
      if (response.success != true) {
        return ApiResult.failure(
          Failure.server(message: response.message ?? 'فشل في تسجيل الدخول'),
        );
      }

      // التحقق من وجود البيانات
      if (response.data?.user == null) {
        return ApiResult.failure(
          Failure.server(
            message: response.message ?? 'فشل في الحصول على بيانات المستخدم',
          ),
        );
      }

      if (response.data?.token == null) {
        return ApiResult.failure(
          Failure.server(
            message: response.message ?? 'فشل في الحصول على الرمز المميز',
          ),
        );
      }

      UserModel userModel = UserModel(
        user: User(
          id: response.data!.user?.id,
          name: response.data!.user?.name,
          email: response.data!.user?.email,
          googleId: response.data!.user?.googleId,
          emailVerifiedAt: response.data!.user?.emailVerifiedAt,
          status: response.data!.user?.status,
          currentTeamId: response.data!.user?.currentTeamId,
          profilePhotoPath: response.data!.user?.profilePhotoPath,
          phone: response.data!.user?.phone,
          position: response.data!.user?.position,
          role: response.data!.user?.role,
          twoFactorConfirmedAt: response.data!.user?.twoFactorConfirmedAt,
          companyId: response.data!.user?.companyId,
          createdAt: response.data!.user?.createdAt,
          updatedAt: response.data!.user?.updatedAt,
          profilePhotoUrl: response.data!.user?.profilePhotoUrl,
        ),
        token: response.data!.token,
        roleId: response.data!.roleId,
      );
      return ApiResult<UserModel>.success(userModel);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
