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

  static String m0(name) =>
      "Are you sure you want to delete customer \"${name}\"?";

  static String m1(name) => "Customer \"${name}\" created successfully";

  static String m2(name) => "Customer \"${name}\" updated successfully";

  static String m3(name) =>
      "Are you sure you want to delete customer \"${name}\"?";

  static String m4(name) =>
      "Are you sure you want to delete product \"${name}\"?";

  static String m5(name) => "Are you sure you want to delete user ${name}?";

  static String m6(error) => "An error occurred: ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "addANewUser": MessageLookupByLibrary.simpleMessage("Add a new user"),
        "addCategory": MessageLookupByLibrary.simpleMessage("Add Category"),
        "addClient": MessageLookupByLibrary.simpleMessage("Add New Client"),
        "addCustomer": MessageLookupByLibrary.simpleMessage("Add Customer"),
        "addExpense": MessageLookupByLibrary.simpleMessage("Add New Expense"),
        "addNewCustomer":
            MessageLookupByLibrary.simpleMessage("Add New Customer"),
        "addNewUserMessage": MessageLookupByLibrary.simpleMessage(
            "Press the add button to create a new user"),
        "addProduct": MessageLookupByLibrary.simpleMessage("Add New Product"),
        "addUser": MessageLookupByLibrary.simpleMessage("Add New User"),
        "additionalInformation":
            MessageLookupByLibrary.simpleMessage("Additional Information"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Additional Settings"),
        "addressInformation":
            MessageLookupByLibrary.simpleMessage("Address Information"),
        "admin": MessageLookupByLibrary.simpleMessage("Admin"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "allCategories": MessageLookupByLibrary.simpleMessage("All Categories"),
        "allStatuses": MessageLookupByLibrary.simpleMessage("All Statuses"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "applyTaxToProduct":
            MessageLookupByLibrary.simpleMessage("Apply Tax to Product"),
        "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
        "authError": MessageLookupByLibrary.simpleMessage(
            "Login failed. Please check your email and password."),
        "backup": MessageLookupByLibrary.simpleMessage("Backup"),
        "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
        "basicInformation":
            MessageLookupByLibrary.simpleMessage("Basic Information"),
        "brand": MessageLookupByLibrary.simpleMessage("Brand"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "categoriesAppbar":
            MessageLookupByLibrary.simpleMessage("Product Categories"),
        "category": MessageLookupByLibrary.simpleMessage("Category"),
        "categoryAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Category added successfully"),
        "categoryDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Category deleted successfully"),
        "categoryUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Category updated successfully"),
        "centimeters": MessageLookupByLibrary.simpleMessage("cm"),
        "chooseFeature": MessageLookupByLibrary.simpleMessage(
            "Choose the feature you want to manage"),
        "clearFilters": MessageLookupByLibrary.simpleMessage("Clear Filters"),
        "clientsList": MessageLookupByLibrary.simpleMessage("Clients List"),
        "clientsProducts":
            MessageLookupByLibrary.simpleMessage("Clients and Products"),
        "clientsProductsDesc": MessageLookupByLibrary.simpleMessage(
            "Control of clients and products"),
        "clientsProductsTitle":
            MessageLookupByLibrary.simpleMessage("Clients and Products"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "color": MessageLookupByLibrary.simpleMessage("Color"),
        "company": MessageLookupByLibrary.simpleMessage("Company"),
        "companySettings":
            MessageLookupByLibrary.simpleMessage("Company Settings"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage("Confirm Delete"),
        "confirmDeleteCustomer":
            MessageLookupByLibrary.simpleMessage("Confirm Delete"),
        "confirmDeleteCustomerMessage": m0,
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
            "Confirm password is required"),
        "contactInfo": MessageLookupByLibrary.simpleMessage("Contact Info"),
        "copy": MessageLookupByLibrary.simpleMessage("Copy"),
        "costPrice": MessageLookupByLibrary.simpleMessage("Cost Price"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Create an account"),
        "createInvoice":
            MessageLookupByLibrary.simpleMessage("Create New Invoice"),
        "createdDate": MessageLookupByLibrary.simpleMessage("Created"),
        "customerAdditionalInfo":
            MessageLookupByLibrary.simpleMessage("Additional Information"),
        "customerAddress": MessageLookupByLibrary.simpleMessage("Address"),
        "customerBasicInfo":
            MessageLookupByLibrary.simpleMessage("Customer Information"),
        "customerBasicInfoSection":
            MessageLookupByLibrary.simpleMessage("Basic Information"),
        "customerCity": MessageLookupByLibrary.simpleMessage("City"),
        "customerCommercialRegister":
            MessageLookupByLibrary.simpleMessage("Commercial Register Number"),
        "customerCompanyName":
            MessageLookupByLibrary.simpleMessage("Company/Organization Name"),
        "customerCreatedSuccessfully": m1,
        "customerDataCopied": MessageLookupByLibrary.simpleMessage(
            "Customer data copied to clipboard"),
        "customerDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Customer deleted successfully"),
        "customerDetailedAddress":
            MessageLookupByLibrary.simpleMessage("Detailed Address"),
        "customerDetails":
            MessageLookupByLibrary.simpleMessage("Customer Details"),
        "customerEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "customerName": MessageLookupByLibrary.simpleMessage("Customer Name"),
        "customerNameRequired":
            MessageLookupByLibrary.simpleMessage("Customer name is required"),
        "customerNotes": MessageLookupByLibrary.simpleMessage("Notes"),
        "customerPhone": MessageLookupByLibrary.simpleMessage("Phone Number"),
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
        "customerUpdatedSuccessfully": m2,
        "customers": MessageLookupByLibrary.simpleMessage("Customers"),
        "customersList": MessageLookupByLibrary.simpleMessage("Customers List"),
        "customersReport":
            MessageLookupByLibrary.simpleMessage("Customers Report"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteConfirmation":
            MessageLookupByLibrary.simpleMessage("Delete Confirmation"),
        "deleteCustomer":
            MessageLookupByLibrary.simpleMessage("Delete Customer"),
        "deleteCustomerConfirmation": m3,
        "deleteProduct": MessageLookupByLibrary.simpleMessage("Delete Product"),
        "deleteProductConfirmation": m4,
        "deleteUserConfirmation": m5,
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "dimensions": MessageLookupByLibrary.simpleMessage("Dimensions"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "editCategory": MessageLookupByLibrary.simpleMessage("Edit Category"),
        "editCustomer": MessageLookupByLibrary.simpleMessage("Edit Customer"),
        "editProduct": MessageLookupByLibrary.simpleMessage("Edit Product"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailInvalid":
            MessageLookupByLibrary.simpleMessage("Invalid email format"),
        "emailRequired":
            MessageLookupByLibrary.simpleMessage("Email is required"),
        "enableDisableProduct":
            MessageLookupByLibrary.simpleMessage("Enable/Disable Product"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
        "enterFullName":
            MessageLookupByLibrary.simpleMessage("Enter full name"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("Enter password"),
        "enterPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Enter phone number"),
        "errorAddingCategory":
            MessageLookupByLibrary.simpleMessage("Error adding category"),
        "errorAddingProduct":
            MessageLookupByLibrary.simpleMessage("Error adding product"),
        "errorCreatingUser":
            MessageLookupByLibrary.simpleMessage("Error creating user: \$e"),
        "errorDeletingCategory":
            MessageLookupByLibrary.simpleMessage("Error deleting category"),
        "errorDeletingProduct":
            MessageLookupByLibrary.simpleMessage("Error deleting product"),
        "errorDeletingUser":
            MessageLookupByLibrary.simpleMessage("Error deleting user"),
        "errorLoadingUsers":
            MessageLookupByLibrary.simpleMessage("Error loading users"),
        "errorOccurred": m6,
        "errorParsingUserData":
            MessageLookupByLibrary.simpleMessage("Error parsing user data"),
        "errorUpdatingCategory":
            MessageLookupByLibrary.simpleMessage("Error updating category"),
        "errorUpdatingProduct":
            MessageLookupByLibrary.simpleMessage("Error updating product"),
        "exitAppConfirmation": MessageLookupByLibrary.simpleMessage("Exit App"),
        "exitAppConfirmationMessage": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to exit the app?"),
        "expenseCategories":
            MessageLookupByLibrary.simpleMessage("Expense Categories"),
        "expenses": MessageLookupByLibrary.simpleMessage("Expenses"),
        "expensesDesc": MessageLookupByLibrary.simpleMessage(
            "Expense categories & Expense management"),
        "expensesList": MessageLookupByLibrary.simpleMessage("Expenses List"),
        "expensesReport":
            MessageLookupByLibrary.simpleMessage("Expenses Report"),
        "expensesTitle": MessageLookupByLibrary.simpleMessage("Expenses"),
        "failedToUpdateUser":
            MessageLookupByLibrary.simpleMessage("Failed to update user"),
        "fillTheFormBelowToAddANewUserTo": MessageLookupByLibrary.simpleMessage(
            "Fill the form below to add a new user to the system"),
        "formHelpDescription": MessageLookupByLibrary.simpleMessage(
            "This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information"),
        "formHelpTitle":
            MessageLookupByLibrary.simpleMessage("Edit Customer Form"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "hasTax": MessageLookupByLibrary.simpleMessage("Has Tax"),
        "haveAccountLogin":
            MessageLookupByLibrary.simpleMessage("Have an account? Login"),
        "help": MessageLookupByLibrary.simpleMessage("Help"),
        "inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
        "invalidNumber": MessageLookupByLibrary.simpleMessage("Invalid number"),
        "inventory": MessageLookupByLibrary.simpleMessage("Inventory"),
        "inventorySettings":
            MessageLookupByLibrary.simpleMessage("Inventory Settings"),
        "invoicesList": MessageLookupByLibrary.simpleMessage("Invoices List"),
        "isActive": MessageLookupByLibrary.simpleMessage("Is Active"),
        "kilogram": MessageLookupByLibrary.simpleMessage("kg"),
        "lastUpdated": MessageLookupByLibrary.simpleMessage("Last Updated"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "loggingIn": MessageLookupByLibrary.simpleMessage("Logging in..."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginLoadin": MessageLookupByLibrary.simpleMessage("Logging in..."),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("Login successful"),
        "loginSuccessfully":
            MessageLookupByLibrary.simpleMessage("Login successful"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "lowStockAlert":
            MessageLookupByLibrary.simpleMessage("Low Stock Alert"),
        "managePermissions":
            MessageLookupByLibrary.simpleMessage("Manage Permissions"),
        "manageProducts":
            MessageLookupByLibrary.simpleMessage("Manage Products"),
        "manager": MessageLookupByLibrary.simpleMessage("Manager"),
        "material": MessageLookupByLibrary.simpleMessage("Material"),
        "maximumQuantity":
            MessageLookupByLibrary.simpleMessage("Maximum Quantity"),
        "meter": MessageLookupByLibrary.simpleMessage("m"),
        "minimumQuantity":
            MessageLookupByLibrary.simpleMessage("Minimum Quantity"),
        "model": MessageLookupByLibrary.simpleMessage("Model"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameInvalid": MessageLookupByLibrary.simpleMessage(
            "Name must contain only letters"),
        "nameRequired":
            MessageLookupByLibrary.simpleMessage("Name is required"),
        "nameShort": MessageLookupByLibrary.simpleMessage(
            "Name must be at least 2 characters"),
        "networkError": MessageLookupByLibrary.simpleMessage(
            "Network connection error. Please check your connection and try again."),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noCustomersFound":
            MessageLookupByLibrary.simpleMessage("No customers found"),
        "noCustomersFoundMessage": MessageLookupByLibrary.simpleMessage(
            "Press the add button to create a new customer"),
        "noDataReceived": MessageLookupByLibrary.simpleMessage(
            "No data received from server"),
        "noHaveAccountRejester": MessageLookupByLibrary.simpleMessage(
            "Don\'t have an account? Create new account"),
        "noName": MessageLookupByLibrary.simpleMessage("No Name"),
        "noProductsFound":
            MessageLookupByLibrary.simpleMessage("No products found"),
        "noUsersFound": MessageLookupByLibrary.simpleMessage("No users found"),
        "notAMember": MessageLookupByLibrary.simpleMessage("Not a member?"),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
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
        "outOfStock": MessageLookupByLibrary.simpleMessage("Out of Stock"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("Password is required"),
        "passwordShort": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 6 characters"),
        "passwordWeak": MessageLookupByLibrary.simpleMessage(
            "Password must contain uppercase, lowercase and number"),
        "passwordsNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "personalInformation":
            MessageLookupByLibrary.simpleMessage("Personal Information"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "piece": MessageLookupByLibrary.simpleMessage("Piece"),
        "postedInvoices":
            MessageLookupByLibrary.simpleMessage("Posted Invoices"),
        "previous": MessageLookupByLibrary.simpleMessage("Previous"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "pricing": MessageLookupByLibrary.simpleMessage("Pricing"),
        "productAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Product added successfully"),
        "productCategories":
            MessageLookupByLibrary.simpleMessage("Product Categories"),
        "productDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Product deleted successfully"),
        "productDetails":
            MessageLookupByLibrary.simpleMessage("Product Details"),
        "productIsActive":
            MessageLookupByLibrary.simpleMessage("Product is Active"),
        "productIsTaxable":
            MessageLookupByLibrary.simpleMessage("Product is Taxable"),
        "productSku": MessageLookupByLibrary.simpleMessage("Product SKU"),
        "productUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Product updated successfully"),
        "products": MessageLookupByLibrary.simpleMessage("Products"),
        "productsCategories":
            MessageLookupByLibrary.simpleMessage("Products And Categories"),
        "productsList": MessageLookupByLibrary.simpleMessage("Products List"),
        "productsReport":
            MessageLookupByLibrary.simpleMessage("Products Report"),
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "quantityMustBeAPositiveInteger": MessageLookupByLibrary.simpleMessage(
            "Quantity must be a positive integer"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerSuccess": MessageLookupByLibrary.simpleMessage(
            "Registration successful! Please login."),
        "registering": MessageLookupByLibrary.simpleMessage("Registering..."),
        "rejester": MessageLookupByLibrary.simpleMessage("Login"),
        "rejesterLoading":
            MessageLookupByLibrary.simpleMessage("Logging in..."),
        "rejesterSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Registration successful! Please login."),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "returnedInvoices":
            MessageLookupByLibrary.simpleMessage("Returned Invoices"),
        "role": MessageLookupByLibrary.simpleMessage("Role"),
        "rule": MessageLookupByLibrary.simpleMessage("Role"),
        "salesReport": MessageLookupByLibrary.simpleMessage("Sales Report"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "searchCustomers":
            MessageLookupByLibrary.simpleMessage("Search customers..."),
        "searchForUser":
            MessageLookupByLibrary.simpleMessage("Search for user..."),
        "searchProducts":
            MessageLookupByLibrary.simpleMessage("Search products..."),
        "securityInformation":
            MessageLookupByLibrary.simpleMessage("Security Information"),
        "selectCategory":
            MessageLookupByLibrary.simpleMessage("Select Category"),
        "sellingPrice": MessageLookupByLibrary.simpleMessage("Selling Price"),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "Server error. Please try again later."),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Sign in with Google"),
        "sku": MessageLookupByLibrary.simpleMessage("SKU"),
        "startNow": MessageLookupByLibrary.simpleMessage("Start Now"),
        "state": MessageLookupByLibrary.simpleMessage("Status"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "statusInfo": MessageLookupByLibrary.simpleMessage("Status Info"),
        "systemSettings":
            MessageLookupByLibrary.simpleMessage("System Settings"),
        "taxInvoices": MessageLookupByLibrary.simpleMessage("Tax invoices"),
        "taxInvoicesDesc": MessageLookupByLibrary.simpleMessage(
            "Unposted invoices & Postpaid invoices & Returned invoices & Create a new invoice"),
        "taxInvoicesTitle":
            MessageLookupByLibrary.simpleMessage("Tax Invoices"),
        "taxRate": MessageLookupByLibrary.simpleMessage("Tax Rate"),
        "taxSettings": MessageLookupByLibrary.simpleMessage("Tax Settings"),
        "tekpart": MessageLookupByLibrary.simpleMessage("TekPart"),
        "thisFieldIsRequired":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "trackAvailableProductQuantity": MessageLookupByLibrary.simpleMessage(
            "Track Available Product Quantity"),
        "trackInventory":
            MessageLookupByLibrary.simpleMessage("Track Inventory"),
        "undefined": MessageLookupByLibrary.simpleMessage("Undefined"),
        "unit": MessageLookupByLibrary.simpleMessage("Unit"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred. Please try again."),
        "user": MessageLookupByLibrary.simpleMessage("User"),
        "userAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("User added successfully"),
        "userCreatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("User created successfully"),
        "userDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("User deleted successfully"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
        "userSettings": MessageLookupByLibrary.simpleMessage("User settings"),
        "userUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("User updated successfully"),
        "usersAndPermissionsDescription": MessageLookupByLibrary.simpleMessage(
            "View and manage users and their permissions"),
        "usersAndPermissionsManagement": MessageLookupByLibrary.simpleMessage(
            "Users and Permissions Management"),
        "usersList": MessageLookupByLibrary.simpleMessage("Users List"),
        "usersPermissions":
            MessageLookupByLibrary.simpleMessage("Users and Permissions"),
        "usersPermissionsDesc": MessageLookupByLibrary.simpleMessage(
            "Control of clients and permissions"),
        "usersPermissionsTitle":
            MessageLookupByLibrary.simpleMessage("Users and Permissions"),
        "validationError": MessageLookupByLibrary.simpleMessage(
            "Please check the entered data"),
        "view": MessageLookupByLibrary.simpleMessage("View"),
        "viewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
        "weight": MessageLookupByLibrary.simpleMessage("Weight"),
        "welcome": MessageLookupByLibrary.simpleMessage("WELCOME!"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
