import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import '../../../../generated/l10n.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final ColorScheme colorScheme;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.onEdit,
    this.onDelete,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(product.id ?? product.name ?? UniqueKey()),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.55,
        
        children: [
          SlidableAction(
            onPressed: (_) => onEdit?.call(),
            backgroundColor: colorScheme.primary.withOpacity(0.1),
            foregroundColor: colorScheme.primary,
            icon: Icons.edit,
            autoClose: true,
            borderRadius: BorderRadius.circular(12.r),
          ),
          SlidableAction(
            onPressed: (_) => onDelete?.call(),
            backgroundColor: colorScheme.error.withOpacity(0.1),
            foregroundColor: colorScheme.error,
            icon: Icons.delete_outline,
            autoClose: true,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ],
      ),
      child: Card(
        margin: EdgeInsets.only(bottom: 12.h),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 12.h),
                _buildDetails(),
                if (product.description != null &&
                    (product.description?.isNotEmpty ?? false)) ...[
                  SizedBox(height: 12.h),
                  _buildDescription(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        _buildProductIcon(),
        SizedBox(width: 16.w),
        Expanded(child: _buildProductInfo()),
        _buildPriceAndStatus(),
      ],
    );
  }

  Widget _buildProductIcon() {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        Icons.inventory_2,
        color: colorScheme.onPrimaryContainer,
        size: 28.sp,
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name ?? S.current.noName,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '${S.current.quantity}: ${product.quantity ?? 0}',
          style: TextStyle(
            fontSize: 12.sp,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'SAR ${_formatPrice(product.price)}',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
        SizedBox(height: 8.h),
        _buildStatusChip(),
      ],
    );
  }

  Widget _buildStatusChip() {
    final status = (product.status ?? 'inactive').toLowerCase();
    final color = status == 'active' ? Colors.green : Colors.grey;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        _getStatusText(status),
        style: TextStyle(
          fontSize: 12.sp,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Row(
      children: [
        if (product.sku != null && product.sku!.isNotEmpty)
          _buildDetailItem(icon: Icons.qr_code, text: 'SKU: ${product.sku}'),
      ],
    );
  }

  Widget _buildDetailItem({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.sp, color: colorScheme.onSurfaceVariant),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      product.description!,
      style: TextStyle(fontSize: 12.sp, color: colorScheme.onSurfaceVariant),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
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

  String _formatPrice(dynamic price) {
    if (price == null) return '0.00';
    if (price is num) return price.toStringAsFixed(2);
    return price.toString();
  }
}
