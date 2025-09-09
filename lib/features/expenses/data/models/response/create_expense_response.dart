import 'package:json_annotation/json_annotation.dart';

import '../expense_api_model.dart';

part 'create_expense_response.g.dart';

@JsonSerializable()
class CreateExpenseResponse {
  final ExpenseApiModel? data;
  final String? message;
  final bool? success;

  CreateExpenseResponse({this.data, this.message, this.success});

  factory CreateExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExpenseResponseToJson(this);
}
