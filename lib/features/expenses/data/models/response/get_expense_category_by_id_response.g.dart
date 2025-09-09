// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_expense_category_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExpenseCategoryByIdResponse _$GetExpenseCategoryByIdResponseFromJson(
  Map<String, dynamic> json,
) => GetExpenseCategoryByIdResponse(
  data: json['data'] == null
      ? null
      : ExpenseCategoryApiModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$GetExpenseCategoryByIdResponseToJson(
  GetExpenseCategoryByIdResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'success': instance.success,
};
