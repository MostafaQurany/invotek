import 'package:dio/dio.dart';
import 'package:invotek/core/utils/app_api_constants.dart';


class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers[ApiKey.authorization] =
    // getIt<SharedPrefHelper>().getData(key: ApiKey.authorization) != null
    //     ? 'Bearer ${getIt<SharedPrefHelper>().getData(key: ApiKey.authorization)}'
    //     : null;
    super.onRequest(options, handler);
  }
}
