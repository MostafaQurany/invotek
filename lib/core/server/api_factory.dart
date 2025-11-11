import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../network/cache_module.dart';
import 'api_interceptors.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  /// You must call this once at app start (after CacheModule.init).
  static Dio create(CacheModule cache, {String? baseUrl}) {
    if (_dio != null) return _dio!;

    final timeOut = const Duration(seconds: 60);

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: {
          'Accept': 'application/json',
          "Content-Type": 'application/json',
        }, // as needed
      ),
    );

    // Order matters:
    // request → [AuthInterceptor] → [Cache] → [Logger] → network
    _dio!
      ..interceptors.add(DioInterceptor()) // auth, localization, etc.
      ..interceptors.add(DioCacheInterceptor(options: cache.options))
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: true,
        ),
      );

    return _dio!;
  }

  static Dio get instance {
    if (_dio == null) {
      throw StateError(
        'Call DioFactory.create(cacheModule) before using instance',
      );
    }
    return _dio!;
  }
}
