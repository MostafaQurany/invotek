import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/products/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/generated/l10n.dart';

class PricingTab extends StatelessWidget {
  final TextEditingController priceController;
  final TextEditingController costController;
  final TextEditingController taxRateController;
  final Map<String, String> validationErrors;

  const PricingTab({
    super.key,
    required this.priceController,
    required this.costController,
    required this.taxRateController,
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
          // Pricing Information Card
          FormSectionCard(
            title: s.pricing,
            icon: Icons.attach_money_outlined,
            children: [
              // Selling Price and Cost Price Row
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: priceController,
                      label: s.sellingPrice,
                      hint: 'Enter selling price',
                      icon: Icons.sell_outlined,
                      keyboardType: TextInputType.number,
                      isRequired: true,
                      errorText: validationErrors['price'],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      controller: costController,
                      label: s.costPrice,
                      hint: 'Enter cost price',
                      icon: Icons.account_balance_wallet_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Tax Rate
              CustomTextField(
                controller: taxRateController,
                label: s.taxRate,
                hint: 'Enter tax rate percentage',
                icon: Icons.percent_outlined,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
