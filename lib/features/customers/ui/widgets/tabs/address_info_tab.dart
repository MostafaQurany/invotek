import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/customers/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/customers/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/generated/l10n.dart';

class AddressInfoTab extends StatelessWidget {
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController postalCodeController;
  final TextEditingController addressController;
  final TextEditingController detailedAddressController;

  const AddressInfoTab({
    super.key,
    required this.cityController,
    required this.regionController,
    required this.postalCodeController,
    required this.addressController,
    required this.detailedAddressController,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Address Information Card
          FormSectionCard(
            title: s.customerAddress,
            icon: Icons.location_on_outlined,
            children: [
              // City
              CustomTextField(
                controller: cityController,
                label: s.customerCity,
                hint: 'Enter city',
                icon: Icons.location_city_outlined,
              ),
              SizedBox(height: 16.h),

              // Region
              CustomTextField(
                controller: regionController,
                label: s.customerRegion,
                hint: 'Enter region',
                icon: Icons.map_outlined,
              ),
              SizedBox(height: 16.h),

              // Postal Code
              CustomTextField(
                controller: postalCodeController,
                label: s.customerPostalCode,
                hint: 'Enter postal code',
                icon: Icons.local_post_office_outlined,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.h),

              // Address
              CustomTextField(
                controller: addressController,
                label: s.customerAddress,
                hint: 'Enter address',
                icon: Icons.home_outlined,
                maxLines: 2,
              ),
              SizedBox(height: 16.h),

              // Detailed Address
              CustomTextField(
                controller: detailedAddressController,
                label: s.customerDetailedAddress,
                hint: 'Enter detailed address',
                icon: Icons.location_on_outlined,
                maxLines: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
