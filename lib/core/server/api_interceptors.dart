import 'package:dio/dio.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
   
    options.headers[ApiKey.authorization] = StorageService.getToken() != null
        ? 'Bearer ${StorageService.getToken()}'
        : null;
    super.onRequest(options, handler);
  }
}
