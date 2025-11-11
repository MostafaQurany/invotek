// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) => InvoiceModel(
  id: (json['id'] as num?)?.toInt(),
  invoiceId: (json['invoice_id'] as num?)?.toInt(),
  invoiceNumber: json['invoice_number'] as String?,
  taxUid: json['tax_uid'] as String?,
  qrCode: json['qr_code'] as String?,
  invoiceType: json['invoice_type'] as String?,
  documentType: json['document_type'] as String?,
  status: json['status'] as String?,
  errorMessage: json['error_message'] as String?,
  issueDate: json['issue_date'] as String?,
  customerName: json['customer_name'] as String?,
  paymentMethodCode: json['payment_method_code'] as String?,
  subtotal: json['subtotal'] as String?,
  taxAmount: json['tax_amount'] as String?,
  discount: json['discount'] as String?,
  total: json['total'] as String?,
  description: json['description'] as String?,
  sentAt: json['sent_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  companyId: (json['company_id'] as num?)?.toInt(),
  customerId: InvoiceModel._customerIdFromJson(json['customer_id']),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => InvoiceItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  customer: json['customer'] == null
      ? null
      : InvoiceCustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InvoiceModelToJson(InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_id': instance.invoiceId,
      'invoice_number': instance.invoiceNumber,
      'tax_uid': instance.taxUid,
      'qr_code': instance.qrCode,
      'invoice_type': instance.invoiceType,
      'document_type': instance.documentType,
      'status': instance.status,
      'error_message': instance.errorMessage,
      'issue_date': instance.issueDate,
      'customer_name': instance.customerName,
      'payment_method_code': instance.paymentMethodCode,
      'subtotal': instance.subtotal,
      'tax_amount': instance.taxAmount,
      'discount': instance.discount,
      'total': instance.total,
      'description': instance.description,
      'sent_at': instance.sentAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'company_id': instance.companyId,
      'customer_id': instance.customerId,
      'items': instance.items,
      'customer': instance.customer,
    };
