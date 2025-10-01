import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/generated/l10n.dart';

class ProductDetailsTab extends StatelessWidget {

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
                activeThumbColor: Theme.of(context).colorScheme.primary,
              ),
              Divider(height: 1),

              // Tax Switch
              SwitchListTile(
                title: Text(s.productIsTaxable),
                subtitle: Text(s.applyTaxToProduct),
                value: hasTax,
                onChanged: onTaxChanged,
                activeThumbColor: Theme.of(context).colorScheme.primary,
              ),
              Divider(height: 1),

              // Track Inventory Switch
              SwitchListTile(
                title: Text(s.trackInventory),
                subtitle: Text(s.trackAvailableProductQuantity),
                value: trackInventory,
                onChanged: onInventoryChanged,
                activeThumbColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
