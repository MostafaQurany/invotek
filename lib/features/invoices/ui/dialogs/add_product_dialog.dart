import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class AddProductDialog extends StatefulWidget {
  final Function(ProductModel) onProductCreated;

  const AddProductDialog({super.key, required this.onProductCreated});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _skuController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _skuController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(maxHeight: 600.h),
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            _buildHeader(),
            SizedBox(height: 16.h),

            // Form
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Basic Information
                      _buildSectionTitle(S.of(context).basicInformation),
                      SizedBox(height: 12.h),
                      _buildTextField(
                        controller: _nameController,
                        label: S.of(context).productName,
                        hint: S.of(context).enterProductName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).nameRequired;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.h),
                      _buildTextField(
                        controller: _skuController,
                        label: S.of(context).sku,
                        hint: S.of(context).enterSku,
                      ),
                      SizedBox(height: 12.h),
                      _buildTextField(
                        controller: _descriptionController,
                        label: S.of(context).description,
                        hint: S.of(context).enterDescription,
                        maxLines: 2,
                      ),

                      SizedBox(height: 20.h),

                      // Pricing Information
                      _buildSectionTitle(S.of(context).pricingInformation),
                      SizedBox(height: 12.h),
                      _buildTextField(
                        controller: _priceController,
                        label: S.of(context).price,
                        hint: S.of(context).enterPrice,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).priceRequired;
                          }
                          if (double.tryParse(value) == null) {
                            return S.of(context).invalidPrice;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.h),
                      _buildTextField(
                        controller: _quantityController,
                        label: S.of(context).quantity,
                        hint: S.of(context).enterQuantity,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).quantityRequired;
                          }
                          if (int.tryParse(value) == null) {
                            return S.of(context).invalidQuantity;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Bottom Actions
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.add_box, color: AppColors.primary, size: 24.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            S.of(context).addNewProduct,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: AppColors.textSecondary, size: 24.sp),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Icon(Icons.info_outline, color: AppColors.primary, size: 20.sp),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
      ),
    );
  }

  Widget _buildBottomActions() {
    return Row(
      children: [
        // Cancel Button
        Expanded(
          child: OutlinedButton(
            onPressed: _isLoading ? null : () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.textSecondary,
              side: BorderSide(color: AppColors.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: Text(S.of(context).cancel),
          ),
        ),
        SizedBox(width: 12.w),
        // Save Button
        Expanded(
          child: ElevatedButton(
            onPressed: _isLoading ? null : _onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: _isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(S.of(context).save),
          ),
        ),
      ],
    );
  }

  void _onSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Create product using ProductsCubit
      await context.read<ProductsCubit>().createProduct(
        name: _nameController.text.trim(),
        price: double.parse(_priceController.text.trim()),
        quantity: int.parse(_quantityController.text.trim()),
        sku: _skuController.text.trim().isNotEmpty
            ? _skuController.text.trim()
            : null,
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
      );

      // Get the created product from the cubit state
      final productsState = context.read<ProductsCubit>().state;
      productsState.maybeWhen(
        createSuccess:
            (products, created, selectedProduct, currentPage, totalPages) {
              widget.onProductCreated(created);
              Navigator.pop(context);
            },
        orElse: () {
          // Handle error case
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).errorCreatingProduct),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).errorCreatingProduct),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
