import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class TaxIntegrationFormSection extends StatefulWidget {
  final TextEditingController companyNameController;
  final TextEditingController taxNumberController;
  final TextEditingController vatNumberController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final TextEditingController postalCodeController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final String selectedCountry;
  final String selectedTaxType;
  final bool isEnabled;
  final Function(String) onCountryChanged;
  final Function(String) onTaxTypeChanged;
  final Function(bool) onEnabledChanged;
  final VoidCallback onTestConnection;

  const TaxIntegrationFormSection({
    super.key,
    required this.companyNameController,
    required this.taxNumberController,
    required this.vatNumberController,
    required this.addressController,
    required this.cityController,
    required this.countryController,
    required this.postalCodeController,
    required this.phoneController,
    required this.emailController,
    required this.selectedCountry,
    required this.selectedTaxType,
    required this.isEnabled,
    required this.onCountryChanged,
    required this.onTaxTypeChanged,
    required this.onEnabledChanged,
    required this.onTestConnection,
  });

  @override
  State<TaxIntegrationFormSection> createState() => _TaxIntegrationFormSectionState();
}

class _TaxIntegrationFormSectionState extends State<TaxIntegrationFormSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tax Integration Settings Section
          _buildSectionHeader(
            title: S.of(context).taxIntegrationSettings,
            icon: Icons.settings,
          ),
          SizedBox(height: 16.h),
          _buildTaxIntegrationSettingsSection(),

          SizedBox(height: 24.h),

          // Company Information Section
          _buildSectionHeader(
            title: S.of(context).companyInformation,
            icon: Icons.business,
          ),
          SizedBox(height: 16.h),
          _buildCompanyInformationSection(),

          SizedBox(height: 24.h),

          // Contact Information Section
          _buildSectionHeader(
            title: S.of(context).contactInformation,
            icon: Icons.contact_phone,
          ),
          SizedBox(height: 16.h),
          _buildContactInformationSection(),

          SizedBox(height: 100.h), // Bottom spacing
        ],
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required IconData icon}) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: AppColors.primary),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildTaxIntegrationSettingsSection() {
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
        children: [
          // Enable Tax Integration
          Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).enableTaxIntegration,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Switch(
                value: widget.isEnabled,
                onChanged: widget.onEnabledChanged,
                activeThumbColor: AppColors.primary,
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Tax Type
          DropdownButtonFormField<String>(
            initialValue: widget.selectedTaxType,
            decoration: InputDecoration(
              labelText: S.of(context).taxType,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            items: [
              DropdownMenuItem(value: 'vat', child: Text(S.of(context).vat)),
              DropdownMenuItem(
                value: 'sales_tax',
                child: Text(S.of(context).salesTax),
              ),
            ],
            onChanged: (value) {
              if (value != null) widget.onTaxTypeChanged(value);
            },
          ),

          SizedBox(height: 16.h),

          // Country
          DropdownButtonFormField<String>(
            initialValue: widget.selectedCountry,
            decoration: InputDecoration(
              labelText: S.of(context).country,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            items: [
              DropdownMenuItem(
                value: 'SA',
                child: Text(S.of(context).saudiArabia),
              ),
              DropdownMenuItem(value: 'AE', child: Text(S.of(context).uae)),
              DropdownMenuItem(value: 'KW', child: Text(S.of(context).kuwait)),
            ],
            onChanged: (value) {
              if (value != null) widget.onCountryChanged(value);
            },
          ),

          SizedBox(height: 16.h),

          // Test Connection Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: widget.onTestConnection,
              icon: Icon(Icons.wifi_protected_setup),
              label: Text(S.of(context).testConnection),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: BorderSide(color: AppColors.primary),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyInformationSection() {
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
        children: [
          // Company Name
          TextField(
            controller: widget.companyNameController,
            decoration: InputDecoration(
              labelText: S.of(context).companyName,
              hintText: S.of(context).enterCompanyName,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Tax Number
          TextField(
            controller: widget.taxNumberController,
            decoration: InputDecoration(
              labelText: S.of(context).taxNumber,
              hintText: S.of(context).enterTaxNumber,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // VAT Number
          TextField(
            controller: widget.vatNumberController,
            decoration: InputDecoration(
              labelText: S.of(context).vatNumber,
              hintText: S.of(context).enterVatNumber,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Address
          TextField(
            controller: widget.addressController,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: S.of(context).address,
              hintText: S.of(context).enterAddress,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // City and Postal Code Row
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.cityController,
                  decoration: InputDecoration(
                    labelText: S.of(context).city,
                    hintText: S.of(context).enterCity,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: TextField(
                  controller: widget.postalCodeController,
                  decoration: InputDecoration(
                    labelText: S.of(context).postalCode,
                    hintText: S.of(context).enterPostalCode,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInformationSection() {
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
        children: [
          // Phone
          TextField(
            controller: widget.phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: S.of(context).phone,
              hintText: S.of(context).enterPhone,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Email
          TextField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: S.of(context).email,
              hintText: S.of(context).enterEmail,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
