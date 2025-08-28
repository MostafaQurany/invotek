import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_error_handler.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(String errorMessage) = Failure<T>;

  // إضافة fromJson method للتحقق من message
  @JsonKey(includeFromJson: false, includeToJson: false)
  static ApiResult<T> fromJson<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    // التحقق من وجود message (خطأ)
    if (json.containsKey('message') && json['message'] != null) {
      final message = json['message'] as String;
      return ApiResult.failure(message);
    }

    // التحقق من وجود errors (خطأ)
    if (json.containsKey('errors') && json['errors'] != null) {
      final errors = json['errors'] as Map<String, dynamic>;
      if (errors.isNotEmpty) {
        final firstError = errors.values.first;
        if (firstError is List && firstError.isNotEmpty) {
          final message = firstError.first as String;
          return ApiResult.failure(message);
        }
      }
    }

    // إذا لم تكن هناك أخطاء، تحويل البيانات إلى model
    try {
      final data = fromJsonT(json);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure('خطأ في تحويل البيانات: ${e.toString()}');
    }
  }
}
