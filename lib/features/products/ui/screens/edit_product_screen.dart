import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/validation/validation.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/widgets.dart';

import '../../../../generated/l10n.dart';

class EditProductScreenWithProvider extends StatelessWidget {
  final ProductModel product;

  const EditProductScreenWithProvider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<ProductsCubit>()),
        BlocProvider.value(value: getIt<CategoriesCubit>()..loadFirstPage()),
      ],
      child: EditProductScreen(product: product),
    );
  }
}

class EditProductScreen extends StatefulWidget {
  final ProductModel product;

  const EditProductScreen({super.key, required this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _costController;
  late final TextEditingController _quantityController;
  late final TextEditingController _skuController;
  late final TextEditingController _barcodeController;
  late final TextEditingController _unitController;
  late final TextEditingController _taxRateController;
  late final TextEditingController _notesController;
  late final TextEditingController _brandController;
  late final TextEditingController _modelController;
  late final TextEditingController _weightController;
  late final TextEditingController _dimensionsController;
  late final TextEditingController _colorController;
  late final TextEditingController _materialController;
  late final TextEditingController _minQuantityController;
  late final TextEditingController _maxQuantityController;

  late String _selectedStatus;
  String? _selectedCategoryId;
  late bool _isActive;
  late bool _hasTax;
  late bool _trackInventory;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _nameController = TextEditingController(text: widget.product.name ?? '');
    _descriptionController = TextEditingController(
      text: widget.product.description ?? '',
    );
    _priceController = TextEditingController(text: widget.product.price ?? '');
    _costController = TextEditingController(text: widget.product.cost ?? '');
    _quantityController = TextEditingController(
      text: widget.product.quantity?.toString() ?? '',
    );
    _skuController = TextEditingController(text: widget.product.sku ?? '');
    _barcodeController = TextEditingController(
      text: widget.product.barcode ?? '',
    );
    _unitController = TextEditingController(text: widget.product.unit ?? '');
    _taxRateController = TextEditingController(
      text: widget.product.taxRate ?? '',
    );
    _notesController = TextEditingController(text: '');
    _brandController = TextEditingController(text: '');
    _modelController = TextEditingController(text: '');
    _weightController = TextEditingController(text: '');
    _dimensionsController = TextEditingController(text: '');
    _colorController = TextEditingController(text: '');
    _materialController = TextEditingController(text: '');
    _minQuantityController = TextEditingController(text: '');
    _maxQuantityController = TextEditingController(text: '');

    _selectedStatus = widget.product.status ?? 'active';
    _selectedCategoryId = widget.product.productCategoryId?.toString();
    _isActive = widget.product.isActive ?? true;
    _hasTax = widget.product.hasTax ?? false;
    _trackInventory = widget.product.trackInventory ?? false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _costController.dispose();
    _quantityController.dispose();
    _skuController.dispose();
    _barcodeController.dispose();
    _unitController.dispose();
    _taxRateController.dispose();
    _notesController.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _weightController.dispose();
    _dimensionsController.dispose();
    _colorController.dispose();
    _materialController.dispose();
    _minQuantityController.dispose();
    _maxQuantityController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      try {
        context.read<ProductsCubit>().updateProduct(
          id: widget.product.id ?? 0,
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          price: _priceController.text.trim(),
          cost: _costController.text.trim().isEmpty
              ? null
              : _costController.text.trim(),
          quantity: int.parse(_quantityController.text),
          sku: _skuController.text.trim().isEmpty
              ? null
              : _skuController.text.trim(),
          barcode: _barcodeController.text.trim().isEmpty
              ? null
              : _barcodeController.text.trim(),
          unit: _unitController.text.trim().isEmpty
              ? null
              : _unitController.text.trim(),
          taxRate: _taxRateController.text.trim().isEmpty
              ? null
              : _taxRateController.text.trim(),
          notes: _notesController.text.trim().isEmpty
              ? null
              : _notesController.text.trim(),
          brand: _brandController.text.trim().isEmpty
              ? null
              : _brandController.text.trim(),
          model: _modelController.text.trim().isEmpty
              ? null
              : _modelController.text.trim(),
          weight: _weightController.text.trim().isEmpty
              ? null
              : _weightController.text.trim(),
          dimensions: _dimensionsController.text.trim().isEmpty
              ? null
              : _dimensionsController.text.trim(),
          color: _colorController.text.trim().isEmpty
              ? null
              : _colorController.text.trim(),
          material: _materialController.text.trim().isEmpty
              ? null
              : _materialController.text.trim(),
          minQuantity: _minQuantityController.text.trim().isEmpty
              ? null
              : int.parse(_minQuantityController.text),
          maxQuantity: _maxQuantityController.text.trim().isEmpty
              ? null
              : int.parse(_maxQuantityController.text),
          isActive: _isActive,
          hasTax: _hasTax,
          trackInventory: _trackInventory,
          status: _selectedStatus,
          categoryId: _selectedCategoryId != null
              ? int.parse(_selectedCategoryId!)
              : null,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في البيانات المدخلة: $e'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(S.of(context).editProduct),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        foregroundColor: colorScheme.onSurface,
      ),
      body: BlocListener<ProductsCubit, ProductsState>(
        listener: (context, state) {
          final messenger = ScaffoldMessenger.of(context);
          state.maybeWhen(
            failure:
                (products, selectedProduct, currentPage, totalPages, error) {
                  messenger.hideCurrentSnackBar();
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text(error),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                  context.read<ProductsCubit>().clearError();
                },
            updateSuccess:
                (products, updated, selectedProduct, currentPage, totalPages) {
                  messenger.hideCurrentSnackBar();
                  final controller = messenger.showSnackBar(
                    SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text(
                        S.of(context).productUpdatedSuccessfully,
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                  controller.closed.then((_) {
                    Navigator.pop(context);
                  });
                },
            orElse: () {},
          );
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Basic Information Section
                FormSectionCard(
                  title: S.of(context).basicInformation,
                  colorScheme: colorScheme,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).name} *',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceContainer,
                      ),
                      validator: Validation.validateRequired,
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: S.of(context).description,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceContainer,
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: CategoryDropdown(
                            selectedCategoryId: _selectedCategoryId,
                            onChanged: (value) {
                              setState(() {
                                _selectedCategoryId = value;
                              });
                            },
                            colorScheme: colorScheme,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedStatus,
                            decoration: InputDecoration(
                              labelText: '${S.of(context).status} *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'active',
                                child: Text(
                                  S.of(context).active,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'inactive',
                                child: Text(S.of(context).inactive),
                              ),
                              DropdownMenuItem(
                                value: 'out_of_stock',
                                child: Text(S.of(context).outOfStock),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedStatus = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Pricing Section
                FormSectionCard(
                  title: S.of(context).pricing,
                  colorScheme: colorScheme,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _priceController,
                            decoration: InputDecoration(
                              labelText: '${S.of(context).sellingPrice} *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                              suffixText: 'ر.س',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) => Validation.validateNumber(
                              value,
                              S.of(context).sellingPrice,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _costController,
                            decoration: InputDecoration(
                              labelText: S.of(context).costPrice,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                              suffixText: 'ر.س',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) => value?.isEmpty == true
                                ? null
                                : Validation.validateNumber(
                                    value,
                                    S.of(context).costPrice,
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _taxRateController,
                      decoration: InputDecoration(
                        labelText: S.of(context).taxRate,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceContainer,
                        suffixText: '%',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => value?.isEmpty == true
                          ? null
                          : Validation.validateNumber(
                              value,
                              S.of(context).taxRate,
                            ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Inventory Section
                FormSectionCard(
                  title: S.of(context).inventory,
                  colorScheme: colorScheme,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _quantityController,
                            decoration: InputDecoration(
                              labelText: '${S.of(context).quantity} *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).thisFieldIsRequired;
                              }
                              final intValue = int.tryParse(value);
                              if (intValue == null || intValue < 0) {
                                return S
                                    .of(context)
                                    .quantityMustBeAPositiveInteger;
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _unitController,
                            decoration: InputDecoration(
                              labelText: S.of(context).unit,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                              hintText:
                                  '${S.of(context).piece}, ${S.of(context).kilogram}, ${S.of(context).meter}...',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _minQuantityController,
                            decoration: InputDecoration(
                              labelText: S.of(context).minimumQuantity,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) => value?.isEmpty == true
                                ? null
                                : (int.tryParse(value!) == null
                                      ? S.of(context).invalidNumber
                                      : null),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _maxQuantityController,
                            decoration: InputDecoration(
                              labelText: S.of(context).maximumQuantity,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) => value?.isEmpty == true
                                ? null
                                : (int.tryParse(value!) == null
                                      ? S.of(context).invalidNumber
                                      : null),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Product Details Section
                FormSectionCard(
                  title: S.of(context).productDetails,
                  colorScheme: colorScheme,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _skuController,
                            decoration: InputDecoration(
                              labelText: S.of(context).productSku,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _barcodeController,
                            decoration: InputDecoration(
                              labelText: S.of(context).barcode,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _brandController,
                            decoration: InputDecoration(
                              labelText: S.of(context).brand,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _modelController,
                            decoration: InputDecoration(
                              labelText: S.of(context).model,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _colorController,
                            decoration: InputDecoration(
                              labelText: S.of(context).color,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _materialController,
                            decoration: InputDecoration(
                              labelText: S.of(context).material,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _weightController,
                            decoration: InputDecoration(
                              labelText: S.of(context).weight,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                              suffixText: S.of(context).kilogram,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) => value?.isEmpty == true
                                ? null
                                : Validation.validateNumber(
                                    value,
                                    S.of(context).weight,
                                  ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _dimensionsController,
                            decoration: InputDecoration(
                              labelText: S.of(context).dimensions,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              filled: true,
                              fillColor: colorScheme.surfaceContainer,
                              hintText: '20x30x40 ${S.of(context).centimeters}',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Additional Information Section
                FormSectionCard(
                  title: S.of(context).additionalInformation,
                  colorScheme: colorScheme,
                  children: [
                    TextFormField(
                      controller: _notesController,
                      decoration: InputDecoration(
                        labelText: S.of(context).notes,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceContainer,
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16.h),
                    SwitchListTile(
                      title: Text(S.of(context).productIsActive),
                      subtitle: Text(S.of(context).enableDisableProduct),
                      value: _isActive,
                      onChanged: (value) {
                        setState(() {
                          _isActive = value;
                        });
                      },
                      activeColor: colorScheme.primary,
                    ),
                    SwitchListTile(
                      title: Text(S.of(context).productIsTaxable),
                      subtitle: Text(S.of(context).applyTaxToProduct),
                      value: _hasTax,
                      onChanged: (value) {
                        setState(() {
                          _hasTax = value;
                        });
                      },
                      activeColor: colorScheme.primary,
                    ),
                    SwitchListTile(
                      title: Text(S.of(context).trackInventory),
                      subtitle: Text(
                        S.of(context).trackAvailableProductQuantity,
                      ),
                      value: _trackInventory,
                      onChanged: (value) {
                        setState(() {
                          _trackInventory = value;
                        });
                      },
                      activeColor: colorScheme.primary,
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                // Submit Button
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading:
                          (
                            products,
                            selectedProduct,
                            currentPage,
                            totalPages,
                            message,
                          ) => true,
                      orElse: () => false,
                    );

                    return FilledButton(
                      onPressed: isLoading ? null : _submitForm,
                      style: FilledButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: isLoading
                          ? SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: CircularProgressIndicator(
                                color: colorScheme.onPrimary,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              S.of(context).editProduct,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    );
                  },
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
