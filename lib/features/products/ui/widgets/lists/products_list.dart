import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Products Count Header
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Text(
                  'Products (${products.length})',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${products.length} Total',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Products List
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: products.length + (isLoadingMore ? 1 : 0),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                if (index == products.length && isLoadingMore) {
                  return Container(
                    padding: EdgeInsets.all(16.w),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                final product = products[index];
                return ProductCard(
                  product: product,
                  onTap: () => onProductTap(product),
                  onEdit: () => onProductEdit(product),
                  onDelete: () => onProductDelete(product),
                  colorScheme: colorScheme,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
