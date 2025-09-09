// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateExpenseResponse _$UpdateExpenseResponseFromJson(
  Map<String, dynamic> json,
) => UpdateExpenseResponse(
  data: json['data'] == null
      ? null
      : ExpenseApiModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$UpdateExpenseResponseToJson(
  UpdateExpenseResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'success': instance.success,
};
