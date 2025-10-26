import 'package:freezed_annotation/freezed_annotation.dart';
import '../error/failures.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(Failure failure) = ApiFailure<T>;

  // إضافة fromJson method للتحقق من message
  static ApiResult<T> fromJson<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    // التحقق من وجود message (خطأ)
    if (json.containsKey('message') && json['message'] != null) {
      final message = json['message'] as String;
      return ApiResult.failure(Failure.server(message: message));
    }

    // التحقق من وجود errors (خطأ)
    if (json.containsKey('errors') && json['errors'] != null) {
      final errors = json['errors'] as Map<String, dynamic>;
      if (errors.isNotEmpty) {
        final firstError = errors.values.first;
        if (firstError is List && firstError.isNotEmpty) {
          final message = firstError.first as String;
          return ApiResult.failure(Failure.validation(message: message));
        }
      }
    }

    // إذا لم تكن هناك أخطاء، تحويل البيانات إلى model
    try {
      final data = fromJsonT(json);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(
        Failure.unknown(message: 'خطأ في تحويل البيانات: ${e.toString()}'),
      );
    }
  }

  // Helper method to create failure from string
  static ApiResult<T> failureFromString<T>(String errorMessage) {
    return ApiResult.failure(Failure.unknown(message: errorMessage));
  }

  // Helper method to create server failure
  static ApiResult<T> serverFailure<T>(String message, {int? statusCode}) {
    return ApiResult.failure(
      Failure.server(message: message, statusCode: statusCode),
    );
  }

  // Helper method to create network failure
  static ApiResult<T> networkFailure<T>(String message) {
    return ApiResult.failure(Failure.network(message: message));
  }

  // Helper method to create validation failure
  static ApiResult<T> validationFailure<T>(
    String message, {
    Map<String, List<String>>? errors,
  }) {
    return ApiResult.failure(
      Failure.validation(message: message, errors: errors),
    );
  }
}
