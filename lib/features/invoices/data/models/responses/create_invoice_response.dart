import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_invoice_response.g.dart';

@JsonSerializable()
class CreateInvoiceResponse {
  final bool success;
  final String message;
  final InvoiceModel data;

  CreateInvoiceResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CreateInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceResponseToJson(this);
}
