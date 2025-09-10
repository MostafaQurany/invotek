// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExpenseCategoryRequest _$CreateExpenseCategoryRequestFromJson(
  Map<String, dynamic> json,
) => CreateExpenseCategoryRequest(
  name: json['name'] as String?,
  description: json['description'] as String?,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$CreateExpenseCategoryRequestToJson(
  CreateExpenseCategoryRequest instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'status': ?instance.status,
  'description': ?instance.description,
  'color': ?instance.color,
  'icon': ?instance.icon,
};
