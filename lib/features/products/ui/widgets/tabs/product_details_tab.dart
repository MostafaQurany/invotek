import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/products/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/generated/l10n.dart';

class ProductDetailsTab extends StatelessWidget {
  final TextEditingController skuController;
  final TextEditingController barcodeController;
  final TextEditingController brandController;
  final TextEditingController modelController;
  final TextEditingController colorController;
  final TextEditingController materialController;
  final TextEditingController weightController;
  final TextEditingController dimensionsController;
  final TextEditingController notesController;
  final bool isActive;
  final bool hasTax;
  final bool trackInventory;
  final ValueChanged<bool> onActiveChanged;
  final ValueChanged<bool> onTaxChanged;
  final ValueChanged<bool> onInventoryChanged;

  const ProductDetailsTab({
    super.key,
    required this.skuController,
    required this.barcodeController,
    required this.brandController,
    required this.modelController,
    required this.colorController,
    required this.materialController,
    required this.weightController,
    required this.dimensionsController,
    required this.notesController,
    required this.isActive,
    required this.hasTax,
    required this.trackInventory,
    required this.onActiveChanged,
    required this.onTaxChanged,
    required this.onInventoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Details Card
          FormSectionCard(
            title: s.productDetails,
            icon: Icons.info_outlined,
            children: [
              // SKU and Barcode Row
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: skuController,
                      label: s.productSku,
                      hint: 'Enter product SKU',
                      icon: Icons.qr_code_outlined,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      controller: barcodeController,
                      label: s.barcode,
                      hint: 'Enter barcode',
                      icon: Icons.barcode_reader,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Brand and Model Row
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: brandController,
                      label: s.brand,
                      hint: 'Enter brand',
                      icon: Icons.business_outlined,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      controller: modelController,
                      label: s.model,
                      hint: 'Enter model',
                      icon: Icons.model_training_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Color and Material Row
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: colorController,
                      label: s.color,
                      hint: 'Enter color',
                      icon: Icons.palette_outlined,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      controller: materialController,
                      label: s.material,
                      hint: 'Enter material',
                      icon: Icons.texture_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Weight and Dimensions Row
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: weightController,
                      label: s.weight,
                      hint: 'Enter weight',
                      icon: Icons.scale_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      controller: dimensionsController,
                      label: s.dimensions,
                      hint: '20x30x40 cm',
                      icon: Icons.straighten_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Notes
              CustomTextField(
                controller: notesController,
                label: s.notes,
                hint: 'Enter additional notes',
                icon: Icons.note_outlined,
                maxLines: 3,
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Settings Card
          FormSectionCard(
            title: 'Settings',
            icon: Icons.settings_outlined,
            children: [
              // Product Active Switch
              SwitchListTile(
                title: Text(s.productIsActive),
                subtitle: Text(s.enableDisableProduct),
                value: isActive,
                onChanged: onActiveChanged,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
              Divider(height: 1),

              // Tax Switch
              SwitchListTile(
                title: Text(s.productIsTaxable),
                subtitle: Text(s.applyTaxToProduct),
                value: hasTax,
                onChanged: onTaxChanged,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
              Divider(height: 1),

              // Track Inventory Switch
              SwitchListTile(
                title: Text(s.trackInventory),
                subtitle: Text(s.trackAvailableProductQuantity),
                value: trackInventory,
                onChanged: onInventoryChanged,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
