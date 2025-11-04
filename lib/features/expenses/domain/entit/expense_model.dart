class ExpenseModel {
  final int id;
  final int companyId;
  final int expenseCategoryId;
  final String title;
  final String? description;
  final double amount;
  final String expenseDate;
  final String? referenceNumber;
  final String paymentMethod;
  final String? notes;
  final String? attachment;
  final String createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ExpenseModel({
    required this.id,
    required this.companyId,
    required this.expenseCategoryId,
    required this.title,
    this.description,
    required this.amount,
    required this.expenseDate,
    this.referenceNumber,
    required this.paymentMethod,
    this.notes,
    this.attachment,
    required this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  String get createdAtString => createdAt != null
      ? '${createdAt!.day.toString().padLeft(2, '0')}/${createdAt!.month.toString().padLeft(2, '0')}/${createdAt!.year}'
      : '';

  String get updatedAtString => updatedAt != null
      ? '${updatedAt!.day.toString().padLeft(2, '0')}/${updatedAt!.month.toString().padLeft(2, '0')}/${updatedAt!.year}'
      : '';

  String get formattedAmount => '\$${amount.toStringAsFixed(2)}';

  String get formattedDate {
    try {
      final date = DateTime.parse(expenseDate);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return expenseDate;
    }
  }

  ExpenseModel copyWith({
    int? id,
    int? companyId,
    int? expenseCategoryId,
    String? title,
    String? description,
    double? amount,
    String? expenseDate,
    String? referenceNumber,
    String? paymentMethod,
    String? notes,
    String? attachment,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      expenseCategoryId: expenseCategoryId ?? this.expenseCategoryId,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      expenseDate: expenseDate ?? this.expenseDate,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      notes: notes ?? this.notes,
      attachment: attachment ?? this.attachment,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExpenseModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'ExpenseModel(id: $id, companyId: $companyId, expenseCategoryId: $expenseCategoryId, title: $title, description: $description, amount: $amount, expenseDate: $expenseDate, paymentMethod: $paymentMethod)';
  }
}
