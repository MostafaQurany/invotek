import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_card.dart';

class ProductsList extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onProductTap;
  final Function(ProductModel) onProductView;
  final Function(ProductModel) onProductEdit;
  final Function(ProductModel) onProductDelete;
  final bool isLoadingMore;

  const ProductsList({
    super.key,
    required this.products,
    required this.onProductTap,
    required this.onProductView,
    required this.onProductEdit,
    required this.onProductDelete,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          // Products Count Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'Products (${products.length})',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${products.length} Total',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          // Products List - Using ListView.builder for memory efficiency
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // Parent SingleChildScrollView handles scrolling
            shrinkWrap: true, // Takes only the space it needs
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: products.length + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == products.length && isLoadingMore) {
                return Container(
                  padding: EdgeInsets.all(16.w),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              final product = products[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ProductCard(
                  product: product,
                  onTap: () => onProductTap(product),
                  onEdit: () => onProductEdit(product),
                  onDelete: () => onProductDelete(product),
                  //  onView: () => onProductView(product),
                  colorScheme: Theme.of(context).colorScheme,
                ),
              );
            },
          ),
          // Bottom spacing for FAB
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
