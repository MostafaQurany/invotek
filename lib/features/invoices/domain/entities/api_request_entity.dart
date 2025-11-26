import 'package:invotek/features/invoices/domain/entities/invoice_item_entity.dart';

class ApiRequestEntity {
  final String? invoiceNumber;
  final String? invoiceDate;
  final String? description;
  final String? paymentMethodCode;
  final String? customerName;
  final List<InvoiceItemEntity>? items;
  final String? subtotal;
  final String? taxAmount;
  final String? discount;
  final String? total;
  final String? creditNumber;
  final String? creditDate;
  final String? originalInvoiceNumber;
  final String? originalUid;
  final String? originalTotal;
  final String? returnReason;

  const ApiRequestEntity({
    this.invoiceNumber,
    this.invoiceDate,
    this.description,
    this.paymentMethodCode,
    this.customerName,
    this.items,
    this.subtotal,
    this.taxAmount,
    this.discount,
    this.total,
    this.creditNumber,
    this.creditDate,
    this.originalInvoiceNumber,
    this.originalUid,
    this.originalTotal,
    this.returnReason,
  });

  ApiRequestEntity copyWith({
    String? invoiceNumber,
    String? invoiceDate,
    String? description,
    String? paymentMethodCode,
    String? customerName,
    List<InvoiceItemEntity>? items,
    String? subtotal,
    String? taxAmount,
    String? discount,
    String? total,
    String? creditNumber,
    String? creditDate,
    String? originalInvoiceNumber,
    String? originalUid,
    String? originalTotal,
    String? returnReason,
  }) {
    return ApiRequestEntity(
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      description: description ?? this.description,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      customerName: customerName ?? this.customerName,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      taxAmount: taxAmount ?? this.taxAmount,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      creditNumber: creditNumber ?? this.creditNumber,
      creditDate: creditDate ?? this.creditDate,
      originalInvoiceNumber: originalInvoiceNumber ?? this.originalInvoiceNumber,
      originalUid: originalUid ?? this.originalUid,
      originalTotal: originalTotal ?? this.originalTotal,
      returnReason: returnReason ?? this.returnReason,
    );
  }
}

