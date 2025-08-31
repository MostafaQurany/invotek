// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num).toDouble(),
  costPrice: (json['costPrice'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  sku: json['sku'] as String?,
  barcode: json['barcode'] as String?,
  category: json['category'] as String,
  status: json['status'] as String,
  image: json['image'] as String?,
  unit: json['unit'] as String?,
  taxRate: (json['taxRate'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  weight: (json['weight'] as num?)?.toDouble(),
  dimensions: json['dimensions'] as String?,
  color: json['color'] as String?,
  material: json['material'] as String?,
  minQuantity: (json['minQuantity'] as num?)?.toInt(),
  maxQuantity: (json['maxQuantity'] as num?)?.toInt(),
  isActive: json['isActive'] as bool,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'costPrice': instance.costPrice,
  'quantity': instance.quantity,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'category': instance.category,
  'status': instance.status,
  'image': instance.image,
  'unit': instance.unit,
  'taxRate': instance.taxRate,
  'notes': instance.notes,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'brand': instance.brand,
  'model': instance.model,
  'weight': instance.weight,
  'dimensions': instance.dimensions,
  'color': instance.color,
  'material': instance.material,
  'minQuantity': instance.minQuantity,
  'maxQuantity': instance.maxQuantity,
  'isActive': instance.isActive,
};
