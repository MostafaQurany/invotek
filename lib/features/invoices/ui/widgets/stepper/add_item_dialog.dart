import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/generated/l10n.dart';

class AddItemDialog extends StatefulWidget {
  final InvoiceItemData? initialItem;
  final Function(InvoiceItemData) onItemAdded;

  const AddItemDialog({super.key, this.initialItem, required this.onItemAdded});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _discountController = TextEditingController();
  final _taxPercentController = TextEditingController();

  // Calculated values
  String _taxAmount = '0.00';
  String _total = '0.00';
  int? _maxQuantity; // available stock if provided

  @override
  void initState() {
    super.initState();
    if (widget.initialItem != null) {
      _initializeWithItem(widget.initialItem!);
    } else {
      _initializeEmpty();
    }
  }

  void _initializeWithItem(InvoiceItemData item) {
    _nameController.text = item.name;
    _quantityController.text = item.quantity;
    _priceController.text = item.price;
    _discountController.text = item.discount;
    _taxPercentController.text = item.taxPercent;
    _taxAmount = item.taxAmount;
    _total = item.total;
    _maxQuantity = item.availableQuantity;
  }

  void _initializeEmpty() {
    _quantityController.text = '1';
    _priceController.text = '0.00';
    _discountController.text = '0.00';
    _taxPercentController.text = '15.00';
    _calculateTotals();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _discountController.dispose();
    _taxPercentController.dispose();
    super.dispose();
  }

  void _calculateTotals() {
    final quantity = double.tryParse(_quantityController.text) ?? 0.0;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final discount = double.tryParse(_discountController.text) ?? 0.0;
    final taxPercent = double.tryParse(_taxPercentController.text) ?? 0.0;

    final subtotal = quantity * price;
    final discountAmount = subtotal * (discount / 100);
    final afterDiscount = subtotal - discountAmount;
    final taxAmount = afterDiscount * (taxPercent / 100);
    final total = afterDiscount + taxAmount;

    setState(() {
      _taxAmount = taxAmount.toStringAsFixed(2);
      _total = total.toStringAsFixed(2);
    });
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final item = InvoiceItemData(
        name: _nameController.text,
        quantity: _quantityController.text,
        price: _priceController.text,
        discount: _discountController.text,
        taxPercent: _taxPercentController.text,
        taxAmount: _taxAmount,
        total: _total,
      );

      widget.onItemAdded(item);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: 600.h),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.initialItem != null
                        ? S.of(context).editItem
                        : S.of(context).addNewItem,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Form
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Item Name
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: S.of(context).itemName,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 16.h,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).itemNameRequired;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),

                      // Quantity and Price Row
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _quantityController,
                              decoration: InputDecoration(
                                labelText: S.of(context).quantity,
                                helperText: _maxQuantity != null
                                    ? S.of(context).available(_maxQuantity!)
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 16.h,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (_) => _calculateTotals(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).quantityRequired;
                                }
                                if (double.tryParse(value) == null ||
                                    double.parse(value) <= 0) {
                                  return S.of(context).quantityMustBeGreaterThanZero;
                                }
                                if (_maxQuantity != null &&
                                    double.parse(value) > _maxQuantity!) {
                                  return S.of(context).quantityExceedsAvailableStock(_maxQuantity!);
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextFormField(
                              controller: _priceController,
                              decoration: InputDecoration(
                                labelText: S.of(context).price,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 16.h,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (_) => _calculateTotals(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).priceRequired;
                                }
                                if (double.tryParse(value) == null ||
                                    double.parse(value) < 0) {
                                  return S.of(context).priceMustBeGreaterThanOrEqualZero;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Discount and Tax Row
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _discountController,
                              decoration: InputDecoration(
                                labelText: S.of(context).discountPercent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 16.h,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (_) => _calculateTotals(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).discountRequired;
                                }
                                if (double.tryParse(value) == null ||
                                    double.parse(value) < 0) {
                                  return S.of(context).discountMustBeGreaterThanOrEqualZero;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextFormField(
                              controller: _taxPercentController,
                              decoration: InputDecoration(
                                labelText: S.of(context).taxPercent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 16.h,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (_) => _calculateTotals(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).taxPercentRequired;
                                }
                                if (double.tryParse(value) == null ||
                                    double.parse(value) < 0) {
                                  return S.of(context).taxPercentMustBeGreaterThanOrEqualZero;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                      // Calculated Values
                      Container(
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
                                  S.of(context).taxAmount,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '$_taxAmount ${S.of(context).currency}',
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
                                  S.of(context).total,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '$_total ${S.of(context).currency}',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(S.of(context).cancel),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      widget.initialItem != null
                          ? S.of(context).saveEdit
                          : S.of(context).addItem,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
