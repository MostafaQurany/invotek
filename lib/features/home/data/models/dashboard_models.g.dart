// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) =>
    DashboardResponse(
      success: json['success'] as bool,
      data: DashboardData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardResponseToJson(DashboardResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

DashboardData _$DashboardDataFromJson(
  Map<String, dynamic> json,
) => DashboardData(
  taxInvoicesCount: (json['tax_invoices_count'] as num).toInt(),
  taxInvoicesTotal: json['tax_invoices_total'] as String,
  invoicesCount: (json['invoices_count'] as num).toInt(),
  newInvoicesCount: (json['new_invoices_count'] as num).toInt(),
  returnedInvoicesCount: (json['returned_invoices_count'] as num).toInt(),
  returnedInvoicesTotal: (json['returned_invoices_total'] as num).toInt(),
  expensesTotal: json['expenses_total'] as String,
  monthlyExpensesTotal: (json['monthly_expenses_total'] as num).toDouble(),
  customersCount: (json['customers_count'] as num).toInt(),
  newCustomersCount: (json['new_customers_count'] as num).toInt(),
  productsCount: (json['products_count'] as num).toInt(),
  newProductsCount: (json['new_products_count'] as num).toInt(),
  salesTotal: json['sales_total'] as String,
  salesGrowthPercentage: (json['sales_growth_percentage'] as num).toDouble(),
  netProfit: (json['net_profit'] as num).toDouble(),
  profitGrowthPercentage: (json['profit_growth_percentage'] as num).toDouble(),
  topProducts: (json['top_products'] as List<dynamic>)
      .map((e) => TopProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  salesCategories: (json['sales_categories'] as List<dynamic>)
      .map((e) => SalesCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
  monthlyLabels: (json['monthly_labels'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  monthlySalesData: (json['monthly_sales_data'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  monthlyInvoicesData: (json['monthly_invoices_data'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  monthlyTaxInvoicesData: (json['monthly_tax_invoices_data'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  monthlyReturnedInvoicesData:
      (json['monthly_returned_invoices_data'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
);

Map<String, dynamic> _$DashboardDataToJson(DashboardData instance) =>
    <String, dynamic>{
      'tax_invoices_count': instance.taxInvoicesCount,
      'tax_invoices_total': instance.taxInvoicesTotal,
      'invoices_count': instance.invoicesCount,
      'new_invoices_count': instance.newInvoicesCount,
      'returned_invoices_count': instance.returnedInvoicesCount,
      'returned_invoices_total': instance.returnedInvoicesTotal,
      'expenses_total': instance.expensesTotal,
      'monthly_expenses_total': instance.monthlyExpensesTotal,
      'customers_count': instance.customersCount,
      'new_customers_count': instance.newCustomersCount,
      'products_count': instance.productsCount,
      'new_products_count': instance.newProductsCount,
      'sales_total': instance.salesTotal,
      'sales_growth_percentage': instance.salesGrowthPercentage,
      'net_profit': instance.netProfit,
      'profit_growth_percentage': instance.profitGrowthPercentage,
      'top_products': instance.topProducts,
      'sales_categories': instance.salesCategories,
      'monthly_labels': instance.monthlyLabels,
      'monthly_sales_data': instance.monthlySalesData,
      'monthly_invoices_data': instance.monthlyInvoicesData,
      'monthly_tax_invoices_data': instance.monthlyTaxInvoicesData,
      'monthly_returned_invoices_data': instance.monthlyReturnedInvoicesData,
    };

TopProduct _$TopProductFromJson(Map<String, dynamic> json) => TopProduct(
  product: json['product'] == null
      ? null
      : Product.fromJson(json['product'] as Map<String, dynamic>),
  totalQuantity: (json['total_quantity'] as num).toDouble(),
  totalAmount: (json['total_amount'] as num).toDouble(),
);

Map<String, dynamic> _$TopProductToJson(TopProduct instance) =>
    <String, dynamic>{
      'product': instance.product,
      'total_quantity': instance.totalQuantity,
      'total_amount': instance.totalAmount,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num).toInt(),
  companyId: (json['company_id'] as num).toInt(),
  productCategoryId: (json['product_category_id'] as num?)?.toInt(),
  name: json['name'] as String,
  sku: json['sku'] as String?,
  description: json['description'] as String?,
  price: json['price'] as String,
  cost: json['cost'] as String?,
  taxRate: json['tax_rate'] as String,
  taxRateBackup: json['tax_rate_backup'] as String?,
  quantity: (json['quantity'] as num).toInt(),
  quantityBackup: (json['quantity_backup'] as num?)?.toInt(),
  barcode: json['barcode'] as String?,
  unit: json['unit'] as String?,
  hasTax: json['has_tax'] as bool,
  isActive: json['is_active'] as bool,
  trackInventory: json['track_inventory'] as bool,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  image: json['image'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'product_category_id': instance.productCategoryId,
  'name': instance.name,
  'sku': instance.sku,
  'description': instance.description,
  'price': instance.price,
  'cost': instance.cost,
  'tax_rate': instance.taxRate,
  'tax_rate_backup': instance.taxRateBackup,
  'quantity': instance.quantity,
  'quantity_backup': instance.quantityBackup,
  'barcode': instance.barcode,
  'unit': instance.unit,
  'has_tax': instance.hasTax,
  'is_active': instance.isActive,
  'track_inventory': instance.trackInventory,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'image': instance.image,
};

SalesCategory _$SalesCategoryFromJson(Map<String, dynamic> json) =>
    SalesCategory(
      category: json['category'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$SalesCategoryToJson(SalesCategory instance) =>
    <String, dynamic>{
      'category': instance.category,
      'total_amount': instance.totalAmount,
    };
