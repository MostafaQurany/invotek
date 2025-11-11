// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleNotificationResponse _$GetSingleNotificationResponseFromJson(
  Map<String, dynamic> json,
) => GetSingleNotificationResponse(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : NotificationApiModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetSingleNotificationResponseToJson(
  GetSingleNotificationResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
