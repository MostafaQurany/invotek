import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handleError(e) {
    print('e: $e');
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout';
        case DioExceptionType.sendTimeout:
          return 'Send timeout';
        case DioExceptionType.receiveTimeout:
          return 'Receive timeout';
        case DioExceptionType.badResponse:
          return 'Bad response';
        case DioExceptionType.cancel:
          return 'Request cancelled';
        case DioExceptionType.connectionError:
          return 'Connection error';
        case DioExceptionType.unknown:
          return 'Unknown error';
        default:
          return 'Unknown error';
      }
    } else {
      return e.toString();
    }
  }
}
