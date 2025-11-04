import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_card.dart';

class ProductsList extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onProductTap;
  final Function(ProductModel) onProductView;
  final Function(ProductModel) onProductEdit;
  final Function(ProductModel) onProductDelete;
  final bool isLoadingMore;
  final ScrollController? scrollController;
  const ProductsList({
    super.key,
    required this.products,
    required this.onProductTap,
    required this.onProductView,
    required this.onProductEdit,
    required this.onProductDelete,
    this.isLoadingMore = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35.h),
        // Products List - Using ListView.builder for memory efficiency
        Expanded(
          child: ListView.builder(
            controller: scrollController,
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
        ),
      ],
    );
  }
}
