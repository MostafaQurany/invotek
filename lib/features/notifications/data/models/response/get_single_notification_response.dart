import 'package:json_annotation/json_annotation.dart';

import '../notification_api_model.dart';

part 'get_single_notification_response.g.dart';

@JsonSerializable()
class GetSingleNotificationResponse {
  final bool? success;
  final NotificationApiModel? data;

  GetSingleNotificationResponse({
    this.success,
    this.data,
  });

  factory GetSingleNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSingleNotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSingleNotificationResponseToJson(this);
}


