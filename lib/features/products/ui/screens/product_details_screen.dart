import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_details_header.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_summary_card.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_info_card.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_details_bottom_actions.dart';
import 'package:invotek/features/products/ui/widgets/dialogs/delete_product_dialog.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Modern Header with Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration.zero,
              child: ProductDetailsHeader(
                product: product,
                onBack: () => Navigator.pop(context),
                onEdit: () => _editProduct(),
              ),
            ),
          ),

          // Space with Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 200),
              child: SizedBox(height: 16.h),
            ),
          ),

          // Content Cards with Staggered Animation
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: StaggeredAnimatedList(
                staggerDelay: Duration(milliseconds: 150),
                children: [
                  ProductSummaryCard(product: product),
                  SizedBox(height: 16.h),
                  ProductInfoCard(
                    product: product,
                    onCopyToClipboard: _copyToClipboard,
                  ),
                  // SizedBox(height: 16.h),
                  // ProductInsightsCard(product: product),
                  SizedBox(height: 15.h), // Space for bottom actions
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Actions with Animation
      bottomNavigationBar: AnimatedEntryWidget(
        delay: Duration(milliseconds: 800),
        child: ProductDetailsBottomActions(
          onDelete: () => _showDeleteConfirmation(),
          onEdit: () => _editProduct(),
        ),
      ),
    );
  }

  // Helper Methods
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _editProduct() {
    Navigator.pushNamed(context, '/products/edit', arguments: widget.product);
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => DeleteProductDialog(
        product: widget.product,
        onConfirm: () {
          final productsCubit = ProductsCubit.get(context);
          productsCubit.deleteProduct(widget.product.id ?? 0);
          Navigator.pop(context, 'deleted'); // Go back to list with result
        },
      ),
    );
  }
}

// Convenience widget for staggered animations
class StaggeredAnimatedList extends StatelessWidget {
  final List<Widget> children;
  final Duration staggerDelay;
  final Duration animationDuration;
  final Offset slideOffset;
  final Curve curve;

  const StaggeredAnimatedList({
    super.key,
    required this.children,
    this.staggerDelay = const Duration(milliseconds: 100),
    this.animationDuration = const Duration(milliseconds: 600),
    this.slideOffset = const Offset(0, 0.3),
    this.curve = Curves.easeOutCubic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;

        return AnimatedEntryWidget(
          delay: Duration(milliseconds: index * staggerDelay.inMilliseconds),
          duration: animationDuration,
          offset: slideOffset,
          curve: curve,
          child: child,
        );
      }).toList(),
    );
  }
}
