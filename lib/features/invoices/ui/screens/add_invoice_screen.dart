import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/features/invoices/ui/widgets/headers/add_invoice_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/sections/add_invoice_form_section.dart';
import 'package:invotek/features/invoices/ui/widgets/sections/add_invoice_bottom_actions.dart';

class AddInvoiceScreen extends StatefulWidget {
  const AddInvoiceScreen({super.key});

  @override
  State<AddInvoiceScreen> createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  late TextEditingController _invoiceNumberController;
  late TextEditingController _customerNameController;
  late TextEditingController _customerEmailController;
  late TextEditingController _customerPhoneController;
  late TextEditingController _subtotalController;
  late TextEditingController _taxAmountController;
  late TextEditingController _totalController;
  late TextEditingController _descriptionController;
  late TextEditingController _issueDateController;

  // Form data
  String _selectedStatus = 'draft';
  String _selectedPaymentMethod = 'cash';
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _invoiceNumberController = TextEditingController();
    _customerNameController = TextEditingController();
    _customerEmailController = TextEditingController();
    _customerPhoneController = TextEditingController();
    _subtotalController = TextEditingController();
    _taxAmountController = TextEditingController();
    _totalController = TextEditingController();
    _descriptionController = TextEditingController();
    _issueDateController = TextEditingController(
      text: DateFormatter.toApiFormat(_selectedDate),
    );
  }

  @override
  void dispose() {
    _invoiceNumberController.dispose();
    _customerNameController.dispose();
    _customerEmailController.dispose();
    _customerPhoneController.dispose();
    _subtotalController.dispose();
    _taxAmountController.dispose();
    _totalController.dispose();
    _descriptionController.dispose();
    _issueDateController.dispose();
    super.dispose();
  }

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
      _issueDateController.text = DateFormatter.toApiFormat(date);
    });
  }

  void _onStatusChanged(String status) {
    setState(() {
      _selectedStatus = status;
    });
  }

  void _onPaymentMethodChanged(String paymentMethod) {
    setState(() {
      _selectedPaymentMethod = paymentMethod;
    });
  }

  void _onSubtotalChanged(String value) {
    final subtotal = double.tryParse(value) ?? 0.0;
    final taxAmount = double.tryParse(_taxAmountController.text) ?? 0.0;
    final total = subtotal + taxAmount;
    _totalController.text = total.toStringAsFixed(2);
  }

  void _onTaxAmountChanged(String value) {
    final subtotal = double.tryParse(_subtotalController.text) ?? 0.0;
    final taxAmount = double.tryParse(value) ?? 0.0;
    final total = subtotal + taxAmount;
    _totalController.text = total.toStringAsFixed(2);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Header
            AddInvoiceHeaderWidget(
              onBack: _onCancel,
              onSave: _onSave,
            ),

            // Form Content
            Expanded(
              child: AddInvoiceFormSection(
                invoiceNumberController: _invoiceNumberController,
                customerNameController: _customerNameController,
                customerEmailController: _customerEmailController,
                customerPhoneController: _customerPhoneController,
                subtotalController: _subtotalController,
                taxAmountController: _taxAmountController,
                totalController: _totalController,
                descriptionController: _descriptionController,
                issueDateController: _issueDateController,
                selectedStatus: _selectedStatus,
                selectedPaymentMethod: _selectedPaymentMethod,
                selectedDate: _selectedDate,
                onDateChanged: _onDateChanged,
                onStatusChanged: _onStatusChanged,
                onPaymentMethodChanged: _onPaymentMethodChanged,
                onSubtotalChanged: _onSubtotalChanged,
                onTaxAmountChanged: _onTaxAmountChanged,
              ),
            ),

            // Bottom Actions
            AddInvoiceBottomActions(
              onSave: _onSave,
              onCancel: _onCancel,
            ),
          ],
        ),
      ),
    );
  }
}
