// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(version, build) => "Version ${version} (Build ${build})";

  static String m1(name) => "Are you sure you want to delete \"${name}\"?";

  static String m2(name) =>
      "Are you sure you want to delete client \"${name}\"?";

  static String m3(phone) => "Calling ${phone}";

  static String m4(number) => "Change payment method for invoice ${number}";

  static String m5(name) =>
      "Are you sure you want to delete customer \"${name}\"?";

  static String m6(name) => "Customer \"${name}\" created successfully";

  static String m7(name) => "Customer \"${name}\" updated successfully";

  static String m8(error) => "Data conversion error: ${error}";

  static String m9(name) =>
      "Are you sure you want to delete category \"${name}\"?";

  static String m10(name) =>
      "Are you sure you want to delete customer \"${name}\"?";

  static String m11(name) =>
      "Are you sure you want to delete product \"${name}\"?";

  static String m12(name) => "Are you sure you want to delete user ${name}?";

  static String m13(number) => "Duplicate invoice ${number}";

  static String m14(name) => "Edit client data for \"${name}\"";

  static String m15(error) => "Error creating client: ${error}";

  static String m16(error) => "Failed to create file: ${error}";

  static String m17(error) => "Error deleting client: ${error}";

  static String m18(error) => "Error deleting clients: ${error}";

  static String m19(error) => "Failed to delete invoice: ${error}";

  static String m20(error) => "Error loading clients: ${error}";

  static String m21(error) => "Error loading statistics: ${error}";

  static String m22(error) => "Error: ${error}";

  static String m23(error) => "An error occurred: ${error}";

  static String m24(error) => "Failed to print invoice: ${error}";

  static String m25(error) => "Failed to send invoice: ${error}";

  static String m26(error) => "Failed to share invoice: ${error}";

  static String m27(error) => "Error updating client: ${error}";

  static String m28(error) => "Error updating client status: ${error}";

  static String m29(error) => "Failed to update status: ${error}";

  static String m30(error) => "Failed to add role: ${error}";

  static String m31(error) => "Failed to delete role: ${error}";

  static String m32(error) => "Failed to load roles and permissions: ${error}";

  static String m33(error) => "Failed to load user permissions: ${error}";

  static String m34(error) => "Failed to update role: ${error}";

  static String m35(error) => "Failed to update user permissions: ${error}";

  static String m36(number, timestamp) => "Invoice_${number}_${timestamp}";

  static String m37(path) => "File saved to: ${path}";

  static String m38(number) => "Invoice Number: ${number}";

  static String m39(status) => "Invoice status updated to: ${status}";

  static String m40(name, quantity, price, total) =>
      "${name}\t\t${quantity}\t${price}\t${total}";

  static String m41(name) => "Loading product details...";

  static String m42(email) => "Opening email to ${email}";

  static String m43(separator, number, date, status, customer, contact, items,
          subtotal, tax, total) =>
      "Invoice\n${separator}\nInvoice Number: ${number}\nDate: ${date}\nStatus: ${status}\n\nCustomer Information:\nName: ${customer}\n${contact}\n\nInvoice Items:\n${items}\n\nTotals:\nSubtotal: ${subtotal} SAR\n${tax}\nTotal: ${total} SAR\n\n${separator}\nThank you for your business\nThis invoice was created by Invotek App\n${separator}";

  static String m44(number, customer, date, amount, status) =>
      "Invoice Number: ${number}\nCustomer: ${customer}\nDate: ${date}\nAmount: ${amount} SAR\nStatus: ${status}\n\nCreated by Invotek App";

  static String m45(status) => "Status: ${status}";

  static String m46(amount) => "Subtotal: ${amount} SAR";

  static String m47(amount) => "Tax: ${amount} SAR";

  static String m48(number) => "Tax UID for invoice ${number}:";

  static String m49(amount) => "Total: ${amount} SAR";

  static String m50(name) => "View customer details: ${name}";

  static String m51(name) => "View item details: ${name}";

  static String m52(name) => "Viewing invoices for ${name}";

  static String m53(name) => "Viewing orders for ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountant": MessageLookupByLibrary.simpleMessage("Accountant"),
        "accountantDescription": MessageLookupByLibrary.simpleMessage(
            "Manages invoices, expenses and financial reports"),
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addANewUser": MessageLookupByLibrary.simpleMessage("Add a new user"),
        "addAndEditCustomers": MessageLookupByLibrary.simpleMessage(
            "Add, edit and delete customers"),
        "addCategory": MessageLookupByLibrary.simpleMessage("Add Category"),
        "addClient": MessageLookupByLibrary.simpleMessage("Add Client"),
        "addClientDescription":
            MessageLookupByLibrary.simpleMessage("Ability to add new client"),
        "addCustomer": MessageLookupByLibrary.simpleMessage("Add Customer"),
        "addEditDeleteCustomers": MessageLookupByLibrary.simpleMessage(
            "Add, edit and delete customers"),
        "addExpense": MessageLookupByLibrary.simpleMessage("Add Expense"),
        "addExpenseDescription":
            MessageLookupByLibrary.simpleMessage("Ability to add new expense"),
        "addExpenseHelp":
            MessageLookupByLibrary.simpleMessage("Help for adding an expense"),
        "addExpenseHelpDescription": MessageLookupByLibrary.simpleMessage(
            "This screen allows you to create and track business expenses. Here\'s what you can do:"),
        "addFirstInvoice":
            MessageLookupByLibrary.simpleMessage("Add First Invoice"),
        "addInvoice": MessageLookupByLibrary.simpleMessage("Add Invoice"),
        "addItemsToInvoice":
            MessageLookupByLibrary.simpleMessage("Add items to invoice"),
        "addNewClient": MessageLookupByLibrary.simpleMessage("Add New Client"),
        "addNewCustomer":
            MessageLookupByLibrary.simpleMessage("Add New Customer"),
        "addNewExpenseCategory":
            MessageLookupByLibrary.simpleMessage("Add New Expense Category"),
        "addNewRole": MessageLookupByLibrary.simpleMessage("Add New Role"),
        "addNewUserMessage": MessageLookupByLibrary.simpleMessage(
            "Press the add button to create a new user"),
        "addNotes": MessageLookupByLibrary.simpleMessage("Add Notes"),
        "addProduct": MessageLookupByLibrary.simpleMessage("Add Product"),
        "addProductDescription":
            MessageLookupByLibrary.simpleMessage("Ability to add new product"),
        "addReferenceNumberAndNotes": MessageLookupByLibrary.simpleMessage(
            "Add reference number and notes"),
        "addUser": MessageLookupByLibrary.simpleMessage("Add User"),
        "addUserDescription":
            MessageLookupByLibrary.simpleMessage("Ability to add new user"),
        "additionalInfo":
            MessageLookupByLibrary.simpleMessage("Additional Info"),
        "additionalInformation":
            MessageLookupByLibrary.simpleMessage("Additional Information"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Additional Settings"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "addressInformation":
            MessageLookupByLibrary.simpleMessage("Address Information"),
        "admin": MessageLookupByLibrary.simpleMessage("Admin"),
        "advancedTechCompany":
            MessageLookupByLibrary.simpleMessage("Advanced Technology Company"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "allCategories": MessageLookupByLibrary.simpleMessage("All Categories"),
        "allCategoriesDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage(
                "All categories deleted successfully"),
        "allCustomers": MessageLookupByLibrary.simpleMessage("All Customers"),
        "allPaymentMethods":
            MessageLookupByLibrary.simpleMessage("All Payment Methods"),
        "allStatus": MessageLookupByLibrary.simpleMessage("All Status"),
        "allStatuses": MessageLookupByLibrary.simpleMessage("All Statuses"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "amountHelperText": MessageLookupByLibrary.simpleMessage(
            "Enter the total amount spent including tax"),
        "amountHint": MessageLookupByLibrary.simpleMessage("0.00"),
        "amountInformation":
            MessageLookupByLibrary.simpleMessage("Amount Information"),
        "amountIsRequired":
            MessageLookupByLibrary.simpleMessage("Amount is required"),
        "appInfo": MessageLookupByLibrary.simpleMessage("App Information"),
        "appVersionWithBuild": m0,
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "applyTaxToProduct":
            MessageLookupByLibrary.simpleMessage("Apply Tax to Product"),
        "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
        "areYouSureDelete": m1,
        "areYouSureDeleteClient": m2,
        "authError": MessageLookupByLibrary.simpleMessage(
            "Login failed. Please check your email and password."),
        "available": MessageLookupByLibrary.simpleMessage("Available"),
        "backToCategories":
            MessageLookupByLibrary.simpleMessage("Back to Categories"),
        "backup": MessageLookupByLibrary.simpleMessage("Backup"),
        "bankTransfer": MessageLookupByLibrary.simpleMessage("Bank Transfer"),
        "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
        "basicInformation":
            MessageLookupByLibrary.simpleMessage("Basic Information"),
        "boughtThis": MessageLookupByLibrary.simpleMessage("Bought This"),
        "brand": MessageLookupByLibrary.simpleMessage("Brand"),
        "buttonPressed":
            MessageLookupByLibrary.simpleMessage("Normal button pressed"),
        "buttons": MessageLookupByLibrary.simpleMessage("Buttons"),
        "calling": m3,
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cannotOpenEmailApp": MessageLookupByLibrary.simpleMessage(
            "Cannot open email application"),
        "cannotOpenWebsite":
            MessageLookupByLibrary.simpleMessage("Cannot open website"),
        "card": MessageLookupByLibrary.simpleMessage("Card"),
        "cardPressed": MessageLookupByLibrary.simpleMessage("Card pressed"),
        "cards": MessageLookupByLibrary.simpleMessage("Cards"),
        "cash": MessageLookupByLibrary.simpleMessage("Cash"),
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "categoriesAppbar":
            MessageLookupByLibrary.simpleMessage("Product Categories"),
        "categorization":
            MessageLookupByLibrary.simpleMessage("Categorization"),
        "category": MessageLookupByLibrary.simpleMessage("Category"),
        "categoryAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Category added successfully"),
        "categoryCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Category created successfully"),
        "categoryDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Category deleted successfully"),
        "categoryDescription":
            MessageLookupByLibrary.simpleMessage("Category Description"),
        "categoryName": MessageLookupByLibrary.simpleMessage("Category Name"),
        "categoryNameRequired":
            MessageLookupByLibrary.simpleMessage("Category name is required"),
        "categoryPreview":
            MessageLookupByLibrary.simpleMessage("Category Preview"),
        "categoryUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Category updated successfully"),
        "centimeters": MessageLookupByLibrary.simpleMessage("cm"),
        "changePaymentMethod":
            MessageLookupByLibrary.simpleMessage("Change Payment Method"),
        "changePaymentMethodForInvoice": m4,
        "changeStatus": MessageLookupByLibrary.simpleMessage("Change Status"),
        "check": MessageLookupByLibrary.simpleMessage("Check"),
        "chooseFeature": MessageLookupByLibrary.simpleMessage(
            "Choose the feature you want to manage"),
        "city": MessageLookupByLibrary.simpleMessage("City"),
        "clearFilters": MessageLookupByLibrary.simpleMessage("Clear Filters"),
        "clientAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Client added successfully"),
        "clientDetails": MessageLookupByLibrary.simpleMessage("Client Details"),
        "clientName": MessageLookupByLibrary.simpleMessage("Client Name"),
        "clientUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Client updated successfully"),
        "clientsList": MessageLookupByLibrary.simpleMessage("Clients List"),
        "clientsManagement":
            MessageLookupByLibrary.simpleMessage("Clients Management"),
        "clientsProducts":
            MessageLookupByLibrary.simpleMessage("Clients and Products"),
        "clientsProductsDesc": MessageLookupByLibrary.simpleMessage(
            "Control of clients and products"),
        "clientsProductsTitle":
            MessageLookupByLibrary.simpleMessage("Clients and Products"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "color": MessageLookupByLibrary.simpleMessage("Color"),
        "company": MessageLookupByLibrary.simpleMessage("Company"),
        "companyAddress":
            MessageLookupByLibrary.simpleMessage("Company Address"),
        "companyAddressRequired":
            MessageLookupByLibrary.simpleMessage("Company address is required"),
        "companyEmail": MessageLookupByLibrary.simpleMessage("Company Email"),
        "companyEmailInvalid":
            MessageLookupByLibrary.simpleMessage("Invalid company email"),
        "companyEmailRequired":
            MessageLookupByLibrary.simpleMessage("Company email is required"),
        "companyInformation":
            MessageLookupByLibrary.simpleMessage("Company Information"),
        "companyName": MessageLookupByLibrary.simpleMessage("Company Name"),
        "companyNameRequired":
            MessageLookupByLibrary.simpleMessage("Company name is required"),
        "companyPhone": MessageLookupByLibrary.simpleMessage("Company Phone"),
        "companyPhoneRequired":
            MessageLookupByLibrary.simpleMessage("Company phone is required"),
        "companySettings":
            MessageLookupByLibrary.simpleMessage("Company Settings"),
        "companySettingsDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to edit company settings"),
        "completeRequiredFields":
            MessageLookupByLibrary.simpleMessage("Complete required fields"),
        "configureTaxIntegration":
            MessageLookupByLibrary.simpleMessage("Configure Tax Integration"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage("Confirm Delete"),
        "confirmDeleteCustomer":
            MessageLookupByLibrary.simpleMessage("Confirm Delete"),
        "confirmDeleteCustomerMessage": m5,
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
            "Password confirmation is required"),
        "constructionDevelopmentCompany": MessageLookupByLibrary.simpleMessage(
            "Construction & Development Company"),
        "contactInfo": MessageLookupByLibrary.simpleMessage("Contact Info"),
        "contactInformation":
            MessageLookupByLibrary.simpleMessage("Contact Information"),
        "contactPersonEmail":
            MessageLookupByLibrary.simpleMessage("Contact Person Email"),
        "contactPersonInformation":
            MessageLookupByLibrary.simpleMessage("Contact Person Information"),
        "contactPersonName":
            MessageLookupByLibrary.simpleMessage("Contact Person Name"),
        "contactPersonPhone":
            MessageLookupByLibrary.simpleMessage("Contact Person Phone"),
        "contactUsForSupport":
            MessageLookupByLibrary.simpleMessage("Contact us for support"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("Copied to clipboard"),
        "copy": MessageLookupByLibrary.simpleMessage("Copy"),
        "costPrice": MessageLookupByLibrary.simpleMessage("Cost Price"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Create an account"),
        "createAndEditInvoices":
            MessageLookupByLibrary.simpleMessage("Create and edit invoices"),
        "createEditInvoices":
            MessageLookupByLibrary.simpleMessage("Create and edit invoices"),
        "createExpense": MessageLookupByLibrary.simpleMessage("Create Expense"),
        "createInvoice": MessageLookupByLibrary.simpleMessage("Create Invoice"),
        "createInvoiceDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to create new invoice"),
        "createInvoiceStep1": MessageLookupByLibrary.simpleMessage(
            "1. Enter basic customer information"),
        "createInvoiceStep2":
            MessageLookupByLibrary.simpleMessage("2. Add items and quantities"),
        "createInvoiceStep3": MessageLookupByLibrary.simpleMessage(
            "3. Set payment method and date"),
        "createInvoiceStep4": MessageLookupByLibrary.simpleMessage(
            "4. Review and save the invoice"),
        "createNewInvoice":
            MessageLookupByLibrary.simpleMessage("Create New Invoice"),
        "createYourFirstExpenseCategory": MessageLookupByLibrary.simpleMessage(
            "Create your first expense category"),
        "createdAt": MessageLookupByLibrary.simpleMessage("Created At"),
        "createdBy": MessageLookupByLibrary.simpleMessage("Created By"),
        "createdByInvotek": MessageLookupByLibrary.simpleMessage(
            "This invoice was created by Invotek App"),
        "createdDate": MessageLookupByLibrary.simpleMessage("Created"),
        "creatingFile":
            MessageLookupByLibrary.simpleMessage("Creating file..."),
        "creatingInvoices":
            MessageLookupByLibrary.simpleMessage("Creating Invoices"),
        "creationDate": MessageLookupByLibrary.simpleMessage("Creation Date"),
        "creditCard": MessageLookupByLibrary.simpleMessage("Credit Card"),
        "customer": MessageLookupByLibrary.simpleMessage("Customer"),
        "customerAdditionalInfo":
            MessageLookupByLibrary.simpleMessage("Additional Information"),
        "customerAddress":
            MessageLookupByLibrary.simpleMessage("Customer Address"),
        "customerBasicInfo":
            MessageLookupByLibrary.simpleMessage("Customer Information"),
        "customerBasicInfoSection":
            MessageLookupByLibrary.simpleMessage("Basic Information"),
        "customerCity": MessageLookupByLibrary.simpleMessage("City"),
        "customerCommercialRegister":
            MessageLookupByLibrary.simpleMessage("Commercial Register Number"),
        "customerCompanyName":
            MessageLookupByLibrary.simpleMessage("Company/Organization Name"),
        "customerCreatedSuccessfully": m6,
        "customerDataCopied": MessageLookupByLibrary.simpleMessage(
            "Customer data copied to clipboard"),
        "customerDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Customer deleted successfully"),
        "customerDetailedAddress":
            MessageLookupByLibrary.simpleMessage("Detailed Address"),
        "customerDetails":
            MessageLookupByLibrary.simpleMessage("Customer Details"),
        "customerEmail": MessageLookupByLibrary.simpleMessage("Customer Email"),
        "customerInformation":
            MessageLookupByLibrary.simpleMessage("Customer Information"),
        "customerManagement":
            MessageLookupByLibrary.simpleMessage("Customer Management"),
        "customerName": MessageLookupByLibrary.simpleMessage("Customer Name"),
        "customerNameRequired":
            MessageLookupByLibrary.simpleMessage("Customer name is required"),
        "customerNotes": MessageLookupByLibrary.simpleMessage("Notes"),
        "customerPhone": MessageLookupByLibrary.simpleMessage("Customer Phone"),
        "customerPhoneRequired":
            MessageLookupByLibrary.simpleMessage("Phone number is required"),
        "customerPostalCode":
            MessageLookupByLibrary.simpleMessage("Postal Code"),
        "customerRegion":
            MessageLookupByLibrary.simpleMessage("Region/Province"),
        "customerResponsiblePerson":
            MessageLookupByLibrary.simpleMessage("Responsible Person"),
        "customerStatus": MessageLookupByLibrary.simpleMessage("Status"),
        "customerStatusActive": MessageLookupByLibrary.simpleMessage("Active"),
        "customerStatusInactive":
            MessageLookupByLibrary.simpleMessage("Inactive"),
        "customerTaxNumber": MessageLookupByLibrary.simpleMessage("Tax Number"),
        "customerUpdatedSuccessfully": m7,
        "customers": MessageLookupByLibrary.simpleMessage("Customers"),
        "customersList": MessageLookupByLibrary.simpleMessage("Customers List"),
        "customersManagement":
            MessageLookupByLibrary.simpleMessage("Customers"),
        "customersReport":
            MessageLookupByLibrary.simpleMessage("Customers Report"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "darkModeDisabled":
            MessageLookupByLibrary.simpleMessage("Dark mode disabled"),
        "darkModeEnabled":
            MessageLookupByLibrary.simpleMessage("Dark mode enabled"),
        "dataConversionError": m8,
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "debitCard": MessageLookupByLibrary.simpleMessage("Debit Card"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAllCategories":
            MessageLookupByLibrary.simpleMessage("Delete All Categories"),
        "deleteCategory":
            MessageLookupByLibrary.simpleMessage("Delete Category"),
        "deleteCategoryConfirmation": m9,
        "deleteClient": MessageLookupByLibrary.simpleMessage("Delete Client"),
        "deleteClientDescription":
            MessageLookupByLibrary.simpleMessage("Ability to delete client"),
        "deleteConfirmation":
            MessageLookupByLibrary.simpleMessage("Delete Confirmation"),
        "deleteCustomer":
            MessageLookupByLibrary.simpleMessage("Delete Customer"),
        "deleteCustomerConfirmation": m10,
        "deleteExpense": MessageLookupByLibrary.simpleMessage("Delete Expense"),
        "deleteExpenseDescription":
            MessageLookupByLibrary.simpleMessage("Ability to delete expense"),
        "deleteInvoice": MessageLookupByLibrary.simpleMessage("Delete Invoice"),
        "deleteInvoiceConfirmation":
            MessageLookupByLibrary.simpleMessage("Delete Invoice Confirmation"),
        "deleteInvoiceDescription":
            MessageLookupByLibrary.simpleMessage("Ability to delete invoice"),
        "deleteInvoiceWarning": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this invoice? This action cannot be undone."),
        "deleteProduct": MessageLookupByLibrary.simpleMessage("Delete Product"),
        "deleteProductConfirmation": m11,
        "deleteProductDescription":
            MessageLookupByLibrary.simpleMessage("Ability to delete product"),
        "deleteUser": MessageLookupByLibrary.simpleMessage("Delete User"),
        "deleteUserConfirmation": m12,
        "deleteUserDescription":
            MessageLookupByLibrary.simpleMessage("Ability to delete user"),
        "deleteUserPermanently":
            MessageLookupByLibrary.simpleMessage("Delete user permanently"),
        "deletingInvoice":
            MessageLookupByLibrary.simpleMessage("Deleting invoice..."),
        "department": MessageLookupByLibrary.simpleMessage("Department"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "descriptionHint": MessageLookupByLibrary.simpleMessage(
            "Add more details about this expense"),
        "deviceInfo":
            MessageLookupByLibrary.simpleMessage("Device Information"),
        "deviceType": MessageLookupByLibrary.simpleMessage("Device Type"),
        "dimensions": MessageLookupByLibrary.simpleMessage("Dimensions"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "downloadPDF": MessageLookupByLibrary.simpleMessage("Download PDF"),
        "draft": MessageLookupByLibrary.simpleMessage("Draft"),
        "duplicate": MessageLookupByLibrary.simpleMessage("Duplicate"),
        "duplicateInvoice":
            MessageLookupByLibrary.simpleMessage("Duplicate Invoice"),
        "duplicateInvoiceMessage": m13,
        "easyInvoiceCustomerManagement": MessageLookupByLibrary.simpleMessage(
            "Easy invoice and customer management"),
        "ecommerceInstitution":
            MessageLookupByLibrary.simpleMessage("E-commerce Institution"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "editCategory": MessageLookupByLibrary.simpleMessage("Edit Category"),
        "editClient": MessageLookupByLibrary.simpleMessage("Edit Client"),
        "editClientData": m14,
        "editClientDescription":
            MessageLookupByLibrary.simpleMessage("Ability to edit client data"),
        "editCustomer": MessageLookupByLibrary.simpleMessage("Edit Customer"),
        "editExpense": MessageLookupByLibrary.simpleMessage("Edit Expense"),
        "editExpenseCategory":
            MessageLookupByLibrary.simpleMessage("Edit Expense Category"),
        "editExpenseDescription":
            MessageLookupByLibrary.simpleMessage("Ability to edit expense"),
        "editInvoice": MessageLookupByLibrary.simpleMessage("Edit Invoice"),
        "editInvoiceDescription":
            MessageLookupByLibrary.simpleMessage("Ability to edit invoice"),
        "editProduct": MessageLookupByLibrary.simpleMessage("Edit Product"),
        "editProductDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to edit product data"),
        "editRole": MessageLookupByLibrary.simpleMessage("Edit Role"),
        "editUser": MessageLookupByLibrary.simpleMessage("Edit User"),
        "editUserDescription":
            MessageLookupByLibrary.simpleMessage("Ability to edit user data"),
        "editUserInformation":
            MessageLookupByLibrary.simpleMessage("Edit user information"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
        "emailDetails": MessageLookupByLibrary.simpleMessage("Email Details"),
        "emailInvalid": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "emailRequired":
            MessageLookupByLibrary.simpleMessage("Email is required"),
        "enableDarkMode":
            MessageLookupByLibrary.simpleMessage("Enable Dark Mode"),
        "enableDisableProduct":
            MessageLookupByLibrary.simpleMessage("Enable/Disable Product"),
        "enableTaxIntegration":
            MessageLookupByLibrary.simpleMessage("Enable Tax Integration"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enterAdditionalNotes":
            MessageLookupByLibrary.simpleMessage("Enter additional notes"),
        "enterAddress": MessageLookupByLibrary.simpleMessage("Enter address"),
        "enterBarcode": MessageLookupByLibrary.simpleMessage("Enter barcode"),
        "enterCategoryDescription": MessageLookupByLibrary.simpleMessage(
            "Enter a brief description for the category"),
        "enterCategoryName":
            MessageLookupByLibrary.simpleMessage("Enter category name"),
        "enterCity": MessageLookupByLibrary.simpleMessage("Enter city"),
        "enterClientAddress":
            MessageLookupByLibrary.simpleMessage("Enter client address"),
        "enterClientCompany":
            MessageLookupByLibrary.simpleMessage("Enter company name"),
        "enterClientEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
        "enterClientName":
            MessageLookupByLibrary.simpleMessage("Enter client name"),
        "enterClientPhone":
            MessageLookupByLibrary.simpleMessage("Enter phone number"),
        "enterCommercialRegister":
            MessageLookupByLibrary.simpleMessage("Enter commercial register"),
        "enterCompanyAddress":
            MessageLookupByLibrary.simpleMessage("Enter company address"),
        "enterCompanyEmail":
            MessageLookupByLibrary.simpleMessage("Enter company email"),
        "enterCompanyName":
            MessageLookupByLibrary.simpleMessage("Enter company name"),
        "enterCompanyPhone":
            MessageLookupByLibrary.simpleMessage("Enter company phone"),
        "enterContactPersonEmail":
            MessageLookupByLibrary.simpleMessage("Enter contact person email"),
        "enterContactPersonName":
            MessageLookupByLibrary.simpleMessage("Enter contact person name"),
        "enterContactPersonPhone":
            MessageLookupByLibrary.simpleMessage("Enter contact person phone"),
        "enterCostPrice":
            MessageLookupByLibrary.simpleMessage("Enter cost price"),
        "enterCustomerEmail":
            MessageLookupByLibrary.simpleMessage("Enter customer email"),
        "enterCustomerName":
            MessageLookupByLibrary.simpleMessage("Enter customer name"),
        "enterCustomerPhone":
            MessageLookupByLibrary.simpleMessage("Enter customer phone"),
        "enterDescription":
            MessageLookupByLibrary.simpleMessage("Enter description"),
        "enterDetailedAddress":
            MessageLookupByLibrary.simpleMessage("Enter detailed address"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
        "enterEmailAddress":
            MessageLookupByLibrary.simpleMessage("Enter email address"),
        "enterExpenseTitleAndDescription": MessageLookupByLibrary.simpleMessage(
            "Enter expense title and description"),
        "enterFullName":
            MessageLookupByLibrary.simpleMessage("Enter full name"),
        "enterInvoiceNumber":
            MessageLookupByLibrary.simpleMessage("Enter invoice number"),
        "enterMessage": MessageLookupByLibrary.simpleMessage("Enter message"),
        "enterNotes": MessageLookupByLibrary.simpleMessage("Enter notes"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("Enter password"),
        "enterPhone": MessageLookupByLibrary.simpleMessage("Enter phone"),
        "enterPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Enter phone number"),
        "enterPostalCode":
            MessageLookupByLibrary.simpleMessage("Enter postal code"),
        "enterProductDescription":
            MessageLookupByLibrary.simpleMessage("Enter product description"),
        "enterProductName":
            MessageLookupByLibrary.simpleMessage("Enter product name"),
        "enterProductSku":
            MessageLookupByLibrary.simpleMessage("Enter product SKU"),
        "enterQuantity": MessageLookupByLibrary.simpleMessage("Enter quantity"),
        "enterRegion": MessageLookupByLibrary.simpleMessage("Enter region"),
        "enterResponsiblePerson":
            MessageLookupByLibrary.simpleMessage("Enter responsible person"),
        "enterSellingPrice":
            MessageLookupByLibrary.simpleMessage("Enter selling price"),
        "enterSubject": MessageLookupByLibrary.simpleMessage("Enter subject"),
        "enterSubtotal": MessageLookupByLibrary.simpleMessage("Enter subtotal"),
        "enterTaxAmount":
            MessageLookupByLibrary.simpleMessage("Enter tax amount"),
        "enterTaxNumber":
            MessageLookupByLibrary.simpleMessage("Enter tax number"),
        "enterTaxRatePercentage":
            MessageLookupByLibrary.simpleMessage("Enter tax rate percentage"),
        "enterUsername": MessageLookupByLibrary.simpleMessage("Enter username"),
        "enterValidQuantity": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid quantity"),
        "enterVatNumber":
            MessageLookupByLibrary.simpleMessage("Enter VAT number"),
        "enterWebsite": MessageLookupByLibrary.simpleMessage("Enter website"),
        "errorAddingCategory":
            MessageLookupByLibrary.simpleMessage("Error adding category"),
        "errorAddingProduct":
            MessageLookupByLibrary.simpleMessage("Error adding product"),
        "errorCreatingClient": m15,
        "errorCreatingFile": m16,
        "errorCreatingProduct":
            MessageLookupByLibrary.simpleMessage("Error creating product"),
        "errorCreatingUser":
            MessageLookupByLibrary.simpleMessage("Error creating user: \$e"),
        "errorDeletingCategory":
            MessageLookupByLibrary.simpleMessage("Error deleting category"),
        "errorDeletingClient": m17,
        "errorDeletingClients": m18,
        "errorDeletingInvoice": m19,
        "errorDeletingProduct":
            MessageLookupByLibrary.simpleMessage("Error deleting product"),
        "errorDeletingUser":
            MessageLookupByLibrary.simpleMessage("Error deleting user"),
        "errorLoadingCategories":
            MessageLookupByLibrary.simpleMessage("Error Loading Categories"),
        "errorLoadingClients": m20,
        "errorLoadingInvoice":
            MessageLookupByLibrary.simpleMessage("Error loading invoice"),
        "errorLoadingProduct":
            MessageLookupByLibrary.simpleMessage("Error loading product data"),
        "errorLoadingProducts":
            MessageLookupByLibrary.simpleMessage("Error loading products"),
        "errorLoadingStatistics": m21,
        "errorLoadingUsers":
            MessageLookupByLibrary.simpleMessage("Error loading users"),
        "errorMessage": m22,
        "errorOccurred": m23,
        "errorParsingUserData":
            MessageLookupByLibrary.simpleMessage("Error parsing user data"),
        "errorPrintingInvoice": m24,
        "errorSendingInvoice": m25,
        "errorSharingInvoice": m26,
        "errorText": MessageLookupByLibrary.simpleMessage("Error Text"),
        "errorUpdatingCategory":
            MessageLookupByLibrary.simpleMessage("Error updating category"),
        "errorUpdatingClient": m27,
        "errorUpdatingClientStatus": m28,
        "errorUpdatingProduct":
            MessageLookupByLibrary.simpleMessage("Error updating product"),
        "errorUpdatingStatus": m29,
        "exampleEmail":
            MessageLookupByLibrary.simpleMessage("example@email.com"),
        "examplePhone": MessageLookupByLibrary.simpleMessage("0500000000"),
        "exitAppConfirmation": MessageLookupByLibrary.simpleMessage("Exit App"),
        "exitAppConfirmationMessage": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to exit the app?"),
        "expenseCategories":
            MessageLookupByLibrary.simpleMessage("Expense Categories"),
        "expenseCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Expense created successfully!"),
        "expenseDate": MessageLookupByLibrary.simpleMessage("Expense Date"),
        "expenseDetails":
            MessageLookupByLibrary.simpleMessage("Expense Details"),
        "expenseManagement":
            MessageLookupByLibrary.simpleMessage("Expense Management"),
        "expenseTitle": MessageLookupByLibrary.simpleMessage("Expense Title"),
        "expenseTitleHint": MessageLookupByLibrary.simpleMessage(
            "e.g., Office supplies, Travel expenses"),
        "expenseUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Expense updated successfully"),
        "expenses": MessageLookupByLibrary.simpleMessage("Expenses"),
        "expensesDesc": MessageLookupByLibrary.simpleMessage(
            "Expense categories & Expense management"),
        "expensesList": MessageLookupByLibrary.simpleMessage("Expenses List"),
        "expensesManagement":
            MessageLookupByLibrary.simpleMessage("Expenses & Categories"),
        "expensesReport":
            MessageLookupByLibrary.simpleMessage("Expenses Report"),
        "expensesTitle": MessageLookupByLibrary.simpleMessage("Expenses"),
        "exportReports": MessageLookupByLibrary.simpleMessage("Export Reports"),
        "exportReportsDescription":
            MessageLookupByLibrary.simpleMessage("Ability to export reports"),
        "failedToAddRole": m30,
        "failedToDeleteRole": m31,
        "failedToGetUserData":
            MessageLookupByLibrary.simpleMessage("Failed to get user data"),
        "failedToLoadRoles": m32,
        "failedToLoadUserPermissions": m33,
        "failedToUpdateRole": m34,
        "failedToUpdateUser":
            MessageLookupByLibrary.simpleMessage("Failed to update user"),
        "failedToUpdateUserPermissions": m35,
        "fileName": m36,
        "fileSavedSuccessfully": m37,
        "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
            "Please fill in all required fields"),
        "fillFormToAddClient": MessageLookupByLibrary.simpleMessage(
            "Fill the form below to add new client to the system"),
        "fillTheFormBelowToAddANewUserTo": MessageLookupByLibrary.simpleMessage(
            "Fill the form below to add a new user to the system"),
        "financialDetails":
            MessageLookupByLibrary.simpleMessage("Financial Details"),
        "financialInformation":
            MessageLookupByLibrary.simpleMessage("Financial Information"),
        "financialServicesInstitution": MessageLookupByLibrary.simpleMessage(
            "Financial Services Institution"),
        "formHelpDescription": MessageLookupByLibrary.simpleMessage(
            "This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information"),
        "formHelpTitle":
            MessageLookupByLibrary.simpleMessage("Edit Customer Form"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "googleSignInError":
            MessageLookupByLibrary.simpleMessage("Google sign in error"),
        "gotIt": MessageLookupByLibrary.simpleMessage("Got it!"),
        "hasTax": MessageLookupByLibrary.simpleMessage("Has Tax"),
        "haveAccountLogin":
            MessageLookupByLibrary.simpleMessage("Have an account? Login"),
        "healthcareInstitution":
            MessageLookupByLibrary.simpleMessage("Healthcare Institution"),
        "help": MessageLookupByLibrary.simpleMessage("Help"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "icon": MessageLookupByLibrary.simpleMessage("Icon"),
        "inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
        "includePDF": MessageLookupByLibrary.simpleMessage("Include PDF"),
        "inputFields": MessageLookupByLibrary.simpleMessage("Input Fields"),
        "interactiveCard":
            MessageLookupByLibrary.simpleMessage("Interactive Card"),
        "interactiveCardDescription": MessageLookupByLibrary.simpleMessage(
            "This is an interactive card that can be pressed"),
        "invalidNumber": MessageLookupByLibrary.simpleMessage("Invalid number"),
        "inventory": MessageLookupByLibrary.simpleMessage("Inventory"),
        "inventorySettings":
            MessageLookupByLibrary.simpleMessage("Inventory Settings"),
        "invoiceCopiedForPrinting": MessageLookupByLibrary.simpleMessage(
            "Invoice details copied for printing"),
        "invoiceCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Invoice details copied to clipboard"),
        "invoiceDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Invoice deleted successfully"),
        "invoiceDetails":
            MessageLookupByLibrary.simpleMessage("Invoice Details"),
        "invoiceHelp": MessageLookupByLibrary.simpleMessage("Invoice Help"),
        "invoiceItems": MessageLookupByLibrary.simpleMessage("Invoice Items"),
        "invoiceManagement":
            MessageLookupByLibrary.simpleMessage("Invoice Management"),
        "invoiceNumber": MessageLookupByLibrary.simpleMessage("Invoice Number"),
        "invoiceNumberLabel": m38,
        "invoiceSentSuccessfully":
            MessageLookupByLibrary.simpleMessage("Invoice sent successfully"),
        "invoiceStatusUpdated": m39,
        "invoices": MessageLookupByLibrary.simpleMessage("Invoices"),
        "invoicesList": MessageLookupByLibrary.simpleMessage("Invoices List"),
        "isActive": MessageLookupByLibrary.simpleMessage("Is Active"),
        "issueDate": MessageLookupByLibrary.simpleMessage("Issue Date"),
        "itemDetails": MessageLookupByLibrary.simpleMessage("Item Details"),
        "itemHeader": MessageLookupByLibrary.simpleMessage(
            "Name\t\tQuantity\tPrice\tTotal"),
        "itemName": MessageLookupByLibrary.simpleMessage("Name"),
        "itemPrice": MessageLookupByLibrary.simpleMessage("Price"),
        "itemQuantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "itemRow": m40,
        "itemSeparator": MessageLookupByLibrary.simpleMessage("-"),
        "itemTotal": MessageLookupByLibrary.simpleMessage("Total"),
        "items": MessageLookupByLibrary.simpleMessage("Items"),
        "kilogram": MessageLookupByLibrary.simpleMessage("kg"),
        "kuwait": MessageLookupByLibrary.simpleMessage("Kuwait"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "languageChangedToArabic":
            MessageLookupByLibrary.simpleMessage("Language changed to Arabic"),
        "languageChangedToEnglish":
            MessageLookupByLibrary.simpleMessage("Language changed to English"),
        "largeResponsiveText":
            MessageLookupByLibrary.simpleMessage("Large Responsive Text"),
        "lastUpdated": MessageLookupByLibrary.simpleMessage("Last Updated"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "link": MessageLookupByLibrary.simpleMessage("Link"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "loadingButton": MessageLookupByLibrary.simpleMessage("Loading Button"),
        "loadingCard": MessageLookupByLibrary.simpleMessage("Loading Card"),
        "loadingExpenses":
            MessageLookupByLibrary.simpleMessage("Loading expenses..."),
        "loadingInvoiceDetails":
            MessageLookupByLibrary.simpleMessage("Loading invoice details..."),
        "loadingMore": MessageLookupByLibrary.simpleMessage("Loading more..."),
        "loadingProductDetails": m41,
        "loadingUsers":
            MessageLookupByLibrary.simpleMessage("Loading users..."),
        "loggingIn": MessageLookupByLibrary.simpleMessage("Logging in..."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginCancelled":
            MessageLookupByLibrary.simpleMessage("Login cancelled"),
        "loginError": MessageLookupByLibrary.simpleMessage("Login error"),
        "loginLoadin": MessageLookupByLibrary.simpleMessage("Logging in..."),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("Login successful"),
        "loginSuccessfully":
            MessageLookupByLibrary.simpleMessage("Login successful"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "lowStockAlert":
            MessageLookupByLibrary.simpleMessage("Low Stock Alert"),
        "mainTitle": MessageLookupByLibrary.simpleMessage("Main Title"),
        "manageCustomers":
            MessageLookupByLibrary.simpleMessage("Manage Customers"),
        "manageInvoiceStep1": MessageLookupByLibrary.simpleMessage(
            "1. Use search and filters to find invoices"),
        "manageInvoiceStep2": MessageLookupByLibrary.simpleMessage(
            "2. Tap on invoice to view details"),
        "manageInvoiceStep3": MessageLookupByLibrary.simpleMessage(
            "3. Use buttons to edit or delete"),
        "manageInvoiceStep4": MessageLookupByLibrary.simpleMessage(
            "4. Send invoice to customer when needed"),
        "manageInvoices":
            MessageLookupByLibrary.simpleMessage("Manage Invoices"),
        "manageInvoicesAndCustomers": MessageLookupByLibrary.simpleMessage(
            "Manage invoices and customers easily"),
        "managePermissions":
            MessageLookupByLibrary.simpleMessage("Manage Permissions"),
        "managePermissionsDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to manage user permissions"),
        "manageProducts":
            MessageLookupByLibrary.simpleMessage("Manage Products"),
        "manager": MessageLookupByLibrary.simpleMessage("Manager"),
        "managingInvoices":
            MessageLookupByLibrary.simpleMessage("Managing Invoices"),
        "markAsPaid": MessageLookupByLibrary.simpleMessage("Mark as Paid"),
        "material": MessageLookupByLibrary.simpleMessage("Material"),
        "maximumQuantity":
            MessageLookupByLibrary.simpleMessage("Maximum Quantity"),
        "mediumResponsiveText":
            MessageLookupByLibrary.simpleMessage("Medium Responsive Text"),
        "message": MessageLookupByLibrary.simpleMessage("Message"),
        "metadata": MessageLookupByLibrary.simpleMessage("Metadata"),
        "meter": MessageLookupByLibrary.simpleMessage("m"),
        "minimumQuantity":
            MessageLookupByLibrary.simpleMessage("Minimum Quantity"),
        "model": MessageLookupByLibrary.simpleMessage("Model"),
        "modernEducationInstitution": MessageLookupByLibrary.simpleMessage(
            "Modern Education Institution"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("More Options"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameInvalid": MessageLookupByLibrary.simpleMessage(
            "Name must contain only letters"),
        "nameMaxLength": MessageLookupByLibrary.simpleMessage(
            "Name must be less than 50 characters"),
        "nameMinLength": MessageLookupByLibrary.simpleMessage(
            "Name must be at least 3 characters"),
        "nameRequired":
            MessageLookupByLibrary.simpleMessage("Name is required"),
        "nameShort": MessageLookupByLibrary.simpleMessage(
            "Name must be at least 2 characters"),
        "networkError": MessageLookupByLibrary.simpleMessage("Network error"),
        "newCategoryDetails":
            MessageLookupByLibrary.simpleMessage("New Category Details"),
        "newExpense": MessageLookupByLibrary.simpleMessage("New Expense"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noCategoriesFound":
            MessageLookupByLibrary.simpleMessage("No Categories Found"),
        "noCategoriesToDelete":
            MessageLookupByLibrary.simpleMessage("No categories to delete"),
        "noClients": MessageLookupByLibrary.simpleMessage("No clients"),
        "noCustomersFound":
            MessageLookupByLibrary.simpleMessage("No customers found"),
        "noCustomersFoundMessage": MessageLookupByLibrary.simpleMessage(
            "Press the add button to create a new customer"),
        "noDataReceived": MessageLookupByLibrary.simpleMessage(
            "No data received from server"),
        "noEmail": MessageLookupByLibrary.simpleMessage("No email"),
        "noHaveAccountRejester": MessageLookupByLibrary.simpleMessage(
            "Don\'t have an account? Create new account"),
        "noInvoiceData":
            MessageLookupByLibrary.simpleMessage("No invoice data available"),
        "noInvoices": MessageLookupByLibrary.simpleMessage("No invoices"),
        "noInvoicesDescription": MessageLookupByLibrary.simpleMessage(
            "Press the add button to create a new invoice"),
        "noItems": MessageLookupByLibrary.simpleMessage("No items"),
        "noName": MessageLookupByLibrary.simpleMessage("No name"),
        "noProductsFound":
            MessageLookupByLibrary.simpleMessage("No products found"),
        "noQRCodeAvailable": MessageLookupByLibrary.simpleMessage(
            "No QR code available for this invoice"),
        "noRole": MessageLookupByLibrary.simpleMessage("No role"),
        "noTaxUIDAvailable": MessageLookupByLibrary.simpleMessage(
            "No tax UID available for this invoice"),
        "noUsersFound": MessageLookupByLibrary.simpleMessage("No users found"),
        "normalButton": MessageLookupByLibrary.simpleMessage("Normal Button"),
        "normalText": MessageLookupByLibrary.simpleMessage("Normal Text"),
        "notAMember": MessageLookupByLibrary.simpleMessage("Not a member?"),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "notesHint": MessageLookupByLibrary.simpleMessage(
            "Any additional information or context"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "notificationsDisabled":
            MessageLookupByLibrary.simpleMessage("Notifications disabled"),
        "notificationsEnabled":
            MessageLookupByLibrary.simpleMessage("Notifications enabled"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "onboardingClients": MessageLookupByLibrary.simpleMessage(
            "Client and Product Management"),
        "onboardingClientsDesc": MessageLookupByLibrary.simpleMessage(
            "Comprehensive management of clients and products with inventory tracking"),
        "onboardingExpenses":
            MessageLookupByLibrary.simpleMessage("Expense Management"),
        "onboardingExpensesDesc": MessageLookupByLibrary.simpleMessage(
            "Track and manage expenses with multiple categories"),
        "onboardingInvoices":
            MessageLookupByLibrary.simpleMessage("Tax Invoices"),
        "onboardingInvoicesDesc": MessageLookupByLibrary.simpleMessage(
            "Create and manage tax invoices with integration with the national invoice system"),
        "onboardingOne": MessageLookupByLibrary.simpleMessage(
            "Follow all your bills in one place"),
        "onboardingOneDec": MessageLookupByLibrary.simpleMessage(
            "Organ your monthly bills, and follow the payment dates, without paper or headache."),
        "onboardingStartNow": MessageLookupByLibrary.simpleMessage("Start now"),
        "onboardingThree": MessageLookupByLibrary.simpleMessage(
            "Pay and follow every need in seconds"),
        "onboardingThreeDec": MessageLookupByLibrary.simpleMessage(
            "Pay electronically, and save your records automatically to review them at any time."),
        "onboardingTwo": MessageLookupByLibrary.simpleMessage(
            "You don\'t forget and no bill"),
        "onboardingTwoDec": MessageLookupByLibrary.simpleMessage(
            "You receive an alert before the payment date, in order to avoid any delay or fines."),
        "onboardingUsers": MessageLookupByLibrary.simpleMessage(
            "User and Permission Management"),
        "onboardingUsersDesc": MessageLookupByLibrary.simpleMessage(
            "Complete control over users and their permissions within the company"),
        "onboardingWelcome":
            MessageLookupByLibrary.simpleMessage("Welcome to Invotek"),
        "onboardingWelcomeDesc": MessageLookupByLibrary.simpleMessage(
            "Integrated system for electronic invoice management with integration with the Jordanian national billing system"),
        "openingEmail": m42,
        "openingMap": MessageLookupByLibrary.simpleMessage("Opening map"),
        "operationCompletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Operation completed successfully"),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "outOfStock": MessageLookupByLibrary.simpleMessage("Out of Stock"),
        "outlinedButton":
            MessageLookupByLibrary.simpleMessage("Outlined Button"),
        "outlinedButtonPressed":
            MessageLookupByLibrary.simpleMessage("Outlined button pressed"),
        "overdue": MessageLookupByLibrary.simpleMessage("Overdue"),
        "pageNotFound": MessageLookupByLibrary.simpleMessage("Page Not Found"),
        "paid": MessageLookupByLibrary.simpleMessage("Paid"),
        "paidInvoices": MessageLookupByLibrary.simpleMessage("8 Paid"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordChangedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Password changed successfully"),
        "passwordLowercase": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one lowercase letter"),
        "passwordMaxLength": MessageLookupByLibrary.simpleMessage(
            "Password must be less than 50 characters"),
        "passwordMinLength": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters"),
        "passwordNumber": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one number"),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("Password is required"),
        "passwordShort": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 6 characters"),
        "passwordUppercase": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one uppercase letter"),
        "passwordWeak": MessageLookupByLibrary.simpleMessage(
            "Password must contain uppercase, lowercase and number"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "passwordsNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "payment": MessageLookupByLibrary.simpleMessage("Payment"),
        "paymentDate": MessageLookupByLibrary.simpleMessage("Payment Date"),
        "paymentDetails":
            MessageLookupByLibrary.simpleMessage("Payment Details"),
        "paymentInformation":
            MessageLookupByLibrary.simpleMessage("Payment Information"),
        "paymentMethod": MessageLookupByLibrary.simpleMessage("Payment Method"),
        "paymentMethodBank":
            MessageLookupByLibrary.simpleMessage("Bank Transfer"),
        "paymentMethodCard":
            MessageLookupByLibrary.simpleMessage("Credit Card"),
        "paymentMethodCash": MessageLookupByLibrary.simpleMessage("Cash"),
        "paymentMethodCheck": MessageLookupByLibrary.simpleMessage("Check"),
        "paymentMethods":
            MessageLookupByLibrary.simpleMessage("Payment Methods"),
        "pending": MessageLookupByLibrary.simpleMessage("Pending"),
        "permissionsManagement":
            MessageLookupByLibrary.simpleMessage("Permissions Management"),
        "personalInformation":
            MessageLookupByLibrary.simpleMessage("Personal Information"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "phoneMaxLength": MessageLookupByLibrary.simpleMessage(
            "Phone number must be less than 15 digits"),
        "phoneMinLength": MessageLookupByLibrary.simpleMessage(
            "Phone number must be at least 10 digits"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "phoneNumberInvalid":
            MessageLookupByLibrary.simpleMessage("Invalid phone number"),
        "phoneRequired":
            MessageLookupByLibrary.simpleMessage("Phone number is required"),
        "piece": MessageLookupByLibrary.simpleMessage("Piece"),
        "pieceKgMeter":
            MessageLookupByLibrary.simpleMessage("piece, kg, meter..."),
        "playServicesNotAvailable":
            MessageLookupByLibrary.simpleMessage("Play services not available"),
        "pleaseEnterValidAmount":
            MessageLookupByLibrary.simpleMessage("Please enter a valid amount"),
        "pleaseSelectCategory":
            MessageLookupByLibrary.simpleMessage("Please select a category"),
        "postalCode": MessageLookupByLibrary.simpleMessage("Postal Code"),
        "postedInvoices":
            MessageLookupByLibrary.simpleMessage("Posted Invoices"),
        "pressAddToCreateClient": MessageLookupByLibrary.simpleMessage(
            "Press add button to create new client"),
        "previous": MessageLookupByLibrary.simpleMessage("Previous"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "pricing": MessageLookupByLibrary.simpleMessage("Pricing"),
        "printInvoice": MessageLookupByLibrary.simpleMessage("Print Invoice"),
        "printInvoiceText": m43,
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "privacyPolicyComingSoon":
            MessageLookupByLibrary.simpleMessage("Privacy Policy Coming Soon"),
        "productAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Product added successfully"),
        "productCategories":
            MessageLookupByLibrary.simpleMessage("Product Categories"),
        "productDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Product deleted successfully"),
        "productDetails":
            MessageLookupByLibrary.simpleMessage("Product Details"),
        "productHelp": MessageLookupByLibrary.simpleMessage("Product Help"),
        "productIsActive":
            MessageLookupByLibrary.simpleMessage("Product is Active"),
        "productIsTaxable":
            MessageLookupByLibrary.simpleMessage("Product is Taxable"),
        "productManagement":
            MessageLookupByLibrary.simpleMessage("Product Management"),
        "productNameRequired":
            MessageLookupByLibrary.simpleMessage("Product name is required"),
        "productPriceRequired":
            MessageLookupByLibrary.simpleMessage("Product price is required"),
        "productQuantityRequired": MessageLookupByLibrary.simpleMessage(
            "Product quantity is required"),
        "productSku": MessageLookupByLibrary.simpleMessage("Product SKU"),
        "productUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Product updated successfully"),
        "products": MessageLookupByLibrary.simpleMessage("Products"),
        "productsCategories": MessageLookupByLibrary.simpleMessage("Products"),
        "productsCategoriesManagement":
            MessageLookupByLibrary.simpleMessage("Products and Categories"),
        "productsList": MessageLookupByLibrary.simpleMessage("Products List"),
        "productsManagement": MessageLookupByLibrary.simpleMessage(
            "Products & Categories Management"),
        "productsReport":
            MessageLookupByLibrary.simpleMessage("Products Report"),
        "qty": MessageLookupByLibrary.simpleMessage("Qty"),
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "quantityMustBeAPositiveInteger": MessageLookupByLibrary.simpleMessage(
            "Quantity must be a positive integer"),
        "quickActions": MessageLookupByLibrary.simpleMessage("Quick Actions"),
        "quickActionsTitle":
            MessageLookupByLibrary.simpleMessage("Quick Actions"),
        "receiveNotifications":
            MessageLookupByLibrary.simpleMessage("Receive Notifications"),
        "referenceNumber":
            MessageLookupByLibrary.simpleMessage("Reference Number"),
        "referenceNumberHint": MessageLookupByLibrary.simpleMessage(
            "Invoice number, receipt ID, etc."),
        "refreshData": MessageLookupByLibrary.simpleMessage("Refresh Data"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerSuccess": MessageLookupByLibrary.simpleMessage(
            "Registration successful! Please login."),
        "registering": MessageLookupByLibrary.simpleMessage("Registering..."),
        "rejester": MessageLookupByLibrary.simpleMessage("Login"),
        "rejesterLoading":
            MessageLookupByLibrary.simpleMessage("Logging in..."),
        "rejesterSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Registration successful! Please login."),
        "reports": MessageLookupByLibrary.simpleMessage("Reports"),
        "requestedPageNotFound": MessageLookupByLibrary.simpleMessage(
            "The requested page was not found"),
        "responsiveTexts":
            MessageLookupByLibrary.simpleMessage("Responsive Texts"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "returnedInvoices":
            MessageLookupByLibrary.simpleMessage("Returned Invoices"),
        "role": MessageLookupByLibrary.simpleMessage("Role"),
        "rule": MessageLookupByLibrary.simpleMessage("Role"),
        "salesReport": MessageLookupByLibrary.simpleMessage("Sales Report"),
        "salesTax": MessageLookupByLibrary.simpleMessage("Sales Tax"),
        "saudiArabia": MessageLookupByLibrary.simpleMessage("Saudi Arabia"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveCategory": MessageLookupByLibrary.simpleMessage("Save Category"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
        "saveSettings": MessageLookupByLibrary.simpleMessage("Save Settings"),
        "saving": MessageLookupByLibrary.simpleMessage("Saving..."),
        "savingSettings":
            MessageLookupByLibrary.simpleMessage("Saving Settings..."),
        "screenDimensions":
            MessageLookupByLibrary.simpleMessage("Screen Dimensions"),
        "screenDimensionsAndPerformance": MessageLookupByLibrary.simpleMessage(
            "Screen dimensions and performance"),
        "screenDimensionsPerformance": MessageLookupByLibrary.simpleMessage(
            "Screen dimensions and performance"),
        "search": MessageLookupByLibrary.simpleMessage("Search..."),
        "searchCustomers":
            MessageLookupByLibrary.simpleMessage("Search customers..."),
        "searchForUser":
            MessageLookupByLibrary.simpleMessage("Search for user..."),
        "searchInClients":
            MessageLookupByLibrary.simpleMessage("Search in clients..."),
        "searchInInvoices":
            MessageLookupByLibrary.simpleMessage("Search in invoices..."),
        "searchInvoices":
            MessageLookupByLibrary.simpleMessage("Search invoices..."),
        "searchProducts":
            MessageLookupByLibrary.simpleMessage("Search products..."),
        "securityInformation":
            MessageLookupByLibrary.simpleMessage("Security Information"),
        "selectAppropriateExpenseCategory":
            MessageLookupByLibrary.simpleMessage(
                "Select appropriate expense category"),
        "selectCategory":
            MessageLookupByLibrary.simpleMessage("Select Category"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Select Date"),
        "selectTheDateThisExpenseOccurred":
            MessageLookupByLibrary.simpleMessage(
                "Select the date this expense occurred"),
        "sellingPrice": MessageLookupByLibrary.simpleMessage("Selling Price"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendInvoice": MessageLookupByLibrary.simpleMessage("Send Invoice"),
        "sendInvoiceDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to send invoice to client"),
        "sendMethod": MessageLookupByLibrary.simpleMessage("Send Method"),
        "sendingInvoice":
            MessageLookupByLibrary.simpleMessage("Sending invoice..."),
        "separator": MessageLookupByLibrary.simpleMessage("="),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "Server error. Please try again later."),
        "setAmountDateAndPaymentMethod": MessageLookupByLibrary.simpleMessage(
            "Set amount, date, and payment method"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsSavedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Settings saved successfully"),
        "shareInvoice": MessageLookupByLibrary.simpleMessage("Share Invoice"),
        "shareInvoiceText": m44,
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signInFailed": MessageLookupByLibrary.simpleMessage("Sign in failed"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Sign in with Google"),
        "sku": MessageLookupByLibrary.simpleMessage("SKU"),
        "smallResponsiveText":
            MessageLookupByLibrary.simpleMessage("Small Responsive Text"),
        "smallText": MessageLookupByLibrary.simpleMessage("Small Text"),
        "sms": MessageLookupByLibrary.simpleMessage("SMS"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "startNow": MessageLookupByLibrary.simpleMessage("Start Now"),
        "state": MessageLookupByLibrary.simpleMessage("Status"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "statusCategory": m45,
        "statusDraft": MessageLookupByLibrary.simpleMessage("Draft"),
        "statusInfo": MessageLookupByLibrary.simpleMessage("Status Info"),
        "statusOverdue": MessageLookupByLibrary.simpleMessage("Overdue"),
        "statusPaid": MessageLookupByLibrary.simpleMessage("Paid"),
        "statusPending": MessageLookupByLibrary.simpleMessage("Pending"),
        "subTitle": MessageLookupByLibrary.simpleMessage("Sub Title"),
        "subject": MessageLookupByLibrary.simpleMessage("Subject"),
        "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
        "subtotalLine": m46,
        "successText": MessageLookupByLibrary.simpleMessage("Success Text"),
        "supervisor": MessageLookupByLibrary.simpleMessage("Supervisor"),
        "supervisorDescription": MessageLookupByLibrary.simpleMessage(
            "Manages users and permissions"),
        "supportEmail": MessageLookupByLibrary.simpleMessage("Support Email"),
        "systemAccess": MessageLookupByLibrary.simpleMessage("System Access"),
        "systemAdministrator":
            MessageLookupByLibrary.simpleMessage("System Administrator"),
        "systemAdministratorDescription": MessageLookupByLibrary.simpleMessage(
            "Has all permissions in the system"),
        "systemSettings":
            MessageLookupByLibrary.simpleMessage("System Settings"),
        "systemSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to edit system settings"),
        "tablet": MessageLookupByLibrary.simpleMessage("Tablet"),
        "tax": MessageLookupByLibrary.simpleMessage("Tax"),
        "taxAmount": MessageLookupByLibrary.simpleMessage("Tax Amount"),
        "taxIntegration":
            MessageLookupByLibrary.simpleMessage("Tax Integration"),
        "taxIntegrationSettings":
            MessageLookupByLibrary.simpleMessage("Tax Integration Settings"),
        "taxIntegrationStep1":
            MessageLookupByLibrary.simpleMessage("1. Enable tax integration"),
        "taxIntegrationStep2": MessageLookupByLibrary.simpleMessage(
            "2. Enter company tax information"),
        "taxIntegrationStep3": MessageLookupByLibrary.simpleMessage(
            "3. Test connection and save settings"),
        "taxInvoices": MessageLookupByLibrary.simpleMessage("Tax Invoices"),
        "taxInvoicesDesc": MessageLookupByLibrary.simpleMessage(
            "Unposted invoices & Postpaid invoices & Returned invoices & Create a new invoice"),
        "taxInvoicesTitle":
            MessageLookupByLibrary.simpleMessage("Tax Invoices"),
        "taxLine": m47,
        "taxNumber": MessageLookupByLibrary.simpleMessage("Tax Number"),
        "taxRate": MessageLookupByLibrary.simpleMessage("Tax Rate"),
        "taxSettings": MessageLookupByLibrary.simpleMessage("Tax Settings"),
        "taxType": MessageLookupByLibrary.simpleMessage("Tax Type"),
        "taxUID": MessageLookupByLibrary.simpleMessage("Tax UID"),
        "taxUIDCopied": MessageLookupByLibrary.simpleMessage("Tax UID copied"),
        "taxUIDForInvoice": m48,
        "tekpart": MessageLookupByLibrary.simpleMessage("TekPart"),
        "termsOfUse": MessageLookupByLibrary.simpleMessage("Terms of Use"),
        "termsOfUseComingSoon":
            MessageLookupByLibrary.simpleMessage("Terms of Use Coming Soon"),
        "testConnection":
            MessageLookupByLibrary.simpleMessage("Test Connection"),
        "testingConnection":
            MessageLookupByLibrary.simpleMessage("Testing connection..."),
        "textStyles": MessageLookupByLibrary.simpleMessage("Text Styles"),
        "thankYouMessage":
            MessageLookupByLibrary.simpleMessage("Thank you for your business"),
        "themeDemo": MessageLookupByLibrary.simpleMessage("Theme Demo"),
        "themeInfo": MessageLookupByLibrary.simpleMessage("Theme Information"),
        "thisField": MessageLookupByLibrary.simpleMessage("This field"),
        "thisFieldIsRequired":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "thisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "titleIsRequired":
            MessageLookupByLibrary.simpleMessage("Title is required"),
        "total": MessageLookupByLibrary.simpleMessage("Total"),
        "totalAmount": MessageLookupByLibrary.simpleMessage("Total Amount"),
        "totalLine": m49,
        "tourismEntertainmentCompany": MessageLookupByLibrary.simpleMessage(
            "Tourism & Entertainment Company"),
        "trackAvailableProductQuantity": MessageLookupByLibrary.simpleMessage(
            "Track Available Product Quantity"),
        "trackInventory":
            MessageLookupByLibrary.simpleMessage("Track Inventory"),
        "trackYourBusinessExpenses": MessageLookupByLibrary.simpleMessage(
            "Track your business expenses"),
        "transportLogisticsCompany": MessageLookupByLibrary.simpleMessage(
            "Transport & Logistics Company"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
        "type": MessageLookupByLibrary.simpleMessage("Type"),
        "uae": MessageLookupByLibrary.simpleMessage("United Arab Emirates"),
        "undefined": MessageLookupByLibrary.simpleMessage("Undefined"),
        "unit": MessageLookupByLibrary.simpleMessage("Unit"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred. Please try again."),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "updateCategory":
            MessageLookupByLibrary.simpleMessage("Update Category"),
        "updateStatus": MessageLookupByLibrary.simpleMessage("Update Status"),
        "updatedAt": MessageLookupByLibrary.simpleMessage("Updated At"),
        "updatingStatus":
            MessageLookupByLibrary.simpleMessage("Updating status..."),
        "user": MessageLookupByLibrary.simpleMessage("User"),
        "userAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("User added successfully"),
        "userCreatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("User created successfully"),
        "userDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("User deleted successfully"),
        "userDescription": MessageLookupByLibrary.simpleMessage(
            "Limited permissions for viewing and reading"),
        "userId": MessageLookupByLibrary.simpleMessage("User ID"),
        "userManagement":
            MessageLookupByLibrary.simpleMessage("User Management"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
        "userSettings": MessageLookupByLibrary.simpleMessage("User settings"),
        "userUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("User updated successfully"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usersAndPermissionsDescription": MessageLookupByLibrary.simpleMessage(
            "View and manage users and their permissions"),
        "usersAndPermissionsManagement": MessageLookupByLibrary.simpleMessage(
            "Users and Permissions Management"),
        "usersList": MessageLookupByLibrary.simpleMessage("Users List"),
        "usersManagement":
            MessageLookupByLibrary.simpleMessage("Users and Permissions"),
        "usersPermissions":
            MessageLookupByLibrary.simpleMessage("Users and Permissions"),
        "usersPermissionsDesc": MessageLookupByLibrary.simpleMessage(
            "Control of clients and permissions"),
        "usersPermissionsTitle":
            MessageLookupByLibrary.simpleMessage("Users and Permissions"),
        "validationError": MessageLookupByLibrary.simpleMessage(
            "Please check the entered data"),
        "vat": MessageLookupByLibrary.simpleMessage("VAT"),
        "vatNumber": MessageLookupByLibrary.simpleMessage("VAT Number"),
        "view": MessageLookupByLibrary.simpleMessage("View"),
        "viewAllInvoices":
            MessageLookupByLibrary.simpleMessage("View All Invoices"),
        "viewClients": MessageLookupByLibrary.simpleMessage("View Clients"),
        "viewClientsDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to view clients list"),
        "viewCustomerDetails": m50,
        "viewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
        "viewExpenses": MessageLookupByLibrary.simpleMessage("View Expenses"),
        "viewExpensesDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to view expenses list"),
        "viewInvoices": MessageLookupByLibrary.simpleMessage("View Invoices"),
        "viewInvoicesDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to view invoices list"),
        "viewItemDetails": m51,
        "viewPrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("View privacy policy"),
        "viewProducts": MessageLookupByLibrary.simpleMessage("View Products"),
        "viewProductsDescription": MessageLookupByLibrary.simpleMessage(
            "Ability to view products list"),
        "viewQRCode": MessageLookupByLibrary.simpleMessage("View QR Code"),
        "viewReports": MessageLookupByLibrary.simpleMessage("View Reports"),
        "viewReportsAndStatistics":
            MessageLookupByLibrary.simpleMessage("View reports and statistics"),
        "viewReportsDescription":
            MessageLookupByLibrary.simpleMessage("Ability to view reports"),
        "viewReportsStatistics":
            MessageLookupByLibrary.simpleMessage("View reports and statistics"),
        "viewTaxUID": MessageLookupByLibrary.simpleMessage("View Tax UID"),
        "viewTermsOfUse":
            MessageLookupByLibrary.simpleMessage("View terms of use"),
        "viewUserDetails":
            MessageLookupByLibrary.simpleMessage("View user details"),
        "viewUsers": MessageLookupByLibrary.simpleMessage("View Users"),
        "viewUsersDescription":
            MessageLookupByLibrary.simpleMessage("Ability to view users list"),
        "viewingInvoices": m52,
        "viewingOrders": m53,
        "visitInvotekWebsite":
            MessageLookupByLibrary.simpleMessage("Visit Invotek website"),
        "website": MessageLookupByLibrary.simpleMessage("Website"),
        "weight": MessageLookupByLibrary.simpleMessage("Weight"),
        "welcome": MessageLookupByLibrary.simpleMessage("WELCOME!"),
        "welcomeToInvotek":
            MessageLookupByLibrary.simpleMessage("Welcome to Invotek App"),
        "welcomeToInvotekApp":
            MessageLookupByLibrary.simpleMessage("Welcome to Invotek app"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
