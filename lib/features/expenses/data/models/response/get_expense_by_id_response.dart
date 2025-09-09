import 'package:json_annotation/json_annotation.dart';

import '../expense_api_model.dart';

part 'get_expense_by_id_response.g.dart';

@JsonSerializable()
class GetExpenseByIdResponse {
  final ExpenseApiModel? data;
  final String? message;
  final bool? success;

  GetExpenseByIdResponse({this.data, this.message, this.success});

  factory GetExpenseByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExpenseByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetExpenseByIdResponseToJson(this);
}
