import 'package:dio/dio.dart';
import 'package:invotek/core/utils/app_api_constants.dart';

class ApiErrorHandler {
  static String handleError(e) {
    if (e is DioException) {
      // Prefer server-provided message when available
      final serverMessage = _extractServerMessage(e.response);

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiErrors.timeoutError;
        case DioExceptionType.badCertificate:
          return ApiErrors.badRequestError;
        case DioExceptionType.badResponse:
          // Map common HTTP status codes and fall back to server message
          final statusCode = e.response?.statusCode;
          if (statusCode != null) {
            if (statusCode >= 500) return ApiErrors.internalServerError;
            if (statusCode == 401) return ApiErrors.unauthorizedError;
            if (statusCode == 403) return ApiErrors.forbiddenError;
            if (statusCode == 404) return ApiErrors.notFoundError;
            if (statusCode == 409) return ApiErrors.conflictError;
            if (statusCode == 400) return ApiErrors.badRequestError;
            if (statusCode == 204) return ApiErrors.noContent;
          }
          return serverMessage ?? ApiErrors.defaultError;
        case DioExceptionType.cancel:
          return 'Request cancelled';
        case DioExceptionType.connectionError:
          return ApiErrors.noInternetError;
        case DioExceptionType.unknown:
          return serverMessage ?? ApiErrors.unknownError;
      }
    }
    return e.toString();
  }

  static String? _extractServerMessage(Response? response) {
    if (response == null) return null;
    final data = response.data;
    if (data is Map) {
      // Try our API keys first
      final messageByKey =
          data[ApiKey.message] ?? data['error'] ?? data['message'];
      if (messageByKey is String && messageByKey.trim().isNotEmpty) {
        return messageByKey;
      }
      // Some APIs nest message under data
      final nested = data[ApiKey.data];
      if (nested is Map) {
        final nestedMsg = nested[ApiKey.message] ?? nested['message'];
        if (nestedMsg is String && nestedMsg.trim().isNotEmpty) {
          return nestedMsg;
        }
      }
    } else if (data is String && data.trim().isNotEmpty) {
      return data;
    }
    return null;
  }
}
