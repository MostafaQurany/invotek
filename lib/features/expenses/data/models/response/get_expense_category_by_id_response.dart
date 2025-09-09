import 'package:json_annotation/json_annotation.dart';

import '../expense_category_api_model.dart';

part 'get_expense_category_by_id_response.g.dart';

@JsonSerializable()
class GetExpenseCategoryByIdResponse {
  final ExpenseCategoryApiModel? data;
  final String? message;
  final bool? success;

  GetExpenseCategoryByIdResponse({this.data, this.message, this.success});

  factory GetExpenseCategoryByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExpenseCategoryByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetExpenseCategoryByIdResponseToJson(this);
}
