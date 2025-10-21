class DashboardResponse {
  final bool success;
  final DashboardData data;

  DashboardResponse({required this.success, required this.data});

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
      success: json['success'] ?? false,
      data: DashboardData.fromJson(json['data'] ?? {}),
    );
  }
}

class DashboardData {
  final int taxInvoicesCount;
  final String taxInvoicesTotal;
  final int invoicesCount;
  final int newInvoicesCount;
  final int returnedInvoicesCount;
  final double returnedInvoicesTotal;
  final String expensesTotal;
  final double monthlyExpensesTotal;
  final int customersCount;
  final int newCustomersCount;
  final int productsCount;
  final int newProductsCount;
  final String salesTotal;
  final double salesGrowthPercentage;
  final double netProfit;
  final double profitGrowthPercentage;
  final List<TopProduct> topProducts;
  final List<SalesCategory> salesCategories;
  final List<String> monthlyLabels;
  final List<double> monthlySalesData;
  final List<double> monthlyInvoicesData;
  final List<double> monthlyTaxInvoicesData;
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
    return DashboardData(
      taxInvoicesCount: json['tax_invoices_count'] ?? 0,
      taxInvoicesTotal: json['tax_invoices_total']?.toString() ?? '0',
      invoicesCount: json['invoices_count'] ?? 0,
      newInvoicesCount: json['new_invoices_count'] ?? 0,
      returnedInvoicesCount: json['returned_invoices_count'] ?? 0,
      returnedInvoicesTotal: (json['returned_invoices_total'] ?? 0).toDouble(),
      expensesTotal: json['expenses_total']?.toString() ?? '0',
      monthlyExpensesTotal: (json['monthly_expenses_total'] ?? 0).toDouble(),
      customersCount: json['customers_count'] ?? 0,
      newCustomersCount: json['new_customers_count'] ?? 0,
      productsCount: json['products_count'] ?? 0,
      newProductsCount: json['new_products_count'] ?? 0,
      salesTotal: json['sales_total']?.toString() ?? '0',
      salesGrowthPercentage: (json['sales_growth_percentage'] ?? 0).toDouble(),
      netProfit: (json['net_profit'] ?? 0).toDouble(),
      profitGrowthPercentage: (json['profit_growth_percentage'] ?? 0)
          .toDouble(),
      topProducts:
          (json['top_products'] as List<dynamic>?)
              ?.map((item) => TopProduct.fromJson(item))
              .toList() ??
          [],
      salesCategories:
          (json['sales_categories'] as List<dynamic>?)
              ?.map((item) => SalesCategory.fromJson(item))
              .toList() ??
          [],
      monthlyLabels:
          (json['monthly_labels'] as List<dynamic>?)
              ?.map((item) => item.toString())
              .toList() ??
          [],
      monthlySalesData:
          (json['monthly_sales_data'] as List<dynamic>?)
              ?.map<double>((item) => (item ?? 0).toDouble())
              .toList() ??
          <double>[],
      monthlyInvoicesData:
          (json['monthly_invoices_data'] as List<dynamic>?)
              ?.map<double>((item) => (item ?? 0).toDouble())
              .toList() ??
          <double>[],
      monthlyTaxInvoicesData:
          (json['monthly_tax_invoices_data'] as List<dynamic>?)
              ?.map<double>((item) => (item ?? 0).toDouble())
              .toList() ??
          <double>[],
      monthlyReturnedInvoicesData:
          (json['monthly_returned_invoices_data'] as List<dynamic>?)
              ?.map<double>((item) => (item ?? 0).toDouble())
              .toList() ??
          <double>[],
    );
  }
}

class TopProduct {
  final Product? product;
  final int totalQuantity;
  final double totalAmount;

  TopProduct({
    this.product,
    required this.totalQuantity,
    required this.totalAmount,
  });

  factory TopProduct.fromJson(Map<String, dynamic> json) {
    return TopProduct(
      product: json['product'] != null
          ? Product.fromJson(json['product'])
          : null,
      totalQuantity: json['total_quantity'] ?? 0,
      totalAmount: (json['total_amount'] ?? 0).toDouble(),
    );
  }
}

class Product {
  final int id;
  final int companyId;
  final int? productCategoryId;
  final String name;
  final String? sku;
  final String? description;
  final String price;
  final String? cost;
  final String taxRate;
  final int quantity;
  final String? barcode;
  final String? unit;
  final bool hasTax;
  final bool isActive;
  final bool trackInventory;
  final String status;
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
    required this.quantity,
    this.barcode,
    this.unit,
    required this.hasTax,
    required this.isActive,
    required this.trackInventory,
    required this.status,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      companyId: json['company_id'] ?? 0,
      productCategoryId: json['product_category_id'],
      name: json['name'] ?? '',
      sku: json['sku'],
      description: json['description'],
      price: json['price']?.toString() ?? '0',
      cost: json['cost']?.toString(),
      taxRate: json['tax_rate']?.toString() ?? '0',
      quantity: json['quantity'] ?? 0,
      barcode: json['barcode'],
      unit: json['unit'],
      hasTax: json['has_tax'] ?? false,
      isActive: json['is_active'] ?? false,
      trackInventory: json['track_inventory'] ?? false,
      status: json['status'] ?? '',
      image: json['image'],
    );
  }
}

class SalesCategory {
  final String category;
  final double totalAmount;

  SalesCategory({required this.category, required this.totalAmount});

  factory SalesCategory.fromJson(Map<String, dynamic> json) {
    return SalesCategory(
      category: json['category'] ?? '',
      totalAmount: (json['total_amount'] ?? 0).toDouble(),
    );
  }
}
