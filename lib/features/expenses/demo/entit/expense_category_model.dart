class ExpenseCategoryModel {
  final int id;
  final String name;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ExpenseCategoryModel({
    required this.id,
    required this.name,
    required this.status,
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
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ExpenseCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
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
