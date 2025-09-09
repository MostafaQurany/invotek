// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseApiModel _$ExpenseApiModelFromJson(
  Map<String, dynamic> json,
) => ExpenseApiModel(
  id: (json['id'] as num).toInt(),
  companyId: (json['company_id'] as num).toInt(),
  expenseCategoryId: (json['expense_category_id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String?,
  amount: json['amount'] as String,
  expenseDate: json['expense_date'] as String,
  referenceNumber: json['reference_number'] as String?,
  paymentMethod: json['payment_method'] as String,
  notes: json['notes'] as String?,
  attachment: json['attachment'] as String?,
  createdBy: json['created_by'] as String,
  createdAt: ExpenseApiModel._stringToDateTime(json['created_at'] as String?),
  updatedAt: ExpenseApiModel._stringToDateTime(json['updated_at'] as String?),
);

Map<String, dynamic> _$ExpenseApiModelToJson(ExpenseApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'expense_category_id': instance.expenseCategoryId,
      'title': instance.title,
      'description': instance.description,
      'amount': instance.amount,
      'expense_date': instance.expenseDate,
      'reference_number': instance.referenceNumber,
      'payment_method': instance.paymentMethod,
      'notes': instance.notes,
      'attachment': instance.attachment,
      'created_by': instance.createdBy,
      'created_at': ExpenseApiModel._dateTimeToString(instance.createdAt),
      'updated_at': ExpenseApiModel._dateTimeToString(instance.updatedAt),
    };
