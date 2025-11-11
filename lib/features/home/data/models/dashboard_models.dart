import 'package:json_annotation/json_annotation.dart';

part 'dashboard_models.g.dart';

@JsonSerializable()
class DashboardResponse {
  final bool success;
  final DashboardData data;

  DashboardResponse({required this.success, required this.data});

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardResponseToJson(this);
}

@JsonSerializable()
class DashboardData {
  // Basic counts and totals
  @JsonKey(name: 'tax_invoices_count')
  final int taxInvoicesCount;
  @JsonKey(name: 'tax_invoices_total')
  final String taxInvoicesTotal;
  @JsonKey(name: 'invoices_count')
  final int invoicesCount;
  @JsonKey(name: 'new_invoices_count')
  final int newInvoicesCount;
  @JsonKey(name: 'returned_invoices_count')
  final int returnedInvoicesCount;
  @JsonKey(name: 'returned_invoices_total')
  final int returnedInvoicesTotal;
  @JsonKey(name: 'expenses_total')
  final String expensesTotal;
  @JsonKey(name: 'monthly_expenses_total')
  final double monthlyExpensesTotal;
  @JsonKey(name: 'customers_count')
  final int customersCount;
  @JsonKey(name: 'new_customers_count')
  final int newCustomersCount;
  @JsonKey(name: 'products_count')
  final int productsCount;
  @JsonKey(name: 'new_products_count')
  final int newProductsCount;
  @JsonKey(name: 'sales_total')
  final String salesTotal;
  @JsonKey(name: 'sales_growth_percentage')
  final double salesGrowthPercentage;
  @JsonKey(name: 'net_profit')
  final double netProfit;
  @JsonKey(name: 'profit_growth_percentage')
  final double profitGrowthPercentage;

  // Complex data structures
  @JsonKey(name: 'top_products')
  final List<TopProduct> topProducts;
  @JsonKey(name: 'sales_categories')
  final List<SalesCategory> salesCategories;
  @JsonKey(name: 'monthly_labels')
  final List<String> monthlyLabels;
  @JsonKey(name: 'monthly_sales_data')
  final List<double> monthlySalesData;
  @JsonKey(name: 'monthly_invoices_data')
  final List<double> monthlyInvoicesData;
  @JsonKey(name: 'monthly_tax_invoices_data')
  final List<double> monthlyTaxInvoicesData;
  @JsonKey(name: 'monthly_returned_invoices_data')
  final List<double> monthlyReturnedInvoicesData;

  DashboardData({
    required this.taxInvoicesCount,
    required this.taxInvoicesTotal,
    required this.invoicesCount,
    required this.newInvoicesCount,
    required this.returnedInvoicesCount,
    required this.returnedInvoicesTotal,
    required this.expensesTotal,
    required this.monthlyExpensesTotal,
    required this.customersCount,
    required this.newCustomersCount,
    required this.productsCount,
    required this.newProductsCount,
    required this.salesTotal,
    required this.salesGrowthPercentage,
    required this.netProfit,
    required this.profitGrowthPercentage,
    required this.topProducts,
    required this.salesCategories,
    required this.monthlyLabels,
    required this.monthlySalesData,
    required this.monthlyInvoicesData,
    required this.monthlyTaxInvoicesData,
    required this.monthlyReturnedInvoicesData,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    double toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0.0;
      return 0.0;
    }

    int toInt(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toInt();
      if (v is String) return int.tryParse(v.split('.').first) ?? 0;
      return 0;
    }

    final data = DashboardData(
      taxInvoicesCount: toInt(json['tax_invoices_count']),
      taxInvoicesTotal: (json['tax_invoices_total'] ?? '').toString(),
      invoicesCount: toInt(json['invoices_count']),
      newInvoicesCount: toInt(json['new_invoices_count']),
      returnedInvoicesCount: toInt(json['returned_invoices_count']),
      returnedInvoicesTotal: toInt(json['returned_invoices_total']),
      expensesTotal: (json['expenses_total'] ?? '').toString(),
      monthlyExpensesTotal: toDouble(json['monthly_expenses_total']),
      customersCount: toInt(json['customers_count']),
      newCustomersCount: toInt(json['new_customers_count']),
      productsCount: toInt(json['products_count']),
      newProductsCount: toInt(json['new_products_count']),
      salesTotal: (json['sales_total'] ?? '').toString(),
      salesGrowthPercentage: toDouble(json['sales_growth_percentage']),
      netProfit: toDouble(json['net_profit']),
      profitGrowthPercentage: toDouble(json['profit_growth_percentage']),
      topProducts: ((json['top_products'] as List?) ?? const [])
          .map((e) => TopProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      salesCategories: ((json['sales_categories'] as List?) ?? const [])
          .map((e) => SalesCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlyLabels: ((json['monthly_labels'] as List?) ?? const [])
          .map((e) => e.toString())
          .toList(),
      monthlySalesData: ((json['monthly_sales_data'] as List?) ?? const [])
          .map(toDouble)
          .toList(),
      monthlyInvoicesData: ((json['monthly_invoices_data'] as List?) ?? const [])
          .map(toDouble)
          .toList(),
      monthlyTaxInvoicesData:
          ((json['monthly_tax_invoices_data'] as List?) ?? const [])
              .map(toDouble)
              .toList(),
      monthlyReturnedInvoicesData:
          ((json['monthly_returned_invoices_data'] as List?) ?? const [])
              .map(toDouble)
              .toList(),
    );
    return data;
  }

  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);
}

@JsonSerializable()
class TopProduct {
  final Product? product;
  @JsonKey(name: 'total_quantity')
  final double totalQuantity;
  @JsonKey(name: 'total_amount')
  final double totalAmount;

  TopProduct({
    this.product,
    required this.totalQuantity,
    required this.totalAmount,
  });

  factory TopProduct.fromJson(Map<String, dynamic> json) =>
      _$TopProductFromJson(json);

  Map<String, dynamic> toJson() => _$TopProductToJson(this);
}

@JsonSerializable()
class Product {
  final int id;
  @JsonKey(name: 'company_id')
  final int companyId;
  @JsonKey(name: 'product_category_id')
  final int? productCategoryId;
  final String name;
  final String? sku;
  final String? description;
  final String price;
  final String? cost;
  @JsonKey(name: 'tax_rate')
  final String taxRate;
  @JsonKey(name: 'tax_rate_backup')
  final String? taxRateBackup;
  final int quantity;
  @JsonKey(name: 'quantity_backup')
  final int? quantityBackup;
  final String? barcode;
  final String? unit;
  @JsonKey(name: 'has_tax')
  final bool hasTax;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'track_inventory')
  final bool trackInventory;
  final String status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final String? image;

  Product({
    required this.id,
    required this.companyId,
    this.productCategoryId,
    required this.name,
    this.sku,
    this.description,
    required this.price,
    this.cost,
    required this.taxRate,
    this.taxRateBackup,
    required this.quantity,
    this.quantityBackup,
    this.barcode,
    this.unit,
    required this.hasTax,
    required this.isActive,
    required this.trackInventory,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class SalesCategory {
  final String category;
  @JsonKey(name: 'total_amount')
  final double totalAmount;

  SalesCategory({required this.category, required this.totalAmount});

  factory SalesCategory.fromJson(Map<String, dynamic> json) =>
      _$SalesCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SalesCategoryToJson(this);
}
