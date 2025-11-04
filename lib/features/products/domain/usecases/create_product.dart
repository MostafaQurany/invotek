import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';

class CreateProduct implements UseCase<ProductModel, CreateProductParams> {
  final ProductsRepository repository;

  CreateProduct(this.repository);

  @override
  Future<ApiResult<ProductModel>> call(CreateProductParams params) async {
    return await repository.createProduct(
      name: params.name,
      productCategoryId: params.productCategoryId,
      sku: params.sku,
      description: params.description,
      image: params.image,
      price: params.price,
      cost: params.cost,
      taxRate: params.taxRate,
      quantity: params.quantity,
      barcode: params.barcode,
      unit: params.unit,
      hasTax: params.hasTax,
      isActive: params.isActive,
      trackInventory: params.trackInventory,
      status: params.status,
    );
  }
}

class CreateProductParams {
  final String name;
  final int? productCategoryId;
  final String? sku;
  final String? description;
  final String? image;
  final double? price;
  final double? cost;
  final double? taxRate;
  final int? quantity;
  final String? barcode;
  final String? unit;
  final bool? hasTax;
  final bool? isActive;
  final bool? trackInventory;
  final String? status;

  const CreateProductParams({
    required this.name,
    this.productCategoryId,
    this.sku,
    this.description,
    this.image,
    this.price,
    this.cost,
    this.taxRate,
    this.quantity,
    this.barcode,
    this.unit,
    this.hasTax,
    this.isActive,
    this.trackInventory,
    this.status,
  });
}
