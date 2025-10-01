import 'package:json_annotation/json_annotation.dart';


part 'create_expense_category_response.g.dart';

@JsonSerializable()
class CreateExpenseCategoryResponse {
  final int? id;
  final String? name;
  final String? status;
  final String? description;
  final String? color;
  final String? icon;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final String? message;
  final bool? success;

  CreateExpenseCategoryResponse({
    this.id,
    this.name,
    this.status,
    this.description,
    this.color,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.message,
    this.success,
  });

  factory CreateExpenseCategoryResponse.fromJson(Map<String, dynamic> json) {
    // Handle direct response (API returns category data directly)
    if (json.containsKey('id') && json.containsKey('name')) {
      return CreateExpenseCategoryResponse(
        id: json['id'] as int?,
        name: json['name'] as String?,
        status: json['status'] as String?,
        description: json['description'] as String?,
        color: json['color'] as String?,
        icon: json['icon'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        message: 'Category created successfully',
        success: true,
      );
    }
    // Handle wrapped response (if API changes to wrap data)
    return _$CreateExpenseCategoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateExpenseCategoryResponseToJson(this);
}
