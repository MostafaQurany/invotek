import 'package:json_annotation/json_annotation.dart';

part 'update_expense_request.g.dart';

@JsonSerializable()
class UpdateExpenseRequest {
  @JsonKey(name: 'expense_category_id')
  final int? expenseCategoryId;
  final String? title;
  final String? description;
  final double? amount;
  @JsonKey(name: 'expense_date')
  final String? expenseDate;
  @JsonKey(name: 'reference_number')
  final String? referenceNumber;
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  final String? notes;
  final String? attachment;

  UpdateExpenseRequest({
    this.expenseCategoryId,
    this.title,
    this.description,
    this.amount,
    this.expenseDate,
    this.referenceNumber,
    this.paymentMethod,
    this.notes,
    this.attachment,
  });

  factory UpdateExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateExpenseRequestToJson(this);
}
