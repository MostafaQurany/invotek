// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) => InvoiceItem(
  product: json['product'] == null
      ? null
      : ProductApiModel.fromJson(json['product'] as Map<String, dynamic>),
  id: (json['id'] as num?)?.toInt(),
  taxInvoiceId: (json['tax_invoice_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  quantity: json['quantity'] as String?,
  price: json['price'] as String?,
  discount: json['discount'] as String?,
  taxPercent: json['tax_percent'] as String?,
  taxAmount: json['tax_amount'] as String?,
  total: json['total'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  productId: (json['product_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$InvoiceItemToJson(InvoiceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tax_invoice_id': instance.taxInvoiceId,
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'discount': instance.discount,
      'tax_percent': instance.taxPercent,
      'tax_amount': instance.taxAmount,
      'total': instance.total,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'product_id': instance.productId,
      'product': instance.product,
    };
