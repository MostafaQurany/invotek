// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInvoiceResponse _$CreateInvoiceResponseFromJson(
  Map<String, dynamic> json,
) => CreateInvoiceResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: InvoiceModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateInvoiceResponseToJson(
  CreateInvoiceResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
