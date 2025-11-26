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
  apiRequest: json['api_request'] == null
      ? null
      : ApiRequestInvoiceModel.fromJson(
          json['api_request'] as Map<String, dynamic>,
        ),
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
      'api_request': instance.apiRequest,
      'items': instance.items,
      'customer': instance.customer,
    };

ApiRequestInvoiceModel _$ApiRequestInvoiceModelFromJson(
  Map<String, dynamic> json,
) => ApiRequestInvoiceModel(
  invoiceNumber: json['invoice_number'] as String?,
  invoiceDate: json['invoice_date'] as String?,
  description: json['description'] as String?,
  paymentMethodCode: json['payment_method_code'] as String?,
  customerName: json['customer_name'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => InvoiceItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: json['subtotal'] as String?,
  taxAmount: json['tax_amount'] as String?,
  discount: json['discount'] as String?,
  total: json['total'] as String?,
  creditNumber: json['credit_number'] as String?,
  creditDate: json['credit_date'] as String?,
  originalInvoiceNumber: json['original_invoice_number'] as String?,
  originalUid: json['original_uid'] as String?,
  originalTotal: json['original_total'] as String?,
  returnReason: json['return_reason'] as String?,
);

Map<String, dynamic> _$ApiRequestInvoiceModelToJson(
  ApiRequestInvoiceModel instance,
) => <String, dynamic>{
  'invoice_number': instance.invoiceNumber,
  'invoice_date': instance.invoiceDate,
  'description': instance.description,
  'payment_method_code': instance.paymentMethodCode,
  'customer_name': instance.customerName,
  'items': instance.items,
  'subtotal': instance.subtotal,
  'tax_amount': instance.taxAmount,
  'discount': instance.discount,
  'total': instance.total,
  'credit_number': instance.creditNumber,
  'credit_date': instance.creditDate,
  'original_invoice_number': instance.originalInvoiceNumber,
  'original_uid': instance.originalUid,
  'original_total': instance.originalTotal,
  'return_reason': instance.returnReason,
};
