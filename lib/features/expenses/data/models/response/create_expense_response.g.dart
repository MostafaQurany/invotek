// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExpenseResponse _$CreateExpenseResponseFromJson(
  Map<String, dynamic> json,
) => CreateExpenseResponse(
  data: json['data'] == null
      ? null
      : ExpenseApiModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$CreateExpenseResponseToJson(
  CreateExpenseResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'success': instance.success,
};
