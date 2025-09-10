import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/products/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/generated/l10n.dart';

class InventoryTab extends StatelessWidget {
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

              // Min and Max Quantity Row
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: minQuantityController,
                      label: s.minimumQuantity,
                      hint: 'Enter minimum quantity',
                      icon: Icons.trending_down_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      controller: maxQuantityController,
                      label: s.maximumQuantity,
                      hint: 'Enter maximum quantity',
                      icon: Icons.trending_up_outlined,
                      keyboardType: TextInputType.number,
                    ),
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
