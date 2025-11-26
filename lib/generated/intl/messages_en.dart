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

  static String m0(count) => "and ${count} more invoices...";

  static String m1(version, build) => "Version ${version} (Build ${build})";

  static String m2(name) => "Are you sure you want to delete \"${name}\"?";

  static String m3(name) =>
      "Are you sure you want to delete client \"${name}\"?";

  static String m4(count) => "Available: ${count}";

  static String m5(phone) => "Calling ${phone}";

  static String m6(number) => "Change payment method for invoice ${number}";

  static String m7(count) => "Clients (${count})";

  static String m8(clientName) =>
      "Are you sure you want to delete client \"${clientName}\"?";

  static String m9(clientName) => "Edit client data \"${clientName}\"";

  static String m10(error) => "Error occurred while creating client: ${error}";

  static String m11(error) => "Error occurred while updating client: ${error}";

  static String m12(name) =>
      "Are you sure you want to delete customer \"${name}\"?";

  static String m13(name) => "Customer \"${name}\" created successfully";

  static String m14(name) => "Customer \"${name}\" updated successfully";

  static String m15(error) => "Data conversion error: ${error}";

  static String m16(name) =>
      "Are you sure you want to delete category \"${name}\"?";

  static String m17(name) =>
      "Are you sure you want to delete customer \"${name}\"?";

  static String m18(name) =>
      "Are you sure you want to delete product \"${name}\"?";

  static String m19(name) => "Are you sure you want to delete user ${name}?";

  static String m20(number) => "Duplicate invoice ${number}";

  static String m21(name) => "Edit client data for \"${name}\"";

  static String m22(error) => "Error creating client: ${error}";

  static String m23(error) => "Failed to create file: ${error}";

  static String m24(error) => "Error: ${error}";

  static String m25(error) => "Error deleting client: ${error}";

  static String m26(error) => "Error deleting clients: ${error}";

  static String m27(error) => "Failed to delete invoice: ${error}";

  static String m28(error) => "Error loading clients: ${error}";

  static String m29(error) => "Error loading statistics: ${error}";

  static String m30(error) => "Error: ${error}";

  static String m31(message) => "Error Occurred: ${message}";

  static String m32(error) => "Failed to print invoice: ${error}";

  static String m33(error) => "Failed to send invoice: ${error}";

  static String m34(error) => "Failed to share invoice: ${error}";

  static String m35(error) => "Error updating client: ${error}";

  static String m36(error) => "Error updating client status: ${error}";

  static String m37(error) => "Failed to update status: ${error}";

  static String m38(expenseTitle) =>
      "Are you sure you want to delete expense \"${expenseTitle}\"? This action cannot be undone.";

  static String m39(error) => "Error: ${error}";

  static String m40(status) => "Status: ${status}";

  static String m41(error) => "Failed to add role: ${error}";

  static String m42(error) => "Failed to delete role: ${error}";

  static String m43(error) => "Failed to load roles and permissions: ${error}";

  static String m44(error) => "Failed to load user permissions: ${error}";

  static String m45(error) => "Failed to update role: ${error}";

  static String m46(error) => "Failed to update user permissions: ${error}";

  static String m47(field) => "${field} is required";

  static String m48(number, timestamp) => "Invoice_${number}_${timestamp}";

  static String m49(path) => "File saved to: ${path}";

  static String m50(deviceType) => "Device Type: ${deviceType}";

  static String m51(height) => "Height: ${height}px";

  static String m52(featureName) =>
      "You don\'t have permission to access ${featureName}";

  static String m53(ratio) => "Pixel Ratio: ${ratio}";

  static String m54(version) => "Version ${version}";

  static String m55(width) => "Width: ${width}px";

  static String m56(number) => "Invoice Number: ${number}";

  static String m57(status) => "Invoice status updated to: ${status}";

  static String m58(number) => "Invoice ${number}";

  static String m59(name, quantity, price, total) =>
      "${name}\t\t${quantity}\t${price}\t${total}";

  static String m60(name) => "Loading product details...";

  static String m61(feature) =>
      "Sorry, you don\'t have permission to access ${feature}";

  static String m62(email) => "Opening email to ${email}";

  static String m63(error) => "Preview Error: ${error}";

  static String m64(error) => "Print Error: ${error}";

  static String m65(
    separator,
    number,
    date,
    status,
    customer,
    contact,
    items,
    subtotal,
    tax,
    total,
  ) =>
      "Invoice\n${separator}\nInvoice Number: ${number}\nDate: ${date}\nStatus: ${status}\n\nCustomer Information:\nName: ${customer}\n${contact}\n\nInvoice Items:\n${items}\n\nTotals:\nSubtotal: ${subtotal} SAR\n${tax}\nTotal: ${total} SAR\n\n${separator}\nThank you for your business\nThis invoice was created by Invotek App\n${separator}";

  static String m66(date) => "Last updated: ${date}";

  static String m67(name) =>
      "Are you sure you want to delete category \"${name}\"?";

  static String m68(count) => "Quantity exceeds available stock (${count})";

  static String m69(seconds) => "Resend in ${seconds} seconds";

  static String m70(number, customer, date, amount, status) =>
      "Invoice Number: ${number}\nCustomer: ${customer}\nDate: ${date}\nAmount: ${amount} SAR\nStatus: ${status}\n\nCreated by Invotek App";

  static String m71(count) => "Show All Items (${count})";

  static String m72(status) => "Status: ${status}";

  static String m73(code) => "Status Code: ${code}";

  static String m74(amount) => "Subtotal: ${amount} SAR";

  static String m75(amount) => "Tax: ${amount} SAR";

  static String m76(number) => "Tax UID for invoice ${number}:";

  static String m77(amount) => "Total: ${amount} SAR";

  static String m78(name) =>
      "Are you sure you want to delete the role \"${name}\"?";

  static String m79(email) => "Enter the code sent to ${email}";

  static String m80(name) => "View customer details: ${name}";

  static String m81(name) => "View item details: ${name}";

  static String m82(name) => "Viewing invoices for ${name}";

  static String m83(name) => "Viewing orders for ${name}";

  static String m84(name) => "Welcome ${name}, 👋";

  static String m85(count) => "You have ${count} new notification";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutUs": MessageLookupByLibrary.simpleMessage("About Us"),
    "aboutUsDescription": MessageLookupByLibrary.simpleMessage(
      "Invotek is a comprehensive invoice management system designed to help businesses manage their invoicing needs efficiently.",
    ),
    "accessDenied": MessageLookupByLibrary.simpleMessage("Access Denied"),
    "accountDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Account deleted successfully",
    ),
    "accountSettings": MessageLookupByLibrary.simpleMessage("Account Settings"),
    "accountStatus": MessageLookupByLibrary.simpleMessage("Account Status"),
    "accountant": MessageLookupByLibrary.simpleMessage("Accountant"),
    "accountantDescription": MessageLookupByLibrary.simpleMessage(
      "Manages invoices, expenses and financial reports",
    ),
    "action": MessageLookupByLibrary.simpleMessage("Action"),
    "actionRequired": MessageLookupByLibrary.simpleMessage(
      "Action is required",
    ),
    "actionType": MessageLookupByLibrary.simpleMessage("Action Type"),
    "activate": MessageLookupByLibrary.simpleMessage("Activate"),
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "activeStatus": MessageLookupByLibrary.simpleMessage("Active"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addANewUser": MessageLookupByLibrary.simpleMessage("Add a new user"),
    "addAndEditCustomers": MessageLookupByLibrary.simpleMessage(
      "Add, edit and delete customers",
    ),
    "addAtLeastOneItem": MessageLookupByLibrary.simpleMessage(
      "Please add at least one item",
    ),
    "addCategory": MessageLookupByLibrary.simpleMessage("Add Category"),
    "addClient": MessageLookupByLibrary.simpleMessage("Add Client"),
    "addClientDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to add new client",
    ),
    "addCustomer": MessageLookupByLibrary.simpleMessage("Add Customer"),
    "addEditDeleteCustomers": MessageLookupByLibrary.simpleMessage(
      "Add, edit and delete customers",
    ),
    "addExpense": MessageLookupByLibrary.simpleMessage("Add Expense"),
    "addExpenseDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to add new expense",
    ),
    "addExpenseHelp": MessageLookupByLibrary.simpleMessage(
      "Help for adding an expense",
    ),
    "addExpenseHelpDescription": MessageLookupByLibrary.simpleMessage(
      "This screen allows you to create and track business expenses. Here\'s what you can do:",
    ),
    "addFirstCustomer": MessageLookupByLibrary.simpleMessage(
      "Add first customer",
    ),
    "addFirstInvoice": MessageLookupByLibrary.simpleMessage(
      "Add First Invoice",
    ),
    "addFirstItem": MessageLookupByLibrary.simpleMessage("Add First Item"),
    "addFirstProduct": MessageLookupByLibrary.simpleMessage(
      "Add first product",
    ),
    "addFirstUser": MessageLookupByLibrary.simpleMessage("Add First User"),
    "addFromProducts": MessageLookupByLibrary.simpleMessage(
      "Add from Products",
    ),
    "addInvoice": MessageLookupByLibrary.simpleMessage("Add Invoice"),
    "addItem": MessageLookupByLibrary.simpleMessage("Add Item"),
    "addItemsToInvoice": MessageLookupByLibrary.simpleMessage(
      "Add items to invoice",
    ),
    "addManualItem": MessageLookupByLibrary.simpleMessage("Add Manual Item"),
    "addNewClient": MessageLookupByLibrary.simpleMessage("Add New Client"),
    "addNewCustomer": MessageLookupByLibrary.simpleMessage("Add New Customer"),
    "addNewExpenseCategory": MessageLookupByLibrary.simpleMessage(
      "Add New Expense Category",
    ),
    "addNewItem": MessageLookupByLibrary.simpleMessage("Add New Item"),
    "addNewProduct": MessageLookupByLibrary.simpleMessage("Add New Product"),
    "addNewRole": MessageLookupByLibrary.simpleMessage("Add New Role"),
    "addNewUserMessage": MessageLookupByLibrary.simpleMessage(
      "Press the add button to create a new user",
    ),
    "addNotes": MessageLookupByLibrary.simpleMessage("Add Notes"),
    "addProduct": MessageLookupByLibrary.simpleMessage("Add Product"),
    "addProductDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to add new product",
    ),
    "addReferenceNumberAndNotes": MessageLookupByLibrary.simpleMessage(
      "Add reference number and notes",
    ),
    "addUser": MessageLookupByLibrary.simpleMessage("Add User"),
    "addUserDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to add new user",
    ),
    "additionalInfo": MessageLookupByLibrary.simpleMessage("Additional Info"),
    "additionalInformation": MessageLookupByLibrary.simpleMessage(
      "Additional Information",
    ),
    "additionalInvoiceDetails": MessageLookupByLibrary.simpleMessage(
      "Additional Invoice Details",
    ),
    "additionalSettings": MessageLookupByLibrary.simpleMessage(
      "Additional Settings",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "addressInformation": MessageLookupByLibrary.simpleMessage(
      "Address Information",
    ),
    "admin": MessageLookupByLibrary.simpleMessage("Admin"),
    "advancedTechCompany": MessageLookupByLibrary.simpleMessage(
      "Advanced Technology Company",
    ),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allCategories": MessageLookupByLibrary.simpleMessage("All Categories"),
    "allCategoriesDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "All categories deleted successfully",
    ),
    "allCustomers": MessageLookupByLibrary.simpleMessage("All Customers"),
    "allDataClearedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "All data cleared successfully",
    ),
    "allInvoices": MessageLookupByLibrary.simpleMessage("All Invoices"),
    "allPaymentMethods": MessageLookupByLibrary.simpleMessage(
      "All Payment Methods",
    ),
    "allRoles": MessageLookupByLibrary.simpleMessage("All Roles"),
    "allStatus": MessageLookupByLibrary.simpleMessage("All Status"),
    "allStatuses": MessageLookupByLibrary.simpleMessage("All Statuses"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "amount": MessageLookupByLibrary.simpleMessage("Amount"),
    "amountHelperText": MessageLookupByLibrary.simpleMessage(
      "Enter the total amount spent including tax",
    ),
    "amountHint": MessageLookupByLibrary.simpleMessage("0.00"),
    "amountInformation": MessageLookupByLibrary.simpleMessage(
      "Amount Information",
    ),
    "amountIsRequired": MessageLookupByLibrary.simpleMessage(
      "Amount is required",
    ),
    "andMoreInvoices": m0,
    "appInfo": MessageLookupByLibrary.simpleMessage("App Information"),
    "appInformation": MessageLookupByLibrary.simpleMessage("App Information"),
    "appName": MessageLookupByLibrary.simpleMessage("App Name"),
    "appVersionWithBuild": m1,
    "apply": MessageLookupByLibrary.simpleMessage("Apply"),
    "applyFilters": MessageLookupByLibrary.simpleMessage("Apply Filters"),
    "applyTaxToProduct": MessageLookupByLibrary.simpleMessage(
      "Apply Tax to Product",
    ),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "arabicDescription": MessageLookupByLibrary.simpleMessage("العربية"),
    "areYouSureDelete": m2,
    "areYouSureDeleteClient": m3,
    "ascending": MessageLookupByLibrary.simpleMessage("Ascending"),
    "authConfirmPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Enter password confirmation",
    ),
    "authCopyCodeFromEmail": MessageLookupByLibrary.simpleMessage(
      "Copy the code from email and paste it here",
    ),
    "authError": MessageLookupByLibrary.simpleMessage(
      "Login failed. Please check your email and password.",
    ),
    "authLoadingComplete": MessageLookupByLibrary.simpleMessage(
      "Loading complete!",
    ),
    "authLoadingDashboard": MessageLookupByLibrary.simpleMessage(
      "Loading dashboard data...",
    ),
    "authLoadingError": MessageLookupByLibrary.simpleMessage("Loading error"),
    "authLoadingStatistics": MessageLookupByLibrary.simpleMessage(
      "Loading statistics...",
    ),
    "authPreparingHome": MessageLookupByLibrary.simpleMessage(
      "Preparing home screen...",
    ),
    "authSignInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign in with Google",
    ),
    "authSubscriptionRequired": MessageLookupByLibrary.simpleMessage(
      "Subscription required",
    ),
    "available": m4,
    "backToCategories": MessageLookupByLibrary.simpleMessage(
      "Back to Categories",
    ),
    "backToLoginScreen": MessageLookupByLibrary.simpleMessage(
      "Back to Login Screen",
    ),
    "backup": MessageLookupByLibrary.simpleMessage("Backup"),
    "bankTransfer": MessageLookupByLibrary.simpleMessage("Bank Transfer"),
    "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
    "basicInfo": MessageLookupByLibrary.simpleMessage("Basic Info"),
    "basicInformation": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "bluetooth": MessageLookupByLibrary.simpleMessage("Bluetooth"),
    "bluetoothIsOff": MessageLookupByLibrary.simpleMessage("Bluetooth is Off"),
    "bluetoothIsOffMessage": MessageLookupByLibrary.simpleMessage(
      "Bluetooth is off. Please enable Bluetooth to connect to printer.",
    ),
    "bluetoothOff": MessageLookupByLibrary.simpleMessage(
      "Bluetooth is off. Please enable it.",
    ),
    "boughtThis": MessageLookupByLibrary.simpleMessage("Bought This"),
    "brand": MessageLookupByLibrary.simpleMessage("Brand"),
    "buildNumber": MessageLookupByLibrary.simpleMessage("Build Number"),
    "buttonPressed": MessageLookupByLibrary.simpleMessage(
      "Normal button pressed",
    ),
    "buttons": MessageLookupByLibrary.simpleMessage("Buttons"),
    "cacheClearedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Cache cleared successfully",
    ),
    "cacheError": MessageLookupByLibrary.simpleMessage("Local storage error"),
    "cacheSize": MessageLookupByLibrary.simpleMessage("Cache Size"),
    "calling": m5,
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cannotEditInvoice": MessageLookupByLibrary.simpleMessage(
      "Cannot Edit Invoice",
    ),
    "cannotEditSentInvoice": MessageLookupByLibrary.simpleMessage(
      "Cannot edit sent invoices",
    ),
    "cannotOpenEmail": MessageLookupByLibrary.simpleMessage(
      "Cannot open email app",
    ),
    "cannotOpenEmailApp": MessageLookupByLibrary.simpleMessage(
      "Cannot open email application",
    ),
    "cannotOpenPackageLink": MessageLookupByLibrary.simpleMessage(
      "Cannot open package link",
    ),
    "cannotOpenPhone": MessageLookupByLibrary.simpleMessage(
      "Cannot open phone app",
    ),
    "cannotOpenSubscriptionLink": MessageLookupByLibrary.simpleMessage(
      "Cannot open subscription link",
    ),
    "cannotOpenWebsite": MessageLookupByLibrary.simpleMessage(
      "Cannot open website",
    ),
    "cannotOpenWhatsApp": MessageLookupByLibrary.simpleMessage(
      "Cannot open WhatsApp",
    ),
    "card": MessageLookupByLibrary.simpleMessage("Card"),
    "cardPressed": MessageLookupByLibrary.simpleMessage("Card pressed"),
    "cards": MessageLookupByLibrary.simpleMessage("Cards"),
    "cash": MessageLookupByLibrary.simpleMessage("Cash"),
    "categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "categoriesAppbar": MessageLookupByLibrary.simpleMessage(
      "Product Categories",
    ),
    "categorization": MessageLookupByLibrary.simpleMessage("Categorization"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "categoryAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Category added successfully",
    ),
    "categoryCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Category created successfully",
    ),
    "categoryDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Category deleted successfully",
    ),
    "categoryDescription": MessageLookupByLibrary.simpleMessage(
      "Category Description",
    ),
    "categoryName": MessageLookupByLibrary.simpleMessage("Category Name"),
    "categoryNameRequired": MessageLookupByLibrary.simpleMessage(
      "Category name is required",
    ),
    "categoryPreview": MessageLookupByLibrary.simpleMessage("Category Preview"),
    "categoryUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Category updated successfully",
    ),
    "centimeters": MessageLookupByLibrary.simpleMessage("cm"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "changePasswordButton": MessageLookupByLibrary.simpleMessage(
      "Change Password",
    ),
    "changePasswordConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to change your password?",
    ),
    "changePaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Change Payment Method",
    ),
    "changePaymentMethodForInvoice": m6,
    "changeStatus": MessageLookupByLibrary.simpleMessage("Change Status"),
    "check": MessageLookupByLibrary.simpleMessage("Check"),
    "checkYourEmail": MessageLookupByLibrary.simpleMessage("Check your email"),
    "checkingBluetoothStatus": MessageLookupByLibrary.simpleMessage(
      "Checking Bluetooth status...",
    ),
    "checkingConnection": MessageLookupByLibrary.simpleMessage(
      "Checking connection...",
    ),
    "checkingPrinterConnection": MessageLookupByLibrary.simpleMessage(
      "Checking printer connection...",
    ),
    "chooseFeature": MessageLookupByLibrary.simpleMessage(
      "Choose the feature you want to manage",
    ),
    "chooseSubscription": MessageLookupByLibrary.simpleMessage(
      "Choose Subscription",
    ),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "clear": MessageLookupByLibrary.simpleMessage("Clear"),
    "clearAllData": MessageLookupByLibrary.simpleMessage("Clear All Data"),
    "clearAllDataConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear all data? This will remove all cached files and preferences. This action cannot be undone.",
    ),
    "clearAllDataDescription": MessageLookupByLibrary.simpleMessage(
      "Warning: This will delete all cached data and preferences. Your account data will remain safe.",
    ),
    "clearCache": MessageLookupByLibrary.simpleMessage("Clear Cache"),
    "clearCacheConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear the cache? This will remove temporary files but not your personal data.",
    ),
    "clearCacheDescription": MessageLookupByLibrary.simpleMessage(
      "Clear temporary files and cached data to free up storage space.",
    ),
    "clearFilters": MessageLookupByLibrary.simpleMessage("Clear Filters"),
    "clearSearch": MessageLookupByLibrary.simpleMessage("Clear Search"),
    "clientAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Client added successfully",
    ),
    "clientDetails": MessageLookupByLibrary.simpleMessage("Client Details"),
    "clientName": MessageLookupByLibrary.simpleMessage("Client Name"),
    "clientUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Client updated successfully",
    ),
    "clientsActive": MessageLookupByLibrary.simpleMessage("Active"),
    "clientsAddClient": MessageLookupByLibrary.simpleMessage("Add Client"),
    "clientsAddFirstClient": MessageLookupByLibrary.simpleMessage(
      "Add First Client",
    ),
    "clientsAddNew": MessageLookupByLibrary.simpleMessage("Add New Client"),
    "clientsAddNewDesc": MessageLookupByLibrary.simpleMessage(
      "Fill the form below to add a new client to the system",
    ),
    "clientsAdditionalInfo": MessageLookupByLibrary.simpleMessage(
      "Additional Information",
    ),
    "clientsAddress": MessageLookupByLibrary.simpleMessage("Address"),
    "clientsAll": MessageLookupByLibrary.simpleMessage("All"),
    "clientsBasicInfo": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "clientsCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "clientsClientAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Client added successfully",
    ),
    "clientsClientName": MessageLookupByLibrary.simpleMessage("Client Name"),
    "clientsClientUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Client updated successfully",
    ),
    "clientsCompanyInfo": MessageLookupByLibrary.simpleMessage(
      "Company Information",
    ),
    "clientsCompanyName": MessageLookupByLibrary.simpleMessage("Company Name"),
    "clientsContactPersonEmail": MessageLookupByLibrary.simpleMessage(
      "Contact Person Email",
    ),
    "clientsContactPersonInfo": MessageLookupByLibrary.simpleMessage(
      "Contact Person Information",
    ),
    "clientsContactPersonName": MessageLookupByLibrary.simpleMessage(
      "Contact Person Name",
    ),
    "clientsContactPersonPhone": MessageLookupByLibrary.simpleMessage(
      "Contact Person Phone",
    ),
    "clientsCount": m7,
    "clientsCreatedAt": MessageLookupByLibrary.simpleMessage("Created At"),
    "clientsDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "clientsDeleteConfirmation": MessageLookupByLibrary.simpleMessage(
      "Confirm Delete",
    ),
    "clientsDeleteConfirmationMessage": m8,
    "clientsDetails": MessageLookupByLibrary.simpleMessage("Client Details"),
    "clientsEdit": MessageLookupByLibrary.simpleMessage("Edit Client"),
    "clientsEditAction": MessageLookupByLibrary.simpleMessage("Edit"),
    "clientsEditDesc": m9,
    "clientsEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "clientsEnterAddress": MessageLookupByLibrary.simpleMessage(
      "Enter client address",
    ),
    "clientsEnterClientName": MessageLookupByLibrary.simpleMessage(
      "Enter client name",
    ),
    "clientsEnterCompanyName": MessageLookupByLibrary.simpleMessage(
      "Enter company name",
    ),
    "clientsEnterContactPersonEmail": MessageLookupByLibrary.simpleMessage(
      "Enter contact person email",
    ),
    "clientsEnterContactPersonName": MessageLookupByLibrary.simpleMessage(
      "Enter contact person name",
    ),
    "clientsEnterContactPersonPhone": MessageLookupByLibrary.simpleMessage(
      "Enter contact person phone",
    ),
    "clientsEnterEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
    "clientsEnterNotes": MessageLookupByLibrary.simpleMessage(
      "Enter additional notes",
    ),
    "clientsEnterPhone": MessageLookupByLibrary.simpleMessage(
      "Enter phone number",
    ),
    "clientsEnterTaxNumber": MessageLookupByLibrary.simpleMessage(
      "Enter tax number",
    ),
    "clientsEnterWebsite": MessageLookupByLibrary.simpleMessage(
      "Enter website",
    ),
    "clientsErrorCreatingClient": m10,
    "clientsErrorUpdatingClient": m11,
    "clientsInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "clientsList": MessageLookupByLibrary.simpleMessage("Clients List"),
    "clientsLockedAction": MessageLookupByLibrary.simpleMessage(
      "Locked Action",
    ),
    "clientsManagement": MessageLookupByLibrary.simpleMessage(
      "Clients Management",
    ),
    "clientsName": MessageLookupByLibrary.simpleMessage("Name"),
    "clientsNoClientsFound": MessageLookupByLibrary.simpleMessage(
      "No clients found",
    ),
    "clientsNoPermissionToAct": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to perform this action",
    ),
    "clientsNoPermissionToView": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to view this content",
    ),
    "clientsNotes": MessageLookupByLibrary.simpleMessage("Notes"),
    "clientsPhone": MessageLookupByLibrary.simpleMessage("Phone"),
    "clientsProducts": MessageLookupByLibrary.simpleMessage(
      "Clients and Products",
    ),
    "clientsProductsDesc": MessageLookupByLibrary.simpleMessage(
      "Control of clients and products",
    ),
    "clientsProductsTitle": MessageLookupByLibrary.simpleMessage(
      "Clients and Products",
    ),
    "clientsSaveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "clientsSearchClients": MessageLookupByLibrary.simpleMessage(
      "Search clients...",
    ),
    "clientsStartByAddingFirst": MessageLookupByLibrary.simpleMessage(
      "Start by adding your first client to the system",
    ),
    "clientsStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "clientsTaxNumber": MessageLookupByLibrary.simpleMessage("Tax Number"),
    "clientsTotal": MessageLookupByLibrary.simpleMessage("Total"),
    "clientsUpdatedAt": MessageLookupByLibrary.simpleMessage("Last Updated"),
    "clientsView": MessageLookupByLibrary.simpleMessage("View"),
    "clientsWebsite": MessageLookupByLibrary.simpleMessage("Website"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "codeMustBe6Digits": MessageLookupByLibrary.simpleMessage(
      "Code must be 6 digits",
    ),
    "codeResent": MessageLookupByLibrary.simpleMessage(
      "Code resent successfully",
    ),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "comingSoon": MessageLookupByLibrary.simpleMessage("Coming Soon"),
    "company": MessageLookupByLibrary.simpleMessage("Company"),
    "companyAddress": MessageLookupByLibrary.simpleMessage("Company Address"),
    "companyAddressRequired": MessageLookupByLibrary.simpleMessage(
      "Company address is required",
    ),
    "companyEmail": MessageLookupByLibrary.simpleMessage("Company Email"),
    "companyEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Invalid company email",
    ),
    "companyEmailRequired": MessageLookupByLibrary.simpleMessage(
      "Company email is required",
    ),
    "companyInformation": MessageLookupByLibrary.simpleMessage(
      "Company Information",
    ),
    "companyLogo": MessageLookupByLibrary.simpleMessage("Company Logo"),
    "companyLogoFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to load company logo",
    ),
    "companyLogoLoaded": MessageLookupByLibrary.simpleMessage(
      "Company logo loaded successfully",
    ),
    "companyName": MessageLookupByLibrary.simpleMessage("Company Name"),
    "companyNameRequired": MessageLookupByLibrary.simpleMessage(
      "Company name is required",
    ),
    "companyPhone": MessageLookupByLibrary.simpleMessage("Company Phone"),
    "companyPhoneRequired": MessageLookupByLibrary.simpleMessage(
      "Company phone is required",
    ),
    "companySettings": MessageLookupByLibrary.simpleMessage("Company Settings"),
    "companySettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to edit company settings",
    ),
    "completeRequiredFields": MessageLookupByLibrary.simpleMessage(
      "Complete required fields",
    ),
    "completedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "completed successfully",
    ),
    "configureTaxIntegration": MessageLookupByLibrary.simpleMessage(
      "Configure Tax Integration",
    ),
    "confirmDelete": MessageLookupByLibrary.simpleMessage("Confirm Delete"),
    "confirmDeleteCustomer": MessageLookupByLibrary.simpleMessage(
      "Confirm Delete Customer",
    ),
    "confirmDeleteCustomerMessage": m12,
    "confirmNewPassword": MessageLookupByLibrary.simpleMessage(
      "Confirm New Password",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "confirmPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Confirm password",
    ),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Password confirmation is required",
    ),
    "connect": MessageLookupByLibrary.simpleMessage("Connect"),
    "connectPrinterFromSettings": MessageLookupByLibrary.simpleMessage(
      "Please connect printer from settings",
    ),
    "connected": MessageLookupByLibrary.simpleMessage("Connected"),
    "connectedPrinter": MessageLookupByLibrary.simpleMessage(
      "Connected Printer",
    ),
    "connectedPrinterShownAtTop": MessageLookupByLibrary.simpleMessage(
      "Connected printer is shown at the top",
    ),
    "connectingToPrinter": MessageLookupByLibrary.simpleMessage(
      "Connecting to printer...",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Connection error"),
    "connectionFailed": MessageLookupByLibrary.simpleMessage(
      "Connection Failed",
    ),
    "connectionFailedMessage": MessageLookupByLibrary.simpleMessage(
      "Failed to connect to printer. Please check printer settings and try again.",
    ),
    "connectionType": MessageLookupByLibrary.simpleMessage("Connection Type"),
    "constructionDevelopmentCompany": MessageLookupByLibrary.simpleMessage(
      "Construction & Development Company",
    ),
    "contactAdminForAccess": MessageLookupByLibrary.simpleMessage(
      "Please contact the system administrator for access",
    ),
    "contactForm": MessageLookupByLibrary.simpleMessage("Contact Form"),
    "contactInfo": MessageLookupByLibrary.simpleMessage("Contact Info"),
    "contactInformation": MessageLookupByLibrary.simpleMessage(
      "Contact Information",
    ),
    "contactPersonEmail": MessageLookupByLibrary.simpleMessage(
      "Contact Person Email",
    ),
    "contactPersonInformation": MessageLookupByLibrary.simpleMessage(
      "Contact Person Information",
    ),
    "contactPersonName": MessageLookupByLibrary.simpleMessage(
      "Contact Person Name",
    ),
    "contactPersonPhone": MessageLookupByLibrary.simpleMessage(
      "Contact Person Phone",
    ),
    "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "contactUsForSupport": MessageLookupByLibrary.simpleMessage(
      "Contact us for support",
    ),
    "contactViaWhatsApp": MessageLookupByLibrary.simpleMessage(
      "Contact us via WhatsApp",
    ),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "copyCodeFromEmail": MessageLookupByLibrary.simpleMessage(
      "Copy the code from email and paste here",
    ),
    "copyright": MessageLookupByLibrary.simpleMessage("Copyright"),
    "costPrice": MessageLookupByLibrary.simpleMessage("Cost Price"),
    "country": MessageLookupByLibrary.simpleMessage("Country"),
    "create": MessageLookupByLibrary.simpleMessage("Create"),
    "createAnAccount": MessageLookupByLibrary.simpleMessage(
      "Create an account",
    ),
    "createAndEditInvoices": MessageLookupByLibrary.simpleMessage(
      "Create and edit invoices",
    ),
    "createCreditInvoice": MessageLookupByLibrary.simpleMessage(
      "Create Credit Invoice",
    ),
    "createCustomers": MessageLookupByLibrary.simpleMessage("Create Customers"),
    "createEditInvoices": MessageLookupByLibrary.simpleMessage(
      "Create and edit invoices",
    ),
    "createExpense": MessageLookupByLibrary.simpleMessage("Create Expense"),
    "createExpenses": MessageLookupByLibrary.simpleMessage("Create Expenses"),
    "createInvoice": MessageLookupByLibrary.simpleMessage("Create Invoice"),
    "createInvoiceDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to create new invoice",
    ),
    "createInvoiceStep1": MessageLookupByLibrary.simpleMessage(
      "1. Enter basic customer information",
    ),
    "createInvoiceStep2": MessageLookupByLibrary.simpleMessage(
      "2. Add items and quantities",
    ),
    "createInvoiceStep3": MessageLookupByLibrary.simpleMessage(
      "3. Set payment method and date",
    ),
    "createInvoiceStep4": MessageLookupByLibrary.simpleMessage(
      "4. Review and save the invoice",
    ),
    "createNewInvoice": MessageLookupByLibrary.simpleMessage(
      "Create New Invoice",
    ),
    "createNewInvoiceStepper": MessageLookupByLibrary.simpleMessage(
      "Create New Invoice",
    ),
    "createProducts": MessageLookupByLibrary.simpleMessage("Create Products"),
    "createUsers": MessageLookupByLibrary.simpleMessage("Create Users"),
    "createYourFirstExpenseCategory": MessageLookupByLibrary.simpleMessage(
      "Create your first expense category",
    ),
    "createdAt": MessageLookupByLibrary.simpleMessage("Created At"),
    "createdBy": MessageLookupByLibrary.simpleMessage("Created By"),
    "createdByInvotek": MessageLookupByLibrary.simpleMessage(
      "This invoice was created by Invotek App",
    ),
    "createdDate": MessageLookupByLibrary.simpleMessage("Created"),
    "creatingFile": MessageLookupByLibrary.simpleMessage("Creating file..."),
    "creatingInvoices": MessageLookupByLibrary.simpleMessage(
      "Creating Invoices",
    ),
    "creationDate": MessageLookupByLibrary.simpleMessage("Creation Date"),
    "creditCard": MessageLookupByLibrary.simpleMessage("Credit Card"),
    "creditInvoice": MessageLookupByLibrary.simpleMessage("Credit Invoice"),
    "creditInvoicesTitle": MessageLookupByLibrary.simpleMessage(
      "Credit Invoices",
    ),
    "currency": MessageLookupByLibrary.simpleMessage("Dinar"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("Current Password"),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "customerAbilities": MessageLookupByLibrary.simpleMessage(
      "Customer Abilities",
    ),
    "customerAccess": MessageLookupByLibrary.simpleMessage("Customer Access"),
    "customerAccomplishment": MessageLookupByLibrary.simpleMessage(
      "Customer Accomplishment",
    ),
    "customerAccountStatus": MessageLookupByLibrary.simpleMessage(
      "Account Status",
    ),
    "customerAccountability": MessageLookupByLibrary.simpleMessage(
      "Customer Accountability",
    ),
    "customerAchievement": MessageLookupByLibrary.simpleMessage(
      "Customer Achievement",
    ),
    "customerAcquisition": MessageLookupByLibrary.simpleMessage(
      "Customer Acquisition",
    ),
    "customerActinium": MessageLookupByLibrary.simpleMessage(
      "Customer Actinium",
    ),
    "customerActions": MessageLookupByLibrary.simpleMessage("Customer Actions"),
    "customerActive": MessageLookupByLibrary.simpleMessage("Active"),
    "customerActivities": MessageLookupByLibrary.simpleMessage(
      "Customer Activities",
    ),
    "customerAdaptability": MessageLookupByLibrary.simpleMessage(
      "Customer Adaptability",
    ),
    "customerAdditionalInfo": MessageLookupByLibrary.simpleMessage(
      "Additional Information",
    ),
    "customerAddress": MessageLookupByLibrary.simpleMessage("Address"),
    "customerAddressInfo": MessageLookupByLibrary.simpleMessage(
      "Address Information",
    ),
    "customerAddressPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Customer Address",
    ),
    "customerAddressRequired": MessageLookupByLibrary.simpleMessage(
      "Address is required",
    ),
    "customerAddressValue": MessageLookupByLibrary.simpleMessage("Address"),
    "customerAdvantage": MessageLookupByLibrary.simpleMessage(
      "Customer Advantage",
    ),
    "customerAgate": MessageLookupByLibrary.simpleMessage("Customer Agate"),
    "customerAgreements": MessageLookupByLibrary.simpleMessage(
      "Customer Agreements",
    ),
    "customerAlerts": MessageLookupByLibrary.simpleMessage("Customer Alerts"),
    "customerAluminum": MessageLookupByLibrary.simpleMessage(
      "Customer Aluminum",
    ),
    "customerAmber": MessageLookupByLibrary.simpleMessage("Customer Amber"),
    "customerAmericium": MessageLookupByLibrary.simpleMessage(
      "Customer Americium",
    ),
    "customerAmethyst": MessageLookupByLibrary.simpleMessage(
      "Customer Amethyst",
    ),
    "customerAnalysis": MessageLookupByLibrary.simpleMessage(
      "Customer Analysis",
    ),
    "customerAnalytics": MessageLookupByLibrary.simpleMessage(
      "Customer Analytics",
    ),
    "customerApproaches": MessageLookupByLibrary.simpleMessage(
      "Customer Approaches",
    ),
    "customerApprovals": MessageLookupByLibrary.simpleMessage(
      "Customer Approvals",
    ),
    "customerArchives": MessageLookupByLibrary.simpleMessage(
      "Customer Archives",
    ),
    "customerAssessment": MessageLookupByLibrary.simpleMessage(
      "Customer Assessment",
    ),
    "customerAssets": MessageLookupByLibrary.simpleMessage("Customer Assets"),
    "customerAssurance": MessageLookupByLibrary.simpleMessage(
      "Customer Assurance",
    ),
    "customerAstatine": MessageLookupByLibrary.simpleMessage(
      "Customer Astatine",
    ),
    "customerAudit": MessageLookupByLibrary.simpleMessage("Customer Audit"),
    "customerAuthentication": MessageLookupByLibrary.simpleMessage(
      "Customer Authentication",
    ),
    "customerAuthorization": MessageLookupByLibrary.simpleMessage(
      "Customer Authorization",
    ),
    "customerAuthorizations": MessageLookupByLibrary.simpleMessage(
      "Customer Authorizations",
    ),
    "customerBackup": MessageLookupByLibrary.simpleMessage("Customer Backup"),
    "customerBalance": MessageLookupByLibrary.simpleMessage("Customer Balance"),
    "customerBasicInfo": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "customerBasicInfoSection": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "customerBenefit": MessageLookupByLibrary.simpleMessage("Customer Benefit"),
    "customerBerkelium": MessageLookupByLibrary.simpleMessage(
      "Customer Berkelium",
    ),
    "customerBest": MessageLookupByLibrary.simpleMessage("Customer Best"),
    "customerBohrium": MessageLookupByLibrary.simpleMessage("Customer Bohrium"),
    "customerBone": MessageLookupByLibrary.simpleMessage("Customer Bone"),
    "customerBronze": MessageLookupByLibrary.simpleMessage("Customer Bronze"),
    "customerBudget": MessageLookupByLibrary.simpleMessage("Customer Budget"),
    "customerCalendars": MessageLookupByLibrary.simpleMessage(
      "Customer Calendars",
    ),
    "customerCalifornium": MessageLookupByLibrary.simpleMessage(
      "Customer Californium",
    ),
    "customerCalls": MessageLookupByLibrary.simpleMessage("Customer Calls"),
    "customerCampaigns": MessageLookupByLibrary.simpleMessage(
      "Customer Campaigns",
    ),
    "customerCapabilities": MessageLookupByLibrary.simpleMessage(
      "Customer Capabilities",
    ),
    "customerCapital": MessageLookupByLibrary.simpleMessage("Customer Capital"),
    "customerCategory": MessageLookupByLibrary.simpleMessage(
      "Customer Category",
    ),
    "customerCertifications": MessageLookupByLibrary.simpleMessage(
      "Customer Certifications",
    ),
    "customerChats": MessageLookupByLibrary.simpleMessage("Customer Chats"),
    "customerChromium": MessageLookupByLibrary.simpleMessage(
      "Customer Chromium",
    ),
    "customerCity": MessageLookupByLibrary.simpleMessage("City"),
    "customerCityRequired": MessageLookupByLibrary.simpleMessage(
      "City is required",
    ),
    "customerCobalt": MessageLookupByLibrary.simpleMessage("Customer Cobalt"),
    "customerComments": MessageLookupByLibrary.simpleMessage(
      "Customer Comments",
    ),
    "customerCommercialRegister": MessageLookupByLibrary.simpleMessage(
      "Commercial Register",
    ),
    "customerCommercialRegisterRequired": MessageLookupByLibrary.simpleMessage(
      "Commercial register is required",
    ),
    "customerCommitment": MessageLookupByLibrary.simpleMessage(
      "Customer Commitment",
    ),
    "customerCommunication": MessageLookupByLibrary.simpleMessage(
      "Customer Communication",
    ),
    "customerCompany": MessageLookupByLibrary.simpleMessage("Company"),
    "customerCompanyName": MessageLookupByLibrary.simpleMessage(
      "Company/Organization Name",
    ),
    "customerCompanyRequired": MessageLookupByLibrary.simpleMessage(
      "Company name is required",
    ),
    "customerCompetencies": MessageLookupByLibrary.simpleMessage(
      "Customer Competencies",
    ),
    "customerComplaints": MessageLookupByLibrary.simpleMessage(
      "Customer Complaints",
    ),
    "customerConfidence": MessageLookupByLibrary.simpleMessage(
      "Customer Confidence",
    ),
    "customerConfidentiality": MessageLookupByLibrary.simpleMessage(
      "Customer Confidentiality",
    ),
    "customerConfiguration": MessageLookupByLibrary.simpleMessage(
      "Customer Configuration",
    ),
    "customerConsistency": MessageLookupByLibrary.simpleMessage(
      "Customer Consistency",
    ),
    "customerContactInfo": MessageLookupByLibrary.simpleMessage(
      "Contact Information",
    ),
    "customerContracts": MessageLookupByLibrary.simpleMessage(
      "Customer Contracts",
    ),
    "customerConversion": MessageLookupByLibrary.simpleMessage(
      "Customer Conversion",
    ),
    "customerCopernicium": MessageLookupByLibrary.simpleMessage(
      "Customer Copernicium",
    ),
    "customerCopper": MessageLookupByLibrary.simpleMessage("Customer Copper"),
    "customerCoral": MessageLookupByLibrary.simpleMessage("Customer Coral"),
    "customerCost": MessageLookupByLibrary.simpleMessage("Customer Cost"),
    "customerCreatedDate": MessageLookupByLibrary.simpleMessage("Created Date"),
    "customerCreatedSuccessfully": m13,
    "customerCreativity": MessageLookupByLibrary.simpleMessage(
      "Customer Creativity",
    ),
    "customerCredentials": MessageLookupByLibrary.simpleMessage(
      "Customer Credentials",
    ),
    "customerCreditLimit": MessageLookupByLibrary.simpleMessage("Credit Limit"),
    "customerCredits": MessageLookupByLibrary.simpleMessage("Customer Credits"),
    "customerCrown": MessageLookupByLibrary.simpleMessage("Customer Crown"),
    "customerCrystal": MessageLookupByLibrary.simpleMessage("Customer Crystal"),
    "customerCurium": MessageLookupByLibrary.simpleMessage("Customer Curium"),
    "customerCurrency": MessageLookupByLibrary.simpleMessage(
      "Customer Currency",
    ),
    "customerCustomization": MessageLookupByLibrary.simpleMessage(
      "Customer Customization",
    ),
    "customerDarmstadtium": MessageLookupByLibrary.simpleMessage(
      "Customer Darmstadtium",
    ),
    "customerDashboard": MessageLookupByLibrary.simpleMessage(
      "Customer Dashboard",
    ),
    "customerData": MessageLookupByLibrary.simpleMessage("Customer Data"),
    "customerDataCopied": MessageLookupByLibrary.simpleMessage(
      "Customer data copied to clipboard",
    ),
    "customerDatabase": MessageLookupByLibrary.simpleMessage(
      "Customer Database",
    ),
    "customerDeadlines": MessageLookupByLibrary.simpleMessage(
      "Customer Deadlines",
    ),
    "customerDeals": MessageLookupByLibrary.simpleMessage("Customer Deals"),
    "customerDebits": MessageLookupByLibrary.simpleMessage("Customer Debits"),
    "customerDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Customer deleted successfully",
    ),
    "customerDependability": MessageLookupByLibrary.simpleMessage(
      "Customer Dependability",
    ),
    "customerDeployment": MessageLookupByLibrary.simpleMessage(
      "Customer Deployment",
    ),
    "customerDetailedAddress": MessageLookupByLibrary.simpleMessage(
      "Detailed Address",
    ),
    "customerDetailedAddressRequired": MessageLookupByLibrary.simpleMessage(
      "Detailed address is required",
    ),
    "customerDetails": MessageLookupByLibrary.simpleMessage("Customer Details"),
    "customerDevelopment": MessageLookupByLibrary.simpleMessage(
      "Customer Development",
    ),
    "customerDiamond": MessageLookupByLibrary.simpleMessage("Customer Diamond"),
    "customerDiscount": MessageLookupByLibrary.simpleMessage(
      "Customer Discount",
    ),
    "customerDistinctiveness": MessageLookupByLibrary.simpleMessage(
      "Customer Distinctiveness",
    ),
    "customerDistribution": MessageLookupByLibrary.simpleMessage(
      "Customer Distribution",
    ),
    "customerDiversity": MessageLookupByLibrary.simpleMessage(
      "Customer Diversity",
    ),
    "customerDocumentation": MessageLookupByLibrary.simpleMessage(
      "Customer Documentation",
    ),
    "customerDocuments": MessageLookupByLibrary.simpleMessage(
      "Customer Documents",
    ),
    "customerDubnium": MessageLookupByLibrary.simpleMessage("Customer Dubnium"),
    "customerDuty": MessageLookupByLibrary.simpleMessage("Customer Duty"),
    "customerEarnings": MessageLookupByLibrary.simpleMessage(
      "Customer Earnings",
    ),
    "customerEdge": MessageLookupByLibrary.simpleMessage("Customer Edge"),
    "customerEffectiveness": MessageLookupByLibrary.simpleMessage(
      "Customer Effectiveness",
    ),
    "customerEfficiency": MessageLookupByLibrary.simpleMessage(
      "Customer Efficiency",
    ),
    "customerEinsteinium": MessageLookupByLibrary.simpleMessage(
      "Customer Einsteinium",
    ),
    "customerEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "customerEmailPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Customer Email",
    ),
    "customerEmailRequired": MessageLookupByLibrary.simpleMessage(
      "Email is required",
    ),
    "customerEmailValue": MessageLookupByLibrary.simpleMessage("Email"),
    "customerEmails": MessageLookupByLibrary.simpleMessage("Customer Emails"),
    "customerEmerald": MessageLookupByLibrary.simpleMessage("Customer Emerald"),
    "customerEndorsements": MessageLookupByLibrary.simpleMessage(
      "Customer Endorsements",
    ),
    "customerEngagement": MessageLookupByLibrary.simpleMessage(
      "Customer Engagement",
    ),
    "customerEnhancement": MessageLookupByLibrary.simpleMessage(
      "Customer Enhancement",
    ),
    "customerEquity": MessageLookupByLibrary.simpleMessage("Customer Equity"),
    "customerEvaluation": MessageLookupByLibrary.simpleMessage(
      "Customer Evaluation",
    ),
    "customerEvents": MessageLookupByLibrary.simpleMessage("Customer Events"),
    "customerExcellence": MessageLookupByLibrary.simpleMessage(
      "Customer Excellence",
    ),
    "customerExpectations": MessageLookupByLibrary.simpleMessage(
      "Customer Expectations",
    ),
    "customerExpense": MessageLookupByLibrary.simpleMessage("Customer Expense"),
    "customerExpertise": MessageLookupByLibrary.simpleMessage(
      "Customer Expertise",
    ),
    "customerExport": MessageLookupByLibrary.simpleMessage("Export Customers"),
    "customerFairness": MessageLookupByLibrary.simpleMessage(
      "Customer Fairness",
    ),
    "customerFeedback": MessageLookupByLibrary.simpleMessage(
      "Customer Feedback",
    ),
    "customerFermium": MessageLookupByLibrary.simpleMessage("Customer Fermium"),
    "customerFiles": MessageLookupByLibrary.simpleMessage("Customer Files"),
    "customerFilters": MessageLookupByLibrary.simpleMessage("Customer Filters"),
    "customerFinancing": MessageLookupByLibrary.simpleMessage(
      "Customer Financing",
    ),
    "customerFlawlessness": MessageLookupByLibrary.simpleMessage(
      "Customer Flawlessness",
    ),
    "customerFlerovium": MessageLookupByLibrary.simpleMessage(
      "Customer Flerovium",
    ),
    "customerFlexibility": MessageLookupByLibrary.simpleMessage(
      "Customer Flexibility",
    ),
    "customerFollowUp": MessageLookupByLibrary.simpleMessage(
      "Customer Follow-up",
    ),
    "customerFormDescription": MessageLookupByLibrary.simpleMessage(
      "Fill out the form below to add a new customer to the system",
    ),
    "customerFormHelp": MessageLookupByLibrary.simpleMessage(
      "Customer Form Help",
    ),
    "customerFormHelpDescription": MessageLookupByLibrary.simpleMessage(
      "This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information",
    ),
    "customerFormTitle": MessageLookupByLibrary.simpleMessage("Customer Form"),
    "customerFortune": MessageLookupByLibrary.simpleMessage("Customer Fortune"),
    "customerFrancium": MessageLookupByLibrary.simpleMessage(
      "Customer Francium",
    ),
    "customerFunding": MessageLookupByLibrary.simpleMessage("Customer Funding"),
    "customerGain": MessageLookupByLibrary.simpleMessage("Customer Gain"),
    "customerGarnet": MessageLookupByLibrary.simpleMessage("Customer Garnet"),
    "customerGem": MessageLookupByLibrary.simpleMessage("Customer Gem"),
    "customerGlobalization": MessageLookupByLibrary.simpleMessage(
      "Customer Globalization",
    ),
    "customerGoals": MessageLookupByLibrary.simpleMessage("Customer Goals"),
    "customerGold": MessageLookupByLibrary.simpleMessage("Customer Gold"),
    "customerGrowth": MessageLookupByLibrary.simpleMessage("Customer Growth"),
    "customerGuarantee": MessageLookupByLibrary.simpleMessage(
      "Customer Guarantee",
    ),
    "customerGuidelines": MessageLookupByLibrary.simpleMessage(
      "Customer Guidelines",
    ),
    "customerHafnium": MessageLookupByLibrary.simpleMessage("Customer Hafnium"),
    "customerHassium": MessageLookupByLibrary.simpleMessage("Customer Hassium"),
    "customerHighest": MessageLookupByLibrary.simpleMessage("Customer Highest"),
    "customerHistory": MessageLookupByLibrary.simpleMessage("Customer History"),
    "customerIdeal": MessageLookupByLibrary.simpleMessage("Customer Ideal"),
    "customerIdeas": MessageLookupByLibrary.simpleMessage("Customer Ideas"),
    "customerImplementation": MessageLookupByLibrary.simpleMessage(
      "Customer Implementation",
    ),
    "customerImport": MessageLookupByLibrary.simpleMessage("Import Customers"),
    "customerImprovement": MessageLookupByLibrary.simpleMessage(
      "Customer Improvement",
    ),
    "customerInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "customerInclusion": MessageLookupByLibrary.simpleMessage(
      "Customer Inclusion",
    ),
    "customerIncome": MessageLookupByLibrary.simpleMessage("Customer Income"),
    "customerIndustry": MessageLookupByLibrary.simpleMessage(
      "Customer Industry",
    ),
    "customerInfo": MessageLookupByLibrary.simpleMessage(
      "Customer Information",
    ),
    "customerInformation": MessageLookupByLibrary.simpleMessage(
      "Customer Information",
    ),
    "customerInnovation": MessageLookupByLibrary.simpleMessage(
      "Customer Innovation",
    ),
    "customerInspection": MessageLookupByLibrary.simpleMessage(
      "Customer Inspection",
    ),
    "customerInstallation": MessageLookupByLibrary.simpleMessage(
      "Customer Installation",
    ),
    "customerIntegration": MessageLookupByLibrary.simpleMessage(
      "Customer Integration",
    ),
    "customerInternationalization": MessageLookupByLibrary.simpleMessage(
      "Customer Internationalization",
    ),
    "customerInvestment": MessageLookupByLibrary.simpleMessage(
      "Customer Investment",
    ),
    "customerInvoices": MessageLookupByLibrary.simpleMessage(
      "Customer Invoices",
    ),
    "customerIridium": MessageLookupByLibrary.simpleMessage("Customer Iridium"),
    "customerIron": MessageLookupByLibrary.simpleMessage("Customer Iron"),
    "customerIssues": MessageLookupByLibrary.simpleMessage("Customer Issues"),
    "customerIvory": MessageLookupByLibrary.simpleMessage("Customer Ivory"),
    "customerJade": MessageLookupByLibrary.simpleMessage("Customer Jade"),
    "customerJet": MessageLookupByLibrary.simpleMessage("Customer Jet"),
    "customerJewel": MessageLookupByLibrary.simpleMessage("Customer Jewel"),
    "customerKnowledge": MessageLookupByLibrary.simpleMessage(
      "Customer Knowledge",
    ),
    "customerLanguage": MessageLookupByLibrary.simpleMessage(
      "Customer Language",
    ),
    "customerLastUpdated": MessageLookupByLibrary.simpleMessage("Last Updated"),
    "customerLawrencium": MessageLookupByLibrary.simpleMessage(
      "Customer Lawrencium",
    ),
    "customerLead": MessageLookupByLibrary.simpleMessage("Customer Lead"),
    "customerLiability": MessageLookupByLibrary.simpleMessage(
      "Customer Liability",
    ),
    "customerLicenses": MessageLookupByLibrary.simpleMessage(
      "Customer Licenses",
    ),
    "customerLifetimeValue": MessageLookupByLibrary.simpleMessage(
      "Customer Lifetime Value",
    ),
    "customerList": MessageLookupByLibrary.simpleMessage("Customer List"),
    "customerLivermorium": MessageLookupByLibrary.simpleMessage(
      "Customer Livermorium",
    ),
    "customerLocalization": MessageLookupByLibrary.simpleMessage(
      "Customer Localization",
    ),
    "customerLocation": MessageLookupByLibrary.simpleMessage(
      "Customer Location",
    ),
    "customerLoyalty": MessageLookupByLibrary.simpleMessage("Customer Loyalty"),
    "customerManagement": MessageLookupByLibrary.simpleMessage(
      "Customer Management",
    ),
    "customerManganese": MessageLookupByLibrary.simpleMessage(
      "Customer Manganese",
    ),
    "customerMargin": MessageLookupByLibrary.simpleMessage("Customer Margin"),
    "customerMaximum": MessageLookupByLibrary.simpleMessage("Customer Maximum"),
    "customerMeetings": MessageLookupByLibrary.simpleMessage(
      "Customer Meetings",
    ),
    "customerMeitnerium": MessageLookupByLibrary.simpleMessage(
      "Customer Meitnerium",
    ),
    "customerMendelevium": MessageLookupByLibrary.simpleMessage(
      "Customer Mendelevium",
    ),
    "customerMessages": MessageLookupByLibrary.simpleMessage(
      "Customer Messages",
    ),
    "customerMetal": MessageLookupByLibrary.simpleMessage("Customer Metal"),
    "customerMethods": MessageLookupByLibrary.simpleMessage("Customer Methods"),
    "customerMigration": MessageLookupByLibrary.simpleMessage(
      "Customer Migration",
    ),
    "customerMilestones": MessageLookupByLibrary.simpleMessage(
      "Customer Milestones",
    ),
    "customerMolybdenum": MessageLookupByLibrary.simpleMessage(
      "Customer Molybdenum",
    ),
    "customerMoscovium": MessageLookupByLibrary.simpleMessage(
      "Customer Moscovium",
    ),
    "customerMulticultural": MessageLookupByLibrary.simpleMessage(
      "Customer Multicultural",
    ),
    "customerMultilingual": MessageLookupByLibrary.simpleMessage(
      "Customer Multilingual",
    ),
    "customerName": MessageLookupByLibrary.simpleMessage("Customer Name"),
    "customerNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Customer Name",
    ),
    "customerNameRequired": MessageLookupByLibrary.simpleMessage(
      "Customer name is required",
    ),
    "customerNameValue": MessageLookupByLibrary.simpleMessage("Customer Name"),
    "customerNeptunium": MessageLookupByLibrary.simpleMessage(
      "Customer Neptunium",
    ),
    "customerNickel": MessageLookupByLibrary.simpleMessage("Customer Nickel"),
    "customerNihonium": MessageLookupByLibrary.simpleMessage(
      "Customer Nihonium",
    ),
    "customerNiobium": MessageLookupByLibrary.simpleMessage("Customer Niobium"),
    "customerNobelium": MessageLookupByLibrary.simpleMessage(
      "Customer Nobelium",
    ),
    "customerNotes": MessageLookupByLibrary.simpleMessage("Notes"),
    "customerNotesRequired": MessageLookupByLibrary.simpleMessage(
      "Notes are required",
    ),
    "customerNotifications": MessageLookupByLibrary.simpleMessage(
      "Customer Notifications",
    ),
    "customerObjectives": MessageLookupByLibrary.simpleMessage(
      "Customer Objectives",
    ),
    "customerObligation": MessageLookupByLibrary.simpleMessage(
      "Customer Obligation",
    ),
    "customerOffers": MessageLookupByLibrary.simpleMessage("Customer Offers"),
    "customerOganesson": MessageLookupByLibrary.simpleMessage(
      "Customer Oganesson",
    ),
    "customerOnboarding": MessageLookupByLibrary.simpleMessage(
      "Customer Onboarding",
    ),
    "customerOnyx": MessageLookupByLibrary.simpleMessage("Customer Onyx"),
    "customerOpal": MessageLookupByLibrary.simpleMessage("Customer Opal"),
    "customerOpportunities": MessageLookupByLibrary.simpleMessage(
      "Customer Opportunities",
    ),
    "customerOpportunity": MessageLookupByLibrary.simpleMessage(
      "Customer Opportunity",
    ),
    "customerOptimal": MessageLookupByLibrary.simpleMessage("Customer Optimal"),
    "customerOptimization": MessageLookupByLibrary.simpleMessage(
      "Customer Optimization",
    ),
    "customerOptions": MessageLookupByLibrary.simpleMessage("Customer Options"),
    "customerOrders": MessageLookupByLibrary.simpleMessage("Customer Orders"),
    "customerOriginality": MessageLookupByLibrary.simpleMessage(
      "Customer Originality",
    ),
    "customerOsmium": MessageLookupByLibrary.simpleMessage("Customer Osmium"),
    "customerPalladium": MessageLookupByLibrary.simpleMessage(
      "Customer Palladium",
    ),
    "customerPartnerships": MessageLookupByLibrary.simpleMessage(
      "Customer Partnerships",
    ),
    "customerPaymentTerms": MessageLookupByLibrary.simpleMessage(
      "Payment Terms",
    ),
    "customerPayments": MessageLookupByLibrary.simpleMessage(
      "Customer Payments",
    ),
    "customerPeak": MessageLookupByLibrary.simpleMessage("Customer Peak"),
    "customerPearl": MessageLookupByLibrary.simpleMessage("Customer Pearl"),
    "customerPerfection": MessageLookupByLibrary.simpleMessage(
      "Customer Perfection",
    ),
    "customerPerformance": MessageLookupByLibrary.simpleMessage(
      "Customer Performance",
    ),
    "customerPermission": MessageLookupByLibrary.simpleMessage(
      "Customer Permission",
    ),
    "customerPermits": MessageLookupByLibrary.simpleMessage("Customer Permits"),
    "customerPersonalization": MessageLookupByLibrary.simpleMessage(
      "Customer Personalization",
    ),
    "customerPhone": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "customerPhonePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Customer Phone",
    ),
    "customerPhoneRequired": MessageLookupByLibrary.simpleMessage(
      "Phone number is required",
    ),
    "customerPhoneValue": MessageLookupByLibrary.simpleMessage("Phone"),
    "customerPinnacle": MessageLookupByLibrary.simpleMessage(
      "Customer Pinnacle",
    ),
    "customerPlans": MessageLookupByLibrary.simpleMessage("Customer Plans"),
    "customerPlatinum": MessageLookupByLibrary.simpleMessage(
      "Customer Platinum",
    ),
    "customerPlutonium": MessageLookupByLibrary.simpleMessage(
      "Customer Plutonium",
    ),
    "customerPolicies": MessageLookupByLibrary.simpleMessage(
      "Customer Policies",
    ),
    "customerPolonium": MessageLookupByLibrary.simpleMessage(
      "Customer Polonium",
    ),
    "customerPortal": MessageLookupByLibrary.simpleMessage("Customer Portal"),
    "customerPostalCode": MessageLookupByLibrary.simpleMessage("Postal Code"),
    "customerPostalCodeRequired": MessageLookupByLibrary.simpleMessage(
      "Postal code is required",
    ),
    "customerPredictability": MessageLookupByLibrary.simpleMessage(
      "Customer Predictability",
    ),
    "customerPreferences": MessageLookupByLibrary.simpleMessage(
      "Customer Preferences",
    ),
    "customerPrice": MessageLookupByLibrary.simpleMessage("Customer Price"),
    "customerPriority": MessageLookupByLibrary.simpleMessage(
      "Customer Priority",
    ),
    "customerPrivacy": MessageLookupByLibrary.simpleMessage("Customer Privacy"),
    "customerProcedures": MessageLookupByLibrary.simpleMessage(
      "Customer Procedures",
    ),
    "customerProductivity": MessageLookupByLibrary.simpleMessage(
      "Customer Productivity",
    ),
    "customerProfile": MessageLookupByLibrary.simpleMessage("Customer Profile"),
    "customerProfit": MessageLookupByLibrary.simpleMessage("Customer Profit"),
    "customerProjects": MessageLookupByLibrary.simpleMessage(
      "Customer Projects",
    ),
    "customerPromethium": MessageLookupByLibrary.simpleMessage(
      "Customer Promethium",
    ),
    "customerPromise": MessageLookupByLibrary.simpleMessage("Customer Promise"),
    "customerPromotions": MessageLookupByLibrary.simpleMessage(
      "Customer Promotions",
    ),
    "customerProposals": MessageLookupByLibrary.simpleMessage(
      "Customer Proposals",
    ),
    "customerProtactinium": MessageLookupByLibrary.simpleMessage(
      "Customer Protactinium",
    ),
    "customerQualifications": MessageLookupByLibrary.simpleMessage(
      "Customer Qualifications",
    ),
    "customerQuality": MessageLookupByLibrary.simpleMessage("Customer Quality"),
    "customerQuartz": MessageLookupByLibrary.simpleMessage("Customer Quartz"),
    "customerQuickActions": MessageLookupByLibrary.simpleMessage(
      "Quick Actions",
    ),
    "customerRadium": MessageLookupByLibrary.simpleMessage("Customer Radium"),
    "customerRadon": MessageLookupByLibrary.simpleMessage("Customer Radon"),
    "customerRatings": MessageLookupByLibrary.simpleMessage("Customer Ratings"),
    "customerRecommendations": MessageLookupByLibrary.simpleMessage(
      "Customer Recommendations",
    ),
    "customerRecords": MessageLookupByLibrary.simpleMessage("Customer Records"),
    "customerRecovery": MessageLookupByLibrary.simpleMessage(
      "Customer Recovery",
    ),
    "customerReferences": MessageLookupByLibrary.simpleMessage(
      "Customer References",
    ),
    "customerReferrals": MessageLookupByLibrary.simpleMessage(
      "Customer Referrals",
    ),
    "customerRegion": MessageLookupByLibrary.simpleMessage("Region"),
    "customerRegionRequired": MessageLookupByLibrary.simpleMessage(
      "Region is required",
    ),
    "customerRegionalization": MessageLookupByLibrary.simpleMessage(
      "Customer Regionalization",
    ),
    "customerReliability": MessageLookupByLibrary.simpleMessage(
      "Customer Reliability",
    ),
    "customerReminders": MessageLookupByLibrary.simpleMessage(
      "Customer Reminders",
    ),
    "customerReplication": MessageLookupByLibrary.simpleMessage(
      "Customer Replication",
    ),
    "customerReports": MessageLookupByLibrary.simpleMessage("Customer Reports"),
    "customerRepository": MessageLookupByLibrary.simpleMessage(
      "Customer Repository",
    ),
    "customerRequests": MessageLookupByLibrary.simpleMessage(
      "Customer Requests",
    ),
    "customerRequired": MessageLookupByLibrary.simpleMessage(
      "Please select a customer or enter customer data",
    ),
    "customerRequirements": MessageLookupByLibrary.simpleMessage(
      "Customer Requirements",
    ),
    "customerResources": MessageLookupByLibrary.simpleMessage(
      "Customer Resources",
    ),
    "customerResponsibility": MessageLookupByLibrary.simpleMessage(
      "Customer Responsibility",
    ),
    "customerResponsiblePerson": MessageLookupByLibrary.simpleMessage(
      "Responsible Person",
    ),
    "customerResponsiblePersonRequired": MessageLookupByLibrary.simpleMessage(
      "Responsible person is required",
    ),
    "customerRestore": MessageLookupByLibrary.simpleMessage("Customer Restore"),
    "customerRetention": MessageLookupByLibrary.simpleMessage(
      "Customer Retention",
    ),
    "customerReturn": MessageLookupByLibrary.simpleMessage("Customer Return"),
    "customerRevenue": MessageLookupByLibrary.simpleMessage("Customer Revenue"),
    "customerReview": MessageLookupByLibrary.simpleMessage("Customer Review"),
    "customerReviews": MessageLookupByLibrary.simpleMessage("Customer Reviews"),
    "customerRhenium": MessageLookupByLibrary.simpleMessage("Customer Rhenium"),
    "customerRhodium": MessageLookupByLibrary.simpleMessage("Customer Rhodium"),
    "customerRisk": MessageLookupByLibrary.simpleMessage("Customer Risk"),
    "customerRock": MessageLookupByLibrary.simpleMessage("Customer Rock"),
    "customerRoentgenium": MessageLookupByLibrary.simpleMessage(
      "Customer Roentgenium",
    ),
    "customerRuby": MessageLookupByLibrary.simpleMessage("Customer Ruby"),
    "customerRuthenium": MessageLookupByLibrary.simpleMessage(
      "Customer Ruthenium",
    ),
    "customerRutherfordium": MessageLookupByLibrary.simpleMessage(
      "Customer Rutherfordium",
    ),
    "customerSales": MessageLookupByLibrary.simpleMessage("Customer Sales"),
    "customerSapphire": MessageLookupByLibrary.simpleMessage(
      "Customer Sapphire",
    ),
    "customerSatisfaction": MessageLookupByLibrary.simpleMessage(
      "Customer Satisfaction",
    ),
    "customerSavings": MessageLookupByLibrary.simpleMessage("Customer Savings"),
    "customerScalability": MessageLookupByLibrary.simpleMessage(
      "Customer Scalability",
    ),
    "customerSchedules": MessageLookupByLibrary.simpleMessage(
      "Customer Schedules",
    ),
    "customerSeaborgium": MessageLookupByLibrary.simpleMessage(
      "Customer Seaborgium",
    ),
    "customerSearch": MessageLookupByLibrary.simpleMessage("Search Customers"),
    "customerSecurity": MessageLookupByLibrary.simpleMessage(
      "Customer Security",
    ),
    "customerSegment": MessageLookupByLibrary.simpleMessage("Customer Segment"),
    "customerSelection": MessageLookupByLibrary.simpleMessage(
      "Customer Selection",
    ),
    "customerService": MessageLookupByLibrary.simpleMessage("Customer Service"),
    "customerSettings": MessageLookupByLibrary.simpleMessage(
      "Customer Settings",
    ),
    "customerSilver": MessageLookupByLibrary.simpleMessage("Customer Silver"),
    "customerSize": MessageLookupByLibrary.simpleMessage("Customer Size"),
    "customerSkills": MessageLookupByLibrary.simpleMessage("Customer Skills"),
    "customerSort": MessageLookupByLibrary.simpleMessage("Sort Customers"),
    "customerSpecialization": MessageLookupByLibrary.simpleMessage(
      "Customer Specialization",
    ),
    "customerSpecifications": MessageLookupByLibrary.simpleMessage(
      "Customer Specifications",
    ),
    "customerStability": MessageLookupByLibrary.simpleMessage(
      "Customer Stability",
    ),
    "customerStandards": MessageLookupByLibrary.simpleMessage(
      "Customer Standards",
    ),
    "customerStatistics": MessageLookupByLibrary.simpleMessage(
      "Customer Statistics",
    ),
    "customerStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "customerStatusActive": MessageLookupByLibrary.simpleMessage("Active"),
    "customerStatusInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "customerStatusRequired": MessageLookupByLibrary.simpleMessage(
      "Status is required",
    ),
    "customerSteel": MessageLookupByLibrary.simpleMessage("Customer Steel"),
    "customerStone": MessageLookupByLibrary.simpleMessage("Customer Stone"),
    "customerStorage": MessageLookupByLibrary.simpleMessage("Customer Storage"),
    "customerStrategies": MessageLookupByLibrary.simpleMessage(
      "Customer Strategies",
    ),
    "customerStrengths": MessageLookupByLibrary.simpleMessage(
      "Customer Strengths",
    ),
    "customerSuccess": MessageLookupByLibrary.simpleMessage("Customer Success"),
    "customerSuggestions": MessageLookupByLibrary.simpleMessage(
      "Customer Suggestions",
    ),
    "customerSummit": MessageLookupByLibrary.simpleMessage("Customer Summit"),
    "customerSuperiority": MessageLookupByLibrary.simpleMessage(
      "Customer Superiority",
    ),
    "customerSupport": MessageLookupByLibrary.simpleMessage("Customer Support"),
    "customerSustainability": MessageLookupByLibrary.simpleMessage(
      "Customer Sustainability",
    ),
    "customerSynchronization": MessageLookupByLibrary.simpleMessage(
      "Customer Synchronization",
    ),
    "customerTactics": MessageLookupByLibrary.simpleMessage("Customer Tactics"),
    "customerTantalum": MessageLookupByLibrary.simpleMessage(
      "Customer Tantalum",
    ),
    "customerTargets": MessageLookupByLibrary.simpleMessage("Customer Targets"),
    "customerTasks": MessageLookupByLibrary.simpleMessage("Customer Tasks"),
    "customerTaxExempt": MessageLookupByLibrary.simpleMessage("Tax Exempt"),
    "customerTaxNumber": MessageLookupByLibrary.simpleMessage("Tax Number"),
    "customerTaxNumberPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Customer Tax Number",
    ),
    "customerTaxNumberRequired": MessageLookupByLibrary.simpleMessage(
      "Tax number is required",
    ),
    "customerTechnetium": MessageLookupByLibrary.simpleMessage(
      "Customer Technetium",
    ),
    "customerTechniques": MessageLookupByLibrary.simpleMessage(
      "Customer Techniques",
    ),
    "customerTennessine": MessageLookupByLibrary.simpleMessage(
      "Customer Tennessine",
    ),
    "customerTerms": MessageLookupByLibrary.simpleMessage("Customer Terms"),
    "customerTestimonials": MessageLookupByLibrary.simpleMessage(
      "Customer Testimonials",
    ),
    "customerThorium": MessageLookupByLibrary.simpleMessage("Customer Thorium"),
    "customerThreat": MessageLookupByLibrary.simpleMessage("Customer Threat"),
    "customerThreats": MessageLookupByLibrary.simpleMessage("Customer Threats"),
    "customerTickets": MessageLookupByLibrary.simpleMessage("Customer Tickets"),
    "customerTimelines": MessageLookupByLibrary.simpleMessage(
      "Customer Timelines",
    ),
    "customerTimezone": MessageLookupByLibrary.simpleMessage("Timezone"),
    "customerTin": MessageLookupByLibrary.simpleMessage("Customer Tin"),
    "customerTitanium": MessageLookupByLibrary.simpleMessage(
      "Customer Titanium",
    ),
    "customerTools": MessageLookupByLibrary.simpleMessage("Customer Tools"),
    "customerTop": MessageLookupByLibrary.simpleMessage("Customer Top"),
    "customerTopaz": MessageLookupByLibrary.simpleMessage("Customer Topaz"),
    "customerTraining": MessageLookupByLibrary.simpleMessage(
      "Customer Training",
    ),
    "customerTransactions": MessageLookupByLibrary.simpleMessage(
      "Customer Transactions",
    ),
    "customerTranslation": MessageLookupByLibrary.simpleMessage(
      "Customer Translation",
    ),
    "customerTransparency": MessageLookupByLibrary.simpleMessage(
      "Customer Transparency",
    ),
    "customerTreasure": MessageLookupByLibrary.simpleMessage(
      "Customer Treasure",
    ),
    "customerTriumph": MessageLookupByLibrary.simpleMessage("Customer Triumph"),
    "customerTrust": MessageLookupByLibrary.simpleMessage("Customer Trust"),
    "customerTungsten": MessageLookupByLibrary.simpleMessage(
      "Customer Tungsten",
    ),
    "customerTurquoise": MessageLookupByLibrary.simpleMessage(
      "Customer Turquoise",
    ),
    "customerType": MessageLookupByLibrary.simpleMessage("Customer Type"),
    "customerUniqueness": MessageLookupByLibrary.simpleMessage(
      "Customer Uniqueness",
    ),
    "customerUpdatedSuccessfully": m14,
    "customerUranium": MessageLookupByLibrary.simpleMessage("Customer Uranium"),
    "customerValidation": MessageLookupByLibrary.simpleMessage(
      "Customer Validation",
    ),
    "customerValue": MessageLookupByLibrary.simpleMessage("Customer Value"),
    "customerVanadium": MessageLookupByLibrary.simpleMessage(
      "Customer Vanadium",
    ),
    "customerVerification": MessageLookupByLibrary.simpleMessage(
      "Customer Verification",
    ),
    "customerVictory": MessageLookupByLibrary.simpleMessage("Customer Victory"),
    "customerVip": MessageLookupByLibrary.simpleMessage("VIP Customer"),
    "customerWarranty": MessageLookupByLibrary.simpleMessage(
      "Customer Warranty",
    ),
    "customerWeaknesses": MessageLookupByLibrary.simpleMessage(
      "Customer Weaknesses",
    ),
    "customerWealth": MessageLookupByLibrary.simpleMessage("Customer Wealth"),
    "customerWin": MessageLookupByLibrary.simpleMessage("Customer Win"),
    "customerWood": MessageLookupByLibrary.simpleMessage("Customer Wood"),
    "customerWorth": MessageLookupByLibrary.simpleMessage("Customer Worth"),
    "customerZinc": MessageLookupByLibrary.simpleMessage("Customer Zinc"),
    "customerZirconium": MessageLookupByLibrary.simpleMessage(
      "Customer Zirconium",
    ),
    "customers": MessageLookupByLibrary.simpleMessage("Customers"),
    "customersAccountStatus": MessageLookupByLibrary.simpleMessage(
      "Account Status",
    ),
    "customersAppSettings": MessageLookupByLibrary.simpleMessage(
      "App Settings",
    ),
    "customersCacheError": MessageLookupByLibrary.simpleMessage(
      "Cache error - Customers",
    ),
    "customersCall": MessageLookupByLibrary.simpleMessage("Call"),
    "customersCallPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Call permission denied",
    ),
    "customersCallPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Call Permission Required",
    ),
    "customersCallPermissionRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "You must allow call permission to use this feature. Please go to app settings and allow call permission.",
    ),
    "customersCannotMakeCall": MessageLookupByLibrary.simpleMessage(
      "Cannot make call",
    ),
    "customersCannotOpenMap": MessageLookupByLibrary.simpleMessage(
      "Cannot open map",
    ),
    "customersCannotSendEmail": MessageLookupByLibrary.simpleMessage(
      "Cannot send email",
    ),
    "customersCompanyConstruction": MessageLookupByLibrary.simpleMessage(
      "Construction & Development Company",
    ),
    "customersCompanyEcommerce": MessageLookupByLibrary.simpleMessage(
      "E-commerce Institution",
    ),
    "customersCompanyEducation": MessageLookupByLibrary.simpleMessage(
      "Modern Education Institution",
    ),
    "customersCompanyFinance": MessageLookupByLibrary.simpleMessage(
      "Financial Services Institution",
    ),
    "customersCompanyHealthcare": MessageLookupByLibrary.simpleMessage(
      "Healthcare Institution",
    ),
    "customersCompanyTech": MessageLookupByLibrary.simpleMessage(
      "Advanced Technology Company",
    ),
    "customersCompanyTourism": MessageLookupByLibrary.simpleMessage(
      "Tourism & Entertainment Company",
    ),
    "customersCompanyTransport": MessageLookupByLibrary.simpleMessage(
      "Transport & Logistics Company",
    ),
    "customersContactInformation": MessageLookupByLibrary.simpleMessage(
      "Contact Information",
    ),
    "customersCreated": MessageLookupByLibrary.simpleMessage("Created"),
    "customersCustomerFormHelpDescription": MessageLookupByLibrary.simpleMessage(
      "This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information",
    ),
    "customersDeleteAction": MessageLookupByLibrary.simpleMessage("Delete"),
    "customersEditCustomerAction": MessageLookupByLibrary.simpleMessage(
      "Edit Customer",
    ),
    "customersEmailSubject": MessageLookupByLibrary.simpleMessage(
      "Message from Invotek App",
    ),
    "customersInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "customersInvalidPhoneFormat": MessageLookupByLibrary.simpleMessage(
      "Invalid phone number format",
    ),
    "customersLastFiveInvoices": MessageLookupByLibrary.simpleMessage(
      "The last 5 invoices",
    ),
    "customersLastUpdated": MessageLookupByLibrary.simpleMessage(
      "Last Updated",
    ),
    "customersList": MessageLookupByLibrary.simpleMessage("Customers List"),
    "customersLoadError": MessageLookupByLibrary.simpleMessage(
      "Error loading customers",
    ),
    "customersLoadingMore": MessageLookupByLibrary.simpleMessage(
      "Loading more...",
    ),
    "customersLocationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Location permission denied",
    ),
    "customersLocationPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Location Permission Required",
    ),
    "customersLocationPermissionRequiredMessage":
        MessageLookupByLibrary.simpleMessage(
          "You must allow location permission to use this feature. Please go to app settings and allow location permission.",
        ),
    "customersLockedAction": MessageLookupByLibrary.simpleMessage(
      "Locked Action",
    ),
    "customersManagement": MessageLookupByLibrary.simpleMessage("Customers"),
    "customersMap": MessageLookupByLibrary.simpleMessage("Map"),
    "customersNetworkError": MessageLookupByLibrary.simpleMessage(
      "Network error - Customers",
    ),
    "customersNoInvoicesForCustomer": MessageLookupByLibrary.simpleMessage(
      "No invoices for this customer",
    ),
    "customersNoPermissionToAct": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to perform this action",
    ),
    "customersNoPermissionToView": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to view this content",
    ),
    "customersNotProvided": MessageLookupByLibrary.simpleMessage(
      "Not provided",
    ),
    "customersReport": MessageLookupByLibrary.simpleMessage("Customers Report"),
    "customersTimeoutError": MessageLookupByLibrary.simpleMessage(
      "Timeout error - Customers",
    ),
    "customersUnauthorizedError": MessageLookupByLibrary.simpleMessage(
      "Unauthorized error - Customers",
    ),
    "customersUnknownError": MessageLookupByLibrary.simpleMessage(
      "Unknown error - Customers",
    ),
    "customersUnnamedCustomer": MessageLookupByLibrary.simpleMessage(
      "Unnamed Customer",
    ),
    "customersValidationError": MessageLookupByLibrary.simpleMessage(
      "Validation error - Customers",
    ),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "darkModeDisabled": MessageLookupByLibrary.simpleMessage(
      "Dark mode disabled",
    ),
    "darkModeEnabled": MessageLookupByLibrary.simpleMessage(
      "Dark mode enabled",
    ),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "dashboardError": MessageLookupByLibrary.simpleMessage(
      "Error loading data",
    ),
    "dashboardErrorMessage": MessageLookupByLibrary.simpleMessage(
      "An error occurred while loading dashboard data",
    ),
    "dataConversionError": m15,
    "dataSize": MessageLookupByLibrary.simpleMessage("Data Size"),
    "dataStorage": MessageLookupByLibrary.simpleMessage("Data & Storage"),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "deactivate": MessageLookupByLibrary.simpleMessage("Deactivate"),
    "debitCard": MessageLookupByLibrary.simpleMessage("Debit Card"),
    "debts": MessageLookupByLibrary.simpleMessage("Debts"),
    "decrease": MessageLookupByLibrary.simpleMessage("Decrease"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "deleteAccountButton": MessageLookupByLibrary.simpleMessage(
      "Delete Account Permanently",
    ),
    "deleteAccountConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account?",
    ),
    "deleteAccountFinalConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you absolutely sure you want to delete your account? This action cannot be undone",
    ),
    "deleteAccountWarning": MessageLookupByLibrary.simpleMessage(
      "Warning: Your account will be permanently deleted",
    ),
    "deleteAllCategories": MessageLookupByLibrary.simpleMessage(
      "Delete All Categories",
    ),
    "deleteCategory": MessageLookupByLibrary.simpleMessage("Delete Category"),
    "deleteCategoryConfirmation": m16,
    "deleteClient": MessageLookupByLibrary.simpleMessage("Delete Client"),
    "deleteClientDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to delete client",
    ),
    "deleteConfirmation": MessageLookupByLibrary.simpleMessage(
      "Delete Confirmation",
    ),
    "deleteCustomer": MessageLookupByLibrary.simpleMessage("Delete Customer"),
    "deleteCustomerConfirmation": m17,
    "deleteCustomers": MessageLookupByLibrary.simpleMessage("Delete Customers"),
    "deleteExpense": MessageLookupByLibrary.simpleMessage("Delete Expense"),
    "deleteExpenseDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to delete expense",
    ),
    "deleteExpenses": MessageLookupByLibrary.simpleMessage("Delete Expenses"),
    "deleteInvoice": MessageLookupByLibrary.simpleMessage("Delete Invoice"),
    "deleteInvoiceConfirmation": MessageLookupByLibrary.simpleMessage(
      "Delete Invoice Confirmation",
    ),
    "deleteInvoiceDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to delete invoice",
    ),
    "deleteInvoiceWarning": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this invoice? This action cannot be undone.",
    ),
    "deleteItemConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this item?",
    ),
    "deleteProduct": MessageLookupByLibrary.simpleMessage("Delete Product"),
    "deleteProductConfirmation": m18,
    "deleteProductDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to delete product",
    ),
    "deleteProducts": MessageLookupByLibrary.simpleMessage("Delete Products"),
    "deleteUser": MessageLookupByLibrary.simpleMessage("Delete User"),
    "deleteUserConfirmation": m19,
    "deleteUserDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to delete user",
    ),
    "deleteUserPermanently": MessageLookupByLibrary.simpleMessage(
      "Delete user permanently",
    ),
    "deleteUsers": MessageLookupByLibrary.simpleMessage("Delete Users"),
    "deletingInvoice": MessageLookupByLibrary.simpleMessage(
      "Deleting invoice...",
    ),
    "department": MessageLookupByLibrary.simpleMessage("Department"),
    "descending": MessageLookupByLibrary.simpleMessage("Descending"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Add more details about this expense",
    ),
    "descriptionValue": MessageLookupByLibrary.simpleMessage("Description"),
    "deviceInfo": MessageLookupByLibrary.simpleMessage("Device Information"),
    "deviceType": MessageLookupByLibrary.simpleMessage("Device Type"),
    "dimensions": MessageLookupByLibrary.simpleMessage("Dimensions"),
    "dinar": MessageLookupByLibrary.simpleMessage("Dinar"),
    "disconnect": MessageLookupByLibrary.simpleMessage("Disconnect"),
    "disconnected": MessageLookupByLibrary.simpleMessage("Disconnected"),
    "discount": MessageLookupByLibrary.simpleMessage("Discount"),
    "discountMustBeGreaterThanOrEqualZero":
        MessageLookupByLibrary.simpleMessage(
          "Discount must be greater than or equal to zero",
        ),
    "discountPercent": MessageLookupByLibrary.simpleMessage("Discount (%)"),
    "discountRequired": MessageLookupByLibrary.simpleMessage(
      "Discount is required",
    ),
    "dismiss": MessageLookupByLibrary.simpleMessage("Dismiss"),
    "dontHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "downloadPDF": MessageLookupByLibrary.simpleMessage("Download PDF"),
    "draft": MessageLookupByLibrary.simpleMessage("Draft"),
    "duplicate": MessageLookupByLibrary.simpleMessage("Duplicate"),
    "duplicateInvoice": MessageLookupByLibrary.simpleMessage(
      "Duplicate Invoice",
    ),
    "duplicateInvoiceMessage": m20,
    "easyInvoiceCustomerManagement": MessageLookupByLibrary.simpleMessage(
      "Easy invoice and customer management",
    ),
    "ecommerceInstitution": MessageLookupByLibrary.simpleMessage(
      "E-commerce Institution",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editCategory": MessageLookupByLibrary.simpleMessage("Edit Category"),
    "editClient": MessageLookupByLibrary.simpleMessage("Edit Client"),
    "editClientData": m21,
    "editClientDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to edit client data",
    ),
    "editCustomer": MessageLookupByLibrary.simpleMessage("Edit Customer"),
    "editCustomers": MessageLookupByLibrary.simpleMessage("Edit Customers"),
    "editExpense": MessageLookupByLibrary.simpleMessage("Edit Expense"),
    "editExpenseCategory": MessageLookupByLibrary.simpleMessage(
      "Edit Expense Category",
    ),
    "editExpenseDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to edit expense",
    ),
    "editExpenses": MessageLookupByLibrary.simpleMessage("Edit Expenses"),
    "editInvoice": MessageLookupByLibrary.simpleMessage("Edit Invoice"),
    "editInvoiceDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to edit invoice",
    ),
    "editItem": MessageLookupByLibrary.simpleMessage("Edit Item"),
    "editProduct": MessageLookupByLibrary.simpleMessage("Edit Product"),
    "editProductDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to edit product data",
    ),
    "editProducts": MessageLookupByLibrary.simpleMessage("Edit Products"),
    "editProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "editRole": MessageLookupByLibrary.simpleMessage("Edit Role"),
    "editUser": MessageLookupByLibrary.simpleMessage("Edit User"),
    "editUserDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to edit user data",
    ),
    "editUserInformation": MessageLookupByLibrary.simpleMessage(
      "Edit user information",
    ),
    "editUsers": MessageLookupByLibrary.simpleMessage("Edit Users"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
    "emailDetails": MessageLookupByLibrary.simpleMessage("Email Details"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("Invalid email"),
    "emailIsRequired": MessageLookupByLibrary.simpleMessage(
      "Email is required",
    ),
    "emailOpened": MessageLookupByLibrary.simpleMessage("Email app opened"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "employee": MessageLookupByLibrary.simpleMessage("Employee"),
    "enableDarkMode": MessageLookupByLibrary.simpleMessage("Enable Dark Mode"),
    "enableDisableProduct": MessageLookupByLibrary.simpleMessage(
      "Enable/Disable Product",
    ),
    "enableOrDisableUserAccount": MessageLookupByLibrary.simpleMessage(
      "Enable or disable user account",
    ),
    "enableTaxIntegration": MessageLookupByLibrary.simpleMessage(
      "Enable Tax Integration",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "englishDescription": MessageLookupByLibrary.simpleMessage("English"),
    "enterAdditionalNotes": MessageLookupByLibrary.simpleMessage(
      "Enter additional notes",
    ),
    "enterAddress": MessageLookupByLibrary.simpleMessage("Enter address"),
    "enterBarcode": MessageLookupByLibrary.simpleMessage("Enter barcode"),
    "enterCategoryDescription": MessageLookupByLibrary.simpleMessage(
      "Enter a brief description for the category",
    ),
    "enterCategoryName": MessageLookupByLibrary.simpleMessage(
      "Enter category name",
    ),
    "enterCity": MessageLookupByLibrary.simpleMessage("Enter city"),
    "enterClientAddress": MessageLookupByLibrary.simpleMessage(
      "Enter client address",
    ),
    "enterClientCompany": MessageLookupByLibrary.simpleMessage(
      "Enter company name",
    ),
    "enterClientEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
    "enterClientName": MessageLookupByLibrary.simpleMessage(
      "Enter client name",
    ),
    "enterClientPhone": MessageLookupByLibrary.simpleMessage(
      "Enter phone number",
    ),
    "enterCode": MessageLookupByLibrary.simpleMessage("Enter Code"),
    "enterCommercialRegister": MessageLookupByLibrary.simpleMessage(
      "Enter commercial register",
    ),
    "enterCompanyAddress": MessageLookupByLibrary.simpleMessage(
      "Enter company address",
    ),
    "enterCompanyEmail": MessageLookupByLibrary.simpleMessage(
      "Enter company email",
    ),
    "enterCompanyName": MessageLookupByLibrary.simpleMessage(
      "Enter company name",
    ),
    "enterCompanyPhone": MessageLookupByLibrary.simpleMessage(
      "Enter company phone",
    ),
    "enterContactPersonEmail": MessageLookupByLibrary.simpleMessage(
      "Enter contact person email",
    ),
    "enterContactPersonName": MessageLookupByLibrary.simpleMessage(
      "Enter contact person name",
    ),
    "enterContactPersonPhone": MessageLookupByLibrary.simpleMessage(
      "Enter contact person phone",
    ),
    "enterCostPrice": MessageLookupByLibrary.simpleMessage("Enter cost price"),
    "enterCurrentPassword": MessageLookupByLibrary.simpleMessage(
      "Enter current password",
    ),
    "enterCustomerAddress": MessageLookupByLibrary.simpleMessage(
      "Enter address",
    ),
    "enterCustomerCity": MessageLookupByLibrary.simpleMessage("Enter city"),
    "enterCustomerCommercialRegister": MessageLookupByLibrary.simpleMessage(
      "Enter commercial register",
    ),
    "enterCustomerCompany": MessageLookupByLibrary.simpleMessage(
      "Enter company name",
    ),
    "enterCustomerDetailedAddress": MessageLookupByLibrary.simpleMessage(
      "Enter detailed address",
    ),
    "enterCustomerEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
    "enterCustomerName": MessageLookupByLibrary.simpleMessage(
      "Enter customer name",
    ),
    "enterCustomerNotes": MessageLookupByLibrary.simpleMessage("Enter notes"),
    "enterCustomerPhone": MessageLookupByLibrary.simpleMessage(
      "Enter phone number",
    ),
    "enterCustomerPostalCode": MessageLookupByLibrary.simpleMessage(
      "Enter postal code",
    ),
    "enterCustomerRegion": MessageLookupByLibrary.simpleMessage("Enter region"),
    "enterCustomerResponsiblePerson": MessageLookupByLibrary.simpleMessage(
      "Enter responsible person",
    ),
    "enterCustomerTaxNumber": MessageLookupByLibrary.simpleMessage(
      "Enter tax number",
    ),
    "enterDepartment": MessageLookupByLibrary.simpleMessage("Enter department"),
    "enterDescription": MessageLookupByLibrary.simpleMessage(
      "Enter description",
    ),
    "enterDetailedAddress": MessageLookupByLibrary.simpleMessage(
      "Enter detailed address",
    ),
    "enterDiscount": MessageLookupByLibrary.simpleMessage("Enter discount"),
    "enterEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
    "enterEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Enter email address",
    ),
    "enterExpenseTitleAndDescription": MessageLookupByLibrary.simpleMessage(
      "Enter expense title and description",
    ),
    "enterFullName": MessageLookupByLibrary.simpleMessage("Enter full name"),
    "enterInvoiceDescription": MessageLookupByLibrary.simpleMessage(
      "Enter invoice description (optional)",
    ),
    "enterInvoiceNumber": MessageLookupByLibrary.simpleMessage(
      "Enter invoice number",
    ),
    "enterItemName": MessageLookupByLibrary.simpleMessage("Enter item name"),
    "enterMessage": MessageLookupByLibrary.simpleMessage("Enter message"),
    "enterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Enter new password",
    ),
    "enterNotes": MessageLookupByLibrary.simpleMessage("Enter notes"),
    "enterPassword": MessageLookupByLibrary.simpleMessage("Enter password"),
    "enterPasswordToConfirm": MessageLookupByLibrary.simpleMessage(
      "Enter password to confirm",
    ),
    "enterPhone": MessageLookupByLibrary.simpleMessage("Enter phone"),
    "enterPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Enter phone number",
    ),
    "enterPosition": MessageLookupByLibrary.simpleMessage("Enter position"),
    "enterPostalCode": MessageLookupByLibrary.simpleMessage(
      "Enter postal code",
    ),
    "enterPrice": MessageLookupByLibrary.simpleMessage("Enter price"),
    "enterProductDescription": MessageLookupByLibrary.simpleMessage(
      "Enter product description",
    ),
    "enterProductName": MessageLookupByLibrary.simpleMessage(
      "Enter product name",
    ),
    "enterProductSku": MessageLookupByLibrary.simpleMessage(
      "Enter product SKU",
    ),
    "enterQuantity": MessageLookupByLibrary.simpleMessage("Enter quantity"),
    "enterReasonForReturn": MessageLookupByLibrary.simpleMessage(
      "Enter reason for return",
    ),
    "enterRegion": MessageLookupByLibrary.simpleMessage("Enter region"),
    "enterResponsiblePerson": MessageLookupByLibrary.simpleMessage(
      "Enter responsible person",
    ),
    "enterSellingPrice": MessageLookupByLibrary.simpleMessage(
      "Enter selling price",
    ),
    "enterSku": MessageLookupByLibrary.simpleMessage("Enter SKU"),
    "enterSubject": MessageLookupByLibrary.simpleMessage("Enter subject"),
    "enterSubtotal": MessageLookupByLibrary.simpleMessage("Enter subtotal"),
    "enterTaxAmount": MessageLookupByLibrary.simpleMessage("Enter tax amount"),
    "enterTaxNumber": MessageLookupByLibrary.simpleMessage("Enter tax number"),
    "enterTaxPercent": MessageLookupByLibrary.simpleMessage(
      "Enter tax percent",
    ),
    "enterTaxRatePercentage": MessageLookupByLibrary.simpleMessage(
      "Enter tax rate percentage",
    ),
    "enterTotal": MessageLookupByLibrary.simpleMessage("Enter total"),
    "enterUsername": MessageLookupByLibrary.simpleMessage("Enter username"),
    "enterValidQuantity": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid quantity",
    ),
    "enterVatNumber": MessageLookupByLibrary.simpleMessage("Enter VAT number"),
    "enterVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Enter verification code",
    ),
    "enterWebsite": MessageLookupByLibrary.simpleMessage("Enter website"),
    "errorAddingCategory": MessageLookupByLibrary.simpleMessage(
      "Error adding category",
    ),
    "errorAddingProduct": MessageLookupByLibrary.simpleMessage(
      "Error adding product",
    ),
    "errorClearingCache": MessageLookupByLibrary.simpleMessage(
      "Error clearing cache",
    ),
    "errorClearingData": MessageLookupByLibrary.simpleMessage(
      "Error clearing data",
    ),
    "errorCreatingClient": m22,
    "errorCreatingCustomer": MessageLookupByLibrary.simpleMessage(
      "Error creating customer",
    ),
    "errorCreatingFile": m23,
    "errorCreatingInvoice": m24,
    "errorCreatingProduct": MessageLookupByLibrary.simpleMessage(
      "Error creating product",
    ),
    "errorCreatingUser": MessageLookupByLibrary.simpleMessage(
      "Error creating user: \$e",
    ),
    "errorDeletingCategory": MessageLookupByLibrary.simpleMessage(
      "Error deleting category",
    ),
    "errorDeletingClient": m25,
    "errorDeletingClients": m26,
    "errorDeletingCustomer": MessageLookupByLibrary.simpleMessage(
      "Error deleting customer",
    ),
    "errorDeletingInvoice": m27,
    "errorDeletingProduct": MessageLookupByLibrary.simpleMessage(
      "Error deleting product",
    ),
    "errorDeletingUser": MessageLookupByLibrary.simpleMessage(
      "Error deleting user",
    ),
    "errorLoadingCategories": MessageLookupByLibrary.simpleMessage(
      "Error Loading Categories",
    ),
    "errorLoadingClients": m28,
    "errorLoadingCustomer": MessageLookupByLibrary.simpleMessage(
      "Error loading customer",
    ),
    "errorLoadingCustomers": MessageLookupByLibrary.simpleMessage(
      "Error loading customers",
    ),
    "errorLoadingDashboard": MessageLookupByLibrary.simpleMessage(
      "Error loading dashboard",
    ),
    "errorLoadingInvoice": MessageLookupByLibrary.simpleMessage(
      "Error loading invoice",
    ),
    "errorLoadingInvoices": MessageLookupByLibrary.simpleMessage(
      "Error Loading Invoices",
    ),
    "errorLoadingProduct": MessageLookupByLibrary.simpleMessage(
      "Error loading product data",
    ),
    "errorLoadingProducts": MessageLookupByLibrary.simpleMessage(
      "Error loading products",
    ),
    "errorLoadingStatistics": m29,
    "errorLoadingUsers": MessageLookupByLibrary.simpleMessage(
      "Error loading users",
    ),
    "errorMessage": m30,
    "errorMessageLabel": MessageLookupByLibrary.simpleMessage("Error Message"),
    "errorOccurred": MessageLookupByLibrary.simpleMessage("An error occurred"),
    "errorOccurredWithMessage": m31,
    "errorParsingUserData": MessageLookupByLibrary.simpleMessage(
      "Error parsing user data",
    ),
    "errorPrintingInvoice": m32,
    "errorSendingInvoice": m33,
    "errorSharingInvoice": m34,
    "errorText": MessageLookupByLibrary.simpleMessage("Error Text"),
    "errorUpdatingCategory": MessageLookupByLibrary.simpleMessage(
      "Error updating category",
    ),
    "errorUpdatingClient": m35,
    "errorUpdatingClientStatus": m36,
    "errorUpdatingCustomer": MessageLookupByLibrary.simpleMessage(
      "Error updating customer",
    ),
    "errorUpdatingInvoice": MessageLookupByLibrary.simpleMessage(
      "Error updating invoice",
    ),
    "errorUpdatingProduct": MessageLookupByLibrary.simpleMessage(
      "Error updating product",
    ),
    "errorUpdatingStatus": m37,
    "exampleEmail": MessageLookupByLibrary.simpleMessage("example@email.com"),
    "examplePhone": MessageLookupByLibrary.simpleMessage("0500000000"),
    "existingCustomer": MessageLookupByLibrary.simpleMessage(
      "Existing Customer",
    ),
    "exitAppConfirmation": MessageLookupByLibrary.simpleMessage("Exit App"),
    "exitAppConfirmationMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to exit the app?",
    ),
    "expenseCategories": MessageLookupByLibrary.simpleMessage(
      "Expense Categories",
    ),
    "expenseCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Expense created successfully!",
    ),
    "expenseDate": MessageLookupByLibrary.simpleMessage("Expense Date"),
    "expenseDetails": MessageLookupByLibrary.simpleMessage("Expense Details"),
    "expenseManagement": MessageLookupByLibrary.simpleMessage(
      "Expense Management",
    ),
    "expenseTitle": MessageLookupByLibrary.simpleMessage("Expense Title"),
    "expenseTitleHint": MessageLookupByLibrary.simpleMessage(
      "e.g., Office supplies, Travel expenses",
    ),
    "expenseUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Expense updated successfully",
    ),
    "expenses": MessageLookupByLibrary.simpleMessage("Expenses"),
    "expensesAddFirstCategory": MessageLookupByLibrary.simpleMessage(
      "Add First Category",
    ),
    "expensesAddFirstExpense": MessageLookupByLibrary.simpleMessage(
      "Add First Expense",
    ),
    "expensesAllCategories": MessageLookupByLibrary.simpleMessage(
      "All Categories",
    ),
    "expensesAllCategoriesDeletedSuccessfully":
        MessageLookupByLibrary.simpleMessage(
          "All categories deleted successfully",
        ),
    "expensesAllStatus": MessageLookupByLibrary.simpleMessage("All Status"),
    "expensesAreYouSureDeleteCategory": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this expense category?",
    ),
    "expensesAreYouSureDeleteExpense": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this expense?",
    ),
    "expensesCacheError": MessageLookupByLibrary.simpleMessage(
      "Cache error - Expenses",
    ),
    "expensesCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "expensesCreateExpenseCategories": MessageLookupByLibrary.simpleMessage(
      "Create expense categories to organize your business expenses",
    ),
    "expensesCurrentCategories": MessageLookupByLibrary.simpleMessage(
      "Current Categories",
    ),
    "expensesDeleteAllCategories": MessageLookupByLibrary.simpleMessage(
      "Delete All Categories",
    ),
    "expensesDeleteAllCategoriesCount": MessageLookupByLibrary.simpleMessage(
      "Delete All Categories",
    ),
    "expensesDeleteCategory": MessageLookupByLibrary.simpleMessage(
      "Delete Category",
    ),
    "expensesDeleteExpense": MessageLookupByLibrary.simpleMessage(
      "Delete Expense",
    ),
    "expensesDeleteExpenseConfirmation": m38,
    "expensesDeleting": MessageLookupByLibrary.simpleMessage("Deleting..."),
    "expensesDesc": MessageLookupByLibrary.simpleMessage(
      "Expense categories & Expense management",
    ),
    "expensesEditCategory": MessageLookupByLibrary.simpleMessage(
      "Edit Category",
    ),
    "expensesEditExpense": MessageLookupByLibrary.simpleMessage("Edit Expense"),
    "expensesErrorOccurred": m39,
    "expensesErrorPrefix": MessageLookupByLibrary.simpleMessage("Error"),
    "expensesExpenseDetailsHelpDescription": MessageLookupByLibrary.simpleMessage(
      "This screen shows detailed information about the expense including financial details, payment information, and metadata.",
    ),
    "expensesExpenseDetailsHelpTitle": MessageLookupByLibrary.simpleMessage(
      "Help",
    ),
    "expensesList": MessageLookupByLibrary.simpleMessage("Expenses List"),
    "expensesLoadError": MessageLookupByLibrary.simpleMessage(
      "Error loading expenses",
    ),
    "expensesLoading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "expensesLockedAction": MessageLookupByLibrary.simpleMessage(
      "Locked Action",
    ),
    "expensesManagement": MessageLookupByLibrary.simpleMessage(
      "Expenses & Categories",
    ),
    "expensesNetworkError": MessageLookupByLibrary.simpleMessage(
      "Network error - Expenses",
    ),
    "expensesNoCategoriesFoundMessage": MessageLookupByLibrary.simpleMessage(
      "No categories found. You can now start creating new ones!",
    ),
    "expensesNoCategoriesToDelete": MessageLookupByLibrary.simpleMessage(
      "No categories to delete",
    ),
    "expensesNoCategoriesYet": MessageLookupByLibrary.simpleMessage(
      "No categories yet",
    ),
    "expensesNoDescription": MessageLookupByLibrary.simpleMessage(
      "No description",
    ),
    "expensesNoExpensesYet": MessageLookupByLibrary.simpleMessage(
      "No expenses yet",
    ),
    "expensesNoPermissionToAct": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to perform this action",
    ),
    "expensesNoPermissionToView": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to view this content",
    ),
    "expensesOrder": MessageLookupByLibrary.simpleMessage("Order"),
    "expensesPaymentMethodBankTransfer": MessageLookupByLibrary.simpleMessage(
      "Bank Transfer",
    ),
    "expensesPaymentMethodCard": MessageLookupByLibrary.simpleMessage(
      "Credit/Debit Card",
    ),
    "expensesPaymentMethodCash": MessageLookupByLibrary.simpleMessage("Cash"),
    "expensesPaymentMethodCheck": MessageLookupByLibrary.simpleMessage("Check"),
    "expensesReport": MessageLookupByLibrary.simpleMessage("Expenses Report"),
    "expensesSearchCategories": MessageLookupByLibrary.simpleMessage(
      "Search categories...",
    ),
    "expensesSomethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "expensesSortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
    "expensesSortByAmount": MessageLookupByLibrary.simpleMessage("Amount"),
    "expensesSortByCreatedAt": MessageLookupByLibrary.simpleMessage(
      "Created At",
    ),
    "expensesSortByDate": MessageLookupByLibrary.simpleMessage("Date"),
    "expensesSortByTitle": MessageLookupByLibrary.simpleMessage("Title"),
    "expensesSortByUpdatedAt": MessageLookupByLibrary.simpleMessage(
      "Updated At",
    ),
    "expensesSortOrderAsc": MessageLookupByLibrary.simpleMessage("ASC"),
    "expensesSortOrderDesc": MessageLookupByLibrary.simpleMessage("DESC"),
    "expensesStartTrackingExpenses": MessageLookupByLibrary.simpleMessage(
      "Start tracking your business expenses by adding your first expense",
    ),
    "expensesStatus": m40,
    "expensesStatusLabel": MessageLookupByLibrary.simpleMessage("Status"),
    "expensesThisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "This action cannot be undone.",
    ),
    "expensesTimeoutError": MessageLookupByLibrary.simpleMessage(
      "Timeout error - Expenses",
    ),
    "expensesTitle": MessageLookupByLibrary.simpleMessage("Expenses"),
    "expensesTryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "expensesUnauthorizedError": MessageLookupByLibrary.simpleMessage(
      "Unauthorized error - Expenses",
    ),
    "expensesUnknownCategory": MessageLookupByLibrary.simpleMessage(
      "Unknown Category",
    ),
    "expensesUnknownError": MessageLookupByLibrary.simpleMessage(
      "Unknown error - Expenses",
    ),
    "expensesValidationError": MessageLookupByLibrary.simpleMessage(
      "Validation error - Expenses",
    ),
    "expensesViewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
    "exportReports": MessageLookupByLibrary.simpleMessage("Export Reports"),
    "exportReportsDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to export reports",
    ),
    "failedToAddRole": m41,
    "failedToDeleteRole": m42,
    "failedToGetUserData": MessageLookupByLibrary.simpleMessage(
      "Failed to get user data",
    ),
    "failedToLoadCompanyLogoUsingDefault": MessageLookupByLibrary.simpleMessage(
      "Failed to load company logo, using default logo",
    ),
    "failedToLoadRoles": m43,
    "failedToLoadUserPermissions": m44,
    "failedToUpdateRole": m45,
    "failedToUpdateUser": MessageLookupByLibrary.simpleMessage(
      "Failed to update user",
    ),
    "failedToUpdateUserPermissions": m46,
    "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
    "faqAnswer1": MessageLookupByLibrary.simpleMessage(
      "To create an invoice, go to the Invoices section and tap the \'+\' button. Fill in the required information and save.",
    ),
    "faqAnswer2": MessageLookupByLibrary.simpleMessage(
      "Go to Settings > Account Settings > Change Password. Enter your current password and new password.",
    ),
    "faqAnswer3": MessageLookupByLibrary.simpleMessage(
      "Go to the Customers section and tap the \'+\' button. Fill in the customer information and save.",
    ),
    "faqAnswer4": MessageLookupByLibrary.simpleMessage(
      "Open the invoice details and tap the print button. Select your printer and print.",
    ),
    "faqAnswer5": MessageLookupByLibrary.simpleMessage(
      "You can contact support through the Contact Us screen in Settings or email us at support@invotik.com.",
    ),
    "faqQuestion1": MessageLookupByLibrary.simpleMessage(
      "How do I create an invoice?",
    ),
    "faqQuestion2": MessageLookupByLibrary.simpleMessage(
      "How do I change my password?",
    ),
    "faqQuestion3": MessageLookupByLibrary.simpleMessage(
      "How do I add a customer?",
    ),
    "faqQuestion4": MessageLookupByLibrary.simpleMessage(
      "How do I print an invoice?",
    ),
    "faqQuestion5": MessageLookupByLibrary.simpleMessage(
      "How do I contact support?",
    ),
    "fieldIsRequired": m47,
    "fileName": m48,
    "fileSavedSuccessfully": m49,
    "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
      "Please fill in all required fields",
    ),
    "fillFormToAddClient": MessageLookupByLibrary.simpleMessage(
      "Fill the form below to add new client to the system",
    ),
    "fillRequiredFieldsBasicInfo": MessageLookupByLibrary.simpleMessage(
      "Please fill all required fields in Invoice Information",
    ),
    "fillTheFormBelowToAddANewUserTo": MessageLookupByLibrary.simpleMessage(
      "Fill the form below to add a new user to the system",
    ),
    "filterCustomers": MessageLookupByLibrary.simpleMessage("Filter Customers"),
    "filters": MessageLookupByLibrary.simpleMessage("Filters"),
    "financialDetails": MessageLookupByLibrary.simpleMessage(
      "Financial Details",
    ),
    "financialInfo": MessageLookupByLibrary.simpleMessage(
      "Financial Information",
    ),
    "financialInformation": MessageLookupByLibrary.simpleMessage(
      "Financial Information",
    ),
    "financialServicesInstitution": MessageLookupByLibrary.simpleMessage(
      "Financial Services Institution",
    ),
    "firstCategory": MessageLookupByLibrary.simpleMessage("First Category"),
    "forgetPassword": MessageLookupByLibrary.simpleMessage("Forget password?"),
    "forgetPasswordDesc": MessageLookupByLibrary.simpleMessage(
      "Enter your email to send verification code",
    ),
    "forgetPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Forgot Password",
    ),
    "formHelpDescription": MessageLookupByLibrary.simpleMessage(
      "This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information",
    ),
    "formHelpTitle": MessageLookupByLibrary.simpleMessage("Edit Customer Form"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "generalNotifications": MessageLookupByLibrary.simpleMessage(
      "General Notifications",
    ),
    "generalNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Receive general app notifications",
    ),
    "generatingPDF": MessageLookupByLibrary.simpleMessage("Generating PDF..."),
    "goToSettings": MessageLookupByLibrary.simpleMessage("Go to Settings"),
    "googleSignInError": MessageLookupByLibrary.simpleMessage(
      "Google sign in error",
    ),
    "gotIt": MessageLookupByLibrary.simpleMessage("Got it!"),
    "growth": MessageLookupByLibrary.simpleMessage("Growth"),
    "hasTax": MessageLookupByLibrary.simpleMessage("Has Tax"),
    "haveAccountLogin": MessageLookupByLibrary.simpleMessage(
      "Have an account? Login",
    ),
    "healthcareInstitution": MessageLookupByLibrary.simpleMessage(
      "Healthcare Institution",
    ),
    "help": MessageLookupByLibrary.simpleMessage("Help"),
    "helpSupport": MessageLookupByLibrary.simpleMessage("Help & Support"),
    "high": MessageLookupByLibrary.simpleMessage("High"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "homeAccessDenied": MessageLookupByLibrary.simpleMessage("Access Denied"),
    "homeAddNewCustomer": MessageLookupByLibrary.simpleMessage(
      "Add New Customer",
    ),
    "homeAddNotificationsFeature": MessageLookupByLibrary.simpleMessage(
      "Add notifications feature here",
    ),
    "homeAreYouSureLogout": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to logout?",
    ),
    "homeCreateNewInvoice": MessageLookupByLibrary.simpleMessage(
      "Create New Invoice",
    ),
    "homeDeviceInfo": MessageLookupByLibrary.simpleMessage(
      "Device Information",
    ),
    "homeDeviceType": m50,
    "homeHeight": m51,
    "homeLoadingDashboard": MessageLookupByLibrary.simpleMessage(
      "Loading dashboard data",
    ),
    "homeLockedAction": MessageLookupByLibrary.simpleMessage("Locked Action"),
    "homeNoPermissionToAccess": m52,
    "homeNoPermissionToAct": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to perform this action",
    ),
    "homeNoPermissionToView": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to view this content",
    ),
    "homePhone": MessageLookupByLibrary.simpleMessage("Phone"),
    "homePixelRatio": m53,
    "homeTablet": MessageLookupByLibrary.simpleMessage("Tablet"),
    "homeVersion": m54,
    "homeViewAllInvoices": MessageLookupByLibrary.simpleMessage(
      "View All Invoices",
    ),
    "homeWidth": m55,
    "icon": MessageLookupByLibrary.simpleMessage("Icon"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "inactiveStatus": MessageLookupByLibrary.simpleMessage("Inactive"),
    "includePDF": MessageLookupByLibrary.simpleMessage("Include PDF"),
    "increase": MessageLookupByLibrary.simpleMessage("Increase"),
    "inputFields": MessageLookupByLibrary.simpleMessage("Input Fields"),
    "interactiveCard": MessageLookupByLibrary.simpleMessage("Interactive Card"),
    "interactiveCardDescription": MessageLookupByLibrary.simpleMessage(
      "This is an interactive card that can be pressed",
    ),
    "invalidCode": MessageLookupByLibrary.simpleMessage("Invalid code"),
    "invalidNumber": MessageLookupByLibrary.simpleMessage("Invalid number"),
    "invalidPrice": MessageLookupByLibrary.simpleMessage("Invalid price"),
    "invalidQuantity": MessageLookupByLibrary.simpleMessage("Invalid quantity"),
    "inventory": MessageLookupByLibrary.simpleMessage("Inventory"),
    "inventorySettings": MessageLookupByLibrary.simpleMessage(
      "Inventory Settings",
    ),
    "invoiceAlreadyHasCreditInvoice": MessageLookupByLibrary.simpleMessage(
      "This invoice already has a credit invoice associated with it",
    ),
    "invoiceAlreadySent": MessageLookupByLibrary.simpleMessage(
      "Invoice Already Sent",
    ),
    "invoiceAmount": MessageLookupByLibrary.simpleMessage("Invoice Amount"),
    "invoiceBasicInfo": MessageLookupByLibrary.simpleMessage(
      "Invoice Information",
    ),
    "invoiceCancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "invoiceCopiedForPrinting": MessageLookupByLibrary.simpleMessage(
      "Invoice details copied for printing",
    ),
    "invoiceCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Invoice details copied to clipboard",
    ),
    "invoiceCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Invoice created successfully",
    ),
    "invoiceCreationHelp": MessageLookupByLibrary.simpleMessage(
      "This form helps you create a new invoice step by step:\n\n1. Invoice Information: Choose action, payment method, and status\n2. Select Customer: Choose existing customer or add new one\n3. Invoice Items: Add items, quantities, and prices\n4. Review Calculations: Review final details before saving",
    ),
    "invoiceDate": MessageLookupByLibrary.simpleMessage("Invoice Date"),
    "invoiceDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Invoice deleted successfully",
    ),
    "invoiceDescription": MessageLookupByLibrary.simpleMessage(
      "Invoice Description",
    ),
    "invoiceDetails": MessageLookupByLibrary.simpleMessage("Invoice Details"),
    "invoiceDraft": MessageLookupByLibrary.simpleMessage("Draft"),
    "invoiceHelp": MessageLookupByLibrary.simpleMessage("Invoice Help"),
    "invoiceInfo": MessageLookupByLibrary.simpleMessage("Invoice Information"),
    "invoiceItems": MessageLookupByLibrary.simpleMessage("Invoice Items"),
    "invoiceLanguage": MessageLookupByLibrary.simpleMessage("Invoice Language"),
    "invoiceManagement": MessageLookupByLibrary.simpleMessage(
      "Invoice Management",
    ),
    "invoiceNotifications": MessageLookupByLibrary.simpleMessage(
      "Invoice Notifications",
    ),
    "invoiceNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Receive notifications about invoices",
    ),
    "invoiceNumber": MessageLookupByLibrary.simpleMessage("Invoice Number"),
    "invoiceNumberLabel": m56,
    "invoiceOverdue": MessageLookupByLibrary.simpleMessage("Overdue"),
    "invoicePaid": MessageLookupByLibrary.simpleMessage("Paid"),
    "invoicePending": MessageLookupByLibrary.simpleMessage("Pending"),
    "invoiceReturned": MessageLookupByLibrary.simpleMessage("Returned"),
    "invoiceSent": MessageLookupByLibrary.simpleMessage("Sent"),
    "invoiceSentSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Invoice sent successfully",
    ),
    "invoiceStatistics": MessageLookupByLibrary.simpleMessage(
      "Invoice Statistics",
    ),
    "invoiceStatus": MessageLookupByLibrary.simpleMessage("Invoice Status"),
    "invoiceStatusUpdated": m57,
    "invoiceType": MessageLookupByLibrary.simpleMessage("Invoice Type"),
    "invoiceTypeCreditNote": MessageLookupByLibrary.simpleMessage(
      "Credit Note",
    ),
    "invoiceTypeDebitNote": MessageLookupByLibrary.simpleMessage("Debit Note"),
    "invoiceTypeProforma": MessageLookupByLibrary.simpleMessage(
      "Proforma Invoice",
    ),
    "invoiceTypeStandard": MessageLookupByLibrary.simpleMessage(
      "Standard Invoice",
    ),
    "invoiceUnknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "invoiceUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Invoice updated successfully",
    ),
    "invoices": MessageLookupByLibrary.simpleMessage("Invoices"),
    "invoicesAll": MessageLookupByLibrary.simpleMessage("All"),
    "invoicesApply": MessageLookupByLibrary.simpleMessage("Apply"),
    "invoicesAscending": MessageLookupByLibrary.simpleMessage("Ascending"),
    "invoicesCacheError": MessageLookupByLibrary.simpleMessage(
      "Cache error - Invoices",
    ),
    "invoicesCannotDeleteNonDraft": MessageLookupByLibrary.simpleMessage(
      "Cannot delete this invoice because it is not a draft",
    ),
    "invoicesCustomerAddress": MessageLookupByLibrary.simpleMessage(
      "Customer Address",
    ),
    "invoicesCustomerEmail": MessageLookupByLibrary.simpleMessage(
      "Customer Email",
    ),
    "invoicesCustomerName": MessageLookupByLibrary.simpleMessage(
      "Customer Name",
    ),
    "invoicesCustomerNotes": MessageLookupByLibrary.simpleMessage("Notes"),
    "invoicesCustomerPhone": MessageLookupByLibrary.simpleMessage(
      "Customer Phone",
    ),
    "invoicesDescending": MessageLookupByLibrary.simpleMessage("Descending"),
    "invoicesDiscount": MessageLookupByLibrary.simpleMessage("Discount"),
    "invoicesDownloadPDF": MessageLookupByLibrary.simpleMessage("Download PDF"),
    "invoicesDuplicateInvoice": MessageLookupByLibrary.simpleMessage(
      "Duplicate Invoice",
    ),
    "invoicesEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "invoicesFilterInvoices": MessageLookupByLibrary.simpleMessage(
      "Filter Invoices",
    ),
    "invoicesInvoiceNumber": MessageLookupByLibrary.simpleMessage(
      "Invoice Number",
    ),
    "invoicesInvoiceNumberPlaceholder": m58,
    "invoicesItemDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Description:",
    ),
    "invoicesItemDetails": MessageLookupByLibrary.simpleMessage(
      "Item Details:",
    ),
    "invoicesItemDetailsCopied": MessageLookupByLibrary.simpleMessage(
      "Item details copied to clipboard",
    ),
    "invoicesItemDiscountLabel": MessageLookupByLibrary.simpleMessage(
      "Discount:",
    ),
    "invoicesItemNameLabel": MessageLookupByLibrary.simpleMessage("Name:"),
    "invoicesItemPriceLabel": MessageLookupByLibrary.simpleMessage("Price:"),
    "invoicesItemQuantityLabel": MessageLookupByLibrary.simpleMessage(
      "Quantity:",
    ),
    "invoicesItemTaxAmountLabel": MessageLookupByLibrary.simpleMessage(
      "Tax Amount:",
    ),
    "invoicesItemTaxPercentageLabel": MessageLookupByLibrary.simpleMessage(
      "Tax Percentage:",
    ),
    "invoicesItemTotalLabel": MessageLookupByLibrary.simpleMessage("Total:"),
    "invoicesList": MessageLookupByLibrary.simpleMessage("Invoices List"),
    "invoicesLoadError": MessageLookupByLibrary.simpleMessage(
      "Error loading invoices",
    ),
    "invoicesLoadingInvoices": MessageLookupByLibrary.simpleMessage(
      "Loading invoices...",
    ),
    "invoicesLoadingMore": MessageLookupByLibrary.simpleMessage(
      "Loading more...",
    ),
    "invoicesLockedAction": MessageLookupByLibrary.simpleMessage(
      "Locked Action",
    ),
    "invoicesNetworkError": MessageLookupByLibrary.simpleMessage(
      "Network error - Invoices",
    ),
    "invoicesNoPermissionToAct": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to perform this action",
    ),
    "invoicesNoPermissionToView": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to view this content",
    ),
    "invoicesNoProductIdAvailable": MessageLookupByLibrary.simpleMessage(
      "No product ID available",
    ),
    "invoicesPending": MessageLookupByLibrary.simpleMessage("Pending"),
    "invoicesPleaseFindAttachedInvoice": MessageLookupByLibrary.simpleMessage(
      "Please find attached your invoice.",
    ),
    "invoicesProductInfo": MessageLookupByLibrary.simpleMessage(
      "Product Information:",
    ),
    "invoicesProductInformation": MessageLookupByLibrary.simpleMessage(
      "Product Information",
    ),
    "invoicesProductNameLabel": MessageLookupByLibrary.simpleMessage(
      "Product Name:",
    ),
    "invoicesQRCode": MessageLookupByLibrary.simpleMessage("QR Code"),
    "invoicesScanQRCodeMessage": MessageLookupByLibrary.simpleMessage(
      "You can scan this code to access invoice details",
    ),
    "invoicesSent": MessageLookupByLibrary.simpleMessage("Sent"),
    "invoicesSortOrder": MessageLookupByLibrary.simpleMessage("Sort Order"),
    "invoicesStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "invoicesTaxPercentage": MessageLookupByLibrary.simpleMessage(
      "Tax Percentage",
    ),
    "invoicesTimeoutError": MessageLookupByLibrary.simpleMessage(
      "Timeout error - Invoices",
    ),
    "invoicesUnauthorizedError": MessageLookupByLibrary.simpleMessage(
      "Unauthorized error - Invoices",
    ),
    "invoicesUnknownError": MessageLookupByLibrary.simpleMessage(
      "Unknown error - Invoices",
    ),
    "invoicesValidationError": MessageLookupByLibrary.simpleMessage(
      "Validation error - Invoices",
    ),
    "isActive": MessageLookupByLibrary.simpleMessage("Is Active"),
    "issueDate": MessageLookupByLibrary.simpleMessage("Issue Date"),
    "issueDateValue": MessageLookupByLibrary.simpleMessage("Issue Date"),
    "itemDetails": MessageLookupByLibrary.simpleMessage("Item Details"),
    "itemDiscount": MessageLookupByLibrary.simpleMessage("Discount"),
    "itemHeader": MessageLookupByLibrary.simpleMessage(
      "Name\t\tQuantity\tPrice\tTotal",
    ),
    "itemName": MessageLookupByLibrary.simpleMessage("Item Name"),
    "itemNameRequired": MessageLookupByLibrary.simpleMessage(
      "Item name is required",
    ),
    "itemPrice": MessageLookupByLibrary.simpleMessage("Price"),
    "itemQuantity": MessageLookupByLibrary.simpleMessage("Quantity"),
    "itemRow": m59,
    "itemSeparator": MessageLookupByLibrary.simpleMessage("-"),
    "itemTax": MessageLookupByLibrary.simpleMessage("Tax"),
    "itemTaxAmount": MessageLookupByLibrary.simpleMessage("Tax Amount"),
    "itemTotal": MessageLookupByLibrary.simpleMessage("Total"),
    "items": MessageLookupByLibrary.simpleMessage("Items"),
    "itemsCount": MessageLookupByLibrary.simpleMessage("Items Count:"),
    "itemsInfo": MessageLookupByLibrary.simpleMessage("Items Information"),
    "itemsRequired": MessageLookupByLibrary.simpleMessage(
      "Please add at least one item",
    ),
    "kilogram": MessageLookupByLibrary.simpleMessage("kg"),
    "kuwait": MessageLookupByLibrary.simpleMessage("Kuwait"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "languageChangeNote": MessageLookupByLibrary.simpleMessage(
      "Changing the language will restart the app to apply the changes.",
    ),
    "languageChangedToArabic": MessageLookupByLibrary.simpleMessage(
      "Language changed to Arabic",
    ),
    "languageChangedToEnglish": MessageLookupByLibrary.simpleMessage(
      "Language changed to English",
    ),
    "languageSettings": MessageLookupByLibrary.simpleMessage(
      "Language Settings",
    ),
    "largeResponsiveText": MessageLookupByLibrary.simpleMessage(
      "Large Responsive Text",
    ),
    "lastFiveInvoices": MessageLookupByLibrary.simpleMessage("Last 5 Invoices"),
    "lastInvoices": MessageLookupByLibrary.simpleMessage("Last Invoices"),
    "lastLogin": MessageLookupByLibrary.simpleMessage("Last Login"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("Last Updated"),
    "legal": MessageLookupByLibrary.simpleMessage("Legal"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "link": MessageLookupByLibrary.simpleMessage("Link"),
    "loadMore": MessageLookupByLibrary.simpleMessage("Load More"),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "loadingButton": MessageLookupByLibrary.simpleMessage("Loading Button"),
    "loadingCard": MessageLookupByLibrary.simpleMessage("Loading Card"),
    "loadingCompanyLogo": MessageLookupByLibrary.simpleMessage(
      "Loading company logo...",
    ),
    "loadingCustomers": MessageLookupByLibrary.simpleMessage(
      "Loading customers...",
    ),
    "loadingDashboard": MessageLookupByLibrary.simpleMessage(
      "Loading dashboard data...",
    ),
    "loadingDefaultLogo": MessageLookupByLibrary.simpleMessage(
      "Loading default logo",
    ),
    "loadingExpenses": MessageLookupByLibrary.simpleMessage(
      "Loading expenses...",
    ),
    "loadingInvoiceDetails": MessageLookupByLibrary.simpleMessage(
      "Loading invoice details...",
    ),
    "loadingInvoices": MessageLookupByLibrary.simpleMessage(
      "Loading Invoices...",
    ),
    "loadingMore": MessageLookupByLibrary.simpleMessage("Loading more..."),
    "loadingProductDetails": m60,
    "loadingProducts": MessageLookupByLibrary.simpleMessage(
      "Loading products...",
    ),
    "loadingUsers": MessageLookupByLibrary.simpleMessage("Loading users..."),
    "loggingIn": MessageLookupByLibrary.simpleMessage("Logging in..."),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginCancelled": MessageLookupByLibrary.simpleMessage("Login cancelled"),
    "loginError": MessageLookupByLibrary.simpleMessage("Login error"),
    "loginLoadin": MessageLookupByLibrary.simpleMessage("Logging in..."),
    "loginSuccess": MessageLookupByLibrary.simpleMessage("Login successful"),
    "loginSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Login successful",
    ),
    "logoLoadError": MessageLookupByLibrary.simpleMessage(
      "Failed to load company logo",
    ),
    "logoLoadedFromCache": MessageLookupByLibrary.simpleMessage(
      "Logo loaded from cache",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "low": MessageLookupByLibrary.simpleMessage("Low"),
    "lowStockAlert": MessageLookupByLibrary.simpleMessage("Low Stock Alert"),
    "mainTitle": MessageLookupByLibrary.simpleMessage("Main Title"),
    "manageCustomers": MessageLookupByLibrary.simpleMessage("Manage Customers"),
    "manageExpensesAndBudgets": MessageLookupByLibrary.simpleMessage(
      "Manage expenses and budgets",
    ),
    "manageInvoiceStep1": MessageLookupByLibrary.simpleMessage(
      "1. Use search and filters to find invoices",
    ),
    "manageInvoiceStep2": MessageLookupByLibrary.simpleMessage(
      "2. Tap on invoice to view details",
    ),
    "manageInvoiceStep3": MessageLookupByLibrary.simpleMessage(
      "3. Use buttons to edit or delete",
    ),
    "manageInvoiceStep4": MessageLookupByLibrary.simpleMessage(
      "4. Send invoice to customer when needed",
    ),
    "manageInvoices": MessageLookupByLibrary.simpleMessage("Manage Invoices"),
    "manageInvoicesAndCustomers": MessageLookupByLibrary.simpleMessage(
      "Manage invoices and customers easily",
    ),
    "managePermissions": MessageLookupByLibrary.simpleMessage(
      "Manage Permissions",
    ),
    "managePermissionsDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to manage user permissions",
    ),
    "manageProducts": MessageLookupByLibrary.simpleMessage("Manage Products"),
    "manageSettings": MessageLookupByLibrary.simpleMessage("Manage Settings"),
    "manageUsersAndPermissions": MessageLookupByLibrary.simpleMessage(
      "Manage users and permissions",
    ),
    "manager": MessageLookupByLibrary.simpleMessage("Manager"),
    "managingInvoices": MessageLookupByLibrary.simpleMessage(
      "Managing Invoices",
    ),
    "manualItem": MessageLookupByLibrary.simpleMessage("Manual Item"),
    "markAsPaid": MessageLookupByLibrary.simpleMessage("Mark as Paid"),
    "material": MessageLookupByLibrary.simpleMessage("Material"),
    "maximumQuantity": MessageLookupByLibrary.simpleMessage("Maximum Quantity"),
    "medium": MessageLookupByLibrary.simpleMessage("Medium"),
    "mediumResponsiveText": MessageLookupByLibrary.simpleMessage(
      "Medium Responsive Text",
    ),
    "message": MessageLookupByLibrary.simpleMessage("Message"),
    "messageRequired": MessageLookupByLibrary.simpleMessage(
      "Message is required",
    ),
    "metadata": MessageLookupByLibrary.simpleMessage("Metadata"),
    "meter": MessageLookupByLibrary.simpleMessage("m"),
    "minimumQuantity": MessageLookupByLibrary.simpleMessage("Minimum Quantity"),
    "model": MessageLookupByLibrary.simpleMessage("Model"),
    "modernEducationInstitution": MessageLookupByLibrary.simpleMessage(
      "Modern Education Institution",
    ),
    "monthlyExpenses": MessageLookupByLibrary.simpleMessage("Monthly Expenses"),
    "monthlySalesStatistics": MessageLookupByLibrary.simpleMessage(
      "Monthly Sales Statistics",
    ),
    "moreOptions": MessageLookupByLibrary.simpleMessage("More Options"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "nameInvalid": MessageLookupByLibrary.simpleMessage(
      "Name must contain only letters",
    ),
    "nameMaxLength": MessageLookupByLibrary.simpleMessage(
      "Name must be less than 50 characters",
    ),
    "nameMinLength": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 3 characters",
    ),
    "nameRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "nameShort": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 2 characters",
    ),
    "netProfit": MessageLookupByLibrary.simpleMessage("Net Profit"),
    "network": MessageLookupByLibrary.simpleMessage("Network"),
    "networkError": MessageLookupByLibrary.simpleMessage("Network error"),
    "never": MessageLookupByLibrary.simpleMessage("Never"),
    "newCategoryDetails": MessageLookupByLibrary.simpleMessage(
      "New Category Details",
    ),
    "newCustomer": MessageLookupByLibrary.simpleMessage("New Customer"),
    "newCustomers": MessageLookupByLibrary.simpleMessage("New Customers"),
    "newExpense": MessageLookupByLibrary.simpleMessage("New Expense"),
    "newInvoices": MessageLookupByLibrary.simpleMessage("New Invoices"),
    "newNotifications": MessageLookupByLibrary.simpleMessage(
      "New Notifications",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "newProducts": MessageLookupByLibrary.simpleMessage("New Products"),
    "newThisMonth": MessageLookupByLibrary.simpleMessage("New This Month"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noCategoriesFound": MessageLookupByLibrary.simpleMessage(
      "No Categories Found",
    ),
    "noCategoriesToDelete": MessageLookupByLibrary.simpleMessage(
      "No categories to delete",
    ),
    "noClients": MessageLookupByLibrary.simpleMessage("No clients"),
    "noCustomerSelected": MessageLookupByLibrary.simpleMessage(
      "No customer selected",
    ),
    "noCustomersFound": MessageLookupByLibrary.simpleMessage(
      "No customers found",
    ),
    "noCustomersFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Press the add button to create a new customer",
    ),
    "noCustomersMatchSearch": MessageLookupByLibrary.simpleMessage(
      "No customers match your search",
    ),
    "noData": MessageLookupByLibrary.simpleMessage("No data"),
    "noDataAvailable": MessageLookupByLibrary.simpleMessage(
      "No data available",
    ),
    "noDataReceived": MessageLookupByLibrary.simpleMessage(
      "No data received from server",
    ),
    "noEmail": MessageLookupByLibrary.simpleMessage("No email"),
    "noFAQsFound": MessageLookupByLibrary.simpleMessage("No FAQs found"),
    "noHaveAccountRejester": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account? Create new account",
    ),
    "noInvoiceData": MessageLookupByLibrary.simpleMessage(
      "No invoice data available",
    ),
    "noInvoices": MessageLookupByLibrary.simpleMessage("No Invoices"),
    "noInvoicesDescription": MessageLookupByLibrary.simpleMessage(
      "Press the add button to create a new invoice",
    ),
    "noItems": MessageLookupByLibrary.simpleMessage("No items"),
    "noItemsAdded": MessageLookupByLibrary.simpleMessage("No items added yet"),
    "noName": MessageLookupByLibrary.simpleMessage("No name"),
    "noNotesAvailable": MessageLookupByLibrary.simpleMessage(
      "No notes available",
    ),
    "noPermission": MessageLookupByLibrary.simpleMessage("Not allowed"),
    "noPermissionMessage": m61,
    "noPhone": MessageLookupByLibrary.simpleMessage("No Phone"),
    "noPreview": MessageLookupByLibrary.simpleMessage("No Preview"),
    "noPrinterDeviceSaved": MessageLookupByLibrary.simpleMessage(
      "No printer device saved",
    ),
    "noPrintersFound": MessageLookupByLibrary.simpleMessage(
      "No printers found",
    ),
    "noPrintersPressSearch": MessageLookupByLibrary.simpleMessage(
      "No printers found. Press \"Search\" to search",
    ),
    "noProductsFound": MessageLookupByLibrary.simpleMessage(
      "No products found",
    ),
    "noProductsMatchSearch": MessageLookupByLibrary.simpleMessage(
      "No products match search",
    ),
    "noProductsSoldMessage": MessageLookupByLibrary.simpleMessage(
      "Start creating your first invoices to see the top selling products",
    ),
    "noProductsSoldYet": MessageLookupByLibrary.simpleMessage(
      "No products sold yet",
    ),
    "noQRCodeAvailable": MessageLookupByLibrary.simpleMessage(
      "No QR code available for this invoice",
    ),
    "noRole": MessageLookupByLibrary.simpleMessage("No role"),
    "noStatus": MessageLookupByLibrary.simpleMessage("No Status"),
    "noTaxUIDAvailable": MessageLookupByLibrary.simpleMessage(
      "No tax UID available for this invoice",
    ),
    "noUsersFound": MessageLookupByLibrary.simpleMessage("No users found"),
    "normalButton": MessageLookupByLibrary.simpleMessage("Normal Button"),
    "normalText": MessageLookupByLibrary.simpleMessage("Normal Text"),
    "notAMember": MessageLookupByLibrary.simpleMessage("Not a member?"),
    "notAssigned": MessageLookupByLibrary.simpleMessage("Not assigned"),
    "notAvailable": MessageLookupByLibrary.simpleMessage("Not available"),
    "notProvided": MessageLookupByLibrary.simpleMessage("Not provided"),
    "notSpecified": MessageLookupByLibrary.simpleMessage("Not specified"),
    "notes": MessageLookupByLibrary.simpleMessage("Notes"),
    "notesHint": MessageLookupByLibrary.simpleMessage(
      "Any additional information or context",
    ),
    "notificationTypes": MessageLookupByLibrary.simpleMessage(
      "Notification Types",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "notificationsAdditionalData": MessageLookupByLibrary.simpleMessage(
      "Additional Data",
    ),
    "notificationsAll": MessageLookupByLibrary.simpleMessage("All"),
    "notificationsClearRead": MessageLookupByLibrary.simpleMessage(
      "Clear Read",
    ),
    "notificationsClearReadConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete all read notifications?",
    ),
    "notificationsClearReadSuccess": MessageLookupByLibrary.simpleMessage(
      "All read notifications cleared successfully",
    ),
    "notificationsDeleteConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this notification?",
    ),
    "notificationsDeleteNotification": MessageLookupByLibrary.simpleMessage(
      "Delete Notification",
    ),
    "notificationsDeleteSuccess": MessageLookupByLibrary.simpleMessage(
      "Notification deleted successfully",
    ),
    "notificationsDetails": MessageLookupByLibrary.simpleMessage(
      "Notification Details",
    ),
    "notificationsDisabled": MessageLookupByLibrary.simpleMessage(
      "Notifications disabled",
    ),
    "notificationsEnabled": MessageLookupByLibrary.simpleMessage(
      "Notifications enabled",
    ),
    "notificationsMarkAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Mark All as Read",
    ),
    "notificationsMarkAllAsReadSuccess": MessageLookupByLibrary.simpleMessage(
      "All notifications marked as read successfully",
    ),
    "notificationsMarkAsRead": MessageLookupByLibrary.simpleMessage(
      "Mark as Read",
    ),
    "notificationsMarkAsReadSuccess": MessageLookupByLibrary.simpleMessage(
      "Notification marked as read successfully",
    ),
    "notificationsNoNotifications": MessageLookupByLibrary.simpleMessage(
      "No notifications",
    ),
    "notificationsRead": MessageLookupByLibrary.simpleMessage("Read"),
    "notificationsSearchHint": MessageLookupByLibrary.simpleMessage(
      "Search notifications...",
    ),
    "notificationsSettings": MessageLookupByLibrary.simpleMessage(
      "Notifications Settings",
    ),
    "notificationsSettingsNote": MessageLookupByLibrary.simpleMessage(
      "You can close and open the general notifications.",
    ),
    "notificationsTotal": MessageLookupByLibrary.simpleMessage("Total"),
    "notificationsTypeInvoice": MessageLookupByLibrary.simpleMessage("Invoice"),
    "notificationsTypePayment": MessageLookupByLibrary.simpleMessage("Payment"),
    "notificationsTypeSystem": MessageLookupByLibrary.simpleMessage("System"),
    "notificationsTypeUserCreated": MessageLookupByLibrary.simpleMessage(
      "User Created",
    ),
    "notificationsUnread": MessageLookupByLibrary.simpleMessage("Unread"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "onboardingClients": MessageLookupByLibrary.simpleMessage(
      "Client and Product Management",
    ),
    "onboardingClientsDesc": MessageLookupByLibrary.simpleMessage(
      "Comprehensive management of clients and products with inventory tracking",
    ),
    "onboardingExpenses": MessageLookupByLibrary.simpleMessage(
      "Expense Management",
    ),
    "onboardingExpensesDesc": MessageLookupByLibrary.simpleMessage(
      "Track and manage expenses with multiple categories",
    ),
    "onboardingInvoices": MessageLookupByLibrary.simpleMessage("Tax Invoices"),
    "onboardingInvoicesDesc": MessageLookupByLibrary.simpleMessage(
      "Create and manage tax invoices with integration with the national invoice system",
    ),
    "onboardingOne": MessageLookupByLibrary.simpleMessage(
      "Follow all your bills in one place",
    ),
    "onboardingOneDec": MessageLookupByLibrary.simpleMessage(
      "Organ your monthly bills, and follow the payment dates, without paper or headache.",
    ),
    "onboardingStartNow": MessageLookupByLibrary.simpleMessage("Start now"),
    "onboardingThree": MessageLookupByLibrary.simpleMessage(
      "Pay and follow every need in seconds",
    ),
    "onboardingThreeDec": MessageLookupByLibrary.simpleMessage(
      "Pay electronically, and save your records automatically to review them at any time.",
    ),
    "onboardingTwo": MessageLookupByLibrary.simpleMessage(
      "You don\'t forget and no bill",
    ),
    "onboardingTwoDec": MessageLookupByLibrary.simpleMessage(
      "You receive an alert before the payment date, in order to avoid any delay or fines.",
    ),
    "onboardingUsers": MessageLookupByLibrary.simpleMessage(
      "User and Permission Management",
    ),
    "onboardingUsersDesc": MessageLookupByLibrary.simpleMessage(
      "Complete control over users and their permissions within the company",
    ),
    "onboardingWelcome": MessageLookupByLibrary.simpleMessage(
      "Welcome to Invotek",
    ),
    "onboardingWelcomeDesc": MessageLookupByLibrary.simpleMessage(
      "Integrated system for electronic invoice management with integration with the Jordanian national billing system",
    ),
    "openingEmail": m62,
    "openingMap": MessageLookupByLibrary.simpleMessage("Opening map"),
    "operationBulkDelete": MessageLookupByLibrary.simpleMessage("Bulk Delete"),
    "operationBulkStatusUpdate": MessageLookupByLibrary.simpleMessage(
      "Bulk Status Update",
    ),
    "operationCompletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Operation completed successfully",
    ),
    "operationDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "operationStatusUpdate": MessageLookupByLibrary.simpleMessage(
      "Status Update",
    ),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "otpSentToEmail": MessageLookupByLibrary.simpleMessage(
      "Verification code sent to your email",
    ),
    "outOfStock": MessageLookupByLibrary.simpleMessage("Out of Stock"),
    "outlinedButton": MessageLookupByLibrary.simpleMessage("Outlined Button"),
    "outlinedButtonPressed": MessageLookupByLibrary.simpleMessage(
      "Outlined button pressed",
    ),
    "overdue": MessageLookupByLibrary.simpleMessage("Overdue"),
    "packageName": MessageLookupByLibrary.simpleMessage("Package Name"),
    "pageNotFound": MessageLookupByLibrary.simpleMessage("Page Not Found"),
    "paid": MessageLookupByLibrary.simpleMessage("Paid"),
    "paidInvoices": MessageLookupByLibrary.simpleMessage("8 Paid"),
    "paperSize": MessageLookupByLibrary.simpleMessage("Paper Size"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordChangedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "passwordLowercase": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one lowercase letter",
    ),
    "passwordMaxLength": MessageLookupByLibrary.simpleMessage(
      "Password must be less than 50 characters",
    ),
    "passwordMinLength": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters",
    ),
    "passwordNumber": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one number",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordShort": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "passwordStrengthMedium": MessageLookupByLibrary.simpleMessage("Medium"),
    "passwordStrengthStrong": MessageLookupByLibrary.simpleMessage("Strong"),
    "passwordStrengthWeak": MessageLookupByLibrary.simpleMessage("Weak"),
    "passwordUppercase": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one uppercase letter",
    ),
    "passwordWeak": MessageLookupByLibrary.simpleMessage(
      "Password must contain uppercase, lowercase and number",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "passwordsNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "pasteCode": MessageLookupByLibrary.simpleMessage("Paste Code"),
    "payment": MessageLookupByLibrary.simpleMessage("Payment"),
    "paymentDate": MessageLookupByLibrary.simpleMessage("Payment Date"),
    "paymentDetails": MessageLookupByLibrary.simpleMessage("Payment Details"),
    "paymentInformation": MessageLookupByLibrary.simpleMessage(
      "Payment Information",
    ),
    "paymentMethod": MessageLookupByLibrary.simpleMessage("Payment Method"),
    "paymentMethodBank": MessageLookupByLibrary.simpleMessage("Bank Transfer"),
    "paymentMethodBankTransfer": MessageLookupByLibrary.simpleMessage(
      "Bank Transfer",
    ),
    "paymentMethodCard": MessageLookupByLibrary.simpleMessage("Card"),
    "paymentMethodCash": MessageLookupByLibrary.simpleMessage("Cash"),
    "paymentMethodCheck": MessageLookupByLibrary.simpleMessage("Check"),
    "paymentMethodRequired": MessageLookupByLibrary.simpleMessage(
      "Payment method is required",
    ),
    "paymentMethodType": MessageLookupByLibrary.simpleMessage(
      "Payment Method Type",
    ),
    "paymentMethods": MessageLookupByLibrary.simpleMessage("Payment Methods"),
    "paymentNotifications": MessageLookupByLibrary.simpleMessage(
      "Payment Notifications",
    ),
    "paymentNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Receive notifications about payments",
    ),
    "pdfError": MessageLookupByLibrary.simpleMessage("PDF generation error"),
    "pdfGenerated": MessageLookupByLibrary.simpleMessage(
      "PDF generated successfully",
    ),
    "pdfPreview": MessageLookupByLibrary.simpleMessage("PDF Preview"),
    "pdfPrint": MessageLookupByLibrary.simpleMessage("PDF Print"),
    "pdfPrintDesc": MessageLookupByLibrary.simpleMessage("View and save PDF"),
    "pdfSaved": MessageLookupByLibrary.simpleMessage("PDF saved successfully"),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "permissionsManagement": MessageLookupByLibrary.simpleMessage(
      "Permissions Management",
    ),
    "personalInformation": MessageLookupByLibrary.simpleMessage(
      "Personal Information",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "phoneInvalid": MessageLookupByLibrary.simpleMessage(
      "Invalid phone number format",
    ),
    "phoneMaxLength": MessageLookupByLibrary.simpleMessage(
      "Phone number must be less than 15 digits",
    ),
    "phoneMinLength": MessageLookupByLibrary.simpleMessage(
      "Phone number must be at least 10 digits",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberInvalid": MessageLookupByLibrary.simpleMessage(
      "Invalid phone number",
    ),
    "phoneRequired": MessageLookupByLibrary.simpleMessage(
      "Phone number is required",
    ),
    "photoUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Photo Updated Successfully",
    ),
    "piece": MessageLookupByLibrary.simpleMessage("Piece"),
    "pieceKgMeter": MessageLookupByLibrary.simpleMessage("piece, kg, meter..."),
    "playServicesNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Play services not available",
    ),
    "pleaseConnectPrinterFirst": MessageLookupByLibrary.simpleMessage(
      "Please connect printer first",
    ),
    "pleaseEnableBluetooth": MessageLookupByLibrary.simpleMessage(
      "Please Enable Bluetooth",
    ),
    "pleaseEnterCompanyName": MessageLookupByLibrary.simpleMessage(
      "Please enter company name",
    ),
    "pleaseEnterMerchantCode": MessageLookupByLibrary.simpleMessage(
      "Please enter merchant code",
    ),
    "pleaseEnterValidAmount": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid amount",
    ),
    "pleaseSelectCategory": MessageLookupByLibrary.simpleMessage(
      "Please select a category",
    ),
    "pleaseSelectInvoiceType": MessageLookupByLibrary.simpleMessage(
      "Please select invoice type",
    ),
    "position": MessageLookupByLibrary.simpleMessage("Position"),
    "postalCode": MessageLookupByLibrary.simpleMessage("Postal Code"),
    "postedInvoices": MessageLookupByLibrary.simpleMessage("Posted Invoices"),
    "preparingInvoice": MessageLookupByLibrary.simpleMessage(
      "Preparing invoice...",
    ),
    "pressAddToCreateClient": MessageLookupByLibrary.simpleMessage(
      "Press add button to create new client",
    ),
    "preview": MessageLookupByLibrary.simpleMessage("Preview"),
    "previewAndTestPrint": MessageLookupByLibrary.simpleMessage(
      "Preview and Test Print",
    ),
    "previewError": m63,
    "previewLabel": MessageLookupByLibrary.simpleMessage("Preview:"),
    "previous": MessageLookupByLibrary.simpleMessage("Previous"),
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "priceMustBeGreaterThanOrEqualZero": MessageLookupByLibrary.simpleMessage(
      "Price must be greater than or equal to zero",
    ),
    "priceMustBeGreaterThanZero": MessageLookupByLibrary.simpleMessage(
      "Price must be greater than zero",
    ),
    "priceRequired": MessageLookupByLibrary.simpleMessage("Price is required"),
    "pricing": MessageLookupByLibrary.simpleMessage("Pricing"),
    "pricingInformation": MessageLookupByLibrary.simpleMessage(
      "Pricing Information",
    ),
    "print": MessageLookupByLibrary.simpleMessage("Print"),
    "printCancelled": MessageLookupByLibrary.simpleMessage("Print Cancelled"),
    "printError": MessageLookupByLibrary.simpleMessage("Print error"),
    "printErrorWithMessage": m64,
    "printFailed": MessageLookupByLibrary.simpleMessage("Print failed"),
    "printInvoice": MessageLookupByLibrary.simpleMessage("Print Invoice"),
    "printInvoiceText": m65,
    "printInvoiceTitle": MessageLookupByLibrary.simpleMessage("Print Invoice"),
    "printOptions": MessageLookupByLibrary.simpleMessage("Print Options"),
    "printQuality": MessageLookupByLibrary.simpleMessage("Print Quality"),
    "printReceipt": MessageLookupByLibrary.simpleMessage("Print Receipt"),
    "printSettings": MessageLookupByLibrary.simpleMessage("Print Settings"),
    "printSuccess": MessageLookupByLibrary.simpleMessage("Print successful"),
    "printerConnected": MessageLookupByLibrary.simpleMessage(
      "Connected to printer",
    ),
    "printerDeviceNotFound": MessageLookupByLibrary.simpleMessage(
      "No saved printer device found. Please go to settings and add a printer device.",
    ),
    "printerDisconnected": MessageLookupByLibrary.simpleMessage(
      "Disconnected from printer",
    ),
    "printerName": MessageLookupByLibrary.simpleMessage("Printer Name"),
    "printerNotConnected": MessageLookupByLibrary.simpleMessage(
      "Printer Not Connected",
    ),
    "printerNotConnectedStatus": MessageLookupByLibrary.simpleMessage(
      "Not connected to printer",
    ),
    "printerSettings": MessageLookupByLibrary.simpleMessage("Printer Settings"),
    "printerStatus": MessageLookupByLibrary.simpleMessage("Printer Status"),
    "printers": MessageLookupByLibrary.simpleMessage("Printers"),
    "printingInProgress": MessageLookupByLibrary.simpleMessage(
      "Printing in progress...",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "privacyPolicyComingSoon": MessageLookupByLibrary.simpleMessage(
      "Privacy Policy Coming Soon",
    ),
    "privacyPolicyContactContent": MessageLookupByLibrary.simpleMessage(
      "If you have any questions about this Privacy Policy, please contact us at support@invotik.com.",
    ),
    "privacyPolicyContactTitle": MessageLookupByLibrary.simpleMessage(
      "Contact Us",
    ),
    "privacyPolicyDataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "We collect information that you provide directly to us, such as when you create an account, make a purchase, or contact us for support.",
    ),
    "privacyPolicyDataCollectionTitle": MessageLookupByLibrary.simpleMessage(
      "Data Collection",
    ),
    "privacyPolicyDataSecurityContent": MessageLookupByLibrary.simpleMessage(
      "We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.",
    ),
    "privacyPolicyDataSecurityTitle": MessageLookupByLibrary.simpleMessage(
      "Data Security",
    ),
    "privacyPolicyDataUsageContent": MessageLookupByLibrary.simpleMessage(
      "We use the information we collect to provide, maintain, and improve our services, process transactions, and communicate with you.",
    ),
    "privacyPolicyDataUsageTitle": MessageLookupByLibrary.simpleMessage(
      "Data Usage",
    ),
    "privacyPolicyIntroductionContent": MessageLookupByLibrary.simpleMessage(
      "This Privacy Policy describes how Invotek collects, uses, and protects your personal information when you use our application.",
    ),
    "privacyPolicyIntroductionTitle": MessageLookupByLibrary.simpleMessage(
      "Introduction",
    ),
    "privacyPolicyLastUpdated": m66,
    "privacyPolicyLastUpdatedPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Last updated: January 2024",
    ),
    "privacyPolicyTitle": MessageLookupByLibrary.simpleMessage(
      "Privacy Policy",
    ),
    "privacyPolicyUserRightsContent": MessageLookupByLibrary.simpleMessage(
      "You have the right to access, update, or delete your personal information at any time through your account settings.",
    ),
    "privacyPolicyUserRightsTitle": MessageLookupByLibrary.simpleMessage(
      "Your Rights",
    ),
    "product": MessageLookupByLibrary.simpleMessage("Product"),
    "productAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Product added successfully",
    ),
    "productCategories": MessageLookupByLibrary.simpleMessage(
      "Product Categories",
    ),
    "productDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Product deleted successfully",
    ),
    "productDetails": MessageLookupByLibrary.simpleMessage("Product Details"),
    "productHelp": MessageLookupByLibrary.simpleMessage("Product Help"),
    "productIsActive": MessageLookupByLibrary.simpleMessage(
      "Product is Active",
    ),
    "productIsTaxable": MessageLookupByLibrary.simpleMessage(
      "Product is Taxable",
    ),
    "productManagement": MessageLookupByLibrary.simpleMessage(
      "Product Management",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Product Name"),
    "productNameRequired": MessageLookupByLibrary.simpleMessage(
      "Product name is required",
    ),
    "productPriceRequired": MessageLookupByLibrary.simpleMessage(
      "Product price is required",
    ),
    "productQuantityRequired": MessageLookupByLibrary.simpleMessage(
      "Product quantity is required",
    ),
    "productSku": MessageLookupByLibrary.simpleMessage("Product SKU"),
    "productUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Product updated successfully",
    ),
    "products": MessageLookupByLibrary.simpleMessage("Products"),
    "productsAdd": MessageLookupByLibrary.simpleMessage("Add"),
    "productsApplyTaxToProduct": MessageLookupByLibrary.simpleMessage(
      "Apply tax to product",
    ),
    "productsAreYouSureYouWantToDeleteThisProduct":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete this product?",
        ),
    "productsAvailable": MessageLookupByLibrary.simpleMessage("Available"),
    "productsBarcode": MessageLookupByLibrary.simpleMessage("Barcode"),
    "productsBasicInformation": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "productsBasicInformationDescription": MessageLookupByLibrary.simpleMessage(
      "Enter product name, description, category, and status.",
    ),
    "productsBoughtThis": MessageLookupByLibrary.simpleMessage("Bought This"),
    "productsCacheError": MessageLookupByLibrary.simpleMessage(
      "Cache error - Products",
    ),
    "productsCategories": MessageLookupByLibrary.simpleMessage("Products"),
    "productsCategoriesManagement": MessageLookupByLibrary.simpleMessage(
      "Products and Categories",
    ),
    "productsCategoryState": MessageLookupByLibrary.simpleMessage(
      "Category State",
    ),
    "productsCheckIfCategoryIsActiveOrInactive":
        MessageLookupByLibrary.simpleMessage(
          "check if the category is active or inactive",
        ),
    "productsCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "productsCostPrice": MessageLookupByLibrary.simpleMessage("Cost Price"),
    "productsCreateFirstProduct": MessageLookupByLibrary.simpleMessage(
      "Create your first product to get started",
    ),
    "productsCustomers": MessageLookupByLibrary.simpleMessage("Customers"),
    "productsDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "productsDeleteCategory": MessageLookupByLibrary.simpleMessage(
      "Delete Category",
    ),
    "productsDeleteCategoryConfirmation": m67,
    "productsDescription": MessageLookupByLibrary.simpleMessage("Description"),
    "productsEdit": MessageLookupByLibrary.simpleMessage("Edit"),
    "productsEditProduct": MessageLookupByLibrary.simpleMessage("Edit Product"),
    "productsEnterBarcode": MessageLookupByLibrary.simpleMessage(
      "Enter barcode",
    ),
    "productsEnterCostPrice": MessageLookupByLibrary.simpleMessage(
      "Enter cost price",
    ),
    "productsEnterProductDescription": MessageLookupByLibrary.simpleMessage(
      "Enter product description",
    ),
    "productsEnterProductName": MessageLookupByLibrary.simpleMessage(
      "Enter product name",
    ),
    "productsEnterProductSku": MessageLookupByLibrary.simpleMessage(
      "Enter product SKU",
    ),
    "productsEnterQuantity": MessageLookupByLibrary.simpleMessage(
      "Enter quantity",
    ),
    "productsEnterSKU": MessageLookupByLibrary.simpleMessage("Enter SKU"),
    "productsEnterSellingPrice": MessageLookupByLibrary.simpleMessage(
      "Enter selling price",
    ),
    "productsEnterTaxRatePercentage": MessageLookupByLibrary.simpleMessage(
      "Enter tax rate percentage",
    ),
    "productsEnterUnit": MessageLookupByLibrary.simpleMessage(
      "Enter unit (e.g., piece)",
    ),
    "productsErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Error Occurred",
    ),
    "productsHelp": MessageLookupByLibrary.simpleMessage("Product Help"),
    "productsHelpDescription": MessageLookupByLibrary.simpleMessage(
      "This screen helps you add new products to your inventory. Here\'s what you need to know:",
    ),
    "productsInStock": MessageLookupByLibrary.simpleMessage(
      "Products in Stock",
    ),
    "productsInventory": MessageLookupByLibrary.simpleMessage("Inventory"),
    "productsInventoryDescription": MessageLookupByLibrary.simpleMessage(
      "Manage quantity, units, and stock levels.",
    ),
    "productsInvoices": MessageLookupByLibrary.simpleMessage("Invoices"),
    "productsList": MessageLookupByLibrary.simpleMessage("Products List"),
    "productsLoadError": MessageLookupByLibrary.simpleMessage(
      "Error loading products",
    ),
    "productsManageProductsAndInventory": MessageLookupByLibrary.simpleMessage(
      "Manage products and inventory",
    ),
    "productsManagement": MessageLookupByLibrary.simpleMessage(
      "Products & Categories Management",
    ),
    "productsNetworkError": MessageLookupByLibrary.simpleMessage(
      "Network error - Products",
    ),
    "productsNo": MessageLookupByLibrary.simpleMessage("No"),
    "productsNoCategoriesFound": MessageLookupByLibrary.simpleMessage(
      "No categories found",
    ),
    "productsNoPermissionToAct": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to perform this action",
    ),
    "productsNoPermissionToView": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to view this content",
    ),
    "productsNotSet": MessageLookupByLibrary.simpleMessage("Not set"),
    "productsNotSpecified": MessageLookupByLibrary.simpleMessage(
      "Not specified",
    ),
    "productsPleaseEnterValidPrice": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid price",
    ),
    "productsPleaseEnterValidQuantity": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid quantity",
    ),
    "productsPricing": MessageLookupByLibrary.simpleMessage("Pricing"),
    "productsPricingDescription": MessageLookupByLibrary.simpleMessage(
      "Set selling price, cost price, and tax rate.",
    ),
    "productsProductDetails": MessageLookupByLibrary.simpleMessage(
      "Product Details",
    ),
    "productsProductDetailsDescription": MessageLookupByLibrary.simpleMessage(
      "Add SKU, barcode, brand, model, and other details.",
    ),
    "productsProductInformation": MessageLookupByLibrary.simpleMessage(
      "Product Information",
    ),
    "productsProductInsights": MessageLookupByLibrary.simpleMessage(
      "Product Insights",
    ),
    "productsProductIsTaxable": MessageLookupByLibrary.simpleMessage(
      "Product is Taxable",
    ),
    "productsProductNameRequired": MessageLookupByLibrary.simpleMessage(
      "Product name is required",
    ),
    "productsProductStatusRequired": MessageLookupByLibrary.simpleMessage(
      "Product status is required",
    ),
    "productsQty": MessageLookupByLibrary.simpleMessage("Qty"),
    "productsQuantity": MessageLookupByLibrary.simpleMessage("Quantity"),
    "productsQuantityRequired": MessageLookupByLibrary.simpleMessage(
      "Quantity is required",
    ),
    "productsReport": MessageLookupByLibrary.simpleMessage("Products Report"),
    "productsSales": MessageLookupByLibrary.simpleMessage("Sales"),
    "productsSellingPriceRequired": MessageLookupByLibrary.simpleMessage(
      "Selling price is required",
    ),
    "productsSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "productsSku": MessageLookupByLibrary.simpleMessage("SKU"),
    "productsStock": MessageLookupByLibrary.simpleMessage("Stock"),
    "productsTapToCopy": MessageLookupByLibrary.simpleMessage("Tap to copy"),
    "productsTaxRate": MessageLookupByLibrary.simpleMessage("Tax Rate"),
    "productsTaxable": MessageLookupByLibrary.simpleMessage("Taxable"),
    "productsThisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "This action cannot be undone.",
    ),
    "productsThisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
    "productsTimeoutError": MessageLookupByLibrary.simpleMessage(
      "Timeout error - Products",
    ),
    "productsTrackAvailableProductQuantity":
        MessageLookupByLibrary.simpleMessage(
          "Track available product quantity",
        ),
    "productsTrackInventory": MessageLookupByLibrary.simpleMessage(
      "Track Inventory",
    ),
    "productsUnauthorizedError": MessageLookupByLibrary.simpleMessage(
      "Unauthorized error - Products",
    ),
    "productsUnit": MessageLookupByLibrary.simpleMessage("Unit"),
    "productsUnitHint": MessageLookupByLibrary.simpleMessage(
      "piece, kg, meter...",
    ),
    "productsUnknownError": MessageLookupByLibrary.simpleMessage(
      "Unknown error - Products",
    ),
    "productsUnnamedProduct": MessageLookupByLibrary.simpleMessage(
      "Unnamed Product",
    ),
    "productsUpdate": MessageLookupByLibrary.simpleMessage("Update"),
    "productsValidationError": MessageLookupByLibrary.simpleMessage(
      "Validation error - Products",
    ),
    "productsViewAndManageProductInformation":
        MessageLookupByLibrary.simpleMessage(
          "View and manage product information",
        ),
    "productsYes": MessageLookupByLibrary.simpleMessage("Yes"),
    "profileInformation": MessageLookupByLibrary.simpleMessage(
      "Profile Information",
    ),
    "profitGrowth": MessageLookupByLibrary.simpleMessage("Profit Growth"),
    "qrCode": MessageLookupByLibrary.simpleMessage("QR- Code"),
    "qrCodeLabel": MessageLookupByLibrary.simpleMessage("QR Code"),
    "qty": MessageLookupByLibrary.simpleMessage("Qty"),
    "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
    "quantityExceedsAvailableStock": m68,
    "quantityMustBeAPositiveInteger": MessageLookupByLibrary.simpleMessage(
      "Quantity must be a positive integer",
    ),
    "quantityMustBeGreaterThanZero": MessageLookupByLibrary.simpleMessage(
      "Quantity must be greater than zero",
    ),
    "quantityRequired": MessageLookupByLibrary.simpleMessage(
      "Quantity is required",
    ),
    "quickActions": MessageLookupByLibrary.simpleMessage("Quick Actions"),
    "quickActionsTitle": MessageLookupByLibrary.simpleMessage("Quick Actions"),
    "quickContact": MessageLookupByLibrary.simpleMessage("Quick Contact"),
    "reason": MessageLookupByLibrary.simpleMessage("Reason"),
    "receiveNotifications": MessageLookupByLibrary.simpleMessage(
      "Receive Notifications",
    ),
    "referenceNumber": MessageLookupByLibrary.simpleMessage("Reference Number"),
    "referenceNumberHint": MessageLookupByLibrary.simpleMessage(
      "Invoice number, receipt ID, etc.",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshData": MessageLookupByLibrary.simpleMessage("Refresh Data"),
    "refreshPrinters": MessageLookupByLibrary.simpleMessage("Refresh Printers"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerSuccess": MessageLookupByLibrary.simpleMessage(
      "Registration successful! Please login.",
    ),
    "registering": MessageLookupByLibrary.simpleMessage("Registering..."),
    "regularInvoices": MessageLookupByLibrary.simpleMessage("Regular Invoices"),
    "rejester": MessageLookupByLibrary.simpleMessage("Login"),
    "rejesterLoading": MessageLookupByLibrary.simpleMessage("Logging in..."),
    "rejesterSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Registration successful! Please login.",
    ),
    "removeItem": MessageLookupByLibrary.simpleMessage("Remove Item"),
    "renderingInvoice": MessageLookupByLibrary.simpleMessage(
      "Rendering invoice...",
    ),
    "reports": MessageLookupByLibrary.simpleMessage("Reports"),
    "requestedPageNotFound": MessageLookupByLibrary.simpleMessage(
      "The requested page was not found",
    ),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "resendCodeIn": m69,
    "resetFilters": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "resetPasswordDesc": MessageLookupByLibrary.simpleMessage(
      "Enter your new password",
    ),
    "resetPasswordSuccess": MessageLookupByLibrary.simpleMessage(
      "Password reset successfully",
    ),
    "resetPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Reset Password",
    ),
    "responsiveTexts": MessageLookupByLibrary.simpleMessage("Responsive Texts"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "retryConnection": MessageLookupByLibrary.simpleMessage("Retry Connection"),
    "retryingLogoLoad": MessageLookupByLibrary.simpleMessage(
      "Retrying logo load...",
    ),
    "returnInvoice": MessageLookupByLibrary.simpleMessage("Return Invoice"),
    "returnReason": MessageLookupByLibrary.simpleMessage("Return Reason"),
    "returnedInvoice": MessageLookupByLibrary.simpleMessage("Returned Invoice"),
    "returnedInvoices": MessageLookupByLibrary.simpleMessage(
      "Returned Invoices",
    ),
    "reviewCalculations": MessageLookupByLibrary.simpleMessage(
      "Review Calculations",
    ),
    "role": MessageLookupByLibrary.simpleMessage("Role"),
    "rule": MessageLookupByLibrary.simpleMessage("Role"),
    "salesCategories": MessageLookupByLibrary.simpleMessage("Sales Categories"),
    "salesDistribution": MessageLookupByLibrary.simpleMessage(
      "Sales Distribution",
    ),
    "salesGrowth": MessageLookupByLibrary.simpleMessage("Sales Growth"),
    "salesReport": MessageLookupByLibrary.simpleMessage("Sales Report"),
    "salesTax": MessageLookupByLibrary.simpleMessage("Sales Tax"),
    "saudiArabia": MessageLookupByLibrary.simpleMessage("Saudi Arabia"),
    "saudiRiyal": MessageLookupByLibrary.simpleMessage("Saudi Riyal"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveAndSend": MessageLookupByLibrary.simpleMessage("Save and Send"),
    "saveCategory": MessageLookupByLibrary.simpleMessage("Save Category"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "saveEdit": MessageLookupByLibrary.simpleMessage("Save Edit"),
    "saveError": MessageLookupByLibrary.simpleMessage("Save error"),
    "saveOnly": MessageLookupByLibrary.simpleMessage("Save Only"),
    "savePDF": MessageLookupByLibrary.simpleMessage("Save PDF"),
    "saveSettings": MessageLookupByLibrary.simpleMessage("Save Settings"),
    "saving": MessageLookupByLibrary.simpleMessage("Saving..."),
    "savingSettings": MessageLookupByLibrary.simpleMessage(
      "Saving Settings...",
    ),
    "screenDimensions": MessageLookupByLibrary.simpleMessage(
      "Screen Dimensions",
    ),
    "screenDimensionsAndPerformance": MessageLookupByLibrary.simpleMessage(
      "Screen dimensions and performance",
    ),
    "screenDimensionsPerformance": MessageLookupByLibrary.simpleMessage(
      "Screen dimensions and performance",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Search..."),
    "searchCustomers": MessageLookupByLibrary.simpleMessage("Search customers"),
    "searchExpenses": MessageLookupByLibrary.simpleMessage(
      ".... Search expenses",
    ),
    "searchFAQs": MessageLookupByLibrary.simpleMessage("Search FAQs"),
    "searchForUser": MessageLookupByLibrary.simpleMessage("Search for user..."),
    "searchInClients": MessageLookupByLibrary.simpleMessage(
      "Search in clients...",
    ),
    "searchInInvoices": MessageLookupByLibrary.simpleMessage(
      "Search in invoices...",
    ),
    "searchInvoices": MessageLookupByLibrary.simpleMessage(
      "Search invoices...",
    ),
    "searchItems": MessageLookupByLibrary.simpleMessage("Search items..."),
    "searchProducts": MessageLookupByLibrary.simpleMessage(
      "Search products...",
    ),
    "searchUsers": MessageLookupByLibrary.simpleMessage("Search users"),
    "searchingForPrinters": MessageLookupByLibrary.simpleMessage(
      "Searching for printers...",
    ),
    "searchingPrinter": MessageLookupByLibrary.simpleMessage(
      "Searching for printer...",
    ),
    "securityInformation": MessageLookupByLibrary.simpleMessage(
      "Security Information",
    ),
    "selectAppropriateExpenseCategory": MessageLookupByLibrary.simpleMessage(
      "Select appropriate expense category",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage("Select Category"),
    "selectCustomer": MessageLookupByLibrary.simpleMessage("Select Customer"),
    "selectCustomerStatus": MessageLookupByLibrary.simpleMessage(
      "Select customer status",
    ),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select Date"),
    "selectLanguage": MessageLookupByLibrary.simpleMessage("Select Language"),
    "selectOrAddCustomer": MessageLookupByLibrary.simpleMessage(
      "Please select a customer or enter customer data",
    ),
    "selectPrinter": MessageLookupByLibrary.simpleMessage("Select Printer"),
    "selectProduct": MessageLookupByLibrary.simpleMessage("Select Product"),
    "selectRole": MessageLookupByLibrary.simpleMessage("Select Role"),
    "selectStatus": MessageLookupByLibrary.simpleMessage("Select Status"),
    "selectTheDateThisExpenseOccurred": MessageLookupByLibrary.simpleMessage(
      "Select the date this expense occurred",
    ),
    "sellingPrice": MessageLookupByLibrary.simpleMessage("Selling Price"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "sendInvoice": MessageLookupByLibrary.simpleMessage("Send Invoice"),
    "sendInvoiceDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to send invoice to client",
    ),
    "sendMessage": MessageLookupByLibrary.simpleMessage("Send Message"),
    "sendMethod": MessageLookupByLibrary.simpleMessage("Send Method"),
    "sendVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Send Verification Code",
    ),
    "sendingInvoice": MessageLookupByLibrary.simpleMessage(
      "Sending invoice...",
    ),
    "sent": MessageLookupByLibrary.simpleMessage("Sent"),
    "sentDate": MessageLookupByLibrary.simpleMessage("Sent Date"),
    "separator": MessageLookupByLibrary.simpleMessage("="),
    "serverError": MessageLookupByLibrary.simpleMessage(
      "Server error. Please try again later.",
    ),
    "setAmountDateAndPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Set amount, date, and payment method",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsAccount": MessageLookupByLibrary.simpleMessage("Account Settings"),
    "settingsAccountDeleted": MessageLookupByLibrary.simpleMessage(
      "Your account will be permanently deleted",
    ),
    "settingsAccountSecurity": MessageLookupByLibrary.simpleMessage(
      "Account Security",
    ),
    "settingsActivate": MessageLookupByLibrary.simpleMessage("Activate"),
    "settingsActivateIntegration": MessageLookupByLibrary.simpleMessage(
      "Activate Integration",
    ),
    "settingsActive": MessageLookupByLibrary.simpleMessage("Active"),
    "settingsAddress": MessageLookupByLibrary.simpleMessage("Address"),
    "settingsBasicInfo": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "settingsCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "settingsCannotUndo": MessageLookupByLibrary.simpleMessage(
      "This action cannot be undone",
    ),
    "settingsChangePassword": MessageLookupByLibrary.simpleMessage(
      "Change Password",
    ),
    "settingsChangePasswordDesc": MessageLookupByLibrary.simpleMessage(
      "Update your password to keep your account secure",
    ),
    "settingsChooseFromGallery": MessageLookupByLibrary.simpleMessage(
      "Choose from Gallery",
    ),
    "settingsCompanyName": MessageLookupByLibrary.simpleMessage("Company Name"),
    "settingsDataDeleted": MessageLookupByLibrary.simpleMessage(
      "All your data will be permanently deleted",
    ),
    "settingsDeactivate": MessageLookupByLibrary.simpleMessage("Deactivate"),
    "settingsDiscard": MessageLookupByLibrary.simpleMessage("Discard"),
    "settingsDiscardChanges": MessageLookupByLibrary.simpleMessage(
      "You have unsaved changes. Are you sure you want to discard them?",
    ),
    "settingsGeneral": MessageLookupByLibrary.simpleMessage("General"),
    "settingsHardware": MessageLookupByLibrary.simpleMessage("Hardware"),
    "settingsInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "settingsIncome": MessageLookupByLibrary.simpleMessage("Income"),
    "settingsInvoiceType": MessageLookupByLibrary.simpleMessage("Invoice Type"),
    "settingsInvoiceTypeSimplified": MessageLookupByLibrary.simpleMessage(
      "Simplified",
    ),
    "settingsInvoiceTypeStandard": MessageLookupByLibrary.simpleMessage(
      "Standard",
    ),
    "settingsManage": MessageLookupByLibrary.simpleMessage("Manage"),
    "settingsMerchantCode": MessageLookupByLibrary.simpleMessage(
      "Merchant Code",
    ),
    "settingsNoPermissionToAct": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to perform this action",
    ),
    "settingsNoPermissionToView": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to view settings",
    ),
    "settingsNotificationsDisabled": MessageLookupByLibrary.simpleMessage(
      "Notifications disabled",
    ),
    "settingsNotificationsEnabled": MessageLookupByLibrary.simpleMessage(
      "Notifications enabled",
    ),
    "settingsPasswordMedium": MessageLookupByLibrary.simpleMessage("Medium"),
    "settingsPasswordMinLength": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters",
    ),
    "settingsPasswordNumber": MessageLookupByLibrary.simpleMessage(
      "At least one number",
    ),
    "settingsPasswordRequirements": MessageLookupByLibrary.simpleMessage(
      "Password Requirements",
    ),
    "settingsPasswordSpecial": MessageLookupByLibrary.simpleMessage(
      "At least one special character",
    ),
    "settingsPasswordStrong": MessageLookupByLibrary.simpleMessage("Strong"),
    "settingsPasswordUppercase": MessageLookupByLibrary.simpleMessage(
      "At least one uppercase letter",
    ),
    "settingsPasswordWeak": MessageLookupByLibrary.simpleMessage("Weak"),
    "settingsPersonalInfo": MessageLookupByLibrary.simpleMessage(
      "Personal Information",
    ),
    "settingsPhone": MessageLookupByLibrary.simpleMessage("Phone"),
    "settingsPrinter": MessageLookupByLibrary.simpleMessage("Printer"),
    "settingsProfile": MessageLookupByLibrary.simpleMessage("Profile"),
    "settingsRegionalSettings": MessageLookupByLibrary.simpleMessage(
      "Regional Settings",
    ),
    "settingsRemovePhoto": MessageLookupByLibrary.simpleMessage("Remove Photo"),
    "settingsRetry": MessageLookupByLibrary.simpleMessage("Retry"),
    "settingsSaveChanges": MessageLookupByLibrary.simpleMessage(
      "Changes saved successfully",
    ),
    "settingsSavedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Settings saved successfully",
    ),
    "settingsStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "settingsSupportEmailSubject": MessageLookupByLibrary.simpleMessage(
      "Technical Support - Invotek App",
    ),
    "settingsTakePhoto": MessageLookupByLibrary.simpleMessage("Take Photo"),
    "settingsTaxIntegration": MessageLookupByLibrary.simpleMessage(
      "Tax Integration",
    ),
    "settingsTaxInvoiceType": MessageLookupByLibrary.simpleMessage(
      "Tax Invoice Type",
    ),
    "settingsTaxMerchantCode": MessageLookupByLibrary.simpleMessage(
      "Tax Merchant Code",
    ),
    "settingsUnsavedChanges": MessageLookupByLibrary.simpleMessage(
      "Unsaved Changes",
    ),
    "settingsUpdateStatus": MessageLookupByLibrary.simpleMessage(
      "Update Status",
    ),
    "settingsUserActive": MessageLookupByLibrary.simpleMessage("Active"),
    "settingsUserInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "settingsUsersManagement": MessageLookupByLibrary.simpleMessage(
      "Users Management",
    ),
    "settingsVAT": MessageLookupByLibrary.simpleMessage("VAT"),
    "settingsWhatHappens": MessageLookupByLibrary.simpleMessage(
      "What happens when you delete your account?",
    ),
    "shareApp": MessageLookupByLibrary.simpleMessage("Share App"),
    "shareInvoice": MessageLookupByLibrary.simpleMessage("Share Invoice"),
    "shareInvoiceText": m70,
    "showAllItems": m71,
    "showLess": MessageLookupByLibrary.simpleMessage("Show Less"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
    "signInFailed": MessageLookupByLibrary.simpleMessage("Sign in failed"),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign in with Google",
    ),
    "sku": MessageLookupByLibrary.simpleMessage("SKU"),
    "sliceHeight": MessageLookupByLibrary.simpleMessage(
      "Slice Height (pixels)",
    ),
    "smallResponsiveText": MessageLookupByLibrary.simpleMessage(
      "Small Responsive Text",
    ),
    "smallText": MessageLookupByLibrary.simpleMessage("Small Text"),
    "sms": MessageLookupByLibrary.simpleMessage("SMS"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("Sort By"),
    "sortByCreatedAt": MessageLookupByLibrary.simpleMessage("Created Date"),
    "sortByEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "sortByName": MessageLookupByLibrary.simpleMessage("Name"),
    "sortByUpdatedAt": MessageLookupByLibrary.simpleMessage("Updated Date"),
    "sortOrder": MessageLookupByLibrary.simpleMessage("Sort Order"),
    "startByAddingFirstUser": MessageLookupByLibrary.simpleMessage(
      "Start by adding your first user to the system",
    ),
    "startNow": MessageLookupByLibrary.simpleMessage("Start Now"),
    "state": MessageLookupByLibrary.simpleMessage("Status"),
    "statistics": MessageLookupByLibrary.simpleMessage("Statistics"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "statusCategory": m72,
    "statusCode": m73,
    "statusDraft": MessageLookupByLibrary.simpleMessage("Draft"),
    "statusInfo": MessageLookupByLibrary.simpleMessage("Status Info"),
    "statusOverdue": MessageLookupByLibrary.simpleMessage("Overdue"),
    "statusPaid": MessageLookupByLibrary.simpleMessage("Paid"),
    "statusPending": MessageLookupByLibrary.simpleMessage("Pending"),
    "statusRequired": MessageLookupByLibrary.simpleMessage(
      "Invoice status is required",
    ),
    "statusSent": MessageLookupByLibrary.simpleMessage("Sent"),
    "statusType": MessageLookupByLibrary.simpleMessage("Status Type"),
    "stop": MessageLookupByLibrary.simpleMessage("Stop"),
    "storageInformation": MessageLookupByLibrary.simpleMessage(
      "Storage Information",
    ),
    "subTitle": MessageLookupByLibrary.simpleMessage("Sub Title"),
    "subject": MessageLookupByLibrary.simpleMessage("Subject"),
    "subjectRequired": MessageLookupByLibrary.simpleMessage(
      "Subject is required",
    ),
    "subscriptionPackageSelectionPage": MessageLookupByLibrary.simpleMessage(
      "Subscription Packages Page",
    ),
    "subscriptionRequired": MessageLookupByLibrary.simpleMessage(
      "Subscription Required",
    ),
    "subscriptionRequiredAction": MessageLookupByLibrary.simpleMessage(
      "Choose Package",
    ),
    "subscriptionRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "You must choose a suitable subscription to use this feature",
    ),
    "subscriptionRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "Subscription Required",
    ),
    "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal:"),
    "subtotalLine": m74,
    "successText": MessageLookupByLibrary.simpleMessage("Success Text"),
    "summary": MessageLookupByLibrary.simpleMessage("Summary"),
    "supervisor": MessageLookupByLibrary.simpleMessage("Supervisor"),
    "supervisorDescription": MessageLookupByLibrary.simpleMessage(
      "Manages users and permissions",
    ),
    "supportEmail": MessageLookupByLibrary.simpleMessage("Support Email"),
    "suspended": MessageLookupByLibrary.simpleMessage("Suspended"),
    "systemAccess": MessageLookupByLibrary.simpleMessage("System Access"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "System Administrator",
    ),
    "systemAdministratorDescription": MessageLookupByLibrary.simpleMessage(
      "Has all permissions in the system",
    ),
    "systemNotifications": MessageLookupByLibrary.simpleMessage(
      "System Notifications",
    ),
    "systemNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Receive system and update notifications",
    ),
    "systemSettings": MessageLookupByLibrary.simpleMessage("System Settings"),
    "systemSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to edit system settings",
    ),
    "tablet": MessageLookupByLibrary.simpleMessage("Tablet"),
    "tax": MessageLookupByLibrary.simpleMessage("Tax"),
    "taxAmount": MessageLookupByLibrary.simpleMessage("Tax Amount:"),
    "taxIntegration": MessageLookupByLibrary.simpleMessage("Tax Integration"),
    "taxIntegrationNotActive": MessageLookupByLibrary.simpleMessage(
      "Tax integration is not active",
    ),
    "taxIntegrationNotActiveMessage": MessageLookupByLibrary.simpleMessage(
      "You have not activated tax integration. Please activate it from settings if you have permission to do so",
    ),
    "taxIntegrationSettings": MessageLookupByLibrary.simpleMessage(
      "Tax Integration Settings",
    ),
    "taxIntegrationStep1": MessageLookupByLibrary.simpleMessage(
      "1. Enable tax integration",
    ),
    "taxIntegrationStep2": MessageLookupByLibrary.simpleMessage(
      "2. Enter company tax information",
    ),
    "taxIntegrationStep3": MessageLookupByLibrary.simpleMessage(
      "3. Test connection and save settings",
    ),
    "taxInvoiceType": MessageLookupByLibrary.simpleMessage("Tax Invoice Type"),
    "taxInvoices": MessageLookupByLibrary.simpleMessage("Tax Invoices"),
    "taxInvoicesDesc": MessageLookupByLibrary.simpleMessage(
      "Unposted invoices & Postpaid invoices & Returned invoices & Create a new invoice",
    ),
    "taxInvoicesTitle": MessageLookupByLibrary.simpleMessage("Tax Invoices"),
    "taxLine": m75,
    "taxMerchantCode": MessageLookupByLibrary.simpleMessage(
      "Tax Merchant Code",
    ),
    "taxNumber": MessageLookupByLibrary.simpleMessage("Tax Number"),
    "taxPercent": MessageLookupByLibrary.simpleMessage("Tax Percent (%)"),
    "taxPercentMustBeGreaterThanOrEqualZero":
        MessageLookupByLibrary.simpleMessage(
          "Tax percent must be greater than or equal to zero",
        ),
    "taxPercentRequired": MessageLookupByLibrary.simpleMessage(
      "Tax percent is required",
    ),
    "taxRate": MessageLookupByLibrary.simpleMessage("Tax Rate"),
    "taxSettings": MessageLookupByLibrary.simpleMessage("Tax Settings"),
    "taxType": MessageLookupByLibrary.simpleMessage("Tax Type"),
    "taxUID": MessageLookupByLibrary.simpleMessage("Tax UID"),
    "taxUIDCopied": MessageLookupByLibrary.simpleMessage("Tax UID copied"),
    "taxUIDForInvoice": m76,
    "tekpart": MessageLookupByLibrary.simpleMessage("TekPart"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Terms of Use"),
    "termsOfUseComingSoon": MessageLookupByLibrary.simpleMessage(
      "Terms of Use Coming Soon",
    ),
    "testConnection": MessageLookupByLibrary.simpleMessage("Test Connection"),
    "testCustomer": MessageLookupByLibrary.simpleMessage("Test Customer"),
    "testPrint": MessageLookupByLibrary.simpleMessage("Test Print"),
    "testProduct1": MessageLookupByLibrary.simpleMessage("Test Product 1"),
    "testProduct2": MessageLookupByLibrary.simpleMessage("Test Product 2"),
    "testingConnection": MessageLookupByLibrary.simpleMessage(
      "Testing connection...",
    ),
    "textStyles": MessageLookupByLibrary.simpleMessage("Text Styles"),
    "thankYou": MessageLookupByLibrary.simpleMessage(
      "Thank you for your business",
    ),
    "thankYouMessage": MessageLookupByLibrary.simpleMessage(
      "Thank you for your business",
    ),
    "themeDemo": MessageLookupByLibrary.simpleMessage("Theme Demo"),
    "themeInfo": MessageLookupByLibrary.simpleMessage("Theme Information"),
    "thermalPrint": MessageLookupByLibrary.simpleMessage("Thermal Print"),
    "thermalPrintDesc": MessageLookupByLibrary.simpleMessage(
      "For thermal printers - 80mm",
    ),
    "thermalReceipt": MessageLookupByLibrary.simpleMessage("Thermal Receipt"),
    "thisField": MessageLookupByLibrary.simpleMessage("This field"),
    "thisFieldIsRequired": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "thisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
    "timeoutError": MessageLookupByLibrary.simpleMessage("Request timeout"),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "titleIsRequired": MessageLookupByLibrary.simpleMessage(
      "Title is required",
    ),
    "topSellingProducts": MessageLookupByLibrary.simpleMessage(
      "Top Selling Products",
    ),
    "total": MessageLookupByLibrary.simpleMessage("Total:"),
    "totalAmount": MessageLookupByLibrary.simpleMessage("Total Amount"),
    "totalCustomers": MessageLookupByLibrary.simpleMessage("Total Customers"),
    "totalExpenses": MessageLookupByLibrary.simpleMessage("Total Expenses"),
    "totalInvoices": MessageLookupByLibrary.simpleMessage("Total Invoices"),
    "totalLine": m77,
    "totalProducts": MessageLookupByLibrary.simpleMessage("Total Products"),
    "totalSales": MessageLookupByLibrary.simpleMessage("Total Sales"),
    "tourismEntertainmentCompany": MessageLookupByLibrary.simpleMessage(
      "Tourism & Entertainment Company",
    ),
    "trackAvailableProductQuantity": MessageLookupByLibrary.simpleMessage(
      "Track Available Product Quantity",
    ),
    "trackInventory": MessageLookupByLibrary.simpleMessage("Track Inventory"),
    "trackYourBusinessExpenses": MessageLookupByLibrary.simpleMessage(
      "Track your business expenses",
    ),
    "transportLogisticsCompany": MessageLookupByLibrary.simpleMessage(
      "Transport & Logistics Company",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "tryDifferentSearch": MessageLookupByLibrary.simpleMessage(
      "Try a different search",
    ),
    "tryDifferentSearchTerm": MessageLookupByLibrary.simpleMessage(
      "Try a different search term",
    ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "uae": MessageLookupByLibrary.simpleMessage("United Arab Emirates"),
    "unauthorizedError": MessageLookupByLibrary.simpleMessage(
      "Unauthorized access",
    ),
    "uncategorized": MessageLookupByLibrary.simpleMessage("Uncategorized"),
    "undefined": MessageLookupByLibrary.simpleMessage("Undefined"),
    "undefinedProduct": MessageLookupByLibrary.simpleMessage(
      "Undefined Product",
    ),
    "unit": MessageLookupByLibrary.simpleMessage("Unit"),
    "unknown": MessageLookupByLibrary.simpleMessage("(Unknown)"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred. Please try again.",
    ),
    "unknownUser": MessageLookupByLibrary.simpleMessage("Unknown User"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateCategory": MessageLookupByLibrary.simpleMessage("Update Category"),
    "updatePhoto": MessageLookupByLibrary.simpleMessage("Update Photo"),
    "updateStatus": MessageLookupByLibrary.simpleMessage("Update Status"),
    "updateYourProfileInformation": MessageLookupByLibrary.simpleMessage(
      "Update your profile information",
    ),
    "updatedAt": MessageLookupByLibrary.simpleMessage("Updated At"),
    "updatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Updated Successfully",
    ),
    "updatingStatus": MessageLookupByLibrary.simpleMessage(
      "Updating status...",
    ),
    "usb": MessageLookupByLibrary.simpleMessage("USB"),
    "user": MessageLookupByLibrary.simpleMessage("User"),
    "userAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "User added successfully",
    ),
    "userCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "User created successfully",
    ),
    "userCreatedSuccessfullyMessage": MessageLookupByLibrary.simpleMessage(
      "User created successfully",
    ),
    "userDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "User deleted successfully",
    ),
    "userDeletedSuccessfullyMessage": MessageLookupByLibrary.simpleMessage(
      "User deleted successfully",
    ),
    "userDescription": MessageLookupByLibrary.simpleMessage(
      "Limited permissions for viewing and reading",
    ),
    "userDetails": MessageLookupByLibrary.simpleMessage("User Details"),
    "userId": MessageLookupByLibrary.simpleMessage("User ID"),
    "userInformation": MessageLookupByLibrary.simpleMessage("User Information"),
    "userManagement": MessageLookupByLibrary.simpleMessage("User Management"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
    "userPermissions": MessageLookupByLibrary.simpleMessage("User Permissions"),
    "userSettings": MessageLookupByLibrary.simpleMessage("User settings"),
    "userSummary": MessageLookupByLibrary.simpleMessage("User Summary"),
    "userUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "User updated successfully",
    ),
    "userUpdatedSuccessfullyMessage": MessageLookupByLibrary.simpleMessage(
      "User updated successfully",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "usersActive": MessageLookupByLibrary.simpleMessage("Active"),
    "usersAdd": MessageLookupByLibrary.simpleMessage("Add"),
    "usersAddNewRole": MessageLookupByLibrary.simpleMessage("Add New Role"),
    "usersAndPermissionsDescription": MessageLookupByLibrary.simpleMessage(
      "View and manage users and their permissions",
    ),
    "usersAndPermissionsManagement": MessageLookupByLibrary.simpleMessage(
      "Users and Permissions Management",
    ),
    "usersAreYouSureYouWantToDeleteRole": m78,
    "usersAreYouSureYouWantToDeleteUser": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete user",
    ),
    "usersCannotDeleteAdmin": MessageLookupByLibrary.simpleMessage(
      "Cannot delete admin user",
    ),
    "usersCannotDeleteAdminMessage": MessageLookupByLibrary.simpleMessage(
      "Admin users cannot be deleted",
    ),
    "usersCannotDeleteYourself": MessageLookupByLibrary.simpleMessage(
      "Cannot delete your own account",
    ),
    "usersCannotDeleteYourselfMessage": MessageLookupByLibrary.simpleMessage(
      "You cannot delete your own account",
    ),
    "usersClients": MessageLookupByLibrary.simpleMessage("Clients"),
    "usersConfirmDelete": MessageLookupByLibrary.simpleMessage(
      "Confirm Delete",
    ),
    "usersCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "usersDeleteUser": MessageLookupByLibrary.simpleMessage("Delete User"),
    "usersDeleteUserPermanently": MessageLookupByLibrary.simpleMessage(
      "Delete user permanently",
    ),
    "usersEditRole": MessageLookupByLibrary.simpleMessage("Edit Role"),
    "usersEditUser": MessageLookupByLibrary.simpleMessage("Edit User"),
    "usersEditUserInformation": MessageLookupByLibrary.simpleMessage(
      "Edit user information",
    ),
    "usersEmailRequired": MessageLookupByLibrary.simpleMessage(
      "Email is required",
    ),
    "usersExpenses": MessageLookupByLibrary.simpleMessage("Expenses"),
    "usersInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "usersInvoices": MessageLookupByLibrary.simpleMessage("Invoices"),
    "usersList": MessageLookupByLibrary.simpleMessage("Users List"),
    "usersManagePermissions": MessageLookupByLibrary.simpleMessage(
      "Manage Permissions",
    ),
    "usersManageRolesAndPermissions": MessageLookupByLibrary.simpleMessage(
      "Manage roles and permissions",
    ),
    "usersManagement": MessageLookupByLibrary.simpleMessage(
      "Users and Permissions",
    ),
    "usersManagementTitle": MessageLookupByLibrary.simpleMessage(
      "Users Management",
    ),
    "usersModule": MessageLookupByLibrary.simpleMessage("Module"),
    "usersModulePermissions": MessageLookupByLibrary.simpleMessage(
      "Permissions",
    ),
    "usersNameRequired": MessageLookupByLibrary.simpleMessage(
      "Name is required",
    ),
    "usersNoEmail": MessageLookupByLibrary.simpleMessage("No email"),
    "usersNoName": MessageLookupByLibrary.simpleMessage("No name"),
    "usersNoPermissionToAct": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to perform this action",
    ),
    "usersNoPermissionToView": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to view this content",
    ),
    "usersNoPermissionsForThisModule": MessageLookupByLibrary.simpleMessage(
      "No permissions for this module",
    ),
    "usersNoRole": MessageLookupByLibrary.simpleMessage("No role"),
    "usersPasswordMustBeAtLeast6Characters":
        MessageLookupByLibrary.simpleMessage(
          "Password must be at least 6 characters",
        ),
    "usersPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "usersPasswordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "usersPermissions": MessageLookupByLibrary.simpleMessage("Permissions"),
    "usersPermissionsDesc": MessageLookupByLibrary.simpleMessage(
      "Control of clients and permissions",
    ),
    "usersPermissionsTitle": MessageLookupByLibrary.simpleMessage(
      "Users and Permissions",
    ),
    "usersPleaseConfirmYourPassword": MessageLookupByLibrary.simpleMessage(
      "Please confirm your password",
    ),
    "usersPleaseEnterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "usersProducts": MessageLookupByLibrary.simpleMessage("Products"),
    "usersReports": MessageLookupByLibrary.simpleMessage("Reports"),
    "usersRoleAccountant": MessageLookupByLibrary.simpleMessage("Accountant"),
    "usersRoleAdmin": MessageLookupByLibrary.simpleMessage("Admin"),
    "usersRoleDescription": MessageLookupByLibrary.simpleMessage(
      "Role Description",
    ),
    "usersRoleName": MessageLookupByLibrary.simpleMessage("Role Name"),
    "usersRoleSupervisor": MessageLookupByLibrary.simpleMessage("Supervisor"),
    "usersRoleUser": MessageLookupByLibrary.simpleMessage("User"),
    "usersRoles": MessageLookupByLibrary.simpleMessage("Roles"),
    "usersSelectModule": MessageLookupByLibrary.simpleMessage("Select Module"),
    "usersSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "usersStatusActive": MessageLookupByLibrary.simpleMessage("Active"),
    "usersStatusInactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "usersThisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "This action cannot be undone.",
    ),
    "usersTotalPermissions": MessageLookupByLibrary.simpleMessage(
      "Total Permissions",
    ),
    "usersUndefined": MessageLookupByLibrary.simpleMessage("Undefined"),
    "usersUnknownStatus": MessageLookupByLibrary.simpleMessage("Unknown"),
    "usersUnknownUser": MessageLookupByLibrary.simpleMessage("Unknown User"),
    "usersUsers": MessageLookupByLibrary.simpleMessage("Users"),
    "usersViewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
    "usersViewUserDetails": MessageLookupByLibrary.simpleMessage(
      "View user details",
    ),
    "usingDefaultLogo": MessageLookupByLibrary.simpleMessage(
      "Using default logo",
    ),
    "validationError": MessageLookupByLibrary.simpleMessage(
      "Data validation error",
    ),
    "vat": MessageLookupByLibrary.simpleMessage("VAT"),
    "vatNumber": MessageLookupByLibrary.simpleMessage("VAT Number"),
    "verifyCode": MessageLookupByLibrary.simpleMessage("Verify Code"),
    "verifyCodeDesc": m79,
    "verifyCodeTitle": MessageLookupByLibrary.simpleMessage("Verify Code"),
    "verifyTokenIsRequired": MessageLookupByLibrary.simpleMessage(
      "Verify token is required",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "view": MessageLookupByLibrary.simpleMessage("View"),
    "viewAllInvoices": MessageLookupByLibrary.simpleMessage(
      "View All Invoices",
    ),
    "viewClients": MessageLookupByLibrary.simpleMessage("View Clients"),
    "viewClientsDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to view clients list",
    ),
    "viewCustomer": MessageLookupByLibrary.simpleMessage("View Customer"),
    "viewCustomerDetails": m80,
    "viewCustomers": MessageLookupByLibrary.simpleMessage("View Customers"),
    "viewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
    "viewExpenses": MessageLookupByLibrary.simpleMessage("View Expenses"),
    "viewExpensesDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to view expenses list",
    ),
    "viewInvoices": MessageLookupByLibrary.simpleMessage("View Invoices"),
    "viewInvoicesDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to view invoices list",
    ),
    "viewItemDetails": m81,
    "viewPrivacyPolicy": MessageLookupByLibrary.simpleMessage(
      "View privacy policy",
    ),
    "viewProducts": MessageLookupByLibrary.simpleMessage("View Products"),
    "viewProductsDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to view products list",
    ),
    "viewQRCode": MessageLookupByLibrary.simpleMessage("View QR Code"),
    "viewReports": MessageLookupByLibrary.simpleMessage("View Reports"),
    "viewReportsAndStatistics": MessageLookupByLibrary.simpleMessage(
      "View reports and statistics",
    ),
    "viewReportsDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to view reports",
    ),
    "viewReportsStatistics": MessageLookupByLibrary.simpleMessage(
      "View reports and statistics",
    ),
    "viewTaxUID": MessageLookupByLibrary.simpleMessage("View Tax UID"),
    "viewTermsOfUse": MessageLookupByLibrary.simpleMessage("View terms of use"),
    "viewUserDetails": MessageLookupByLibrary.simpleMessage(
      "View user details",
    ),
    "viewUsers": MessageLookupByLibrary.simpleMessage("View Users"),
    "viewUsersDescription": MessageLookupByLibrary.simpleMessage(
      "Ability to view users list",
    ),
    "viewer": MessageLookupByLibrary.simpleMessage("Viewer"),
    "viewingInvoices": m82,
    "viewingOrders": m83,
    "visitInvotekWebsite": MessageLookupByLibrary.simpleMessage(
      "Visit Invotek website",
    ),
    "website": MessageLookupByLibrary.simpleMessage("Website"),
    "weight": MessageLookupByLibrary.simpleMessage("Weight"),
    "welcome": MessageLookupByLibrary.simpleMessage("WELCOME!"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back, 👋"),
    "welcomeBackWithName": m84,
    "welcomeToInvotek": MessageLookupByLibrary.simpleMessage(
      "Welcome to Invotek App",
    ),
    "welcomeToInvotekApp": MessageLookupByLibrary.simpleMessage(
      "Welcome to Invotek app",
    ),
    "whatsapp": MessageLookupByLibrary.simpleMessage("WhatsApp"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "yesDeleteAccount": MessageLookupByLibrary.simpleMessage(
      "Yes, delete my account",
    ),
    "youHaveNewNotification": m85,
  };
}
