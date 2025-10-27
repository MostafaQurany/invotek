import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/dialogs/dialogs.dart';
import 'package:invotek/features/invoices/ui/models/invoice_item_model.dart';
import 'package:invotek/features/invoices/ui/widgets/headers/edit_invoice_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/sections/add_invoice_form_section.dart';
import 'package:invotek/features/invoices/ui/widgets/sections/edit_invoice_bottom_actions.dart';
import 'package:invotek/features/invoices/ui/widgets/widgets.dart';
import 'package:invotek/generated/l10n.dart';

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

  // Customer and Items data
  CustomerModel? _selectedCustomer;
  List<InvoiceItemModel> _invoiceItems = [];

  // Invoice status check
  bool get _isInvoiceSent => widget.invoice.status == 'sent';

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
    _selectedDate =
        DateTime.tryParse(invoice.issueDate ?? "0.00") ?? DateTime.now();

    // Set customer if available
    if (invoice.customer != null) {
      // Convert InvoiceCustomerModel to CustomerModel
      _selectedCustomer = CustomerModel(
        id: invoice.customer!.id ?? 0,
        name: invoice.customer!.name ?? '',
        email: invoice.customer!.email ?? '',
        phone: invoice.customer!.phone,
        address: invoice.customer!.address,
        companyName: null, // InvoiceCustomerModel doesn't have companyName
        status: 'active', // Default status
      );
    }

    // TODO: Load invoice items from the invoice
    // For now, initialize with empty list
    _invoiceItems = [];
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

  void _onCustomerSelected(CustomerModel customer) {
    setState(() {
      _selectedCustomer = customer;
      _customerNameController.text = customer.name;
      _customerEmailController.text = customer.email;
      _customerPhoneController.text = customer.phone ?? '';
    });
  }

  void _onCustomerCreated(CustomerModel customer) {
    setState(() {
      _selectedCustomer = customer;
      _customerNameController.text = customer.name;
      _customerEmailController.text = customer.email;
      _customerPhoneController.text = customer.phone ?? '';
    });
  }

  void _onItemsChanged(List<InvoiceItemModel> items) {
    setState(() {
      _invoiceItems = items;
    });
  }

  void _onSubtotalChangedFromItems(double subtotal) {
    _subtotalController.text = subtotal.toStringAsFixed(2);
    _onSubtotalChanged(_subtotalController.text);
  }

  void _onSave() async {
    // Check if invoice is sent and cannot be edited
    if (_isInvoiceSent) {
      _showCannotEditDialog();
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: AppColors.primary),
                SizedBox(height: 16.h),
                Text(
                  S.of(context).updatingStatus,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      // Update invoice using InvoicesCubit
      await context.read<InvoicesCubit>().updateInvoice(
        id: widget.invoice.id!.toString(),
        customerId: _selectedCustomer?.id.toString(),
        customerName: _customerNameController.text.trim(),
        customerEmail: _customerEmailController.text.trim(),
        customerPhone: _customerPhoneController.text.trim(),
        subtotal: (double.tryParse(_subtotalController.text) ?? 0.0).toString(),
        taxAmount: (double.tryParse(_taxAmountController.text) ?? 0.0)
            .toString(),
        total: (double.tryParse(_totalController.text) ?? 0.0).toString(),
        description: _descriptionController.text.trim(),
        issueDate: _selectedDate.toIso8601String(),
        status: _selectedStatus,
        paymentMethodCode: _selectedPaymentMethod,
        // TODO: Convert InvoiceItemModel to UpdateInvoiceItemRequest
        // items: _invoiceItems,
      );

      // Close loading dialog
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white, size: 20.sp),
                SizedBox(width: 8.w),
                Expanded(child: Text(S.of(context).invoiceUpdatedSuccessfully)),
              ],
            ),
            backgroundColor: AppColors.success,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            margin: EdgeInsets.all(16.w),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      // Close loading dialog
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.white, size: 20.sp),
                SizedBox(width: 8.w),
                Expanded(child: Text(S.of(context).errorUpdatingInvoice)),
              ],
            ),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            margin: EdgeInsets.all(16.w),
          ),
        );
      }
    } finally {
      // Handle any cleanup if needed
    }
  }

  void _showCannotEditDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).cannotEditInvoice),
        content: Text(S.of(context).invoiceAlreadySent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  Widget _buildCustomerSelectionSection() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                S.of(context).customerSelection,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          if (_selectedCustomer != null)
            _buildSelectedCustomerCard()
          else
            _buildNoCustomerSelected(),

          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _showCustomerSelectionDialog,
                  icon: Icon(Icons.person_search, size: 20.sp),
                  label: Text(S.of(context).selectCustomer),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _showAddCustomerDialog,
                  icon: Icon(Icons.person_add, size: 20.sp),
                  label: Text(S.of(context).addNewCustomer),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedCustomerCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Text(
              _selectedCustomer!.name.isNotEmpty
                  ? _selectedCustomer!.name[0].toUpperCase()
                  : 'C',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _selectedCustomer!.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (_selectedCustomer!.email.isNotEmpty)
                  Text(
                    _selectedCustomer!.email,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                if (_selectedCustomer!.phone?.isNotEmpty == true)
                  Text(
                    _selectedCustomer!.phone!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _selectedCustomer = null;
                _customerNameController.clear();
                _customerEmailController.clear();
                _customerPhoneController.clear();
              });
            },
            icon: Icon(Icons.clear, color: AppColors.error, size: 20.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildNoCustomerSelected() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(
            Icons.person_outline,
            color: AppColors.textSecondary,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              S.of(context).noCustomerSelected,
              style: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomerSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: context.read<CustomersCubit>(),
        child: CustomerSelectionDialog(
          selectedCustomer: _selectedCustomer,
          onCustomerSelected: _onCustomerSelected,
          onAddNewCustomer: () {
            Navigator.pop(context);
            _showAddCustomerDialog();
          },
        ),
      ),
    );
  }

  void _showAddCustomerDialog() {
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: context.read<CustomersCubit>(),
        child: AddCustomerDialog(onCustomerCreated: _onCustomerCreated),
      ),
    );
  }

  Widget _buildWarningBanner() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.warning.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.warning,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).invoiceAlreadySent,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.warning,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  S.of(context).cannotEditSentInvoice,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Basic Information
          _buildReadOnlySection(
            title: S.of(context).basicInformation,
            icon: Icons.info_outline,
            children: [
              _buildReadOnlyField(
                label: S.of(context).invoiceNumber,
                value: widget.invoice.invoiceNumber ?? '',
              ),
              _buildReadOnlyField(
                label: S.of(context).issueDate,
                value: widget.invoice.issueDate ?? '',
              ),
              _buildReadOnlyField(
                label: S.of(context).status,
                value: widget.invoice.status ?? '',
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Customer Information
          _buildReadOnlySection(
            title: S.of(context).customerInformation,
            icon: Icons.person_outline,
            children: [
              _buildReadOnlyField(
                label: S.of(context).customerName,
                value: widget.invoice.customerName ?? '',
              ),
              _buildReadOnlyField(
                label: S.of(context).customerEmail,
                value: widget.invoice.customer?.email ?? '',
              ),
              _buildReadOnlyField(
                label: S.of(context).customerPhone,
                value: widget.invoice.customer?.phone ?? '',
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Amount Information
          _buildReadOnlySection(
            title: S.of(context).amountInformation,
            icon: Icons.attach_money,
            children: [
              _buildReadOnlyField(
                label: S.of(context).subtotal,
                value: widget.invoice.subtotal ?? '0.00',
              ),
              _buildReadOnlyField(
                label: S.of(context).taxAmount,
                value: widget.invoice.taxAmount ?? '0.00',
              ),
              _buildReadOnlyField(
                label: S.of(context).total,
                value: widget.invoice.total ?? '0.00',
              ),
              _buildReadOnlyField(
                label: S.of(context).paymentMethod,
                value: widget.invoice.paymentMethodCode ?? '',
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Additional Information
          _buildReadOnlySection(
            title: S.of(context).additionalInformation,
            icon: Icons.note_outlined,
            children: [
              _buildReadOnlyField(
                label: S.of(context).description,
                value: widget.invoice.description ?? '',
                isMultiline: true,
              ),
            ],
          ),

          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _buildReadOnlySection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, size: 20.sp, color: AppColors.primary),
              ),
              SizedBox(width: 12.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildReadOnlyField({
    required String label,
    required String value,
    bool isMultiline = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.border.withOpacity(0.5)),
            ),
            child: Text(
              value.isEmpty ? S.of(context).noData : value,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: value.isEmpty
                    ? AppColors.textSecondary
                    : AppColors.textPrimary,
              ),
              maxLines: isMultiline ? null : 1,
              overflow: isMultiline ? null : TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            // Modern Header with Animation
            SliverToBoxAdapter(
              child: AnimatedEntryWidget(
                delay: Duration.zero,
                child: EditInvoiceHeaderWidget(
                  invoice: widget.invoice,
                  onBack: _onCancel,
                  onSave: _onSave,
                ),
              ),
            ),

            // Warning banner if invoice is sent
            if (_isInvoiceSent)
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 200),
                  child: _buildWarningBanner(),
                ),
              ),

            // Space with Animation
            SliverToBoxAdapter(
              child: AnimatedEntryWidget(
                delay: Duration(milliseconds: 200),
                child: SizedBox(height: 16.h),
              ),
            ),

            // Form Content with Staggered Animation
            if (_isInvoiceSent)
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 400),
                  child: _buildReadOnlyView(),
                ),
              )
            else ...[
              // Basic Form Section with Animation
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 400),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
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
                ),
              ),

              // Space with Animation
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 600),
                  child: SizedBox(height: 16.h),
                ),
              ),

              // Customer Selection Section with Animation
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 800),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _buildCustomerSelectionSection(),
                  ),
                ),
              ),

              // Space with Animation
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 1000),
                  child: SizedBox(height: 16.h),
                ),
              ),

              // Items Section with Animation
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 1200),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: EditableInvoiceItemsSection(
                      items: _invoiceItems,
                      onItemsChanged: _onItemsChanged,
                      onSubtotalChanged: _onSubtotalChangedFromItems,
                    ),
                  ),
                ),
              ),

              // Space with Animation
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 1400),
                  child: SizedBox(height: 16.h),
                ),
              ),

              // Bottom Actions Section with Animation
              SliverToBoxAdapter(
                child: AnimatedEntryWidget(
                  delay: Duration(milliseconds: 1600),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: EditInvoiceBottomActions(
                      onSave: _onSave,
                      onCancel: _onCancel,
                    ),
                  ),
                ),
              ),

              // Bottom spacing
              SliverToBoxAdapter(child: SizedBox(height: 100.h)),
            ],
          ],
        ),
      ),
    );
  }
}
