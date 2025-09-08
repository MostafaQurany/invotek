// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductResponse _$CreateProductResponseFromJson(
  Map<String, dynamic> json,
) => CreateProductResponse(
  name: json['name'] as String?,
  price: json['price'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateProductResponseToJson(
  CreateProductResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'price': instance.price,
  'quantity': instance.quantity,
  'company_id': instance.companyId,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'id': instance.id,
};
