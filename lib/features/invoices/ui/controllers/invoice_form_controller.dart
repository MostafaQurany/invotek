import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceFormController extends ChangeNotifier {
  // Form Controllers
  final actionController = TextEditingController();
  final paymentMethodController = TextEditingController();
  final descriptionController = TextEditingController();
  final issueDateController = TextEditingController();
  final statusController = TextEditingController();

  // Customer Controllers
  final customerNameController = TextEditingController();
  final customerEmailController = TextEditingController();
  final customerPhoneController = TextEditingController();
  final customerAddressController = TextEditingController();

  // Calculation Controllers
  final subtotalController = TextEditingController();
  final taxAmountController = TextEditingController();
  final discountController = TextEditingController();
  final totalController = TextEditingController();

  // Form Data
  String selectedAction = 'save_only';
  String selectedPaymentMethod = 'cash';
  String selectedStatus = 'draft';
  DateTime selectedDate = DateTime.now();

  // Customer Data
  int? selectedCustomerId;
  String? selectedCustomerName;
  String? selectedCustomerEmail;
  String? selectedCustomerPhone;
  String? selectedCustomerAddress;

  // Items Data
  List<InvoiceItemData> items = [];

  // Stepper State
  int currentStep = 0;

  InvoiceFormController() {
    _initializeControllers();
  }

  void _initializeControllers() {
    actionController.text = selectedAction;
    paymentMethodController.text = selectedPaymentMethod;
    statusController.text = selectedStatus;
    issueDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  // Stepper Navigation
  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step <= 3) {
      currentStep = step;
    }
  }

  // Date Handling
  void onDateChanged(DateTime date) {
    selectedDate = date;
    issueDateController.text = DateFormat('yyyy-MM-dd').format(date);
    notifyListeners();
  }

  // Status Handling
  void onStatusChanged(String status) {
    selectedStatus = status;
    statusController.text = status;
    notifyListeners();
  }

  // Payment Method Handling
  void onPaymentMethodChanged(String paymentMethod) {
    selectedPaymentMethod = paymentMethod;
    paymentMethodController.text = paymentMethod;
    notifyListeners();
  }

  // Action Handling
  void onActionChanged(String action) {
    selectedAction = action;
    actionController.text = action;
    notifyListeners();
  }

  // Customer Handling
  void onCustomerSelected(
    int customerId,
    String name,
    String email,
    String phone,
    String address,
  ) {
    selectedCustomerId = customerId;
    selectedCustomerName = name;
    selectedCustomerEmail = email;
    selectedCustomerPhone = phone;
    selectedCustomerAddress = address;

    customerNameController.text = name;
    customerEmailController.text = email;
    customerPhoneController.text = phone;
    customerAddressController.text = address;
    notifyListeners();
  }

  void onNewCustomerAdded(
    String name,
    String email,
    String phone,
    String address,
  ) {
    selectedCustomerId = null;
    selectedCustomerName = name;
    selectedCustomerEmail = email;
    selectedCustomerPhone = phone;
    selectedCustomerAddress = address;

    customerNameController.text = name;
    customerEmailController.text = email;
    customerPhoneController.text = phone;
    customerAddressController.text = address;
  }

  // Items Handling
  void addItem(InvoiceItemData item) {
    items.add(item);
    calculateTotals();
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      calculateTotals();
      notifyListeners();
    }
  }

  void updateItem(int index, InvoiceItemData item) {
    if (index >= 0 && index < items.length) {
      items[index] = item;
      calculateTotals();
      notifyListeners();
    }
  }

  // Calculations
  void calculateTotals() {
    double subtotal = 0;
    double totalTax = 0;
    double totalDiscount = 0;

    for (var item in items) {
      double itemSubtotal =
          (double.tryParse(item.quantity) ?? 0.0) *
          (double.tryParse(item.price) ?? 0.0);
      double itemDiscount = double.tryParse(item.discount) ?? 0.0;
      double itemTax = double.tryParse(item.taxAmount) ?? 0.0;

      subtotal += itemSubtotal;
      totalTax += itemTax;
      totalDiscount += itemDiscount;
    }

    subtotalController.text = subtotal.toStringAsFixed(2);
    taxAmountController.text = totalTax.toStringAsFixed(2);
    discountController.text = totalDiscount.toStringAsFixed(2);

    double total = subtotal + totalTax - totalDiscount;
    totalController.text = total.toStringAsFixed(2);
  }

  // Validation
  bool validateCurrentStep() {
    switch (currentStep) {
      case 0: // Basic Info
        return selectedAction.isNotEmpty &&
            selectedPaymentMethod.isNotEmpty &&
            selectedStatus.isNotEmpty;
      case 1: // Customer
        return (selectedCustomerId != null) ||
            (selectedCustomerName != null && selectedCustomerName!.isNotEmpty);
      case 2: // Items
        return items.isNotEmpty;
      case 3: // Summary
        return true;
      default:
        return false;
    }
  }

  // Form Data for API
  Map<String, dynamic> toCreateInvoiceRequest() {
    return {
      'customer_id': selectedCustomerId?.toString(),
      'customer_name': selectedCustomerName,
      'customer_email': selectedCustomerEmail,
      'customer_phone': selectedCustomerPhone,
      'customer_address': selectedCustomerAddress,
      'subtotal': subtotalController.text,
      'tax_amount': taxAmountController.text,
      'discount': discountController.text,
      'total': totalController.text,
      'issue_date': issueDateController.text,
      'status': selectedStatus,
      'description': descriptionController.text,
      'payment_method_code': selectedPaymentMethod,
      'action': selectedAction,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  @override
  void dispose() {
    actionController.dispose();
    paymentMethodController.dispose();
    descriptionController.dispose();
    issueDateController.dispose();
    statusController.dispose();
    customerNameController.dispose();
    customerEmailController.dispose();
    customerPhoneController.dispose();
    customerAddressController.dispose();
    subtotalController.dispose();
    taxAmountController.dispose();
    discountController.dispose();
    totalController.dispose();
    super.dispose();
  }
}

// Invoice Item Data Model
class InvoiceItemData {
  final int? productId;
  final String name;
  final String quantity;
  final String price;
  final String discount;
  final String taxPercent;
  final String taxAmount;
  final String total;
  final String? productName;
  final String? productDescription;
  final String? productCategory;

  InvoiceItemData({
    this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.taxPercent,
    required this.taxAmount,
    required this.total,
    this.productName,
    this.productDescription,
    this.productCategory,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId?.toString(),
      'name': name,
      'quantity': quantity,
      'price': price,
      'discount': discount,
      'tax_percent': taxPercent,
      'tax_amount': taxAmount,
      'total': total,
      'product_name': productName,
      'product_description': productDescription,
      'product_category': productCategory,
    };
  }
}
