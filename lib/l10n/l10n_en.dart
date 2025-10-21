// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'WELCOME!';

  @override
  String get tekpart => 'TekPart';

  @override
  String get password => 'Password';

  @override
  String get email => 'Email';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get fullName => 'Full Name';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account?';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Invalid email';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordShort => 'Password must be at least 6 characters';

  @override
  String get passwordWeak =>
      'Password must contain uppercase, lowercase and number';

  @override
  String get confirmPasswordRequired => 'Password confirmation is required';

  @override
  String get passwordsNotMatch => 'Passwords do not match';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get nameShort => 'Name must be at least 2 characters';

  @override
  String get nameInvalid => 'Name must contain only letters';

  @override
  String get validationError => 'Please check the entered data';

  @override
  String get networkError => 'Network error';

  @override
  String get serverError => 'Server error. Please try again later.';

  @override
  String get authError => 'Login failed. Please check your email and password.';

  @override
  String get unknownError => 'An unexpected error occurred. Please try again.';

  @override
  String get loading => 'Loading...';

  @override
  String get loggingIn => 'Logging in...';

  @override
  String get registering => 'Registering...';

  @override
  String get close => 'Close';

  @override
  String get loginSuccess => 'Login successful';

  @override
  String get registerSuccess => 'Registration successful! Please login.';

  @override
  String get usersPermissions => 'Users and Permissions';

  @override
  String get usersPermissionsDesc => 'Control of clients and permissions';

  @override
  String get clientsProducts => 'Clients and Products';

  @override
  String get clientsProductsDesc => 'Control of clients and products';

  @override
  String get expenses => 'Expenses';

  @override
  String get expensesDesc => 'Expense categories & Expense management';

  @override
  String get taxInvoices => 'Tax Invoices';

  @override
  String get taxInvoicesDesc =>
      'Unposted invoices & Postpaid invoices & Returned invoices & Create a new invoice';

  @override
  String get loginSuccessfully => 'Login successful';

  @override
  String get rejesterSuccessfully => 'Registration successful! Please login.';

  @override
  String get loginLoadin => 'Logging in...';

  @override
  String get rejester => 'Login';

  @override
  String get rejesterLoading => 'Logging in...';

  @override
  String get haveAccountLogin => 'Have an account? Login';

  @override
  String get noHaveAccountRejester =>
      'Don\'t have an account? Create new account';

  @override
  String get signIn => 'Sign in';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get notAMember => 'Not a member?';

  @override
  String get createAnAccount => 'Create an account';

  @override
  String get onboardingWelcome => 'Welcome to Invotek';

  @override
  String get onboardingWelcomeDesc =>
      'Integrated system for electronic invoice management with integration with the Jordanian national billing system';

  @override
  String get onboardingUsers => 'User and Permission Management';

  @override
  String get onboardingUsersDesc =>
      'Complete control over users and their permissions within the company';

  @override
  String get onboardingClients => 'Client and Product Management';

  @override
  String get onboardingClientsDesc =>
      'Comprehensive management of clients and products with inventory tracking';

  @override
  String get onboardingExpenses => 'Expense Management';

  @override
  String get onboardingExpensesDesc =>
      'Track and manage expenses with multiple categories';

  @override
  String get onboardingInvoices => 'Tax Invoices';

  @override
  String get onboardingInvoicesDesc =>
      'Create and manage tax invoices with integration with the national invoice system';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get startNow => 'Start Now';

  @override
  String get chooseFeature => 'Choose the feature you want to manage';

  @override
  String get usersPermissionsTitle => 'Users and Permissions';

  @override
  String get clientsProductsTitle => 'Clients and Products';

  @override
  String get expensesTitle => 'Expenses';

  @override
  String get taxInvoicesTitle => 'Tax Invoices';

  @override
  String get logout => 'Logout';

  @override
  String get usersList => 'Users List';

  @override
  String get addUser => 'Add User';

  @override
  String get managePermissions => 'Manage Permissions';

  @override
  String get clientsList => 'Clients List';

  @override
  String get addClient => 'Add Client';

  @override
  String get manageProducts => 'Manage Products';

  @override
  String get productCategories => 'Product Categories';

  @override
  String get expensesList => 'Expenses List';

  @override
  String get addExpense => 'Add Expense';

  @override
  String get expenseCategories => 'Expense Categories';

  @override
  String get invoicesList => 'Invoices List';

  @override
  String get createInvoice => 'Create Invoice';

  @override
  String get postedInvoices => 'Posted Invoices';

  @override
  String get returnedInvoices => 'Returned Invoices';

  @override
  String get salesReport => 'Sales Report';

  @override
  String get expensesReport => 'Expenses Report';

  @override
  String get newExpense => 'New Expense';

  @override
  String get trackYourBusinessExpenses => 'Track your business expenses';

  @override
  String get basicInformation => 'Basic Information';

  @override
  String get expenseTitle => 'Expense Title';

  @override
  String get expenseTitleHint => 'e.g., Office supplies, Travel expenses';

  @override
  String get titleIsRequired => 'Title is required';

  @override
  String get description => 'Description';

  @override
  String get descriptionHint => 'Add more details about this expense';

  @override
  String get financialDetails => 'Financial Details';

  @override
  String get amount => 'Amount';

  @override
  String get amountHint => '0.00';

  @override
  String get amountHelperText => 'Enter the total amount spent including tax';

  @override
  String get amountIsRequired => 'Amount is required';

  @override
  String get pleaseEnterValidAmount => 'Please enter a valid amount';

  @override
  String get additionalInformation => 'Additional Information';

  @override
  String get referenceNumber => 'Reference Number';

  @override
  String get referenceNumberHint => 'Invoice number, receipt ID, etc.';

  @override
  String get notes => 'Notes';

  @override
  String get notesHint => 'Any additional information or context';

  @override
  String get createExpense => 'Create Expense';

  @override
  String get expenseCreatedSuccessfully => 'Expense created successfully!';

  @override
  String get pleaseSelectCategory => 'Please select a category';

  @override
  String get completeRequiredFields => 'Complete required fields';

  @override
  String get customersReport => 'Customers Report';

  @override
  String get productsReport => 'Products Report';

  @override
  String get companySettings => 'Company Settings';

  @override
  String get systemSettings => 'System Settings';

  @override
  String get backup => 'Backup';

  @override
  String get userAddedSuccessfully => 'User added successfully';

  @override
  String get errorCreatingUser => 'Error creating user: \$e';

  @override
  String get cancel => 'Cancel';

  @override
  String get usersAndPermissionsManagement =>
      'Users and Permissions Management';

  @override
  String get usersAndPermissionsDescription =>
      'View and manage users and their permissions';

  @override
  String get searchForUser => 'Search for user...';

  @override
  String get status => 'Status';

  @override
  String get role => 'Role';

  @override
  String get all => 'All';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get admin => 'Admin';

  @override
  String get user => 'User';

  @override
  String get manager => 'Manager';

  @override
  String get noUsersFound => 'No users found';

  @override
  String get addNewUserMessage => 'Press the add button to create a new user';

  @override
  String get retry => 'Retry';

  @override
  String get deleteConfirmation => 'Delete Confirmation';

  @override
  String deleteUserConfirmation(String name) {
    return 'Are you sure you want to delete user $name?';
  }

  @override
  String get delete => 'Delete';

  @override
  String get fillTheFormBelowToAddANewUserTo =>
      'Fill the form below to add a new user to the system';

  @override
  String get addANewUser => 'Add a new user';

  @override
  String get state => 'Status';

  @override
  String get rule => 'Role';

  @override
  String get userSettings => 'User settings';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get securityInformation => 'Security Information';

  @override
  String get enterFullName => 'Enter full name';

  @override
  String get enterEmail => 'Enter email';

  @override
  String get enterPhoneNumber => 'Enter phone number';

  @override
  String get enterPassword => 'Enter password';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get noDataReceived => 'No data received from server';

  @override
  String get cannotEditInvoice => 'Cannot Edit Invoice';

  @override
  String get invoiceAlreadySent => 'Invoice Already Sent';

  @override
  String get cannotEditSentInvoice => 'Cannot edit sent invoices';

  @override
  String get noData => 'No data';

  @override
  String get selectCustomer => 'Select Customer';

  @override
  String get searchCustomers => 'Search customers';

  @override
  String get loadingCustomers => 'Loading customers...';

  @override
  String get errorLoadingCustomers => 'Error loading customers';

  @override
  String get noCustomersFound => 'No customers found';

  @override
  String get noCustomersMatchSearch => 'No customers match your search';

  @override
  String get addFirstCustomer => 'Add first customer';

  @override
  String get tryDifferentSearch => 'Try a different search';

  @override
  String get addNewCustomer => 'Add New Customer';

  @override
  String get companyInformation => 'Company Information';

  @override
  String get companyName => 'Company Name';

  @override
  String get enterCompanyName => 'Enter company name';

  @override
  String get address => 'Address';

  @override
  String get enterAddress => 'Enter address';

  @override
  String get errorCreatingCustomer => 'Error creating customer';

  @override
  String get selectProduct => 'Select Product';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get loadingProducts => 'Loading products...';

  @override
  String get errorLoadingProducts => 'Error loading products';

  @override
  String get noProductsFound => 'No products found';

  @override
  String get noProductsMatchSearch => 'No products match search';

  @override
  String get addFirstProduct => 'Add first product';

  @override
  String get addNewProduct => 'Add New Product';

  @override
  String get productName => 'Product Name';

  @override
  String get enterProductName => 'Enter product name';

  @override
  String get sku => 'SKU';

  @override
  String get enterSku => 'Enter SKU';

  @override
  String get pricingInformation => 'Pricing Information';

  @override
  String get price => 'Price';

  @override
  String get enterPrice => 'Enter price';

  @override
  String get priceRequired => 'Price is required';

  @override
  String get invalidPrice => 'Invalid price';

  @override
  String get quantity => 'Quantity';

  @override
  String get enterQuantity => 'Enter quantity';

  @override
  String get quantityRequired => 'Quantity is required';

  @override
  String get invalidQuantity => 'Invalid quantity';

  @override
  String get errorCreatingProduct => 'Error creating product';

  @override
  String get invoiceItems => 'Invoice Items';

  @override
  String get items => 'Items';

  @override
  String get noItemsAdded => 'No items added yet';

  @override
  String get addItemsToInvoice => 'Add items to invoice';

  @override
  String get manualItem => 'Manual Item';

  @override
  String get discount => 'Discount';

  @override
  String get addFromProducts => 'Add from Products';

  @override
  String get addManualItem => 'Add Manual Item';

  @override
  String get customerSelection => 'Customer Selection';

  @override
  String get noCustomerSelected => 'No customer selected';

  @override
  String get invoiceUpdatedSuccessfully => 'Invoice updated successfully';

  @override
  String get errorUpdatingInvoice => 'Error updating invoice';

  @override
  String get errorLoadingUsers => 'Error loading users';

  @override
  String get userNotFound => 'User not found';

  @override
  String get failedToUpdateUser => 'Failed to update user';

  @override
  String get errorDeletingUser => 'Error deleting user';

  @override
  String get errorParsingUserData => 'Error parsing user data';

  @override
  String get userCreatedSuccessfully => 'User created successfully';

  @override
  String get userUpdatedSuccessfully => 'User updated successfully';

  @override
  String get userDeletedSuccessfully => 'User deleted successfully';

  @override
  String get products => 'Products';

  @override
  String get onboardingOne => 'Follow all your bills in one place';

  @override
  String get onboardingTwo => 'You don\'t forget and no bill';

  @override
  String get onboardingThree => 'Pay and follow every need in seconds';

  @override
  String get onboardingOneDec =>
      'Organ your monthly bills, and follow the payment dates, without paper or headache.';

  @override
  String get onboardingTwoDec =>
      'You receive an alert before the payment date, in order to avoid any delay or fines.';

  @override
  String get onboardingThreeDec =>
      'Pay electronically, and save your records automatically to review them at any time.';

  @override
  String get onboardingStartNow => 'Start now';

  @override
  String get productsCategories => 'Products';

  @override
  String get productsList => 'Products List';

  @override
  String get categoriesAppbar => 'Product Categories';

  @override
  String get category => 'Category';

  @override
  String get allCategories => 'All Categories';

  @override
  String get allStatuses => 'All Statuses';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String get viewDetails => 'View Details';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get deleteProduct => 'Delete Product';

  @override
  String deleteProductConfirmation(String name) {
    return 'Are you sure you want to delete product \"$name\"?';
  }

  @override
  String get noName => 'No name';

  @override
  String get undefined => 'Undefined';

  @override
  String get editCategory => 'Edit Category';

  @override
  String get addCategory => 'Add Category';

  @override
  String get name => 'Name';

  @override
  String get save => 'Save';

  @override
  String get categoryAddedSuccessfully => 'Category added successfully';

  @override
  String get categoryUpdatedSuccessfully => 'Category updated successfully';

  @override
  String get categoryDeletedSuccessfully => 'Category deleted successfully';

  @override
  String get errorAddingCategory => 'Error adding category';

  @override
  String get errorUpdatingCategory => 'Error updating category';

  @override
  String get errorDeletingCategory => 'Error deleting category';

  @override
  String get barcode => 'Barcode';

  @override
  String get weight => 'Weight';

  @override
  String get dimensions => 'Dimensions';

  @override
  String get inventorySettings => 'Inventory Settings';

  @override
  String get trackInventory => 'Track Inventory';

  @override
  String get lowStockAlert => 'Low Stock Alert';

  @override
  String get minimumQuantity => 'Minimum Quantity';

  @override
  String get taxSettings => 'Tax Settings';

  @override
  String get hasTax => 'Has Tax';

  @override
  String get taxRate => 'Tax Rate';

  @override
  String get additionalSettings => 'Additional Settings';

  @override
  String get isActive => 'Is Active';

  @override
  String get productAddedSuccessfully => 'Product added successfully';

  @override
  String get productUpdatedSuccessfully => 'Product updated successfully';

  @override
  String get productDeletedSuccessfully => 'Product deleted successfully';

  @override
  String get errorAddingProduct => 'Error adding product';

  @override
  String get errorUpdatingProduct => 'Error updating product';

  @override
  String get errorDeletingProduct => 'Error deleting product';

  @override
  String get addProduct => 'Add Product';

  @override
  String get pricing => 'Pricing';

  @override
  String get sellingPrice => 'Selling Price';

  @override
  String get costPrice => 'Cost Price';

  @override
  String get inventory => 'Inventory';

  @override
  String get thisFieldIsRequired => 'This field is required';

  @override
  String get quantityMustBeAPositiveInteger =>
      'Quantity must be a positive integer';

  @override
  String get unit => 'Unit';

  @override
  String get piece => 'Piece';

  @override
  String get kilogram => 'kg';

  @override
  String get meter => 'm';

  @override
  String get invalidNumber => 'Invalid number';

  @override
  String get maximumQuantity => 'Maximum Quantity';

  @override
  String get productDetails => 'Product Details';

  @override
  String get productSku => 'Product SKU';

  @override
  String get brand => 'Brand';

  @override
  String get model => 'Model';

  @override
  String get color => 'Color';

  @override
  String get material => 'Material';

  @override
  String get centimeters => 'cm';

  @override
  String get productIsActive => 'Product is Active';

  @override
  String get enableDisableProduct => 'Enable/Disable Product';

  @override
  String get productIsTaxable => 'Product is Taxable';

  @override
  String get applyTaxToProduct => 'Apply Tax to Product';

  @override
  String get trackAvailableProductQuantity =>
      'Track Available Product Quantity';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get exitAppConfirmation => 'Exit App';

  @override
  String get exitAppConfirmationMessage =>
      'Are you sure you want to exit the app?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get apply => 'Apply';

  @override
  String get noCustomersFoundMessage =>
      'Press the add button to create a new customer';

  @override
  String get customersList => 'Customers List';

  @override
  String get addCustomer => 'Add Customer';

  @override
  String get editCustomer => 'Edit Customer';

  @override
  String get deleteCustomer => 'Delete Customer';

  @override
  String get customerDetails => 'Customer Details';

  @override
  String get customerName => 'Customer Name';

  @override
  String get customerNameRequired => 'Customer name is required';

  @override
  String get customerEmail => 'Email';

  @override
  String get customerPhone => 'Phone';

  @override
  String get customerAddress => 'Address';

  @override
  String get customerTaxNumber => 'Tax Number';

  @override
  String get customerNotes => 'Notes';

  @override
  String get customerStatus => 'Status';

  @override
  String get customerStatusActive => 'Active';

  @override
  String get customerStatusInactive => 'Inactive';

  @override
  String get customerBasicInfo => 'Customer Information';

  @override
  String get customerBasicInfoSection => 'Basic Information';

  @override
  String get customerCompanyName => 'Company/Organization Name';

  @override
  String get customerPhoneRequired => 'Phone number is required';

  @override
  String get customerCommercialRegister => 'Commercial Register Number';

  @override
  String get customerCity => 'City';

  @override
  String get customerRegion => 'Region/Province';

  @override
  String get customerPostalCode => 'Postal Code';

  @override
  String get customerDetailedAddress => 'Detailed Address';

  @override
  String get customerAdditionalInfo => 'Additional Information';

  @override
  String get customerResponsiblePerson => 'Responsible Person';

  @override
  String customerCreatedSuccessfully(Object name) {
    return 'Customer \"$name\" created successfully';
  }

  @override
  String customerUpdatedSuccessfully(Object name) {
    return 'Customer \"$name\" updated successfully';
  }

  @override
  String get customerDeletedSuccessfully => 'Customer deleted successfully';

  @override
  String get confirmDeleteCustomer => 'Confirm Delete';

  @override
  String confirmDeleteCustomerMessage(Object name) {
    return 'Are you sure you want to delete customer \"$name\"?';
  }

  @override
  String get view => 'View';

  @override
  String get edit => 'Edit';

  @override
  String errorOccurred(Object error) {
    return 'An error occurred: $error';
  }

  @override
  String get company => 'Company';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get customers => 'Customers';

  @override
  String get help => 'Help';

  @override
  String get formHelpTitle => 'Edit Customer Form';

  @override
  String get formHelpDescription =>
      'This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information';

  @override
  String get addressInformation => 'Address Information';

  @override
  String get contactInfo => 'Contact Info';

  @override
  String get statusInfo => 'Status Info';

  @override
  String get createdDate => 'Created';

  @override
  String get lastUpdated => 'Last Updated';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String deleteCustomerConfirmation(Object name) {
    return 'Are you sure you want to delete customer \"$name\"?';
  }

  @override
  String get copy => 'Copy';

  @override
  String get customerDataCopied => 'Customer data copied to clipboard';

  @override
  String get addExpenseHelp => 'Help for adding an expense';

  @override
  String get addExpenseHelpDescription =>
      'This screen allows you to create and track business expenses. Here\'s what you can do:';

  @override
  String get enterExpenseTitleAndDescription =>
      'Enter expense title and description';

  @override
  String get setAmountDateAndPaymentMethod =>
      'Set amount, date, and payment method';

  @override
  String get selectAppropriateExpenseCategory =>
      'Select appropriate expense category';

  @override
  String get addReferenceNumberAndNotes => 'Add reference number and notes';

  @override
  String get gotIt => 'Got it!';

  @override
  String get categorization => 'Categorization';

  @override
  String get additionalInfo => 'Additional Info';

  @override
  String get create => 'Create';

  @override
  String get expenseDate => 'Expense Date';

  @override
  String get selectTheDateThisExpenseOccurred =>
      'Select the date this expense occurred';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get cash => 'Cash';

  @override
  String get creditCard => 'Credit Card';

  @override
  String get debitCard => 'Debit Card';

  @override
  String get bankTransfer => 'Bank Transfer';

  @override
  String get check => 'Check';

  @override
  String get other => 'Other';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get loadingMore => 'Loading more...';

  @override
  String get loadingExpenses => 'Loading expenses...';

  @override
  String get categories => 'Categories';

  @override
  String get expenseDetails => 'Expense Details';

  @override
  String get title => 'Title';

  @override
  String get date => 'Date';

  @override
  String get financialInformation => 'Financial Information';

  @override
  String get paymentInformation => 'Payment Information';

  @override
  String get metadata => 'Metadata';

  @override
  String get createdBy => 'Created By';

  @override
  String get createdAt => 'Created At';

  @override
  String get updatedAt => 'Updated At';

  @override
  String get expenseUpdatedSuccessfully => 'Expense updated successfully';

  @override
  String get editExpense => 'Edit Expense';

  @override
  String get addNewExpenseCategory => 'Add New Expense Category';

  @override
  String get backToCategories => 'Back to Categories';

  @override
  String get newCategoryDetails => 'New Category Details';

  @override
  String get categoryName => 'Category Name';

  @override
  String get categoryNameRequired => 'Category name is required';

  @override
  String get enterCategoryName => 'Enter category name';

  @override
  String get categoryDescription => 'Category Description';

  @override
  String get enterCategoryDescription =>
      'Enter a brief description for the category';

  @override
  String get icon => 'Icon';

  @override
  String get categoryPreview => 'Category Preview';

  @override
  String get saveCategory => 'Save Category';

  @override
  String get saving => 'Saving...';

  @override
  String get editExpenseCategory => 'Edit Expense Category';

  @override
  String get updateCategory => 'Update Category';

  @override
  String get categoryCreatedSuccessfully => 'Category created successfully';

  @override
  String get noCategoriesFound => 'No Categories Found';

  @override
  String get createYourFirstExpenseCategory =>
      'Create your first expense category';

  @override
  String get errorLoadingCategories => 'Error Loading Categories';

  @override
  String get deleteAllCategories => 'Delete All Categories';

  @override
  String get deleteCategory => 'Delete Category';

  @override
  String deleteCategoryConfirmation(String name) {
    return 'Are you sure you want to delete category \"$name\"?';
  }

  @override
  String errorMessage(String error) {
    return 'Error: $error';
  }

  @override
  String statusCategory(String status) {
    return 'Status: $status';
  }

  @override
  String get settings => 'Settings';

  @override
  String get companyEmail => 'Company Email';

  @override
  String get companyPhone => 'Company Phone';

  @override
  String get companyAddress => 'Company Address';

  @override
  String get language => 'Language';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get enableDarkMode => 'Enable Dark Mode';

  @override
  String get notifications => 'Notifications';

  @override
  String get receiveNotifications => 'Receive Notifications';

  @override
  String get appInfo => 'App Information';

  @override
  String get home => 'Home';

  @override
  String get usersManagement => 'Users and Permissions';

  @override
  String get customersManagement => 'Customers';

  @override
  String get productsCategoriesManagement => 'Products and Categories';

  @override
  String get expensesManagement => 'Expenses & Categories';

  @override
  String get supportEmail => 'Support Email';

  @override
  String get website => 'Website';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get saveSettings => 'Save Settings';

  @override
  String get savingSettings => 'Saving Settings...';

  @override
  String get settingsSavedSuccessfully => 'Settings saved successfully';

  @override
  String get companyNameRequired => 'Company name is required';

  @override
  String get companyEmailRequired => 'Company email is required';

  @override
  String get companyEmailInvalid => 'Invalid company email';

  @override
  String get companyPhoneRequired => 'Company phone is required';

  @override
  String get companyAddressRequired => 'Company address is required';

  @override
  String get enterCompanyEmail => 'Enter company email';

  @override
  String get enterCompanyPhone => 'Enter company phone';

  @override
  String get enterCompanyAddress => 'Enter company address';

  @override
  String get languageChangedToArabic => 'Language changed to Arabic';

  @override
  String get languageChangedToEnglish => 'Language changed to English';

  @override
  String get darkModeEnabled => 'Dark mode enabled';

  @override
  String get darkModeDisabled => 'Dark mode disabled';

  @override
  String get notificationsEnabled => 'Notifications enabled';

  @override
  String get notificationsDisabled => 'Notifications disabled';

  @override
  String get or => 'Or';

  @override
  String get reports => 'Reports';

  @override
  String get userManagement => 'User Management';

  @override
  String get permissionsManagement => 'Permissions Management';

  @override
  String get clientsManagement => 'Clients Management';

  @override
  String get productsManagement => 'Products & Categories Management';

  @override
  String get welcomeToInvotek => 'Welcome to Invotek App';

  @override
  String get manageInvoicesAndCustomers =>
      'Manage invoices and customers easily';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get manageCustomers => 'Manage Customers';

  @override
  String get addAndEditCustomers => 'Add, edit and delete customers';

  @override
  String get manageInvoices => 'Manage Invoices';

  @override
  String get createAndEditInvoices => 'Create and edit invoices';

  @override
  String get viewReportsAndStatistics => 'View reports and statistics';

  @override
  String get createNewInvoice => 'Create New Invoice';

  @override
  String get viewAllInvoices => 'View All Invoices';

  @override
  String get deviceInfo => 'Device Information';

  @override
  String get screenDimensionsAndPerformance =>
      'Screen dimensions and performance';

  @override
  String get deviceType => 'Device Type';

  @override
  String get tablet => 'Tablet';

  @override
  String get phone => 'Phone';

  @override
  String get themeDemo => 'Theme Demo';

  @override
  String get themeInfo => 'Theme Information';

  @override
  String get type => 'Type';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get screenDimensions => 'Screen Dimensions';

  @override
  String get textStyles => 'Text Styles';

  @override
  String get mainTitle => 'Main Title';

  @override
  String get subTitle => 'Sub Title';

  @override
  String get normalText => 'Normal Text';

  @override
  String get smallText => 'Small Text';

  @override
  String get link => 'Link';

  @override
  String get errorText => 'Error Text';

  @override
  String get successText => 'Success Text';

  @override
  String get buttons => 'Buttons';

  @override
  String get normalButton => 'Normal Button';

  @override
  String get outlinedButton => 'Outlined Button';

  @override
  String get loadingButton => 'Loading Button';

  @override
  String get inputFields => 'Input Fields';

  @override
  String get username => 'Username';

  @override
  String get enterUsername => 'Enter username';

  @override
  String get cards => 'Cards';

  @override
  String get interactiveCard => 'Interactive Card';

  @override
  String get interactiveCardDescription =>
      'This is an interactive card that can be pressed';

  @override
  String get loadingCard => 'Loading Card';

  @override
  String get responsiveTexts => 'Responsive Texts';

  @override
  String get smallResponsiveText => 'Small Responsive Text';

  @override
  String get mediumResponsiveText => 'Medium Responsive Text';

  @override
  String get largeResponsiveText => 'Large Responsive Text';

  @override
  String get buttonPressed => 'Normal button pressed';

  @override
  String get outlinedButtonPressed => 'Outlined button pressed';

  @override
  String get cardPressed => 'Card pressed';

  @override
  String calling(Object phone) {
    return 'Calling $phone';
  }

  @override
  String openingEmail(Object email) {
    return 'Opening email to $email';
  }

  @override
  String viewingInvoices(Object name) {
    return 'Viewing invoices for $name';
  }

  @override
  String viewingOrders(Object name) {
    return 'Viewing orders for $name';
  }

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get openingMap => 'Opening map';

  @override
  String get ok => 'OK';

  @override
  String get phoneNumberInvalid => 'Invalid phone number';

  @override
  String get advancedTechCompany => 'Advanced Technology Company';

  @override
  String get financialServicesInstitution => 'Financial Services Institution';

  @override
  String get constructionDevelopmentCompany =>
      'Construction & Development Company';

  @override
  String get modernEducationInstitution => 'Modern Education Institution';

  @override
  String get tourismEntertainmentCompany => 'Tourism & Entertainment Company';

  @override
  String get healthcareInstitution => 'Healthcare Institution';

  @override
  String get transportLogisticsCompany => 'Transport & Logistics Company';

  @override
  String get ecommerceInstitution => 'E-commerce Institution';

  @override
  String get productHelp => 'Product Help';

  @override
  String get fillAllRequiredFields => 'Please fill in all required fields';

  @override
  String get productNameRequired => 'Product name is required';

  @override
  String get productPriceRequired => 'Product price is required';

  @override
  String get productQuantityRequired => 'Product quantity is required';

  @override
  String get enterValidQuantity => 'Please enter a valid quantity';

  @override
  String get add => 'Add';

  @override
  String get update => 'Update';

  @override
  String areYouSureDelete(Object name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get errorLoadingProduct => 'Error loading product data';

  @override
  String get noCategoriesToDelete => 'No categories to delete';

  @override
  String get allCategoriesDeletedSuccessfully =>
      'All categories deleted successfully';

  @override
  String get allStatus => 'All Status';

  @override
  String get passwordChangedSuccessfully => 'Password changed successfully';

  @override
  String get operationCompletedSuccessfully =>
      'Operation completed successfully';

  @override
  String get editUser => 'Edit User';

  @override
  String get addNewRole => 'Add New Role';

  @override
  String get editRole => 'Edit Role';

  @override
  String get noEmail => 'No email';

  @override
  String get noRole => 'No role';

  @override
  String get accountant => 'Accountant';

  @override
  String get supervisor => 'Supervisor';

  @override
  String failedToLoadRoles(Object error) {
    return 'Failed to load roles and permissions: $error';
  }

  @override
  String failedToLoadUserPermissions(Object error) {
    return 'Failed to load user permissions: $error';
  }

  @override
  String failedToAddRole(Object error) {
    return 'Failed to add role: $error';
  }

  @override
  String failedToUpdateRole(Object error) {
    return 'Failed to update role: $error';
  }

  @override
  String failedToDeleteRole(Object error) {
    return 'Failed to delete role: $error';
  }

  @override
  String failedToUpdateUserPermissions(Object error) {
    return 'Failed to update user permissions: $error';
  }

  @override
  String get viewUsers => 'View Users';

  @override
  String get pageNotFound => 'Page Not Found';

  @override
  String get requestedPageNotFound => 'The requested page was not found';

  @override
  String get cannotOpenEmailApp => 'Cannot open email application';

  @override
  String get cannotOpenWebsite => 'Cannot open website';

  @override
  String get privacyPolicyComingSoon => 'Privacy Policy Coming Soon';

  @override
  String get termsOfUseComingSoon => 'Terms of Use Coming Soon';

  @override
  String appVersionWithBuild(Object build, Object version) {
    return 'Version $version (Build $build)';
  }

  @override
  String get contactUsForSupport => 'Contact us for support';

  @override
  String get visitInvotekWebsite => 'Visit Invotek website';

  @override
  String get viewPrivacyPolicy => 'View privacy policy';

  @override
  String get viewTermsOfUse => 'View terms of use';

  @override
  String get welcomeToInvotekApp => 'Welcome to Invotek app';

  @override
  String get easyInvoiceCustomerManagement =>
      'Easy invoice and customer management';

  @override
  String get customerManagement => 'Customer Management';

  @override
  String get addEditDeleteCustomers => 'Add, edit and delete customers';

  @override
  String get invoiceManagement => 'Invoice Management';

  @override
  String get createEditInvoices => 'Create and edit invoices';

  @override
  String get viewReportsStatistics => 'View reports and statistics';

  @override
  String get quickActionsTitle => 'Quick Actions';

  @override
  String get screenDimensionsPerformance => 'Screen dimensions and performance';

  @override
  String get enterProductDescription => 'Enter product description';

  @override
  String get pieceKgMeter => 'piece, kg, meter...';

  @override
  String get enterProductSku => 'Enter product SKU';

  @override
  String get enterBarcode => 'Enter barcode';

  @override
  String get enterSellingPrice => 'Enter selling price';

  @override
  String get enterCostPrice => 'Enter cost price';

  @override
  String get enterTaxRatePercentage => 'Enter tax rate percentage';

  @override
  String get enterResponsiblePerson => 'Enter responsible person';

  @override
  String get enterNotes => 'Enter notes';

  @override
  String get exampleEmail => 'example@email.com';

  @override
  String get examplePhone => '0500000000';

  @override
  String get enterCity => 'Enter city';

  @override
  String get enterRegion => 'Enter region';

  @override
  String get enterPostalCode => 'Enter postal code';

  @override
  String get enterDetailedAddress => 'Enter detailed address';

  @override
  String get enterCustomerName => 'Enter customer name';

  @override
  String get enterEmailAddress => 'Enter email address';

  @override
  String get enterTaxNumber => 'Enter tax number';

  @override
  String get enterCommercialRegister => 'Enter commercial register';

  @override
  String get enterClientName => 'Enter client name';

  @override
  String get enterClientEmail => 'Enter email';

  @override
  String get enterClientPhone => 'Enter phone number';

  @override
  String get enterClientAddress => 'Enter client address';

  @override
  String get enterClientCompany => 'Enter company name';

  @override
  String areYouSureDeleteClient(Object name) {
    return 'Are you sure you want to delete client \"$name\"?';
  }

  @override
  String get clientUpdatedSuccessfully => 'Client updated successfully';

  @override
  String get clientAddedSuccessfully => 'Client added successfully';

  @override
  String get clientDetails => 'Client Details';

  @override
  String get editClient => 'Edit Client';

  @override
  String get addNewClient => 'Add New Client';

  @override
  String get department => 'Department';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get userId => 'User ID';

  @override
  String get viewUserDetails => 'View user details';

  @override
  String get editUserInformation => 'Edit user information';

  @override
  String get deleteUserPermanently => 'Delete user permanently';

  @override
  String get paidInvoices => '8 Paid';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get thisMonth => 'This Month';

  @override
  String get boughtThis => 'Bought This';

  @override
  String get available => 'Available';

  @override
  String get productManagement => 'Product Management';

  @override
  String get expenseManagement => 'Expense Management';

  @override
  String get systemAccess => 'System Access';

  @override
  String get viewUsersDescription => 'Ability to view users list';

  @override
  String get addUserDescription => 'Ability to add new user';

  @override
  String get editUserDescription => 'Ability to edit user data';

  @override
  String get deleteUser => 'Delete User';

  @override
  String get deleteUserDescription => 'Ability to delete user';

  @override
  String get managePermissionsDescription =>
      'Ability to manage user permissions';

  @override
  String get viewClients => 'View Clients';

  @override
  String get viewClientsDescription => 'Ability to view clients list';

  @override
  String get addClientDescription => 'Ability to add new client';

  @override
  String get editClientDescription => 'Ability to edit client data';

  @override
  String get deleteClient => 'Delete Client';

  @override
  String get deleteClientDescription => 'Ability to delete client';

  @override
  String get viewProducts => 'View Products';

  @override
  String get viewProductsDescription => 'Ability to view products list';

  @override
  String get addProductDescription => 'Ability to add new product';

  @override
  String get editProductDescription => 'Ability to edit product data';

  @override
  String get deleteProductDescription => 'Ability to delete product';

  @override
  String get viewInvoices => 'View Invoices';

  @override
  String get viewInvoicesDescription => 'Ability to view invoices list';

  @override
  String get createInvoiceDescription => 'Ability to create new invoice';

  @override
  String get editInvoice => 'Edit Invoice';

  @override
  String get editInvoiceDescription => 'Ability to edit invoice';

  @override
  String get deleteInvoice => 'Delete Invoice';

  @override
  String get deleteInvoiceDescription => 'Ability to delete invoice';

  @override
  String get sendInvoice => 'Send Invoice';

  @override
  String get sendInvoiceDescription => 'Ability to send invoice to client';

  @override
  String get viewExpenses => 'View Expenses';

  @override
  String get viewExpensesDescription => 'Ability to view expenses list';

  @override
  String get addExpenseDescription => 'Ability to add new expense';

  @override
  String get editExpenseDescription => 'Ability to edit expense';

  @override
  String get deleteExpense => 'Delete Expense';

  @override
  String get deleteExpenseDescription => 'Ability to delete expense';

  @override
  String get viewReports => 'View Reports';

  @override
  String get viewReportsDescription => 'Ability to view reports';

  @override
  String get exportReports => 'Export Reports';

  @override
  String get exportReportsDescription => 'Ability to export reports';

  @override
  String get companySettingsDescription => 'Ability to edit company settings';

  @override
  String get systemSettingsDescription => 'Ability to edit system settings';

  @override
  String get systemAdministrator => 'System Administrator';

  @override
  String get systemAdministratorDescription =>
      'Has all permissions in the system';

  @override
  String get accountantDescription =>
      'Manages invoices, expenses and financial reports';

  @override
  String get userDescription => 'Limited permissions for viewing and reading';

  @override
  String get supervisorDescription => 'Manages users and permissions';

  @override
  String get searchInClients => 'Search in clients...';

  @override
  String get noClients => 'No clients';

  @override
  String get pressAddToCreateClient => 'Press add button to create new client';

  @override
  String get taxNumber => 'Tax Number';

  @override
  String get contactPersonInformation => 'Contact Person Information';

  @override
  String get contactPersonName => 'Contact Person Name';

  @override
  String get contactPersonPhone => 'Contact Person Phone';

  @override
  String get contactPersonEmail => 'Contact Person Email';

  @override
  String get creationDate => 'Creation Date';

  @override
  String get clientName => 'Client Name';

  @override
  String get enterWebsite => 'Enter website';

  @override
  String get enterContactPersonName => 'Enter contact person name';

  @override
  String get enterContactPersonPhone => 'Enter contact person phone';

  @override
  String get enterContactPersonEmail => 'Enter contact person email';

  @override
  String get enterAdditionalNotes => 'Enter additional notes';

  @override
  String editClientData(Object name) {
    return 'Edit client data for \"$name\"';
  }

  @override
  String get saveChanges => 'Save Changes';

  @override
  String errorUpdatingClient(Object error) {
    return 'Error updating client: $error';
  }

  @override
  String get fillFormToAddClient =>
      'Fill the form below to add new client to the system';

  @override
  String errorCreatingClient(Object error) {
    return 'Error creating client: $error';
  }

  @override
  String errorLoadingClients(Object error) {
    return 'Error loading clients: $error';
  }

  @override
  String errorDeletingClient(Object error) {
    return 'Error deleting client: $error';
  }

  @override
  String errorLoadingStatistics(Object error) {
    return 'Error loading statistics: $error';
  }

  @override
  String errorDeletingClients(Object error) {
    return 'Error deleting clients: $error';
  }

  @override
  String errorUpdatingClientStatus(Object error) {
    return 'Error updating client status: $error';
  }

  @override
  String dataConversionError(Object error) {
    return 'Data conversion error: $error';
  }

  @override
  String get nameMinLength => 'Name must be at least 3 characters';

  @override
  String get nameMaxLength => 'Name must be less than 50 characters';

  @override
  String get phoneRequired => 'Phone number is required';

  @override
  String get phoneMinLength => 'Phone number must be at least 10 digits';

  @override
  String get phoneMaxLength => 'Phone number must be less than 15 digits';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get passwordMaxLength => 'Password must be less than 50 characters';

  @override
  String get passwordUppercase =>
      'Password must contain at least one uppercase letter';

  @override
  String get passwordLowercase =>
      'Password must contain at least one lowercase letter';

  @override
  String get passwordNumber => 'Password must contain at least one number';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get thisField => 'This field';

  @override
  String get search => 'Search...';

  @override
  String get loadingUsers => 'Loading users...';

  @override
  String get signInFailed => 'Sign in failed';

  @override
  String get loginCancelled => 'Login cancelled';

  @override
  String get failedToGetUserData => 'Failed to get user data';

  @override
  String get loginError => 'Login error';

  @override
  String get playServicesNotAvailable => 'Play services not available';

  @override
  String get googleSignInError => 'Google sign in error';

  @override
  String get addInvoice => 'Add Invoice';

  @override
  String get invoices => 'Invoices';

  @override
  String get searchInInvoices => 'Search in invoices...';

  @override
  String get allPaymentMethods => 'All Payment Methods';

  @override
  String get customer => 'Customer';

  @override
  String get allCustomers => 'All Customers';

  @override
  String get paid => 'Paid';

  @override
  String get pending => 'Pending';

  @override
  String get overdue => 'Overdue';

  @override
  String get draft => 'Draft';

  @override
  String get card => 'Card';

  @override
  String get total => 'Total';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get tax => 'Tax';

  @override
  String get noItems => 'No items';

  @override
  String get qty => 'Qty';

  @override
  String get searchItems => 'Search items...';

  @override
  String get showLess => 'Show Less';

  @override
  String showAllItems(Object count) {
    return 'Show All Items ($count)';
  }

  @override
  String get payment => 'Payment';

  @override
  String get paymentDetails => 'Payment Details';

  @override
  String get markAsPaid => 'Mark as Paid';

  @override
  String get send => 'Send';

  @override
  String get duplicate => 'Duplicate';

  @override
  String get downloadPDF => 'Download PDF';

  @override
  String get noInvoices => 'No invoices';

  @override
  String get noInvoicesDescription =>
      'Press the add button to create a new invoice';

  @override
  String get addFirstInvoice => 'Add First Invoice';

  @override
  String get deleteInvoiceConfirmation => 'Delete Invoice Confirmation';

  @override
  String get deleteInvoiceWarning =>
      'Are you sure you want to delete this invoice? This action cannot be undone.';

  @override
  String get sendMethod => 'Send Method';

  @override
  String get sms => 'SMS';

  @override
  String get emailDetails => 'Email Details';

  @override
  String get subject => 'Subject';

  @override
  String get enterSubject => 'Enter subject';

  @override
  String get message => 'Message';

  @override
  String get enterMessage => 'Enter message';

  @override
  String get includePDF => 'Include PDF';

  @override
  String get paymentDate => 'Payment Date';

  @override
  String get addNotes => 'Add Notes';

  @override
  String get invoiceHelp => 'Invoice Help';

  @override
  String get creatingInvoices => 'Creating Invoices';

  @override
  String get createInvoiceStep1 => '1. Enter basic customer information';

  @override
  String get createInvoiceStep2 => '2. Add items and quantities';

  @override
  String get createInvoiceStep3 => '3. Set payment method and date';

  @override
  String get createInvoiceStep4 => '4. Review and save the invoice';

  @override
  String get managingInvoices => 'Managing Invoices';

  @override
  String get manageInvoiceStep1 => '1. Use search and filters to find invoices';

  @override
  String get manageInvoiceStep2 => '2. Tap on invoice to view details';

  @override
  String get manageInvoiceStep3 => '3. Use buttons to edit or delete';

  @override
  String get manageInvoiceStep4 => '4. Send invoice to customer when needed';

  @override
  String get paymentMethods => 'Payment Methods';

  @override
  String get paymentMethodCash => 'Cash';

  @override
  String get paymentMethodCard => 'Credit Card';

  @override
  String get paymentMethodBank => 'Bank Transfer';

  @override
  String get paymentMethodCheck => 'Check';

  @override
  String get taxIntegration => 'Tax Integration';

  @override
  String get taxIntegrationStep1 => '1. Enable tax integration';

  @override
  String get taxIntegrationStep2 => '2. Enter company tax information';

  @override
  String get taxIntegrationStep3 => '3. Test connection and save settings';

  @override
  String get invoiceDetails => 'Invoice Details';

  @override
  String get customerInformation => 'Customer Information';

  @override
  String get amountInformation => 'Amount Information';

  @override
  String get invoiceNumber => 'Invoice Number';

  @override
  String get enterInvoiceNumber => 'Enter invoice number';

  @override
  String get issueDate => 'Issue Date';

  @override
  String get selectDate => 'Select Date';

  @override
  String get enterCustomerEmail => 'Enter email';

  @override
  String get enterCustomerPhone => 'Enter phone number';

  @override
  String get enterSubtotal => 'Enter subtotal';

  @override
  String get enterTaxAmount => 'Enter tax amount';

  @override
  String get taxIntegrationSettings => 'Tax Integration Settings';

  @override
  String get configureTaxIntegration => 'Configure Tax Integration';

  @override
  String get enableTaxIntegration => 'Enable Tax Integration';

  @override
  String get taxType => 'Tax Type';

  @override
  String get vat => 'VAT';

  @override
  String get salesTax => 'Sales Tax';

  @override
  String get country => 'Country';

  @override
  String get saudiArabia => 'Saudi Arabia';

  @override
  String get uae => 'United Arab Emirates';

  @override
  String get kuwait => 'Kuwait';

  @override
  String get testConnection => 'Test Connection';

  @override
  String get vatNumber => 'VAT Number';

  @override
  String get enterVatNumber => 'Enter VAT number';

  @override
  String get city => 'City';

  @override
  String get postalCode => 'Postal Code';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get enterPhone => 'Enter phone';

  @override
  String get testingConnection => 'Testing connection...';

  @override
  String get taxAmount => 'Tax Amount';

  @override
  String get enterDescription => 'Enter description';

  @override
  String get searchInvoices => 'Search invoices...';

  @override
  String get loadingInvoiceDetails => 'Loading invoice details...';

  @override
  String get errorLoadingInvoice => 'Error loading invoice';

  @override
  String get noInvoiceData => 'No invoice data available';

  @override
  String invoiceNumberLabel(String number) {
    return 'Invoice Number: $number';
  }

  @override
  String get shareInvoice => 'Share Invoice';

  @override
  String get printInvoice => 'Print Invoice';

  @override
  String get duplicateInvoice => 'Duplicate Invoice';

  @override
  String get viewQRCode => 'View QR Code';

  @override
  String get viewTaxUID => 'View Tax UID';

  @override
  String get updateStatus => 'Update Status';

  @override
  String get changeStatus => 'Change Status';

  @override
  String get moreOptions => 'More Options';

  @override
  String get refreshData => 'Refresh Data';

  @override
  String get invoiceCopiedToClipboard => 'Invoice details copied to clipboard';

  @override
  String get invoiceCopiedForPrinting => 'Invoice details copied for printing';

  @override
  String get invoiceSentSuccessfully => 'Invoice sent successfully';

  @override
  String get invoiceDeletedSuccessfully => 'Invoice deleted successfully';

  @override
  String invoiceStatusUpdated(String status) {
    return 'Invoice status updated to: $status';
  }

  @override
  String fileSavedSuccessfully(String path) {
    return 'File saved to: $path';
  }

  @override
  String get noQRCodeAvailable => 'No QR code available for this invoice';

  @override
  String get noTaxUIDAvailable => 'No tax UID available for this invoice';

  @override
  String get taxUIDCopied => 'Tax UID copied';

  @override
  String shareInvoiceText(
    String number,
    String customer,
    String date,
    String amount,
    String status,
  ) {
    return 'Invoice Number: $number\nCustomer: $customer\nDate: $date\nAmount: $amount SAR\nStatus: $status\n\nCreated by Invotek App';
  }

  @override
  String printInvoiceText(
    String separator,
    String number,
    String date,
    String status,
    String customer,
    String contact,
    String items,
    String subtotal,
    String tax,
    String total,
  ) {
    return 'Invoice\n$separator\nInvoice Number: $number\nDate: $date\nStatus: $status\n\nCustomer Information:\nName: $customer\n$contact\n\nInvoice Items:\n$items\n\nTotals:\nSubtotal: $subtotal SAR\n$tax\nTotal: $total SAR\n\n$separator\nThank you for your business\nThis invoice was created by Invotek App\n$separator';
  }

  @override
  String get statusPaid => 'Paid';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusOverdue => 'Overdue';

  @override
  String get statusDraft => 'Draft';

  @override
  String get itemDetails => 'Item Details';

  @override
  String get changePaymentMethod => 'Change Payment Method';

  @override
  String get creatingFile => 'Creating file...';

  @override
  String get sendingInvoice => 'Sending invoice...';

  @override
  String get deletingInvoice => 'Deleting invoice...';

  @override
  String get updatingStatus => 'Updating status...';

  @override
  String errorSharingInvoice(String error) {
    return 'Failed to share invoice: $error';
  }

  @override
  String errorPrintingInvoice(String error) {
    return 'Failed to print invoice: $error';
  }

  @override
  String errorSendingInvoice(String error) {
    return 'Failed to send invoice: $error';
  }

  @override
  String errorDeletingInvoice(String error) {
    return 'Failed to delete invoice: $error';
  }

  @override
  String errorCreatingFile(String error) {
    return 'Failed to create file: $error';
  }

  @override
  String errorUpdatingStatus(String error) {
    return 'Failed to update status: $error';
  }

  @override
  String duplicateInvoiceMessage(String number) {
    return 'Duplicate invoice $number';
  }

  @override
  String viewCustomerDetails(String name) {
    return 'View customer details: $name';
  }

  @override
  String viewItemDetails(String name) {
    return 'View item details: $name';
  }

  @override
  String changePaymentMethodForInvoice(String number) {
    return 'Change payment method for invoice $number';
  }

  @override
  String get taxUID => 'Tax UID';

  @override
  String taxUIDForInvoice(String number) {
    return 'Tax UID for invoice $number:';
  }

  @override
  String get itemName => 'Item Name';

  @override
  String get itemQuantity => 'Quantity';

  @override
  String get itemPrice => 'Price';

  @override
  String get itemTotal => 'Total';

  @override
  String get thankYouMessage => 'Thank you for your business';

  @override
  String get createdByInvotek => 'This invoice was created by Invotek App';

  @override
  String get separator => '=';

  @override
  String get itemSeparator => '-';

  @override
  String get itemHeader => 'Name\t\tQuantity\tPrice\tTotal';

  @override
  String itemRow(String name, String quantity, String price, String total) {
    return '$name\t\t$quantity\t$price\t$total';
  }

  @override
  String taxLine(String amount) {
    return 'Tax: $amount SAR';
  }

  @override
  String subtotalLine(String amount) {
    return 'Subtotal: $amount SAR';
  }

  @override
  String totalLine(String amount) {
    return 'Total: $amount SAR';
  }

  @override
  String fileName(String number, String timestamp) {
    return 'Invoice_${number}_$timestamp';
  }

  @override
  String loadingProductDetails(String name) {
    return 'Loading product details...';
  }

  @override
  String get createNewInvoiceStepper => 'Create New Invoice';

  @override
  String get invoiceBasicInfo => 'Invoice Information';

  @override
  String get reviewCalculations => 'Review Calculations';

  @override
  String get invoiceCreationHelp =>
      'This form helps you create a new invoice step by step:\n\n1. Invoice Information: Choose action, payment method, and status\n2. Select Customer: Choose existing customer or add new one\n3. Invoice Items: Add items, quantities, and prices\n4. Review Calculations: Review final details before saving';

  @override
  String get invoiceCreatedSuccessfully => 'Invoice created successfully';

  @override
  String errorCreatingInvoice(String error) {
    return 'Error: $error';
  }

  @override
  String get fillRequiredFieldsBasicInfo =>
      'Please fill all required fields in Invoice Information';

  @override
  String get selectOrAddCustomer =>
      'Please select a customer or enter customer data';

  @override
  String get addAtLeastOneItem => 'Please add at least one item';

  @override
  String get actionRequired => 'Action is required';

  @override
  String get paymentMethodRequired => 'Payment method is required';

  @override
  String get statusRequired => 'Invoice status is required';

  @override
  String get customerRequired =>
      'Please select a customer or enter customer data';

  @override
  String get itemsRequired => 'Please add at least one item';

  @override
  String get action => 'Action';

  @override
  String get saveOnly => 'Save Only';

  @override
  String get saveAndSend => 'Save and Send';

  @override
  String get invoiceStatus => 'Invoice Status';

  @override
  String get sent => 'Sent';

  @override
  String get invoiceDescription => 'Invoice Description';

  @override
  String get enterInvoiceDescription => 'Enter invoice description (optional)';

  @override
  String get customerType => 'Customer Type';

  @override
  String get existingCustomer => 'Existing Customer';

  @override
  String get newCustomer => 'New Customer';

  @override
  String get enterCustomerAddress => 'Enter address';

  @override
  String get addItem => 'Add Item';

  @override
  String get addFirstItem => 'Add First Item';

  @override
  String get taxPercent => 'Tax Percent';

  @override
  String get enterItemName => 'Enter item name';

  @override
  String get enterDiscount => 'Enter discount';

  @override
  String get enterTaxPercent => 'Enter tax percent';

  @override
  String get enterTotal => 'Enter total';

  @override
  String get removeItem => 'Remove Item';

  @override
  String get editItem => 'Edit Item';

  @override
  String get invoiceInfo => 'Invoice Information';

  @override
  String get customerInfo => 'Customer Information';

  @override
  String get itemsInfo => 'Items Information';

  @override
  String get financialInfo => 'Financial Information';

  @override
  String get actionType => 'Action Type';

  @override
  String get paymentMethodType => 'Payment Method Type';

  @override
  String get statusType => 'Status Type';

  @override
  String get issueDateValue => 'Issue Date';

  @override
  String get descriptionValue => 'Description';

  @override
  String get customerNameValue => 'Customer Name';

  @override
  String get customerEmailValue => 'Email';

  @override
  String get customerPhoneValue => 'Phone';

  @override
  String get customerAddressValue => 'Address';

  @override
  String get itemDiscount => 'Discount';

  @override
  String get itemTax => 'Tax';

  @override
  String get clearSearch => 'Clear Search';

  @override
  String get loadMore => 'Load More';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get statistics => 'Statistics';

  @override
  String get totalInvoices => 'Total Invoices';

  @override
  String get newInvoices => 'New Invoices';

  @override
  String get totalSales => 'Total Sales';

  @override
  String get totalExpenses => 'Total Expenses';

  @override
  String get monthlyExpenses => 'Monthly Expenses';

  @override
  String get totalCustomers => 'Total Customers';

  @override
  String get newCustomers => 'New Customers';

  @override
  String get totalProducts => 'Total Products';

  @override
  String get newProducts => 'New Products';

  @override
  String get netProfit => 'Net Profit';

  @override
  String get salesGrowth => 'Sales Growth';

  @override
  String get profitGrowth => 'Profit Growth';

  @override
  String get topSellingProducts => 'Top Selling Products';

  @override
  String get loadingDashboard => 'Loading Dashboard...';

  @override
  String get errorLoadingDashboard => 'Error loading dashboard';

  @override
  String get dashboardError => 'Dashboard Error';

  @override
  String get dashboardErrorMessage =>
      'An error occurred while loading dashboard data';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get currency => 'Dinar';

  @override
  String get growth => 'Growth';

  @override
  String get decrease => 'Decrease';

  @override
  String get increase => 'Increase';

  @override
  String get newThisMonth => 'New This Month';

  @override
  String get productsInStock => 'Products in Stock';

  @override
  String get salesDistribution => 'Sales Distribution';

  @override
  String get invoiceStatistics => 'Invoice Statistics';

  @override
  String get allInvoices => 'All Invoices';

  @override
  String get regularInvoices => 'Regular Invoices';

  @override
  String get monthlySalesStatistics => 'Monthly Sales Statistics';

  @override
  String get salesCategories => 'Sales Categories';

  @override
  String get firstCategory => 'First Category';

  @override
  String get uncategorized => 'Uncategorized';

  @override
  String get printOptions => 'Print Options';

  @override
  String get thermalPrint => 'Thermal Print';

  @override
  String get thermalPrintDesc => 'For thermal printers - 80mm';

  @override
  String get pdfPrint => 'PDF Print';

  @override
  String get pdfPrintDesc => 'View and save PDF';

  @override
  String get printerStatus => 'Printer Status';

  @override
  String get printerConnected => 'Connected to printer';

  @override
  String get printerDisconnected => 'Disconnected from printer';

  @override
  String get checkingConnection => 'Checking connection...';

  @override
  String get searchingPrinter => 'Searching for printer...';

  @override
  String get printReceipt => 'Print Receipt';

  @override
  String get retryConnection => 'Retry Connection';

  @override
  String get pdfPreview => 'PDF Preview';

  @override
  String get savePDF => 'Save PDF';

  @override
  String get generatingPDF => 'Generating PDF...';

  @override
  String get pdfGenerated => 'PDF generated successfully';

  @override
  String get pdfSaved => 'PDF saved successfully';

  @override
  String get printError => 'Print error';

  @override
  String get connectionError => 'Connection error';

  @override
  String get thermalReceipt => 'Thermal Receipt';

  @override
  String get thankYou => 'Thank you for your business';

  @override
  String get printSuccess => 'Print successful';

  @override
  String get printFailed => 'Print failed';

  @override
  String get pdfError => 'PDF generation error';

  @override
  String get saveError => 'Save error';

  @override
  String get printSettings => 'Print Settings';

  @override
  String get paperSize => 'Paper Size';

  @override
  String get printerName => 'Printer Name';

  @override
  String get connectionType => 'Connection Type';

  @override
  String get bluetooth => 'Bluetooth';

  @override
  String get usb => 'USB';

  @override
  String get network => 'Network';

  @override
  String get selectPrinter => 'Select Printer';

  @override
  String get noPrintersFound => 'No printers found';

  @override
  String get refreshPrinters => 'Refresh Printers';

  @override
  String get printerSettings => 'Printer Settings';

  @override
  String get testPrint => 'Test Print';

  @override
  String get printQuality => 'Print Quality';

  @override
  String get high => 'High';

  @override
  String get medium => 'Medium';

  @override
  String get low => 'Low';

  @override
  String get searchExpenses => '.... Search expenses';
}
