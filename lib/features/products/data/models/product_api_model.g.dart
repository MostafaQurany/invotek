// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductApiModel _$ProductApiModelFromJson(Map<String, dynamic> json) =>
    ProductApiModel(
      id: (json['id'] as num).toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      productCategoryId: (json['productCategoryId'] as num?)?.toInt(),
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      cost: json['cost'] as String?,
      taxRate: json['tax_rate'] as String?,
      taxRateBackup: json['tax_rate_backup'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      quantityBackup: (json['quantity_backup'] as num?)?.toInt(),
      barcode: json['barcode'] as String?,
      unit: json['unit'] as String?,
      hasTax: json['has_tax'] as bool?,
      isActive: json['is_active'] as bool?,
      trackInventory: json['track_inventory'] as bool?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductApiModelToJson(ProductApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'productCategoryId': instance.productCategoryId,
      'name': instance.name,
      'sku': instance.sku,
      'description': instance.description,
      'price': instance.price,
      'cost': instance.cost,
      'tax_rate': instance.taxRate,
      'tax_rate_backup': instance.taxRateBackup,
      'quantity': instance.quantity,
      'quantity_backup': instance.quantityBackup,
      'barcode': instance.barcode,
      'unit': instance.unit,
      'has_tax': instance.hasTax,
      'is_active': instance.isActive,
      'track_inventory': instance.trackInventory,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
    };
