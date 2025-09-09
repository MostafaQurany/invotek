import 'package:json_annotation/json_annotation.dart';

part 'create_expense_request.g.dart';

@JsonSerializable()
class CreateExpenseRequest {
  @JsonKey(name: 'expense_category_id')
  final int expenseCategoryId;
  final String title;
  final String? description;
  final double amount;
  @JsonKey(name: 'expense_date')
  final String expenseDate;
  @JsonKey(name: 'reference_number')
  final String? referenceNumber;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  final String? notes;
  final String? attachment;

  CreateExpenseRequest({
    required this.expenseCategoryId,
    required this.title,
    this.description,
    required this.amount,
    required this.expenseDate,
    this.referenceNumber,
    required this.paymentMethod,
    this.notes,
    this.attachment,
  });

  factory CreateExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExpenseRequestToJson(this);
}
