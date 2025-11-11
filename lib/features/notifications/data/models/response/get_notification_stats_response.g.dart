// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notification_stats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationStatsResponse _$GetNotificationStatsResponseFromJson(
  Map<String, dynamic> json,
) => GetNotificationStatsResponse(
  total: (json['total'] as num?)?.toInt(),
  read: (json['read'] as num?)?.toInt(),
  unread: (json['unread'] as num?)?.toInt(),
);

Map<String, dynamic> _$GetNotificationStatsResponseToJson(
  GetNotificationStatsResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'read': instance.read,
  'unread': instance.unread,
};
