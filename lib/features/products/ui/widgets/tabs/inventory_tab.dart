import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/products/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class InventoryTab extends StatelessWidget {
  final TextEditingController skuController;
  final TextEditingController barcodeController;
  final TextEditingController quantityController;
  final TextEditingController unitController;
  final TextEditingController minQuantityController;
  final TextEditingController maxQuantityController;
  final Map<String, String> validationErrors;

  const InventoryTab({
    super.key,
    required this.quantityController,
    required this.unitController,
    required this.minQuantityController,
    required this.maxQuantityController,
    required this.skuController,
    required this.barcodeController,
    this.validationErrors = const {},
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Inventory Information Card
          FormSectionCard(
            title: s.inventory,
            icon: Icons.inventory_outlined,
            children: [
              // Quantity and Unit Row
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: quantityController,
                      label: s.quantity,
                      hint: 'Enter quantity',
                      icon: Icons.numbers_outlined,
                      keyboardType: TextInputType.number,
                      isRequired: true,
                      errorText: validationErrors['quantity'],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      controller: unitController,
                      label: s.unit,
                      hint: 'piece, kg, meter...',
                      icon: Icons.straighten_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
          SizedBox(height: 16.h),
          // Product Details Card
          FormSectionCard(
            title: s.productDetails,
            icon: Icons.info_outlined,
            children: [
              CustomTextField(
                controller: skuController,
                label: s.productSku,
                hint: 'Enter product SKU',
                icon: Icons.qr_code_outlined,
              ),
              SizedBox(height: 16.h),
              // SKU and Barcode Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IgnorePointer(
                      ignoring: true,
                      child: CustomTextField(
                        controller: barcodeController,
                        label: s.barcode,
                        hint: 'Enter barcode',
                        icon: Icons.barcode_reader,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // generate barcode button
                  IconButton(
                    onPressed: () {
                      // generate uuid
                      final uuid = Uuid().v4();
                      barcodeController.text = uuid;
                    },
                    icon: Icon(Icons.qr_code_scanner, size: 45.sp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
