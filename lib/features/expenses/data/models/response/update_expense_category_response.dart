import 'package:json_annotation/json_annotation.dart';

import '../expense_category_api_model.dart';

part 'update_expense_category_response.g.dart';

@JsonSerializable()
class UpdateExpenseCategoryResponse {
  final ExpenseCategoryApiModel? data;
  final String? message;
  final bool? success;

  UpdateExpenseCategoryResponse({this.data, this.message, this.success});

  factory UpdateExpenseCategoryResponse.fromJson(Map<String, dynamic> json) {
    // Handle direct response (API returns category data directly)
    if (json.containsKey('id') && json.containsKey('name')) {
      return UpdateExpenseCategoryResponse(
        data: ExpenseCategoryApiModel.fromJson(json),
        message: 'Category updated successfully',
        success: true,
      );
    }
    // Handle wrapped response (if API changes to wrap data)
    return _$UpdateExpenseCategoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateExpenseCategoryResponseToJson(this);
}
