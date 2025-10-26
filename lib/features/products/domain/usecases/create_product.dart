import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';

class CreateProduct implements UseCase<ProductModel, CreateProductParams> {
  final ProductsRepository repository;

  CreateProduct(this.repository);

  @override
  Future<ApiResult<ProductModel>> call(CreateProductParams params) async {
    return await repository.createProduct(
      name: params.name,
      description: params.description,
      price: params.price,
      cost: params.cost,
      quantity: params.quantity,
      sku: params.sku,
      barcode: params.barcode,
      unit: params.unit,
      taxRate: params.taxRate,
      notes: params.notes,
      brand: params.brand,
      model: params.model,
      weight: params.weight,
      dimensions: params.dimensions,
      color: params.color,
      material: params.material,
      minQuantity: params.minQuantity,
      maxQuantity: params.maxQuantity,
      isActive: params.isActive,
      hasTax: params.hasTax,
      trackInventory: params.trackInventory,
      status: params.status,
      categoryId: params.categoryId,
    );
  }
}

class CreateProductParams {
  final String name;
  final String? description;
  final String price;
  final String? cost;
  final int quantity;
  final String? sku;
  final String? barcode;
  final String? unit;
  final String? taxRate;
  final String? notes;
  final String? brand;
  final String? model;
  final String? weight;
  final String? dimensions;
  final String? color;
  final String? material;
  final int? minQuantity;
  final int? maxQuantity;
  final bool isActive;
  final bool hasTax;
  final bool trackInventory;
  final String status;
  final int? categoryId;

  const CreateProductParams({
    required this.name,
    this.description,
    required this.price,
    this.cost,
    required this.quantity,
    this.sku,
    this.barcode,
    this.unit,
    this.taxRate,
    this.notes,
    this.brand,
    this.model,
    this.weight,
    this.dimensions,
    this.color,
    this.material,
    this.minQuantity,
    this.maxQuantity,
    this.isActive = true,
    this.hasTax = false,
    this.trackInventory = false,
    this.status = 'active',
    this.categoryId,
  });
}
