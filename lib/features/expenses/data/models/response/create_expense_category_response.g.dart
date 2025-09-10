// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExpenseCategoryResponse _$CreateExpenseCategoryResponseFromJson(
  Map<String, dynamic> json,
) => CreateExpenseCategoryResponse(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  status: json['status'] as String?,
  description: json['description'] as String?,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$CreateExpenseCategoryResponseToJson(
  CreateExpenseCategoryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': instance.status,
  'description': instance.description,
  'color': instance.color,
  'icon': instance.icon,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'message': instance.message,
  'success': instance.success,
};
