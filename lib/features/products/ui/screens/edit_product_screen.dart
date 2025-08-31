import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/validation/validation.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';

class EditProductScreenWithProvider extends StatelessWidget {
  final Product product;

  const EditProductScreenWithProvider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => getIt<ProductsCubit>(),
      child: EditProductScreen(product: product),
    );
  }
}

class EditProductScreen extends StatefulWidget {
  final Product product;

  const EditProductScreen({super.key, required this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _costPriceController;
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

  late String _selectedCategory;
  late String _selectedStatus;
  late bool _isActive;

  final List<String> _categories = [
    'الإلكترونيات',
    'الأثاث',
    'الأجهزة المنزلية',
    'الملابس',
    'الأحذية',
    'الإكسسوارات',
    'الكتب',
    'الرياضة',
    'الطعام',
    'أخرى',
  ];

  final List<String> _statuses = ['متوفر', 'غير متوفر', 'منخفض المخزون'];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(
      text: widget.product.description ?? '',
    );
    _priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
    _costPriceController = TextEditingController(
      text: widget.product.costPrice?.toString() ?? '',
    );
    _quantityController = TextEditingController(
      text: widget.product.quantity.toString(),
    );
    _skuController = TextEditingController(text: widget.product.sku ?? '');
    _barcodeController = TextEditingController(
      text: widget.product.barcode ?? '',
    );
    _unitController = TextEditingController(text: widget.product.unit ?? '');
    _taxRateController = TextEditingController(
      text: widget.product.taxRate?.toString() ?? '',
    );
    _notesController = TextEditingController(text: widget.product.notes ?? '');
    _brandController = TextEditingController(text: widget.product.brand ?? '');
    _modelController = TextEditingController(text: widget.product.model ?? '');
    _weightController = TextEditingController(
      text: widget.product.weight?.toString() ?? '',
    );
    _dimensionsController = TextEditingController(
      text: widget.product.dimensions ?? '',
    );
    _colorController = TextEditingController(text: widget.product.color ?? '');
    _materialController = TextEditingController(
      text: widget.product.material ?? '',
    );
    _minQuantityController = TextEditingController(
      text: widget.product.minQuantity?.toString() ?? '',
    );
    _maxQuantityController = TextEditingController(
      text: widget.product.maxQuantity?.toString() ?? '',
    );

    _selectedCategory = widget.product.category;
    _selectedStatus = widget.product.status;
    _isActive = widget.product.isActive;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _costPriceController.dispose();
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
          id: widget.product.id,
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          price: double.parse(_priceController.text),
          costPrice: _costPriceController.text.trim().isEmpty
              ? null
              : double.parse(_costPriceController.text),
          quantity: int.parse(_quantityController.text),
          sku: _skuController.text.trim().isEmpty
              ? null
              : _skuController.text.trim(),
          barcode: _barcodeController.text.trim().isEmpty
              ? null
              : _barcodeController.text.trim(),
          category: _selectedCategory,
          status: _selectedStatus,
          unit: _unitController.text.trim().isEmpty
              ? null
              : _unitController.text.trim(),
          taxRate: _taxRateController.text.trim().isEmpty
              ? null
              : double.parse(_taxRateController.text),
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
              : double.parse(_weightController.text),
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
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في البيانات المدخلة: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل المنتج'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: AppColors.error,
              ),
            );
            context.read<ProductsCubit>().clearError();
          } else if (!state.isLoading && state.products.isNotEmpty) {
            // Check if the product was updated
            final updatedProduct = state.products.firstWhere(
              (product) => product.id == widget.product.id,
              orElse: () => widget.product,
            );

            if (updatedProduct.name == _nameController.text.trim() &&
                updatedProduct.price == double.parse(_priceController.text)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم تحديث المنتج بنجاح'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            }
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Basic Information Section
                _buildSectionCard(
                  title: 'معلومات أساسية',
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'اسم المنتج *',
                        border: OutlineInputBorder(),
                      ),
                      validator: Validation.validateRequired,
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'الوصف',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _priceController,
                            decoration: const InputDecoration(
                              labelText: 'السعر *',
                              border: OutlineInputBorder(),
                              suffixText: 'د.ك',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                Validation.validateNumber(value, 'السعر'),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _costPriceController,
                            decoration: const InputDecoration(
                              labelText: 'سعر التكلفة',
                              border: OutlineInputBorder(),
                              suffixText: 'د.ك',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _quantityController,
                            decoration: const InputDecoration(
                              labelText: 'الكمية *',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                Validation.validateNumber(value, 'الكمية'),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _unitController,
                            decoration: const InputDecoration(
                              labelText: 'الوحدة',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedCategory,
                            decoration: const InputDecoration(
                              labelText: 'الفئة *',
                              border: OutlineInputBorder(),
                            ),
                            items: _categories.map((category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(category),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedStatus,
                            decoration: const InputDecoration(
                              labelText: 'الحالة *',
                              border: OutlineInputBorder(),
                            ),
                            items: _statuses.map((status) {
                              return DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedStatus = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SwitchListTile(
                      title: const Text('نشط'),
                      value: _isActive,
                      onChanged: (value) {
                        setState(() {
                          _isActive = value;
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Product Details Section
                _buildSectionCard(
                  title: 'تفاصيل المنتج',
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _skuController,
                            decoration: const InputDecoration(
                              labelText: 'رمز المنتج (SKU)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _barcodeController,
                            decoration: const InputDecoration(
                              labelText: 'الباركود',
                              border: OutlineInputBorder(),
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
                            decoration: const InputDecoration(
                              labelText: 'العلامة التجارية',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _modelController,
                            decoration: const InputDecoration(
                              labelText: 'الموديل',
                              border: OutlineInputBorder(),
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
                            decoration: const InputDecoration(
                              labelText: 'الوزن (كجم)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _dimensionsController,
                            decoration: const InputDecoration(
                              labelText: 'الأبعاد',
                              border: OutlineInputBorder(),
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
                            decoration: const InputDecoration(
                              labelText: 'اللون',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _materialController,
                            decoration: const InputDecoration(
                              labelText: 'المادة',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Additional Information Section
                _buildSectionCard(
                  title: 'معلومات إضافية',
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _minQuantityController,
                            decoration: const InputDecoration(
                              labelText: 'الحد الأدنى للكمية',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _maxQuantityController,
                            decoration: const InputDecoration(
                              labelText: 'الحد الأقصى للكمية',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _taxRateController,
                      decoration: const InputDecoration(
                        labelText: 'نسبة الضريبة (%)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        labelText: 'ملاحظات',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),

                SizedBox(height: 32.h),

                // Submit Button
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isLoading ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: state.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'تحديث المنتج',
                              style: TextStyle(fontSize: 16),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16.h),
            ...children,
          ],
        ),
      ),
    );
  }
}
