class InvoiceItemEntity {
  final int? id;
  final int? taxInvoiceId;
  final String? name;
  final String? description;
  final String? quantity;
  final String? price;
  final String? discount;
  final String? taxPercent;
  final String? taxAmount;
  final String? total;
  final String? createdAt;
  final String? updatedAt;
  final int? productId;

  const InvoiceItemEntity({
    this.id,
    this.taxInvoiceId,
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.discount,
    this.taxPercent,
    this.taxAmount,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.productId,
  });

  InvoiceItemEntity copyWith({
    int? id,
    int? taxInvoiceId,
    String? name,
    String? description,
    String? quantity,
    String? price,
    String? discount,
    String? taxPercent,
    String? taxAmount,
    String? total,
    String? createdAt,
    String? updatedAt,
    int? productId,
  }) {
    return InvoiceItemEntity(
      id: id ?? this.id,
      taxInvoiceId: taxInvoiceId ?? this.taxInvoiceId,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      taxPercent: taxPercent ?? this.taxPercent,
      taxAmount: taxAmount ?? this.taxAmount,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productId: productId ?? this.productId,
    );
  }
}

