import 'package:json_annotation/json_annotation.dart';

part 'notification_api_model.g.dart';

@JsonSerializable()
class NotificationApiModel {
  final int id;
  final String? title;
  final String? message;
  final String? type;
  @JsonKey(name: 'is_read')
  final bool? isRead;
  @JsonKey(
    name: 'created_at',
    fromJson: _stringToDateTime,
    toJson: _dateTimeToString,
  )
  final DateTime? createdAt;
  @JsonKey(
    name: 'updated_at',
    fromJson: _stringToDateTime,
    toJson: _dateTimeToString,
  )
  final DateTime? updatedAt;
  final Map<String, dynamic>? data;

  NotificationApiModel({
    required this.id,
    this.title,
    this.message,
    this.type,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.data,
  });

  factory NotificationApiModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationApiModelToJson(this);

  static DateTime? _stringToDateTime(String? dateTime) =>
      dateTime != null ? DateTime.parse(dateTime) : null;
  static String? _dateTimeToString(DateTime? dateTime) =>
      dateTime?.toIso8601String();
}


