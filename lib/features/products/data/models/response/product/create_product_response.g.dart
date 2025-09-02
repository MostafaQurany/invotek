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
  companyId: (json['companyId'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateProductResponseToJson(
  CreateProductResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'price': instance.price,
  'quantity': instance.quantity,
  'companyId': instance.companyId,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'id': instance.id,
};
