import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/ui/widgets/headers/edit_invoice_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/sections/add_invoice_form_section.dart';
import 'package:invotek/features/invoices/ui/widgets/sections/edit_invoice_bottom_actions.dart';

class EditInvoiceScreen extends StatefulWidget {
  final InvoiceModel invoice;

  const EditInvoiceScreen({super.key, required this.invoice});

  @override
  State<EditInvoiceScreen> createState() => _EditInvoiceScreenState();
}

class _EditInvoiceScreenState extends State<EditInvoiceScreen> {
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
    _populateFormData();
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
    _issueDateController = TextEditingController();
  }

  void _populateFormData() {
    final invoice = widget.invoice;
    _invoiceNumberController.text = invoice.invoiceNumber ?? "Invoice Number";
    _customerNameController.text = invoice.customerName ?? "Customer Name";
    _customerEmailController.text = invoice.customer?.email ?? "Customer Email";
    _customerPhoneController.text = invoice.customer?.phone ?? "Customer Phone";
    _subtotalController.text = invoice.subtotal ?? "0.00";
    _taxAmountController.text = invoice.taxAmount ?? "0.00";
    _totalController.text = invoice.total ?? "0.00";
    _descriptionController.text = invoice.description ?? "No Description";
    _issueDateController.text = invoice.issueDate ?? "0.00";
    
    _selectedStatus = invoice.status ?? "draft";
    _selectedPaymentMethod = invoice.paymentMethodCode ?? "cash";
    _selectedDate = DateTime.tryParse(invoice.issueDate ?? "0.00") ?? DateTime.now();
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
      _issueDateController.text = DateFormat('yyyy-MM-dd').format(date);
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
      // TODO: Implement update logic
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
            EditInvoiceHeaderWidget(
              invoice: widget.invoice,
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
            EditInvoiceBottomActions(
              onSave: _onSave,
              onCancel: _onCancel,
            ),
          ],
        ),
      ),
    );
  }
}
