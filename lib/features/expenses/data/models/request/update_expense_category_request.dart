import 'package:json_annotation/json_annotation.dart';

part 'update_expense_category_request.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateExpenseCategoryRequest {
  final String? name;
  final String? status;
  final String? description;
  final String? color;
  final String? icon;

  UpdateExpenseCategoryRequest({
    this.name,
    this.status,
    this.description,
    this.color,
    this.icon,
  });

  factory UpdateExpenseCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateExpenseCategoryRequestToJson(this);
}
