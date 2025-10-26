import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.server({
    @Default('خطأ في الخادم') String message,
    int? statusCode,
  }) = ServerFailure;

  const factory Failure.network({
    @Default('خطأ في الاتصال بالإنترنت') String message,
  }) = NetworkFailure;

  const factory Failure.cache({
    @Default('خطأ في التخزين المحلي') String message,
  }) = CacheFailure;

  const factory Failure.validation({
    @Default('خطأ في التحقق من البيانات') String message,
    Map<String, List<String>>? errors,
  }) = ValidationFailure;

  const factory Failure.unknown({@Default('خطأ غير معروف') String message}) =
      UnknownFailure;

  const factory Failure.timeout({@Default('انتهت مهلة الطلب') String message}) =
      TimeoutFailure;

  const factory Failure.unauthorized({
    @Default('غير مصرح بالوصول') String message,
  }) = UnauthorizedFailure;

  const factory Failure.subscriptionRequired({
    @Default('يرجى اختيار باقة للاستمرار في استخدام النظام') String message,
    String? redirectUrl,
  }) = SubscriptionRequiredFailure;
}
