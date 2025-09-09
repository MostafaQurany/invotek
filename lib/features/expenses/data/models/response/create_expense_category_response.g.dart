// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExpenseCategoryResponse _$CreateExpenseCategoryResponseFromJson(
  Map<String, dynamic> json,
) => CreateExpenseCategoryResponse(
  data: json['data'] == null
      ? null
      : ExpenseCategoryApiModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$CreateExpenseCategoryResponseToJson(
  CreateExpenseCategoryResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'success': instance.success,
};
