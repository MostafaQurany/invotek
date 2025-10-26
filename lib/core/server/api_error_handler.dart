import 'package:dio/dio.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/utils/app_api_constants.dart';

class ApiErrorHandler {
  static Failure handleError(e) {
    if (e is DioException) {
      // Prefer server-provided message when available
      final serverMessage = _extractServerMessage(e.response);

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Failure.timeout(message: ApiErrors.timeoutError);
        case DioExceptionType.badCertificate:
          return Failure.server(message: ApiErrors.badRequestError);
        case DioExceptionType.badResponse:
          // Map common HTTP status codes and fall back to server message
          final statusCode = e.response?.statusCode;
          if (statusCode != null) {
            if (statusCode >= 500)
              return Failure.server(
                message: ApiErrors.internalServerError,
                statusCode: statusCode,
              );
            if (statusCode == 401)
              return Failure.unauthorized(message: ApiErrors.unauthorizedError);
            if (statusCode == 403) {
              // التحقق من رسالة خطأ الباقة
              final serverMessage = _extractServerMessage(e.response);
              if (serverMessage != null &&
                  serverMessage.contains(
                    'يرجى اختيار باقة للاستمرار في استخدام النظام',
                  )) {
                return Failure.subscriptionRequired(
                  message: serverMessage,
                  redirectUrl: _extractRedirectUrl(e.response),
                );
              }
              return Failure.server(
                message: ApiErrors.forbiddenError,
                statusCode: statusCode,
              );
            }
            if (statusCode == 404)
              return Failure.server(
                message: ApiErrors.notFoundError,
                statusCode: statusCode,
              );
            if (statusCode == 409)
              return Failure.server(
                message: ApiErrors.conflictError,
                statusCode: statusCode,
              );
            if (statusCode == 400)
              return Failure.validation(message: ApiErrors.badRequestError);
            if (statusCode == 204)
              return Failure.server(
                message: ApiErrors.noContent,
                statusCode: statusCode,
              );
          }
          return Failure.server(
            message: serverMessage ?? ApiErrors.defaultError,
          );
        case DioExceptionType.cancel:
          return Failure.unknown(message: 'Request cancelled');
        case DioExceptionType.connectionError:
          return Failure.network(message: ApiErrors.noInternetError);
        case DioExceptionType.unknown:
          return Failure.unknown(
            message: serverMessage ?? ApiErrors.unknownError,
          );
      }
    }
    return Failure.unknown(message: e.toString());
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

  static String? _extractRedirectUrl(Response? response) {
    if (response == null) return null;
    final data = response.data;
    if (data is Map) {
      final redirectUrl = data['redirect'];
      if (redirectUrl is String && redirectUrl.trim().isNotEmpty) {
        return redirectUrl;
      }
    }
    return null;
  }
}
