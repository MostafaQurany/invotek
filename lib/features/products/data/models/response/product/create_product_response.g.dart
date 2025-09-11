// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductResponse _$CreateProductResponseFromJson(
  Map<String, dynamic> json,
) => CreateProductResponse(
  description: json['description'] as String?,
  cost: json['cost'] as String?,
  sku: json['sku'] as String?,
  barcode: json['barcode'] as String?,
  unit: json['unit'] as String?,
  taxRate: json['tax_rate'] as String?,
  notes: json['notes'] as String?,
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  weight: json['weight'] as String?,
  dimensions: json['dimensions'] as String?,
  color: json['color'] as String?,
  material: json['material'] as String?,
  minQuantity: (json['min_quantity'] as num?)?.toInt(),
  maxQuantity: (json['max_quantity'] as num?)?.toInt(),
  isActive: json['is_active'] as bool,
  hasTax: json['has_tax'] as bool,
  trackInventory: json['track_inventory'] as bool,
  status: json['status'] as String,
  categoryId: (json['product_category_id'] as num?)?.toInt(),
  name: json['name'] as String,
  price: json['price'] as String,
  quantity: (json['quantity'] as num).toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$CreateProductResponseToJson(
  CreateProductResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'cost': instance.cost,
  'quantity': instance.quantity,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'unit': instance.unit,
  'tax_rate': instance.taxRate,
  'notes': instance.notes,
  'brand': instance.brand,
  'model': instance.model,
  'weight': instance.weight,
  'dimensions': instance.dimensions,
  'color': instance.color,
  'material': instance.material,
  'min_quantity': instance.minQuantity,
  'max_quantity': instance.maxQuantity,
  'is_active': instance.isActive,
  'has_tax': instance.hasTax,
  'track_inventory': instance.trackInventory,
  'status': instance.status,
  'company_id': instance.companyId,
  'product_category_id': instance.categoryId,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'id': instance.id,
  'image': instance.image,
};
