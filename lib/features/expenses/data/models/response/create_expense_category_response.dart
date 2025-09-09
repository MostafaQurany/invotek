import 'package:json_annotation/json_annotation.dart';

import '../expense_category_api_model.dart';

part 'create_expense_category_response.g.dart';

@JsonSerializable()
class CreateExpenseCategoryResponse {
  final ExpenseCategoryApiModel? data;
  final String? message;
  final bool? success;

  CreateExpenseCategoryResponse({this.data, this.message, this.success});

  factory CreateExpenseCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExpenseCategoryResponseToJson(this);
}
