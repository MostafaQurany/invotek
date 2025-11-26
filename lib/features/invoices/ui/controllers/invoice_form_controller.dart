import 'package:flutter/material.dart';
import 'package:invotek/core/utils/date_formatter.dart';

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
    issueDateController.text = DateFormatter.toApiFormat(selectedDate);
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
    issueDateController.text = DateFormatter.toApiFormat(date);
    notifyListeners();
  }

  // Status Handling
  void onStatusChanged(String status) {
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

  // Notify listeners when customer fields change
  void notifyCustomerFieldsChanged() {
    notifyListeners();
  }

  // Items Handling
  void addItem(InvoiceItemData item) {
    // إذا كان العنصر له productId، نتحقق من وجود عنصر بنفس productId
    if (item.productId != null) {
      final existingIndex = items.indexWhere(
        (existingItem) => existingItem.productId == item.productId,
      );

      if (existingIndex != -1) {
        // يوجد عنصر بنفس productId، ندمج الكميات
        final existingItem = items[existingIndex];
        final existingQty = double.tryParse(existingItem.quantity) ?? 0.0;
        final newQty = double.tryParse(item.quantity) ?? 0.0;
        final combinedQty = existingQty + newQty;

        // إعادة حساب القيم بناءً على الكمية المدمجة
        final price = double.tryParse(existingItem.price) ?? 0.0;
        final discount = double.tryParse(existingItem.discount) ?? 0.0;
        final taxPercent = double.tryParse(existingItem.taxPercent) ?? 0.0;

        final subtotal = combinedQty * price;
        final discountAmount = subtotal * (discount / 100);
        final afterDiscount = subtotal - discountAmount;
        final taxAmount = afterDiscount * (taxPercent / 100);
        final total = afterDiscount + taxAmount;

        // تحديث العنصر الموجود
        final updatedItem = InvoiceItemData(
          productId: existingItem.productId,
          name: existingItem.name,
          quantity: combinedQty.toStringAsFixed(0),
          price: existingItem.price,
          discount: existingItem.discount,
          taxPercent: existingItem.taxPercent,
          taxAmount: taxAmount.toStringAsFixed(2),
          total: total.toStringAsFixed(2),
          productName: existingItem.productName,
          productDescription: existingItem.productDescription,
          productCategory: existingItem.productCategory,
          availableQuantity: existingItem.availableQuantity,
        );

        items[existingIndex] = updatedItem;
        calculateTotals();
        notifyListeners();
        return;
      }
    }

    // إذا لم يوجد عنصر بنفس productId أو العنصر لا يحتوي على productId، نضيفه كعنصر جديد
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

    notifyListeners();
  }

  // Item quantity validation against available stock (if provided)
  String? validateItemQuantities() {
    for (final item in items) {
      final parsedQty = double.tryParse(item.quantity) ?? 0.0;
      if (parsedQty <= 0) {
        return 'الكمية يجب أن تكون أكبر من الصفر';
      }
      if (item.availableQuantity != null) {
        final max = item.availableQuantity!.toDouble();
        if (parsedQty > max) {
          return 'الكمية تتجاوز المخزون المتاح (${item.availableQuantity})';
        }
      }
    }
    return null;
  }

  // Validation
  bool validateCurrentStep() {
    switch (currentStep) {
      case 0: // Basic Info
        return selectedAction.isNotEmpty && selectedPaymentMethod.isNotEmpty;
      case 1: // Customer
        return isCustomerStepValid();
      case 2: // Items
        return items.isNotEmpty;
      case 3: // Summary
        return true;
      default:
        return false;
    }
  }

  // Check if customer step is valid
  bool isCustomerStepValid() {
    // If existing customer is selected
    if (selectedCustomerId != null) {
      return true;
    }
    // If new customer: only name is required
    return customerNameController.text.trim().isNotEmpty;
  }

  // Form Data for API
  Map<String, dynamic> toCreateInvoiceRequest() {
    // Ensure issue_date is in English format (convert Arabic digits to English)
    // Use toApiFormat to ensure English digits are always sent to API
    final issueDate = DateFormatter.parseApiDate(issueDateController.text);
    final formattedIssueDate = issueDate != null
        ? DateFormatter.toApiFormat(issueDate)
        : DateFormatter.extractDateFromApiString(issueDateController.text) ??
              issueDateController.text;

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
      'issue_date': formattedIssueDate,
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
  final int? availableQuantity; // optional, not sent to API

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
    this.availableQuantity,
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
