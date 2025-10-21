// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInvoiceRequest _$UpdateInvoiceRequestFromJson(
  Map<String, dynamic> json,
) => UpdateInvoiceRequest(
  id: json['id'] as String?,
  status: json['status'] as String?,
  customerId: json['customer_id'] as String?,
  customerName: json['customer_name'] as String?,
  customerEmail: json['customer_email'] as String?,
  customerPhone: json['customer_phone'] as String?,
  customerAddress: json['customer_address'] as String?,
  subtotal: json['subtotal'] as String?,
  taxAmount: json['tax_amount'] as String?,
  discount: json['discount'] as String?,
  total: json['total'] as String?,
  issueDate: json['issue_date'] as String?,
  description: json['description'] as String?,
  paymentMethodCode: json['payment_method_code'] as String?,
  action: json['action'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => UpdateInvoiceItemRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpdateInvoiceRequestToJson(
  UpdateInvoiceRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'customer_id': instance.customerId,
  'customer_name': instance.customerName,
  'customer_email': instance.customerEmail,
  'customer_phone': instance.customerPhone,
  'customer_address': instance.customerAddress,
  'subtotal': instance.subtotal,
  'tax_amount': instance.taxAmount,
  'discount': instance.discount,
  'total': instance.total,
  'issue_date': instance.issueDate,
  'description': instance.description,
  'payment_method_code': instance.paymentMethodCode,
  'action': instance.action,
  'items': instance.items,
};

UpdateInvoiceItemRequest _$UpdateInvoiceItemRequestFromJson(
  Map<String, dynamic> json,
) => UpdateInvoiceItemRequest(
  name: json['name'] as String?,
  quantity: json['quantity'] as String?,
  price: json['price'] as String?,
  discount: json['discount'] as String?,
  taxPercent: json['tax_percent'] as String?,
  taxAmount: json['tax_amount'] as String?,
  total: json['total'] as String?,
  productName: json['product_name'] as String?,
  productDescription: json['product_description'] as String?,
  productCategory: json['product_category'] as String?,
  productId: json['product_id'] as String?,
);

Map<String, dynamic> _$UpdateInvoiceItemRequestToJson(
  UpdateInvoiceItemRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'quantity': instance.quantity,
  'price': instance.price,
  'discount': instance.discount,
  'tax_percent': instance.taxPercent,
  'tax_amount': instance.taxAmount,
  'total': instance.total,
  'product_name': instance.productName,
  'product_description': instance.productDescription,
  'product_category': instance.productCategory,
  'product_id': instance.productId,
};
