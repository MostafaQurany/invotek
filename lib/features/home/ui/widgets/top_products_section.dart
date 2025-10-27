import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';
import 'package:invotek/features/home/ui/widgets/empty_products_widget.dart';
import 'package:invotek/features/home/ui/widgets/top_product_item.dart';
import 'package:invotek/generated/l10n.dart';

class TopProductsSection extends StatelessWidget {
  final List<TopProduct> topProducts;
  final String? customTitle;
  final int maxProducts;
  final VoidCallback? onProductTap;
  final VoidCallback? onAddProduct;

  const TopProductsSection({
    super.key,
    required this.topProducts,
    this.customTitle,
    this.maxProducts = 5,
    this.onProductTap,
    this.onAddProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customTitle ?? S.of(context).topSellingProducts,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),

          if (topProducts.isEmpty)
            EmptyProductsWidget(onAction: onAddProduct)
          else
            ...topProducts
                .take(maxProducts)
                .map(
                  (product) =>
                      TopProductItem(product: product, onTap: onProductTap),
                ),
        ],
      ),
    );
  }
}
