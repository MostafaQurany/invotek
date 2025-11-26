import 'package:invotek/features/invoices/domain/entities/api_request_entity.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_customer_entity.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_item_entity.dart';

enum DocumentType { invoice, credit, none }

class InvoiceEntity {
  final int? id;
  final int? invoiceId;
  final String? invoiceNumber;
  final String? taxUid;
  final String? qrCode;
  final String? invoiceType;
  final String? documentType;
  final String? status;
  final String? errorMessage;
  final String? issueDate;
  final String? customerName;
  final String? paymentMethodCode;
  final String? subtotal;
  final String? taxAmount;
  final String? discount;
  final String? total;
  final String? description;
  final String? sentAt;
  final String? createdAt;
  final String? updatedAt;
  final int? companyId;
  final int? customerId;
  final List<InvoiceItemEntity>? items;
  final InvoiceCustomerEntity? customer;
  final ApiRequestEntity? apiRequest;

  const InvoiceEntity({
    this.id,
    this.invoiceId,
    this.invoiceNumber,
    this.taxUid,
    this.qrCode,
    this.invoiceType,
    this.documentType,
    this.status,
    this.errorMessage,
    this.issueDate,
    this.customerName,
    this.paymentMethodCode,
    this.subtotal,
    this.taxAmount,
    this.discount,
    this.total,
    this.description,
    this.sentAt,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.customerId,
    this.items,
    this.customer,
    this.apiRequest,
  });

  InvoiceEntity copyWith({
    int? id,
    int? invoiceId,
    String? invoiceNumber,
    String? taxUid,
    String? qrCode,
    String? invoiceType,
    String? documentType,
    String? status,
    String? errorMessage,
    String? issueDate,
    String? customerName,
    String? paymentMethodCode,
    String? subtotal,
    String? taxAmount,
    String? discount,
    String? total,
    String? description,
    String? sentAt,
    String? createdAt,
    String? updatedAt,
    int? companyId,
    int? customerId,
    List<InvoiceItemEntity>? items,
    InvoiceCustomerEntity? customer,
    ApiRequestEntity? apiRequest,
  }) {
    return InvoiceEntity(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      taxUid: taxUid ?? this.taxUid,
      qrCode: qrCode ?? this.qrCode,
      invoiceType: invoiceType ?? this.invoiceType,
      documentType: documentType ?? this.documentType,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      issueDate: issueDate ?? this.issueDate,
      customerName: customerName ?? this.customerName,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      subtotal: subtotal ?? this.subtotal,
      taxAmount: taxAmount ?? this.taxAmount,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      description: description ?? this.description,
      sentAt: sentAt ?? this.sentAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      companyId: companyId ?? this.companyId,
      customerId: customerId ?? this.customerId,
      items: items ?? this.items,
      customer: customer ?? this.customer,
      apiRequest: apiRequest ?? this.apiRequest,
    );
  }
}
