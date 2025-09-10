// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseCategoryApiModel _$ExpenseCategoryApiModelFromJson(
  Map<String, dynamic> json,
) => ExpenseCategoryApiModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  description: json['description'] as String?,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  createdAt: ExpenseCategoryApiModel._stringToDateTime(
    json['created_at'] as String?,
  ),
  updatedAt: ExpenseCategoryApiModel._stringToDateTime(
    json['updated_at'] as String?,
  ),
);

Map<String, dynamic> _$ExpenseCategoryApiModelToJson(
  ExpenseCategoryApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': instance.status,
  'description': instance.description,
  'color': instance.color,
  'icon': instance.icon,
  'created_at': ExpenseCategoryApiModel._dateTimeToString(instance.createdAt),
  'updated_at': ExpenseCategoryApiModel._dateTimeToString(instance.updatedAt),
};
