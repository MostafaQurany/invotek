import 'package:json_annotation/json_annotation.dart';

part 'deactivating_tax_integration_responses.g.dart';

@JsonSerializable()
class DeactivatingTaxIntegrationResponses {
  final bool success;
  final String message;
  final Map<String, dynamic> data;
  DeactivatingTaxIntegrationResponses({
    required this.success,
    required this.message,
    required this.data,
  });
  factory DeactivatingTaxIntegrationResponses.fromJson(
    Map<String, dynamic> json,
  ) => _$DeactivatingTaxIntegrationResponsesFromJson(json);
  Map<String, dynamic> toJson() =>
      _$DeactivatingTaxIntegrationResponsesToJson(this);
}
