import 'package:json_annotation/json_annotation.dart';

part 'delete_expense_category_response.g.dart';

@JsonSerializable()
class DeleteExpenseCategoryResponse {
  final String? message;
  final bool? success;

  DeleteExpenseCategoryResponse({this.message, this.success});

  factory DeleteExpenseCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteExpenseCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteExpenseCategoryResponseToJson(this);
}
