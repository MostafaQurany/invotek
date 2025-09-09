// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_expense_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteExpenseCategoryResponse _$DeleteExpenseCategoryResponseFromJson(
  Map<String, dynamic> json,
) => DeleteExpenseCategoryResponse(
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$DeleteExpenseCategoryResponseToJson(
  DeleteExpenseCategoryResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
