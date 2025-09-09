// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_expense_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExpenseByIdResponse _$GetExpenseByIdResponseFromJson(
  Map<String, dynamic> json,
) => GetExpenseByIdResponse(
  data: json['data'] == null
      ? null
      : ExpenseApiModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$GetExpenseByIdResponseToJson(
  GetExpenseByIdResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'success': instance.success,
};
