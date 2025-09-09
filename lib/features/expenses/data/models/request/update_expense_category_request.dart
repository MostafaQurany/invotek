import 'package:json_annotation/json_annotation.dart';

part 'update_expense_category_request.g.dart';

@JsonSerializable()
class UpdateExpenseCategoryRequest {
  final String? name;
  final String? status;

  UpdateExpenseCategoryRequest({this.name, this.status});

  factory UpdateExpenseCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateExpenseCategoryRequestToJson(this);
}
