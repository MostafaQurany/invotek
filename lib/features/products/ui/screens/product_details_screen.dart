import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/screens/edit_product_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المنتج'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditProductScreenWithProvider(product: product),
                ),
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
            // Header Card
            _buildHeaderCard(),
            SizedBox(height: 24.h),

            // Basic Information Section
            _buildSectionCard(
              title: 'المعلومات الأساسية',
              children: [
                _buildInfoRow('اسم المنتج', product.name),
                if (product.description != null)
                  _buildInfoRow('الوصف', product.description!),
                _buildInfoRow(
                  'السعر',
                  '${product.price.toStringAsFixed(2)} د.ك',
                ),
                if (product.costPrice != null)
                  _buildInfoRow(
                    'سعر التكلفة',
                    '${product.costPrice!.toStringAsFixed(2)} د.ك',
                  ),
                _buildInfoRow(
                  'الكمية',
                  '${product.quantity} ${product.unit ?? 'قطعة'}',
                ),
                _buildInfoRow('الفئة', product.category),
                _buildInfoRow('الحالة', product.status),
                _buildInfoRow('نشط', product.isActive ? 'نعم' : 'لا'),
              ],
            ),

            SizedBox(height: 16.h),

            // Product Details Section
            _buildSectionCard(
              title: 'تفاصيل المنتج',
              children: [
                if (product.sku != null)
                  _buildInfoRow('رمز المنتج (SKU)', product.sku!),
                if (product.barcode != null)
                  _buildInfoRow('الباركود', product.barcode!),
                if (product.brand != null)
                  _buildInfoRow('العلامة التجارية', product.brand!),
                if (product.model != null)
                  _buildInfoRow('الموديل', product.model!),
                if (product.weight != null)
                  _buildInfoRow('الوزن', '${product.weight} كجم'),
                if (product.dimensions != null)
                  _buildInfoRow('الأبعاد', product.dimensions!),
                if (product.color != null)
                  _buildInfoRow('اللون', product.color!),
                if (product.material != null)
                  _buildInfoRow('المادة', product.material!),
              ],
            ),

            SizedBox(height: 16.h),

            // Additional Information Section
            _buildSectionCard(
              title: 'معلومات إضافية',
              children: [
                if (product.minQuantity != null)
                  _buildInfoRow(
                    'الحد الأدنى للكمية',
                    product.minQuantity.toString(),
                  ),
                if (product.maxQuantity != null)
                  _buildInfoRow(
                    'الحد الأقصى للكمية',
                    product.maxQuantity.toString(),
                  ),
                if (product.taxRate != null)
                  _buildInfoRow('نسبة الضريبة', '${product.taxRate}%'),
                if (product.notes != null)
                  _buildInfoRow('ملاحظات', product.notes!),
              ],
            ),

            SizedBox(height: 16.h),

            // Timestamps Section
            _buildSectionCard(
              title: 'معلومات النظام',
              children: [
                _buildInfoRow('تاريخ الإنشاء', _formatDate(product.createdAt)),
                _buildInfoRow('آخر تحديث', _formatDate(product.updatedAt)),
                _buildInfoRow('معرف المنتج', product.id.toString()),
              ],
            ),

            SizedBox(height: 32.h),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditProductScreenWithProvider(product: product),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('تعديل المنتج'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showDeleteConfirmation(context);
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('حذف المنتج'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            // Product Image Placeholder
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.inventory_2, size: 40.sp, color: Colors.white),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    product.category,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(
                            product.status,
                          ).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          product.status,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: _getStatusColor(product.status),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      if (product.isActive)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            'نشط',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${product.price.toStringAsFixed(2)} د.ك',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'الكمية: ${product.quantity}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ],
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
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 12.h),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'متوفر':
        return Colors.green;
      case 'غير متوفر':
        return Colors.red;
      case 'منخفض المخزون':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
    } catch (e) {
      return dateString;
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد من حذف المنتج "${product.name}"؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implement delete functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم حذف المنتج بنجاح'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );
  }
}
