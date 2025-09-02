import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import '../../../../generated/l10n.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(S.of(context).productDetails),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        foregroundColor: colorScheme.onSurface,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: colorScheme.onSurface),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/products/edit',
                arguments: product,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductHeader(colorScheme),
            SizedBox(height: 24.h),
            _buildProductInfo(colorScheme),
            SizedBox(height: 24.h),
            _buildProductActions(context, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildProductHeader(ColorScheme colorScheme) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.1), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Row(
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                Icons.inventory_2,
                color: colorScheme.onPrimaryContainer,
                size: 40.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? 'No name',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    product.sku ?? 'SKU: N/A',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        product.status ?? 'unknown',
                      ).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      _getStatusText(product.status ?? 'unknown'),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: _getStatusColor(product.status ?? 'unknown'),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${product.price ?? '0.00'} ر.س',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Quantity: ${product.quantity}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Information',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 16.h),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: colorScheme.outline.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                _buildInfoRow(
                  S.current.description,
                  product.description ?? 'No description',
                  colorScheme,
                ),
                _buildInfoRow(
                  S.current.costPrice,
                  '${product.cost ?? '0.00'} ر.س',
                  colorScheme,
                ),
                _buildInfoRow(
                  S.current.taxRate,
                  '${product.taxRate ?? '0'}%',
                  colorScheme,
                ),
                _buildInfoRow(
                  S.current.unit,
                  product.unit ?? 'No unit',
                  colorScheme,
                ),
                _buildInfoRow(
                  S.current.barcode,
                  product.barcode ?? 'No barcode',
                  colorScheme,
                ),
                _buildInfoRow(
                  S.current.productIsActive,
                  product.isActive == true
                      ? S.current.active
                      : S.current.inactive,
                  colorScheme,
                ),
                _buildInfoRow(
                  S.current.productIsTaxable,
                  product.hasTax == true ? 'Yes' : 'No',
                  colorScheme,
                ),
                _buildInfoRow(
                  S.current.trackInventory,
                  product.trackInventory == true ? 'Yes' : 'No',
                  colorScheme,
                ),
                _buildInfoRow(
                  'Created At',
                  _formatDate(product.createdAt),
                  colorScheme,
                ),
                _buildInfoRow(
                  'Updated At',
                  _formatDate(product.updatedAt),
                  colorScheme,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp, color: colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductActions(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/products/edit',
                arguments: product,
              );
            },
            icon: Icon(Icons.edit, size: 18.sp),
            label: Text(S.of(context).editProduct),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: FilledButton.tonal(
            onPressed: () => _showDeleteConfirmation(context),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error.withOpacity(0.1),
              foregroundColor: AppColors.error,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, size: 18.sp),
                SizedBox(width: 8.w),
                Text(S.of(context).deleteProduct),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(S.of(context).deleteConfirmation),
        content: Text(
          S
              .of(context)
              .deleteProductConfirmation(product.name ?? S.of(context).noName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton.tonal(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement delete functionality
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error.withOpacity(0.1),
              foregroundColor: AppColors.error,
            ),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'inactive':
        return Colors.orange;
      case 'out_of_stock':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return S.current.active;
      case 'inactive':
        return S.current.inactive;
      case 'out_of_stock':
        return S.current.outOfStock;
      default:
        return status;
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'No date';
    return '${date.day}/${date.month}/${date.year}';
  }
}
