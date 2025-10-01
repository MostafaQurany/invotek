// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deactivating_tax_integration_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeactivatingTaxIntegrationResponses
_$DeactivatingTaxIntegrationResponsesFromJson(Map<String, dynamic> json) =>
    DeactivatingTaxIntegrationResponses(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DeactivatingTaxIntegrationResponsesToJson(
  DeactivatingTaxIntegrationResponses instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
