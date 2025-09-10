import 'package:json_annotation/json_annotation.dart';

part 'expense_category_api_model.g.dart';

@JsonSerializable()
class ExpenseCategoryApiModel {
  final int id;
  final String name;
  final String status;
  final String? description;
  final String? color;
  final String? icon;
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

  ExpenseCategoryApiModel({
    required this.id,
    required this.name,
    required this.status,
    this.description,
    this.color,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  factory ExpenseCategoryApiModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseCategoryApiModelToJson(this);

  static DateTime? _stringToDateTime(String? dateTime) =>
      dateTime != null ? DateTime.parse(dateTime) : null;
  static String? _dateTimeToString(DateTime? dateTime) =>
      dateTime?.toIso8601String();
}
