import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_invoice_response.g.dart';

@JsonSerializable()
class UpdateInvoiceResponse {
  final bool success;
  final String message;
  final InvoiceModel data;

  UpdateInvoiceResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdateInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInvoiceResponseToJson(this);
}
