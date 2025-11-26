// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_credit_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCreditInvoiceRequest _$CreateCreditInvoiceRequestFromJson(
  Map<String, dynamic> json,
) => CreateCreditInvoiceRequest(
  issueDate: json['issue_date'] as String,
  returnReason: json['return_reason'] as String,
  description: json['description'] as String?,
  action: json['action'] as String,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => CreateInvoiceItemRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: json['subtotal'] as String,
  taxAmount: json['tax_amount'] as String,
  discount: json['discount'] as String,
  total: json['total'] as String,
);

Map<String, dynamic> _$CreateCreditInvoiceRequestToJson(
  CreateCreditInvoiceRequest instance,
) => <String, dynamic>{
  'issue_date': instance.issueDate,
  'return_reason': instance.returnReason,
  'description': instance.description,
  'action': instance.action,
  'items': instance.items,
  'subtotal': instance.subtotal,
  'tax_amount': instance.taxAmount,
  'discount': instance.discount,
  'total': instance.total,
};
