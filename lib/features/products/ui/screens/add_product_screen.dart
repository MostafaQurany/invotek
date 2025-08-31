import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/validation/validation.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/home/demo/cubit/menu_cubit.dart';

class AddProductScreenWithProvider extends StatelessWidget {
  const AddProductScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => getIt<ProductsCubit>(),
      child: const AddProductScreen(),
    );
  }
}

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _costPriceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _skuController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _unitController = TextEditingController();
  final _taxRateController = TextEditingController();
  final _notesController = TextEditingController();
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _weightController = TextEditingController();
  final _dimensionsController = TextEditingController();
  final _colorController = TextEditingController();
  final _materialController = TextEditingController();
  final _minQuantityController = TextEditingController();
  final _maxQuantityController = TextEditingController();

  String _selectedCategory = 'electronics';
  String _selectedStatus = 'active';
  bool _isActive = true;

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
        context.read<ProductsCubit>().createProduct(
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
            content: Text('خطأ في البيانات: ${e.toString()}'),
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
        title: const Text('إضافة منتج جديد'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
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
            // Check if a new product was successfully added
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('تم إضافة المنتج بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
            context.read<MenuCubit>().selectMenuItemByRoute('/products/list');
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
                          child: DropdownButtonFormField<String>(
                            value: _selectedCategory,
                            decoration: const InputDecoration(
                              labelText: 'الفئة *',
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'electronics',
                                child: Text('إلكترونيات'),
                              ),
                              DropdownMenuItem(
                                value: 'clothing',
                                child: Text('ملابس'),
                              ),
                              DropdownMenuItem(
                                value: 'food',
                                child: Text('طعام'),
                              ),
                              DropdownMenuItem(
                                value: 'books',
                                child: Text('كتب'),
                              ),
                              DropdownMenuItem(
                                value: 'home',
                                child: Text('منزل وحديقة'),
                              ),
                              DropdownMenuItem(
                                value: 'sports',
                                child: Text('رياضة'),
                              ),
                            ],
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
                            items: const [
                              DropdownMenuItem(
                                value: 'active',
                                child: Text('نشط'),
                              ),
                              DropdownMenuItem(
                                value: 'inactive',
                                child: Text('غير نشط'),
                              ),
                              DropdownMenuItem(
                                value: 'out_of_stock',
                                child: Text('نفدت الكمية'),
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
                _buildSectionCard(
                  title: 'التسعير',
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _priceController,
                            decoration: const InputDecoration(
                              labelText: 'سعر البيع *',
                              border: OutlineInputBorder(),
                              suffixText: 'ر.س',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                Validation.validateNumber(value, 'سعر البيع'),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _costPriceController,
                            decoration: const InputDecoration(
                              labelText: 'سعر التكلفة',
                              border: OutlineInputBorder(),
                              suffixText: 'ر.س',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) => value?.isEmpty == true
                                ? null
                                : Validation.validateNumber(
                                    value,
                                    'سعر التكلفة',
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _taxRateController,
                      decoration: const InputDecoration(
                        labelText: 'معدل الضريبة',
                        border: OutlineInputBorder(),
                        suffixText: '%',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => value?.isEmpty == true
                          ? null
                          : Validation.validateNumber(value, 'معدل الضريبة'),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Inventory Section
                _buildSectionCard(
                  title: 'المخزون',
                  children: [
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              }
                              final intValue = int.tryParse(value);
                              if (intValue == null || intValue < 0) {
                                return 'يجب أن تكون الكمية رقم صحيح غير سالب';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _unitController,
                            decoration: const InputDecoration(
                              labelText: 'الوحدة',
                              border: OutlineInputBorder(),
                              hintText: 'قطعة، كيلو، متر...',
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
                            decoration: const InputDecoration(
                              labelText: 'الحد الأدنى للكمية',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) => value?.isEmpty == true
                                ? null
                                : (int.tryParse(value!) == null
                                      ? 'رقم غير صحيح'
                                      : null),
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
                            validator: (value) => value?.isEmpty == true
                                ? null
                                : (int.tryParse(value!) == null
                                      ? 'رقم غير صحيح'
                                      : null),
                          ),
                        ),
                      ],
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
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _weightController,
                            decoration: const InputDecoration(
                              labelText: 'الوزن',
                              border: OutlineInputBorder(),
                              suffixText: 'كجم',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) => value?.isEmpty == true
                                ? null
                                : Validation.validateNumber(value, 'الوزن'),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _dimensionsController,
                            decoration: const InputDecoration(
                              labelText: 'الأبعاد',
                              border: OutlineInputBorder(),
                              hintText: '20x30x40 سم',
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
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        labelText: 'ملاحظات',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16.h),
                    SwitchListTile(
                      title: const Text('المنتج نشط'),
                      subtitle: const Text('تفعيل/إلغاء تفعيل المنتج'),
                      value: _isActive,
                      onChanged: (value) {
                        setState(() {
                          _isActive = value;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

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
                          ? SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'إضافة المنتج',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
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
