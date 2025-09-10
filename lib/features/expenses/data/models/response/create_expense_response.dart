import 'package:json_annotation/json_annotation.dart';

import '../expense_api_model.dart';

part 'create_expense_response.g.dart';

@JsonSerializable()
class CreateExpenseResponse {
  final ExpenseApiModel? data;
  final String? message;
  final bool? success;

  CreateExpenseResponse({this.data, this.message, this.success});

  factory CreateExpenseResponse.fromJson(Map<String, dynamic> json) {
    // Handle direct expense data (not wrapped in 'data' field)
    if (json.containsKey('id') && json.containsKey('title')) {
      return CreateExpenseResponse(
        data: ExpenseApiModel.fromJson(json),
        message: json['message'] as String?,
        success: json['success'] as bool? ?? true,
      );
    }
    // Handle wrapped response structure
    return _$CreateExpenseResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateExpenseResponseToJson(this);
}
