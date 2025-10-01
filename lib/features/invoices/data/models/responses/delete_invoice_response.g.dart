// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteInvoiceResponse _$DeleteInvoiceResponseFromJson(
  Map<String, dynamic> json,
) => DeleteInvoiceResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$DeleteInvoiceResponseToJson(
  DeleteInvoiceResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
