import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class TopProductItem extends StatelessWidget {
  final TopProduct product;
  final VoidCallback? onTap;

  const TopProductItem({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (product.product != null) {
          ProductModel productModel = ProductModel(
            id: product.product!.id,
            name: product.product!.name,
            description: product.product!.description,
            price: product.product!.price,
            quantity: product.product!.quantity,
            image: product.product!.image,
            isActive: product.product!.isActive,
            createdAt: DateTime.parse(product.product!.createdAt),
            updatedAt: DateTime.parse(product.product!.updatedAt),
            unit: product.product!.unit,
            hasTax: product.product!.hasTax,
            trackInventory: product.product!.trackInventory,
            status: product.product!.status,
            productCategoryId: product.product!.productCategoryId,
            companyId: product.product!.companyId,
            taxRate: product.product!.taxRate,
            barcode: product.product!.barcode,
            cost: product.product!.cost,
            taxRateBackup: product.product!.taxRateBackup,
            quantityBackup: product.product!.quantityBackup,
            sku: product.product!.sku,
          );

          Navigator.pushNamed(
            context,
            AppRoutes.productDetailsRoute,
            arguments: productModel,
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.inventory,
                color: AppColors.primary,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.product?.name ?? S.of(context).undefinedProduct,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '${S.of(context).quantity}: ${product.totalQuantity.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              CurrencyFormatter.formatCurrency(
                product.totalAmount,
                context,
              ),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
