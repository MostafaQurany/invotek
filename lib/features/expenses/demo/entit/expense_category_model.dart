class ExpenseCategoryModel {
  final int id;
  final String name;
  final String status;
  final String? description;
  final String? color;
  final String? icon;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ExpenseCategoryModel({
    required this.id,
    required this.name,
    required this.status,
    this.description,
    this.color,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  String get createdAtString => createdAt != null
      ? '${createdAt!.day.toString().padLeft(2, '0')}/${createdAt!.month.toString().padLeft(2, '0')}/${createdAt!.year}'
      : '';

  String get updatedAtString => updatedAt != null
      ? '${updatedAt!.day.toString().padLeft(2, '0')}/${updatedAt!.month.toString().padLeft(2, '0')}/${updatedAt!.year}'
      : '';

  ExpenseCategoryModel copyWith({
    int? id,
    String? name,
    String? status,
    String? description,
    String? color,
    String? icon,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ExpenseCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      description: description ?? this.description,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExpenseCategoryModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'ExpenseCategoryModel(id: $id, name: $name, status: $status)';
  }
}
