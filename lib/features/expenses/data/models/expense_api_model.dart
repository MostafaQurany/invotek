import 'package:json_annotation/json_annotation.dart';

part 'expense_api_model.g.dart';

@JsonSerializable()
class ExpenseApiModel {
  final int id;
  @JsonKey(name: 'company_id')
  final int companyId;
  @JsonKey(name: 'expense_category_id')
  final int expenseCategoryId;
  final String title;
  final String? description;
  final String amount;
  @JsonKey(name: 'expense_date')
  final String expenseDate;
  @JsonKey(name: 'reference_number')
  final String? referenceNumber;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  final String? notes;
  final String? attachment;
  @JsonKey(name: 'created_by', fromJson: _createdByFromJson)
  final int createdBy;
  @JsonKey(
    name: 'created_at',
    fromJson: _stringToDateTime,
    toJson: _dateTimeToString,
  )
  final DateTime? createdAt;
  @JsonKey(
    name: 'updated_at',
    fromJson: _stringToDateTime,
    toJson: _dateTimeToString,
  )
  final DateTime? updatedAt;

  ExpenseApiModel({
    required this.id,
    required this.companyId,
    required this.expenseCategoryId,
    required this.title,
    this.description,
    required this.amount,
    required this.expenseDate,
    this.referenceNumber,
    required this.paymentMethod,
    this.notes,
    this.attachment,
    required this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory ExpenseApiModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseApiModelToJson(this);

  static DateTime? _stringToDateTime(String? dateTime) =>
      dateTime != null ? DateTime.parse(dateTime) : null;
  static String? _dateTimeToString(DateTime? dateTime) =>
      dateTime?.toIso8601String();
  static int _createdByFromJson(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.parse(value);
    throw Exception('Invalid created_by value: $value');
  }
}
