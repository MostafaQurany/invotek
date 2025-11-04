import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';

class UpdateProduct implements UseCase<ProductModel, UpdateProductParams> {
  final ProductsRepository repository;

  UpdateProduct(this.repository);

  @override
  Future<ApiResult<ProductModel>> call(UpdateProductParams params) async {
    return await repository.updateProduct(
      id: params.id,
      name: params.name,
      description: params.description,
      price: double.parse(params.price),
      cost: double.parse(params.cost ?? '0'),
      quantity: int.parse(params.quantity.toString()),
      sku: params.sku,
      barcode: params.barcode,
      unit: params.unit,
      taxRate: params.taxRate != null ? double.parse(params.taxRate!) : 0,
      isActive: params.isActive,
      trackInventory: params.trackInventory,
      status: params.status,
    );
  }
}

class UpdateProductParams {
  final int id;
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

  const UpdateProductParams({
    required this.id,
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
