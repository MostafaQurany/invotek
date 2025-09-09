// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteExpenseResponse _$DeleteExpenseResponseFromJson(
  Map<String, dynamic> json,
) => DeleteExpenseResponse(
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$DeleteExpenseResponseToJson(
  DeleteExpenseResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
