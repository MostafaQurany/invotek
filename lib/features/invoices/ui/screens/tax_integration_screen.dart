import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/invoices/ui/widgets/headers/tax_integration_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/sections/tax_integration_form_section.dart';
import 'package:invotek/features/invoices/ui/widgets/sections/tax_integration_bottom_actions.dart';
import 'package:invotek/generated/l10n.dart';

class TaxIntegrationScreen extends StatefulWidget {
  const TaxIntegrationScreen({super.key});

  @override
  State<TaxIntegrationScreen> createState() => _TaxIntegrationScreenState();
}

class _TaxIntegrationScreenState extends State<TaxIntegrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  late TextEditingController _companyNameController;
  late TextEditingController _taxNumberController;
  late TextEditingController _vatNumberController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _countryController;
  late TextEditingController _postalCodeController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  // Form data
  String _selectedCountry = 'SA';
  String _selectedTaxType = 'vat';
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _companyNameController = TextEditingController();
    _taxNumberController = TextEditingController();
    _vatNumberController = TextEditingController();
    _addressController = TextEditingController();
    _cityController = TextEditingController();
    _countryController = TextEditingController();
    _postalCodeController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _taxNumberController.dispose();
    _vatNumberController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _postalCodeController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onCountryChanged(String country) {
    setState(() {
      _selectedCountry = country;
    });
  }

  void _onTaxTypeChanged(String taxType) {
    setState(() {
      _selectedTaxType = taxType;
    });
  }

  void _onEnabledChanged(bool enabled) {
    setState(() {
      _isEnabled = enabled;
    });
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement save logic
      Navigator.pop(context);
    }
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  void _onTestConnection() {
    // TODO: Implement test connection
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.of(context).testConnection)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final canPop = Navigator.of(context).canPop();
          if (canPop) {
            // السماح بالرجوع العادي بدون dialog
            Navigator.of(context).pop();
          } else {
            // فتح zoomDrawer والانتقال إلى home
            try {
              final zoomDrawer = ZoomDrawer.of(context);
              if (zoomDrawer != null) {
                // إغلاق zoomDrawer إذا كان مفتوحاً
                if (zoomDrawer.isOpen()) {
                  zoomDrawer.close();
                }
                // الانتقال إلى home باستخدام NavigationCubit
                context.read<NavigationCubit>().navigateToRoute(AppRoutes.homeRoute);
              } else {
                // Fallback: الانتقال إلى home مباشرة
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              }
            } catch (e) {
              // Fallback: الانتقال إلى home مباشرة
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Header
            TaxIntegrationHeaderWidget(
              onBack: _onCancel,
              onSave: _onSave,
            ),

            // Form Content
            Expanded(
              child: TaxIntegrationFormSection(
                companyNameController: _companyNameController,
                taxNumberController: _taxNumberController,
                vatNumberController: _vatNumberController,
                addressController: _addressController,
                cityController: _cityController,
                countryController: _countryController,
                postalCodeController: _postalCodeController,
                phoneController: _phoneController,
                emailController: _emailController,
                selectedCountry: _selectedCountry,
                selectedTaxType: _selectedTaxType,
                isEnabled: _isEnabled,
                onCountryChanged: _onCountryChanged,
                onTaxTypeChanged: _onTaxTypeChanged,
                onEnabledChanged: _onEnabledChanged,
                onTestConnection: _onTestConnection,
              ),
            ),

            // Bottom Actions
            TaxIntegrationBottomActions(
              onSave: _onSave,
              onCancel: _onCancel,
              onTestConnection: _onTestConnection,
            ),
          ],
        ),
      ),
      ),
    );
  }
}
