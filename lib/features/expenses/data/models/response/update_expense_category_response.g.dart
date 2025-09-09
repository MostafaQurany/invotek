// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateExpenseCategoryResponse _$UpdateExpenseCategoryResponseFromJson(
  Map<String, dynamic> json,
) => UpdateExpenseCategoryResponse(
  data: json['data'] == null
      ? null
      : ExpenseCategoryApiModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$UpdateExpenseCategoryResponseToJson(
  UpdateExpenseCategoryResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'success': instance.success,
};
