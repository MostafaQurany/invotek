import 'package:json_annotation/json_annotation.dart';

part 'create_expense_category_request.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateExpenseCategoryRequest {
  final String? name;
  final String? status;
  final String? description;
  final String? color;
  final String? icon;

  CreateExpenseCategoryRequest({
    this.name,
    this.description,
    this.color,
    this.icon,
    this.status,
  });

  factory CreateExpenseCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExpenseCategoryRequestToJson(this);
}
