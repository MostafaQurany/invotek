// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_invoices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllInvoicesResponse _$GetAllInvoicesResponseFromJson(
  Map<String, dynamic> json,
) => GetAllInvoicesResponse(
  data: GetAllInvoicesBody.fromJson(json['data'] as Map<String, dynamic>),
  success: json['success'] as bool,
);

Map<String, dynamic> _$GetAllInvoicesResponseToJson(
  GetAllInvoicesResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

GetAllInvoicesBody _$GetAllInvoicesBodyFromJson(Map<String, dynamic> json) =>
    GetAllInvoicesBody(
      lastPage: json['last_page'] as num?,
      total: json['total'] as num?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InvoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['current_page'] as num?,
    );

Map<String, dynamic> _$GetAllInvoicesBodyToJson(GetAllInvoicesBody instance) =>
    <String, dynamic>{
      'total': instance.total,
      'last_page': instance.lastPage,
      'current_page': instance.currentPage,
      'data': instance.data,
    };
