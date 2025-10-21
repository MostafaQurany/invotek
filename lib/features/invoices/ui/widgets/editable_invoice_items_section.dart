import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/ui/dialogs/dialogs.dart';
import 'package:invotek/features/invoices/ui/models/invoice_item_model.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class EditableInvoiceItemsSection extends StatefulWidget {
  final List<InvoiceItemModel> items;
  final Function(List<InvoiceItemModel>) onItemsChanged;
  final Function(double) onSubtotalChanged;

  const EditableInvoiceItemsSection({
    super.key,
    required this.items,
    required this.onItemsChanged,
    required this.onSubtotalChanged,
  });

  @override
  State<EditableInvoiceItemsSection> createState() =>
      _EditableInvoiceItemsSectionState();
}

class _EditableInvoiceItemsSectionState
    extends State<EditableInvoiceItemsSection> {
  late List<InvoiceItemModel> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    _calculateSubtotal();
  }

  @override
  void didUpdateWidget(EditableInvoiceItemsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items) {
      _items = List.from(widget.items);
      _calculateSubtotal();
    }
  }

  void _calculateSubtotal() {
    final subtotal = _items.fold<double>(
      0,
      (sum, item) => sum + item.calculatedTotal,
    );
    widget.onSubtotalChanged(subtotal);
  }

  void _addItem() {
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: context.read<ProductsCubit>(),
        child: ProductSelectionDialog(
          onProductSelected: (product) {
            _addProductAsItem(product);
          },
          onAddNewProduct: () {
            Navigator.pop(context);
            _showAddProductDialog();
          },
        ),
      ),
    );
  }

  void _showAddProductDialog() {
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: context.read<ProductsCubit>(),
        child: AddProductDialog(
          onProductCreated: (product) {
            _addProductAsItem(product);
          },
        ),
      ),
    );
  }

  void _addProductAsItem(ProductModel product) {
    final newItem = InvoiceItemModel(
      productId: product.id?.toString(),
      productName: product.name,
      productSku: product.sku,
      quantity: 1,
      price: double.tryParse(product.price ?? '0') ?? 0,
      discount: 0,
      total: double.tryParse(product.price ?? '0') ?? 0,
    );

    setState(() {
      _items.add(newItem);
    });

    widget.onItemsChanged(_items);
    _calculateSubtotal();
  }

  void _addManualItem() {
    final newItem = InvoiceItemModel(
      quantity: 1,
      price: 0,
      discount: 0,
      total: 0,
    );

    setState(() {
      _items.add(newItem);
    });

    widget.onItemsChanged(_items);
    _calculateSubtotal();
  }

  void _updateItem(int index, InvoiceItemModel updatedItem) {
    setState(() {
      _items[index] = updatedItem;
    });

    widget.onItemsChanged(_items);
    _calculateSubtotal();
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });

    widget.onItemsChanged(_items);
    _calculateSubtotal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildHeader(),
          SizedBox(height: 16.h),

          // Items List
          if (_items.isEmpty) _buildEmptyState() else _buildItemsList(),

          SizedBox(height: 16.h),

          // Add Item Buttons
          _buildAddItemButtons(),

          SizedBox(height: 16.h),

          // Summary
          if (_items.isNotEmpty) _buildSummary(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.shopping_cart, color: AppColors.primary, size: 24.sp),
        SizedBox(width: 8.w),
        Text(
          S.of(context).invoiceItems,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        Text(
          '${_items.length} ${S.of(context).items}',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.textSecondary,
            size: 48.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            S.of(context).noItemsAdded,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            S.of(context).addItemsToInvoice,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return _buildItemCard(item, index);
      },
    );
  }

  Widget _buildItemCard(InvoiceItemModel item, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          // Item Header
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName ?? S.of(context).manualItem,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (item.productSku?.isNotEmpty == true)
                      Text(
                        'SKU: ${item.productSku}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => _removeItem(index),
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.error,
                  size: 20.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Item Fields
          Row(
            children: [
              // Quantity
              Expanded(
                flex: 2,
                child: _buildItemField(
                  label: S.of(context).quantity,
                  value: item.quantity.toString(),
                  onChanged: (value) {
                    final quantity = double.tryParse(value) ?? 0;
                    final updatedItem = item.copyWith(
                      quantity: quantity,
                      total: (quantity * item.price) - item.discount,
                    );
                    _updateItem(index, updatedItem);
                  },
                ),
              ),
              SizedBox(width: 12.w),

              // Price
              Expanded(
                flex: 2,
                child: _buildItemField(
                  label: S.of(context).price,
                  value: item.price.toString(),
                  onChanged: (value) {
                    final price = double.tryParse(value) ?? 0;
                    final updatedItem = item.copyWith(
                      price: price,
                      total: (item.quantity * price) - item.discount,
                    );
                    _updateItem(index, updatedItem);
                  },
                ),
              ),
              SizedBox(width: 12.w),

              // Discount
              Expanded(
                flex: 2,
                child: _buildItemField(
                  label: S.of(context).discount,
                  value: item.discount.toString(),
                  onChanged: (value) {
                    final discount = double.tryParse(value) ?? 0;
                    final updatedItem = item.copyWith(
                      discount: discount,
                      total: (item.quantity * item.price) - discount,
                    );
                    _updateItem(index, updatedItem);
                  },
                ),
              ),
              SizedBox(width: 12.w),

              // Total
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).total,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        item.calculatedTotal.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemField({
    required String label,
    required String value,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),
        TextFormField(
          initialValue: value,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildAddItemButtons() {
    return Row(
      children: [
        // Add from Products
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _addItem,
            icon: Icon(Icons.inventory_2, size: 20.sp),
            label: Text(S.of(context).addFromProducts),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Add Manual Item
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _addManualItem,
            icon: Icon(Icons.add, size: 20.sp),
            label: Text(S.of(context).addManualItem),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.textSecondary,
              side: BorderSide(color: AppColors.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    final subtotal = _items.fold<double>(
      0,
      (sum, item) => sum + item.calculatedTotal,
    );
    final itemCount = _items.length;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.calculate, color: AppColors.primary, size: 20.sp),
          SizedBox(width: 8.w),
          Text(
            S.of(context).subtotal,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$itemCount ${S.of(context).items}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                subtotal.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
