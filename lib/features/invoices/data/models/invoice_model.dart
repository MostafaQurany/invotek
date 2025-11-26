import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:invotek/features/invoices/domain/entities/api_request_entity.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_model.g.dart';

enum DocumentType { invoice, credit, none }

@JsonSerializable()
class InvoiceModel {
  final int? id;

  @JsonKey(name: "invoice_id")
  final int? invoiceId;
  @JsonKey(name: "invoice_number")
  final String? invoiceNumber;
  @JsonKey(name: "tax_uid")
  final String? taxUid;
  @JsonKey(name: "qr_code")
  final String? qrCode;
  @JsonKey(name: "invoice_type")
  final String? invoiceType;
  @JsonKey(name: "document_type")
  final String? documentType;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  @JsonKey(name: "issue_date")
  final String? issueDate;
  @JsonKey(name: "customer_name")
  final String? customerName;
  @JsonKey(name: "payment_method_code")
  final String? paymentMethodCode;
  @JsonKey(name: "subtotal")
  final String? subtotal;
  @JsonKey(name: "tax_amount")
  final String? taxAmount;
  @JsonKey(name: "discount")
  final String? discount;
  @JsonKey(name: "total")
  final String? total;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "sent_at")
  final String? sentAt;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "company_id")
  final int? companyId;
  @JsonKey(name: "customer_id", fromJson: _customerIdFromJson)
  final int? customerId;
  @JsonKey(name: "api_request")
  final ApiRequestInvoiceModel? apiRequest;
  static int? _customerIdFromJson(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String && value.isNotEmpty) {
      return int.tryParse(value);
    }
    if (value is num) return value.toInt();
    return null;
  }

  @JsonKey(name: "items")
  final List<InvoiceItem>? items;
  @JsonKey(name: "customer")
  final InvoiceCustomerModel? customer;
  @JsonKey(name: "returned_invoices")
  final List<InvoiceModel>? returnedInvoices;

  InvoiceModel({
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
    this.apiRequest,
    this.customer,
    this.returnedInvoices,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);

  InvoiceEntity toEntity() {
    return InvoiceEntity(
      id: id,
      invoiceId: invoiceId,
      invoiceNumber: invoiceNumber,
      taxUid: taxUid,
      qrCode: qrCode,
      invoiceType: invoiceType,
      documentType: documentType,
      status: status,
      errorMessage: errorMessage,
      issueDate: issueDate,
      customerName: customerName,
      paymentMethodCode: paymentMethodCode,
      subtotal: subtotal,
      taxAmount: taxAmount,
      discount: discount,
      total: total,
      description: description,
      sentAt: sentAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      companyId: companyId,
      customerId: customerId,
      items: items?.map((item) => item.toEntity()).toList(),
      customer: customer?.toEntity(),
      apiRequest: apiRequest?.toEntity(),
      returnedInvoices: returnedInvoices?.map((invoice) => invoice.toEntity()).toList(),
    );
  }
}

/*
    "api_request": {
                    "invoice_number": "CN-5981-001",
                    "invoice_date": "2025-11-25",
                    "description": null,
                    "payment_method_code": "011",
                    "customer_name": "gyhujkgyj",
                    "items": [
                        {
                            "name": "uhhgj",
                            "quantity": "1.00",
                            "price": "55.00",
                            "discount": "0.00",
                            "tax_percent": "0.00",
                            "tax_amount": "0.00",
                            "total": "55.00"
                        }
                    ],
                    "subtotal": "55.00",
                    "tax_amount": "0.00",
                    "discount": "0.00",
                    "total": "55.00",
                    "credit_number": "CN-5981-001",
                    "credit_date": "2025-11-25",
                    "original_invoice_number": "INV1",
                    "original_uid": "33a983be-0a75-4703-9083-394df77f5890",
                    "original_total": "55.00",
                    "return_reason": "test"
                },
 */

@JsonSerializable()
class ApiRequestInvoiceModel {
  @JsonKey(name: "invoice_number")
  final String? invoiceNumber;
  @JsonKey(name: "invoice_date")
  final String? invoiceDate;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "payment_method_code")
  final String? paymentMethodCode;
  @JsonKey(name: "customer_name")
  final String? customerName;
  @JsonKey(name: "items")
  final List<InvoiceItem>? items;
  @JsonKey(name: "subtotal")
  final String? subtotal;
  @JsonKey(name: "tax_amount")
  final String? taxAmount;
  @JsonKey(name: "discount")
  final String? discount;
  @JsonKey(name: "total")
  final String? total;
  @JsonKey(name: "credit_number")
  final String? creditNumber;
  @JsonKey(name: "credit_date")
  final String? creditDate;
  @JsonKey(name: "original_invoice_number")
  final String? originalInvoiceNumber;
  @JsonKey(name: "original_uid")
  final String? originalUid;
  @JsonKey(name: "original_total")
  final String? originalTotal;
  @JsonKey(name: "return_reason")
  final String? returnReason;

  ApiRequestInvoiceModel({
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

  factory ApiRequestInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ApiRequestInvoiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiRequestInvoiceModelToJson(this);

  ApiRequestEntity toEntity() {
    return ApiRequestEntity(
      invoiceNumber: invoiceNumber,
      invoiceDate: invoiceDate,
      description: description,
      paymentMethodCode: paymentMethodCode,
      customerName: customerName,
      items: items?.map((item) => item.toEntity()).toList(),
      subtotal: subtotal,
      taxAmount: taxAmount,
      discount: discount,
      total: total,
      creditNumber: creditNumber,
      creditDate: creditDate,
      originalInvoiceNumber: originalInvoiceNumber,
      originalUid: originalUid,
      originalTotal: originalTotal,
      returnReason: returnReason,
    );
  }
}
