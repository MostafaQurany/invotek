class InvoiceItemModel {
  final String? id;
  final String? productId;
  final String? productName;
  final String? productSku;
  final double quantity;
  final double price;
  final double discount;
  final double total;

  const InvoiceItemModel({
    this.id,
    this.productId,
    this.productName,
    this.productSku,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.total,
  });

  InvoiceItemModel copyWith({
    String? id,
    String? productId,
    String? productName,
    String? productSku,
    double? quantity,
    double? price,
    double? discount,
    double? total,
  }) {
    return InvoiceItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productSku: productSku ?? this.productSku,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      total: total ?? this.total,
    );
  }

  double get calculatedTotal {
    return (quantity * price) - discount;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'productSku': productSku,
      'quantity': quantity,
      'price': price,
      'discount': discount,
      'total': total,
    };
  }

  factory InvoiceItemModel.fromJson(Map<String, dynamic> json) {
    return InvoiceItemModel(
      id: json['id'],
      productId: json['productId'],
      productName: json['productName'],
      productSku: json['productSku'],
      quantity: (json['quantity'] ?? 0).toDouble(),
      price: (json['price'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toDouble(),
      total: (json['total'] ?? 0).toDouble(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InvoiceItemModel &&
        other.id == id &&
        other.productId == productId &&
        other.productName == productName &&
        other.productSku == productSku &&
        other.quantity == quantity &&
        other.price == price &&
        other.discount == discount &&
        other.total == total;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      productId,
      productName,
      productSku,
      quantity,
      price,
      discount,
      total,
    );
  }
}



