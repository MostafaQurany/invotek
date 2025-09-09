import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/customers/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/customers/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/generated/l10n.dart';

class BasicInfoTab extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController companyNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController taxNumberController;
  final TextEditingController commercialRegisterController;
  final Map<String, String> validationErrors;

  const BasicInfoTab({
    super.key,
    required this.nameController,
    required this.companyNameController,
    required this.emailController,
    required this.phoneController,
    required this.taxNumberController,
    required this.commercialRegisterController,
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
          // Basic Information Card
          FormSectionCard(
            title: s.customerBasicInfo,
            icon: Icons.person_outline,
            children: [
              // Customer Name
              CustomTextField(
                controller: nameController,
                label: s.customerName,
                hint: 'Enter customer name',
                icon: Icons.person,
                isRequired: true,
                errorText: validationErrors['name'],
              ),
              SizedBox(height: 16.h),

              // Company Name
              CustomTextField(
                controller: companyNameController,
                label: s.customerCompanyName,
                hint: 'Enter company name',
                icon: Icons.business_outlined,
              ),
              SizedBox(height: 16.h),

              // Email
              CustomTextField(
                controller: emailController,
                label: s.customerEmail,
                hint: 'Enter email address',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                isRequired: true,
                errorText: validationErrors['email'],
              ),
              SizedBox(height: 16.h),

              // Phone
              CustomTextField(
                controller: phoneController,
                label: s.customerPhone,
                hint: 'Enter phone number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                isRequired: true,
                errorText: validationErrors['phone'],
              ),
              SizedBox(height: 16.h),

              // Tax Number
              CustomTextField(
                controller: taxNumberController,
                label: s.customerTaxNumber,
                hint: 'Enter tax number',
                icon: Icons.receipt_outlined,
              ),
              SizedBox(height: 16.h),

              // Commercial Register
              CustomTextField(
                controller: commercialRegisterController,
                label: s.customerCommercialRegister,
                hint: 'Enter commercial register',
                icon: Icons.description_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
