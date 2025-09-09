import 'package:json_annotation/json_annotation.dart';

import '../expense_api_model.dart';

part 'update_expense_response.g.dart';

@JsonSerializable()
class UpdateExpenseResponse {
  final ExpenseApiModel? data;
  final String? message;
  final bool? success;

  UpdateExpenseResponse({this.data, this.message, this.success});

  factory UpdateExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateExpenseResponseToJson(this);
}
