import 'package:json_annotation/json_annotation.dart';

part 'delete_expense_response.g.dart';

@JsonSerializable()
class DeleteExpenseResponse {
  final String? message;
  final bool? success;

  DeleteExpenseResponse({this.message, this.success});

  factory DeleteExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteExpenseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteExpenseResponseToJson(this);
}
