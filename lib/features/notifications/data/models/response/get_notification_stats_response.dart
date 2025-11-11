import 'package:json_annotation/json_annotation.dart';

part 'get_notification_stats_response.g.dart';

@JsonSerializable()
class GetNotificationStatsResponse {
  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'read')
  final int? read;
  @JsonKey(name: 'unread')
  final int? unread;

  GetNotificationStatsResponse({
    this.total,
    this.read,
    this.unread,
  });

  factory GetNotificationStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationStatsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNotificationStatsResponseToJson(this);
}


