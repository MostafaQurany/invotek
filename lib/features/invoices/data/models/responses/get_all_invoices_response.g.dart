// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_invoices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllInvoicesResponse _$GetAllInvoicesResponseFromJson(
  Map<String, dynamic> json,
) => GetAllInvoicesResponse(
  body: GetAllInvoicesBody.fromJson(json['body'] as Map<String, dynamic>),
  success: json['success'] as bool,
);

Map<String, dynamic> _$GetAllInvoicesResponseToJson(
  GetAllInvoicesResponse instance,
) => <String, dynamic>{'success': instance.success, 'body': instance.body};

GetAllInvoicesBody _$GetAllInvoicesBodyFromJson(Map<String, dynamic> json) =>
    GetAllInvoicesBody(
      hasNextPage: json['next_page_url'] == null
          ? false
          : _nextPageUrlFromJson(json['next_page_url'] as String?),
      lastPage: json['last_page'] as num,
      total: json['total'] as num,
      data: (json['data'] as List<dynamic>)
          .map((e) => InvoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['current_page'] as num,
    );

Map<String, dynamic> _$GetAllInvoicesBodyToJson(GetAllInvoicesBody instance) =>
    <String, dynamic>{
      'total': instance.total,
      'next_page_url': _nextPageUrlToJson(instance.hasNextPage),
      'last_page': instance.lastPage,
      'current_page': instance.currentPage,
      'data': instance.data,
    };
