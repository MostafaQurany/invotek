import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/add_item_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/item_card.dart';
import 'package:invotek/generated/l10n.dart';

class ItemsSelectionStep extends StatefulWidget {
  final InvoiceFormController formController;

  const ItemsSelectionStep({super.key, required this.formController});

  @override
  State<ItemsSelectionStep> createState() => _ItemsSelectionStepState();
}

class _ItemsSelectionStepState extends State<ItemsSelectionStep> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Add Button
          _buildHeader(s),
          SizedBox(height: 16.h),

          // Items List
          if (widget.formController.items.isEmpty)
            _buildEmptyState(s)
          else
            _buildItemsList(s),
        ],
      ),
    );
  }

  Widget _buildHeader(S s) {
    return Row(
      children: [
        Expanded(
          child: Text(
            s.invoiceItems,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => _showAddItemDialog(),
          icon: const Icon(Icons.add),
          label: Text(s.addItem),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(S s) {
    return Container(
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border, style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 48.sp,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 16.h),
          Text(
            s.noItemsAdded,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            s.addFirstItem,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList(S s) {
    return Column(
      children: [
        // Items
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.formController.items.length,
          itemBuilder: (context, index) {
            final item = widget.formController.items[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: ItemCard(
                item: item,
                index: index,
                onEdit: () => _showEditItemDialog(index),
                onDelete: () => _deleteItem(index),
              ),
            );
          },
        ),

        SizedBox(height: 16.h),

        // Summary
        _buildItemsSummary(),
      ],
    );
  }

  Widget _buildItemsSummary() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'عدد العناصر:',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '${widget.formController.items.length}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع الفرعي:',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '${widget.formController.subtotalController.text} ريال',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(
        onItemAdded: (item) {
          widget.formController.addItem(item);
          setState(() {});
        },
      ),
    );
  }

  void _showEditItemDialog(int index) {
    final item = widget.formController.items[index];
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(
        initialItem: item,
        onItemAdded: (updatedItem) {
          widget.formController.updateItem(index, updatedItem);
          setState(() {});
        },
      ),
    );
  }

  void _deleteItem(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد من حذف هذا العنصر؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              widget.formController.removeItem(index);
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
