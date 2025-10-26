import 'package:dio/dio.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/utils/app_api_constants.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.path.contains("logout")
        ? null
        : options.path.contains("login")
        ? null
        : options.path.contains("register")
        ? null
        : options.path.contains("verify-code")
        ? null
        : options.path.contains("reset-password")
        ? null
        : options.path.contains("forgot-password")
        ? null
        : options.headers[ApiKey.authorization] =
              StorageService.getToken() != null
              ? 'Bearer ${StorageService.getToken()}'
              : null;
    super.onRequest(options, handler);
  }
}
