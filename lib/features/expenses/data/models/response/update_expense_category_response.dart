import 'package:json_annotation/json_annotation.dart';

import '../expense_category_api_model.dart';

part 'update_expense_category_response.g.dart';

@JsonSerializable()
class UpdateExpenseCategoryResponse {
  final ExpenseCategoryApiModel? data;
  final String? message;
  final bool? success;

  UpdateExpenseCategoryResponse({this.data, this.message, this.success});

  factory UpdateExpenseCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateExpenseCategoryResponseToJson(this);
}
