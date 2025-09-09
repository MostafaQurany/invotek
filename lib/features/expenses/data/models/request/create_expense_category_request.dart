import 'package:json_annotation/json_annotation.dart';

part 'create_expense_category_request.g.dart';

@JsonSerializable()
class CreateExpenseCategoryRequest {
  final String name;
  final String? status;

  CreateExpenseCategoryRequest({required this.name, this.status});

  factory CreateExpenseCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExpenseCategoryRequestToJson(this);
}
