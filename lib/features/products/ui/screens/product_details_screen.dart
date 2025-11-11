import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/products/constants/products_permissions.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_info_card.dart';
import 'package:invotek/features/products/ui/widgets/cards/product_summary_card.dart';
import 'package:invotek/features/products/ui/widgets/dialogs/delete_product_dialog.dart';
import 'package:invotek/generated/l10n.dart';

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
    final s = S.of(context);

    // Check permission for viewing products
    if (!PermissionChecker.hasPermission(context, ProductsPermissions.view)) {
      return Scaffold(
        appBar: AppBar(
          title: Text(s.productDetails),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 64.sp, color: AppColors.error),
              SizedBox(height: 16.h),
              Text(
                s.productsNoPermissionToView,
                style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                s.productsNoPermissionToAct,
                style: TextStyle(fontSize: 14.sp, color: AppColors.greyDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.productDetails),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Builder(
            builder: (context) {
              final hasEditPermission = PermissionChecker.hasPermission(
                context,
                ProductsPermissions.edit,
              );
              return Tooltip(
                message: hasEditPermission
                    ? s.editProduct
                    : s.productsNoPermissionToAct,
                child: IconButton(
                  icon: Icon(
                    hasEditPermission
                        ? Icons.edit_outlined
                        : Icons.lock_outlined,
                    color: hasEditPermission
                        ? AppColors.textPrimary
                        : AppColors.greyDark,
                  ),
                  onPressed: hasEditPermission ? () => _editProduct() : null,
                ),
              );
            },
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSummaryCard(product: product),
            SizedBox(height: 16.h),
            ProductInfoCard(
              product: product,
              onCopyToClipboard: _copyToClipboard,
            ),
            SizedBox(height: 80.h), // Space for bottom buttons
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final hasDeletePermission = PermissionChecker.hasPermission(
                      context,
                      ProductsPermissions.delete,
                    );
                    return Tooltip(
                      message: hasDeletePermission
                          ? s.delete
                          : s.productsNoPermissionToAct,
                      child: OutlinedButton(
                        onPressed: hasDeletePermission
                            ? () => _showDeleteConfirmation()
                            : null,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.error),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              hasDeletePermission
                                  ? Icons.delete_outline
                                  : Icons.lock_outlined,
                              color: AppColors.error,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              s.delete,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: Builder(
                  builder: (context) {
                    final hasEditPermission = PermissionChecker.hasPermission(
                      context,
                      ProductsPermissions.edit,
                    );
                    return Tooltip(
                      message: hasEditPermission
                          ? s.editProduct
                          : s.productsNoPermissionToAct,
                      child: FilledButton(
                        onPressed: hasEditPermission
                            ? () => _editProduct()
                            : null,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              hasEditPermission
                                  ? Icons.edit_outlined
                                  : Icons.lock_outlined,
                              color: AppColors.white,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              s.editProduct,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Methods
  void _copyToClipboard(String text) {
    final s = S.of(context);
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s.productsCopiedToClipboard),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
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
