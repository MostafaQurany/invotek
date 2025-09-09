// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateExpenseRequest _$UpdateExpenseRequestFromJson(
  Map<String, dynamic> json,
) => UpdateExpenseRequest(
  expenseCategoryId: (json['expense_category_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  expenseDate: json['expense_date'] as String?,
  referenceNumber: json['reference_number'] as String?,
  paymentMethod: json['payment_method'] as String?,
  notes: json['notes'] as String?,
  attachment: json['attachment'] as String?,
);

Map<String, dynamic> _$UpdateExpenseRequestToJson(
  UpdateExpenseRequest instance,
) => <String, dynamic>{
  'expense_category_id': instance.expenseCategoryId,
  'title': instance.title,
  'description': instance.description,
  'amount': instance.amount,
  'expense_date': instance.expenseDate,
  'reference_number': instance.referenceNumber,
  'payment_method': instance.paymentMethod,
  'notes': instance.notes,
  'attachment': instance.attachment,
};
