// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationApiModel _$NotificationApiModelFromJson(
  Map<String, dynamic> json,
) => NotificationApiModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String?,
  message: json['message'] as String?,
  type: json['type'] as String?,
  isRead: json['is_read'] as bool?,
  createdAt: NotificationApiModel._stringToDateTime(
    json['created_at'] as String?,
  ),
  updatedAt: NotificationApiModel._stringToDateTime(
    json['updated_at'] as String?,
  ),
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$NotificationApiModelToJson(
  NotificationApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'message': instance.message,
  'type': instance.type,
  'is_read': instance.isRead,
  'created_at': NotificationApiModel._dateTimeToString(instance.createdAt),
  'updated_at': NotificationApiModel._dateTimeToString(instance.updatedAt),
  'data': instance.data,
};
