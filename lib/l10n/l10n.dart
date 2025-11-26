import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'WELCOME!'**
  String get welcome;

  /// No description provided for @tekpart.
  ///
  /// In en, this message translates to:
  /// **'TekPart'**
  String get tekpart;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get emailInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordShort;

  /// No description provided for @passwordWeak.
  ///
  /// In en, this message translates to:
  /// **'Password must contain uppercase, lowercase and number'**
  String get passwordWeak;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation is required'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsNotMatch;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @nameShort.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get nameShort;

  /// No description provided for @nameInvalid.
  ///
  /// In en, this message translates to:
  /// **'Name must contain only letters'**
  String get nameInvalid;

  /// No description provided for @validationError.
  ///
  /// In en, this message translates to:
  /// **'Data validation error'**
  String get validationError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error'**
  String get networkError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get serverError;

  /// No description provided for @authError.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please check your email and password.'**
  String get authError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get unknownError;

  /// No description provided for @cacheError.
  ///
  /// In en, this message translates to:
  /// **'Local storage error'**
  String get cacheError;

  /// No description provided for @timeoutError.
  ///
  /// In en, this message translates to:
  /// **'Request timeout'**
  String get timeoutError;

  /// No description provided for @unauthorizedError.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access'**
  String get unauthorizedError;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @customersLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error loading customers'**
  String get customersLoadError;

  /// No description provided for @customersNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error - Customers'**
  String get customersNetworkError;

  /// No description provided for @customersValidationError.
  ///
  /// In en, this message translates to:
  /// **'Validation error - Customers'**
  String get customersValidationError;

  /// No description provided for @customersUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error - Customers'**
  String get customersUnknownError;

  /// No description provided for @customersTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Timeout error - Customers'**
  String get customersTimeoutError;

  /// No description provided for @customersUnauthorizedError.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized error - Customers'**
  String get customersUnauthorizedError;

  /// No description provided for @customersCacheError.
  ///
  /// In en, this message translates to:
  /// **'Cache error - Customers'**
  String get customersCacheError;

  /// No description provided for @productsLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error loading products'**
  String get productsLoadError;

  /// No description provided for @productsNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error - Products'**
  String get productsNetworkError;

  /// No description provided for @productsValidationError.
  ///
  /// In en, this message translates to:
  /// **'Validation error - Products'**
  String get productsValidationError;

  /// No description provided for @productsUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error - Products'**
  String get productsUnknownError;

  /// No description provided for @productsTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Timeout error - Products'**
  String get productsTimeoutError;

  /// No description provided for @productsUnauthorizedError.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized error - Products'**
  String get productsUnauthorizedError;

  /// No description provided for @productsCacheError.
  ///
  /// In en, this message translates to:
  /// **'Cache error - Products'**
  String get productsCacheError;

  /// No description provided for @expensesLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error loading expenses'**
  String get expensesLoadError;

  /// No description provided for @expensesNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error - Expenses'**
  String get expensesNetworkError;

  /// No description provided for @expensesValidationError.
  ///
  /// In en, this message translates to:
  /// **'Validation error - Expenses'**
  String get expensesValidationError;

  /// No description provided for @expensesUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error - Expenses'**
  String get expensesUnknownError;

  /// No description provided for @expensesTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Timeout error - Expenses'**
  String get expensesTimeoutError;

  /// No description provided for @expensesUnauthorizedError.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized error - Expenses'**
  String get expensesUnauthorizedError;

  /// No description provided for @expensesCacheError.
  ///
  /// In en, this message translates to:
  /// **'Cache error - Expenses'**
  String get expensesCacheError;

  /// No description provided for @invoicesLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error loading invoices'**
  String get invoicesLoadError;

  /// No description provided for @invoicesNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error - Invoices'**
  String get invoicesNetworkError;

  /// No description provided for @invoicesValidationError.
  ///
  /// In en, this message translates to:
  /// **'Validation error - Invoices'**
  String get invoicesValidationError;

  /// No description provided for @invoicesUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error - Invoices'**
  String get invoicesUnknownError;

  /// No description provided for @invoicesTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Timeout error - Invoices'**
  String get invoicesTimeoutError;

  /// No description provided for @invoicesUnauthorizedError.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized error - Invoices'**
  String get invoicesUnauthorizedError;

  /// No description provided for @invoicesCacheError.
  ///
  /// In en, this message translates to:
  /// **'Cache error - Invoices'**
  String get invoicesCacheError;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @loggingIn.
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get loggingIn;

  /// No description provided for @registering.
  ///
  /// In en, this message translates to:
  /// **'Registering...'**
  String get registering;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccess;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful! Please login.'**
  String get registerSuccess;

  /// No description provided for @usersPermissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get usersPermissions;

  /// No description provided for @usersPermissionsDesc.
  ///
  /// In en, this message translates to:
  /// **'Control of clients and permissions'**
  String get usersPermissionsDesc;

  /// No description provided for @clientsProducts.
  ///
  /// In en, this message translates to:
  /// **'Clients and Products'**
  String get clientsProducts;

  /// No description provided for @clientsProductsDesc.
  ///
  /// In en, this message translates to:
  /// **'Control of clients and products'**
  String get clientsProductsDesc;

  /// No description provided for @expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// No description provided for @expensesDesc.
  ///
  /// In en, this message translates to:
  /// **'Expense categories & Expense management'**
  String get expensesDesc;

  /// No description provided for @taxInvoices.
  ///
  /// In en, this message translates to:
  /// **'Tax Invoices'**
  String get taxInvoices;

  /// No description provided for @taxInvoicesDesc.
  ///
  /// In en, this message translates to:
  /// **'Unposted invoices & Postpaid invoices & Returned invoices & Create a new invoice'**
  String get taxInvoicesDesc;

  /// No description provided for @loginSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccessfully;

  /// No description provided for @rejesterSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Registration successful! Please login.'**
  String get rejesterSuccessfully;

  /// No description provided for @loginLoadin.
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get loginLoadin;

  /// No description provided for @rejester.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get rejester;

  /// No description provided for @rejesterLoading.
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get rejesterLoading;

  /// No description provided for @haveAccountLogin.
  ///
  /// In en, this message translates to:
  /// **'Have an account? Login'**
  String get haveAccountLogin;

  /// No description provided for @noHaveAccountRejester.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Create new account'**
  String get noHaveAccountRejester;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @notAMember.
  ///
  /// In en, this message translates to:
  /// **'Not a member?'**
  String get notAMember;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAnAccount;

  /// No description provided for @onboardingWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Invotek'**
  String get onboardingWelcome;

  /// No description provided for @onboardingWelcomeDesc.
  ///
  /// In en, this message translates to:
  /// **'Integrated system for electronic invoice management with integration with the Jordanian national billing system'**
  String get onboardingWelcomeDesc;

  /// No description provided for @onboardingUsers.
  ///
  /// In en, this message translates to:
  /// **'User and Permission Management'**
  String get onboardingUsers;

  /// No description provided for @onboardingUsersDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete control over users and their permissions within the company'**
  String get onboardingUsersDesc;

  /// No description provided for @onboardingClients.
  ///
  /// In en, this message translates to:
  /// **'Client and Product Management'**
  String get onboardingClients;

  /// No description provided for @onboardingClientsDesc.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive management of clients and products with inventory tracking'**
  String get onboardingClientsDesc;

  /// No description provided for @onboardingExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expense Management'**
  String get onboardingExpenses;

  /// No description provided for @onboardingExpensesDesc.
  ///
  /// In en, this message translates to:
  /// **'Track and manage expenses with multiple categories'**
  String get onboardingExpensesDesc;

  /// No description provided for @onboardingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Tax Invoices'**
  String get onboardingInvoices;

  /// No description provided for @onboardingInvoicesDesc.
  ///
  /// In en, this message translates to:
  /// **'Create and manage tax invoices with integration with the national invoice system'**
  String get onboardingInvoicesDesc;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @startNow.
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get startNow;

  /// No description provided for @chooseFeature.
  ///
  /// In en, this message translates to:
  /// **'Choose the feature you want to manage'**
  String get chooseFeature;

  /// No description provided for @usersPermissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Users and Permissions'**
  String get usersPermissionsTitle;

  /// No description provided for @clientsProductsTitle.
  ///
  /// In en, this message translates to:
  /// **'Clients and Products'**
  String get clientsProductsTitle;

  /// No description provided for @expensesTitle.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expensesTitle;

  /// No description provided for @taxInvoicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Tax Invoices'**
  String get taxInvoicesTitle;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @usersList.
  ///
  /// In en, this message translates to:
  /// **'Users List'**
  String get usersList;

  /// No description provided for @addUser.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get addUser;

  /// No description provided for @managePermissions.
  ///
  /// In en, this message translates to:
  /// **'Manage Permissions'**
  String get managePermissions;

  /// No description provided for @clientsList.
  ///
  /// In en, this message translates to:
  /// **'Clients List'**
  String get clientsList;

  /// No description provided for @addClient.
  ///
  /// In en, this message translates to:
  /// **'Add Client'**
  String get addClient;

  /// No description provided for @manageProducts.
  ///
  /// In en, this message translates to:
  /// **'Manage Products'**
  String get manageProducts;

  /// No description provided for @productCategories.
  ///
  /// In en, this message translates to:
  /// **'Product Categories'**
  String get productCategories;

  /// No description provided for @expensesList.
  ///
  /// In en, this message translates to:
  /// **'Expenses List'**
  String get expensesList;

  /// No description provided for @addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get addExpense;

  /// No description provided for @expenseCategories.
  ///
  /// In en, this message translates to:
  /// **'Expense Categories'**
  String get expenseCategories;

  /// No description provided for @invoicesList.
  ///
  /// In en, this message translates to:
  /// **'Invoices List'**
  String get invoicesList;

  /// No description provided for @createInvoice.
  ///
  /// In en, this message translates to:
  /// **'Create Invoice'**
  String get createInvoice;

  /// No description provided for @postedInvoices.
  ///
  /// In en, this message translates to:
  /// **'Posted Invoices'**
  String get postedInvoices;

  /// No description provided for @returnedInvoices.
  ///
  /// In en, this message translates to:
  /// **'Returned Invoices'**
  String get returnedInvoices;

  /// No description provided for @salesReport.
  ///
  /// In en, this message translates to:
  /// **'Sales Report'**
  String get salesReport;

  /// No description provided for @expensesReport.
  ///
  /// In en, this message translates to:
  /// **'Expenses Report'**
  String get expensesReport;

  /// No description provided for @newExpense.
  ///
  /// In en, this message translates to:
  /// **'New Expense'**
  String get newExpense;

  /// No description provided for @trackYourBusinessExpenses.
  ///
  /// In en, this message translates to:
  /// **'Track your business expenses'**
  String get trackYourBusinessExpenses;

  /// No description provided for @basicInformation.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformation;

  /// No description provided for @expenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Expense Title'**
  String get expenseTitle;

  /// No description provided for @expenseTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Office supplies, Travel expenses'**
  String get expenseTitleHint;

  /// No description provided for @titleIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get titleIsRequired;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Add more details about this expense'**
  String get descriptionHint;

  /// No description provided for @financialDetails.
  ///
  /// In en, this message translates to:
  /// **'Financial Details'**
  String get financialDetails;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @amountHint.
  ///
  /// In en, this message translates to:
  /// **'0.00'**
  String get amountHint;

  /// No description provided for @amountHelperText.
  ///
  /// In en, this message translates to:
  /// **'Enter the total amount spent including tax'**
  String get amountHelperText;

  /// No description provided for @amountIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Amount is required'**
  String get amountIsRequired;

  /// No description provided for @pleaseEnterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get pleaseEnterValidAmount;

  /// No description provided for @additionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get additionalInformation;

  /// No description provided for @referenceNumber.
  ///
  /// In en, this message translates to:
  /// **'Reference Number'**
  String get referenceNumber;

  /// No description provided for @referenceNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Invoice number, receipt ID, etc.'**
  String get referenceNumberHint;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Any additional information or context'**
  String get notesHint;

  /// No description provided for @createExpense.
  ///
  /// In en, this message translates to:
  /// **'Create Expense'**
  String get createExpense;

  /// No description provided for @expenseCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Expense created successfully!'**
  String get expenseCreatedSuccessfully;

  /// No description provided for @pleaseSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get pleaseSelectCategory;

  /// No description provided for @completeRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Complete required fields'**
  String get completeRequiredFields;

  /// No description provided for @customersReport.
  ///
  /// In en, this message translates to:
  /// **'Customers Report'**
  String get customersReport;

  /// No description provided for @productsReport.
  ///
  /// In en, this message translates to:
  /// **'Products Report'**
  String get productsReport;

  /// No description provided for @companySettings.
  ///
  /// In en, this message translates to:
  /// **'Company Settings'**
  String get companySettings;

  /// No description provided for @systemSettings.
  ///
  /// In en, this message translates to:
  /// **'System Settings'**
  String get systemSettings;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @userAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User added successfully'**
  String get userAddedSuccessfully;

  /// No description provided for @errorCreatingUser.
  ///
  /// In en, this message translates to:
  /// **'Error creating user: \$e'**
  String get errorCreatingUser;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @usersAndPermissionsManagement.
  ///
  /// In en, this message translates to:
  /// **'Users and Permissions Management'**
  String get usersAndPermissionsManagement;

  /// No description provided for @usersAndPermissionsDescription.
  ///
  /// In en, this message translates to:
  /// **'View and manage users and their permissions'**
  String get usersAndPermissionsDescription;

  /// No description provided for @searchForUser.
  ///
  /// In en, this message translates to:
  /// **'Search for user...'**
  String get searchForUser;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @manager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get manager;

  /// No description provided for @noUsersFound.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get noUsersFound;

  /// No description provided for @addNewUserMessage.
  ///
  /// In en, this message translates to:
  /// **'Press the add button to create a new user'**
  String get addNewUserMessage;

  /// No description provided for @deleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete Confirmation'**
  String get deleteConfirmation;

  /// No description provided for @deleteUserConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete user {name}?'**
  String deleteUserConfirmation(String name);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @fillTheFormBelowToAddANewUserTo.
  ///
  /// In en, this message translates to:
  /// **'Fill the form below to add a new user to the system'**
  String get fillTheFormBelowToAddANewUserTo;

  /// No description provided for @addANewUser.
  ///
  /// In en, this message translates to:
  /// **'Add a new user'**
  String get addANewUser;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get state;

  /// No description provided for @rule.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get rule;

  /// No description provided for @userSettings.
  ///
  /// In en, this message translates to:
  /// **'User settings'**
  String get userSettings;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @securityInformation.
  ///
  /// In en, this message translates to:
  /// **'Security Information'**
  String get securityInformation;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter full name'**
  String get enterFullName;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enterEmail;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enterPhoneNumber;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @noDataReceived.
  ///
  /// In en, this message translates to:
  /// **'No data received from server'**
  String get noDataReceived;

  /// No description provided for @cannotEditInvoice.
  ///
  /// In en, this message translates to:
  /// **'Cannot Edit Invoice'**
  String get cannotEditInvoice;

  /// No description provided for @invoiceAlreadySent.
  ///
  /// In en, this message translates to:
  /// **'Invoice Already Sent'**
  String get invoiceAlreadySent;

  /// No description provided for @cannotEditSentInvoice.
  ///
  /// In en, this message translates to:
  /// **'Cannot edit sent invoices'**
  String get cannotEditSentInvoice;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select Customer'**
  String get selectCustomer;

  /// No description provided for @searchCustomers.
  ///
  /// In en, this message translates to:
  /// **'Search customers'**
  String get searchCustomers;

  /// No description provided for @loadingCustomers.
  ///
  /// In en, this message translates to:
  /// **'Loading customers...'**
  String get loadingCustomers;

  /// No description provided for @errorLoadingCustomers.
  ///
  /// In en, this message translates to:
  /// **'Error loading customers'**
  String get errorLoadingCustomers;

  /// No description provided for @noCustomersFound.
  ///
  /// In en, this message translates to:
  /// **'No customers found'**
  String get noCustomersFound;

  /// No description provided for @noCustomersMatchSearch.
  ///
  /// In en, this message translates to:
  /// **'No customers match your search'**
  String get noCustomersMatchSearch;

  /// No description provided for @addFirstCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add first customer'**
  String get addFirstCustomer;

  /// No description provided for @tryDifferentSearch.
  ///
  /// In en, this message translates to:
  /// **'Try a different search'**
  String get tryDifferentSearch;

  /// No description provided for @addNewCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add New Customer'**
  String get addNewCustomer;

  /// No description provided for @companyInformation.
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get companyInformation;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// No description provided for @enterCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Enter company name'**
  String get enterCompanyName;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get enterAddress;

  /// No description provided for @errorCreatingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Error creating customer'**
  String get errorCreatingCustomer;

  /// No description provided for @selectProduct.
  ///
  /// In en, this message translates to:
  /// **'Select Product'**
  String get selectProduct;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get searchProducts;

  /// No description provided for @loadingProducts.
  ///
  /// In en, this message translates to:
  /// **'Loading products...'**
  String get loadingProducts;

  /// No description provided for @errorLoadingProducts.
  ///
  /// In en, this message translates to:
  /// **'Error loading products'**
  String get errorLoadingProducts;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get noProductsFound;

  /// No description provided for @noProductsMatchSearch.
  ///
  /// In en, this message translates to:
  /// **'No products match search'**
  String get noProductsMatchSearch;

  /// No description provided for @addFirstProduct.
  ///
  /// In en, this message translates to:
  /// **'Add first product'**
  String get addFirstProduct;

  /// No description provided for @addNewProduct.
  ///
  /// In en, this message translates to:
  /// **'Add New Product'**
  String get addNewProduct;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productName;

  /// No description provided for @enterProductName.
  ///
  /// In en, this message translates to:
  /// **'Enter product name'**
  String get enterProductName;

  /// No description provided for @sku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get sku;

  /// No description provided for @enterSku.
  ///
  /// In en, this message translates to:
  /// **'Enter SKU'**
  String get enterSku;

  /// No description provided for @pricingInformation.
  ///
  /// In en, this message translates to:
  /// **'Pricing Information'**
  String get pricingInformation;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @enterPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter price'**
  String get enterPrice;

  /// No description provided for @priceRequired.
  ///
  /// In en, this message translates to:
  /// **'Price is required'**
  String get priceRequired;

  /// No description provided for @invalidPrice.
  ///
  /// In en, this message translates to:
  /// **'Invalid price'**
  String get invalidPrice;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @enterQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter quantity'**
  String get enterQuantity;

  /// No description provided for @quantityRequired.
  ///
  /// In en, this message translates to:
  /// **'Quantity is required'**
  String get quantityRequired;

  /// No description provided for @invalidQuantity.
  ///
  /// In en, this message translates to:
  /// **'Invalid quantity'**
  String get invalidQuantity;

  /// No description provided for @errorCreatingProduct.
  ///
  /// In en, this message translates to:
  /// **'Error creating product'**
  String get errorCreatingProduct;

  /// No description provided for @invoiceItems.
  ///
  /// In en, this message translates to:
  /// **'Invoice Items'**
  String get invoiceItems;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @noItemsAdded.
  ///
  /// In en, this message translates to:
  /// **'No items added yet'**
  String get noItemsAdded;

  /// No description provided for @addItemsToInvoice.
  ///
  /// In en, this message translates to:
  /// **'Add items to invoice'**
  String get addItemsToInvoice;

  /// No description provided for @manualItem.
  ///
  /// In en, this message translates to:
  /// **'Manual Item'**
  String get manualItem;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @addFromProducts.
  ///
  /// In en, this message translates to:
  /// **'Add from Products'**
  String get addFromProducts;

  /// No description provided for @addManualItem.
  ///
  /// In en, this message translates to:
  /// **'Add Manual Item'**
  String get addManualItem;

  /// No description provided for @customerSelection.
  ///
  /// In en, this message translates to:
  /// **'Customer Selection'**
  String get customerSelection;

  /// No description provided for @noCustomerSelected.
  ///
  /// In en, this message translates to:
  /// **'No customer selected'**
  String get noCustomerSelected;

  /// No description provided for @invoiceUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Invoice updated successfully'**
  String get invoiceUpdatedSuccessfully;

  /// No description provided for @errorUpdatingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Error updating invoice'**
  String get errorUpdatingInvoice;

  /// No description provided for @errorLoadingUsers.
  ///
  /// In en, this message translates to:
  /// **'Error loading users'**
  String get errorLoadingUsers;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get userNotFound;

  /// No description provided for @failedToUpdateUser.
  ///
  /// In en, this message translates to:
  /// **'Failed to update user'**
  String get failedToUpdateUser;

  /// No description provided for @errorDeletingUser.
  ///
  /// In en, this message translates to:
  /// **'Error deleting user'**
  String get errorDeletingUser;

  /// No description provided for @errorParsingUserData.
  ///
  /// In en, this message translates to:
  /// **'Error parsing user data'**
  String get errorParsingUserData;

  /// No description provided for @userCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User created successfully'**
  String get userCreatedSuccessfully;

  /// No description provided for @userUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User updated successfully'**
  String get userUpdatedSuccessfully;

  /// No description provided for @userDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User deleted successfully'**
  String get userDeletedSuccessfully;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @onboardingOne.
  ///
  /// In en, this message translates to:
  /// **'Follow all your bills in one place'**
  String get onboardingOne;

  /// No description provided for @onboardingTwo.
  ///
  /// In en, this message translates to:
  /// **'You don\'t forget and no bill'**
  String get onboardingTwo;

  /// No description provided for @onboardingThree.
  ///
  /// In en, this message translates to:
  /// **'Pay and follow every need in seconds'**
  String get onboardingThree;

  /// No description provided for @onboardingOneDec.
  ///
  /// In en, this message translates to:
  /// **'Organ your monthly bills, and follow the payment dates, without paper or headache.'**
  String get onboardingOneDec;

  /// No description provided for @onboardingTwoDec.
  ///
  /// In en, this message translates to:
  /// **'You receive an alert before the payment date, in order to avoid any delay or fines.'**
  String get onboardingTwoDec;

  /// No description provided for @onboardingThreeDec.
  ///
  /// In en, this message translates to:
  /// **'Pay electronically, and save your records automatically to review them at any time.'**
  String get onboardingThreeDec;

  /// No description provided for @onboardingStartNow.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get onboardingStartNow;

  /// No description provided for @productsCategories.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsCategories;

  /// No description provided for @productsList.
  ///
  /// In en, this message translates to:
  /// **'Products List'**
  String get productsList;

  /// No description provided for @categoriesAppbar.
  ///
  /// In en, this message translates to:
  /// **'Product Categories'**
  String get categoriesAppbar;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// No description provided for @allStatuses.
  ///
  /// In en, this message translates to:
  /// **'All Statuses'**
  String get allStatuses;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get editProduct;

  /// No description provided for @deleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get deleteProduct;

  /// No description provided for @deleteProductConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete product \"{name}\"?'**
  String deleteProductConfirmation(String name);

  /// No description provided for @noName.
  ///
  /// In en, this message translates to:
  /// **'No name'**
  String get noName;

  /// No description provided for @undefined.
  ///
  /// In en, this message translates to:
  /// **'Undefined'**
  String get undefined;

  /// No description provided for @editCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get editCategory;

  /// No description provided for @addCategory.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get addCategory;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @categoryAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Category added successfully'**
  String get categoryAddedSuccessfully;

  /// No description provided for @categoryUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Category updated successfully'**
  String get categoryUpdatedSuccessfully;

  /// No description provided for @categoryDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Category deleted successfully'**
  String get categoryDeletedSuccessfully;

  /// No description provided for @errorAddingCategory.
  ///
  /// In en, this message translates to:
  /// **'Error adding category'**
  String get errorAddingCategory;

  /// No description provided for @errorUpdatingCategory.
  ///
  /// In en, this message translates to:
  /// **'Error updating category'**
  String get errorUpdatingCategory;

  /// No description provided for @errorDeletingCategory.
  ///
  /// In en, this message translates to:
  /// **'Error deleting category'**
  String get errorDeletingCategory;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @dimensions.
  ///
  /// In en, this message translates to:
  /// **'Dimensions'**
  String get dimensions;

  /// No description provided for @inventorySettings.
  ///
  /// In en, this message translates to:
  /// **'Inventory Settings'**
  String get inventorySettings;

  /// No description provided for @trackInventory.
  ///
  /// In en, this message translates to:
  /// **'Track Inventory'**
  String get trackInventory;

  /// No description provided for @lowStockAlert.
  ///
  /// In en, this message translates to:
  /// **'Low Stock Alert'**
  String get lowStockAlert;

  /// No description provided for @minimumQuantity.
  ///
  /// In en, this message translates to:
  /// **'Minimum Quantity'**
  String get minimumQuantity;

  /// No description provided for @taxSettings.
  ///
  /// In en, this message translates to:
  /// **'Tax Settings'**
  String get taxSettings;

  /// No description provided for @hasTax.
  ///
  /// In en, this message translates to:
  /// **'Has Tax'**
  String get hasTax;

  /// No description provided for @taxRate.
  ///
  /// In en, this message translates to:
  /// **'Tax Rate'**
  String get taxRate;

  /// No description provided for @additionalSettings.
  ///
  /// In en, this message translates to:
  /// **'Additional Settings'**
  String get additionalSettings;

  /// No description provided for @isActive.
  ///
  /// In en, this message translates to:
  /// **'Is Active'**
  String get isActive;

  /// No description provided for @productAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Product added successfully'**
  String get productAddedSuccessfully;

  /// No description provided for @productUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Product updated successfully'**
  String get productUpdatedSuccessfully;

  /// No description provided for @productDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Product deleted successfully'**
  String get productDeletedSuccessfully;

  /// No description provided for @errorAddingProduct.
  ///
  /// In en, this message translates to:
  /// **'Error adding product'**
  String get errorAddingProduct;

  /// No description provided for @errorUpdatingProduct.
  ///
  /// In en, this message translates to:
  /// **'Error updating product'**
  String get errorUpdatingProduct;

  /// No description provided for @errorDeletingProduct.
  ///
  /// In en, this message translates to:
  /// **'Error deleting product'**
  String get errorDeletingProduct;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get addProduct;

  /// No description provided for @pricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get pricing;

  /// No description provided for @sellingPrice.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get sellingPrice;

  /// No description provided for @costPrice.
  ///
  /// In en, this message translates to:
  /// **'Cost Price'**
  String get costPrice;

  /// No description provided for @inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// No description provided for @thisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get thisFieldIsRequired;

  /// No description provided for @quantityMustBeAPositiveInteger.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be a positive integer'**
  String get quantityMustBeAPositiveInteger;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @piece.
  ///
  /// In en, this message translates to:
  /// **'Piece'**
  String get piece;

  /// No description provided for @kilogram.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kilogram;

  /// No description provided for @meter.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get meter;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get invalidNumber;

  /// No description provided for @maximumQuantity.
  ///
  /// In en, this message translates to:
  /// **'Maximum Quantity'**
  String get maximumQuantity;

  /// No description provided for @productDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetails;

  /// No description provided for @productSku.
  ///
  /// In en, this message translates to:
  /// **'Product SKU'**
  String get productSku;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @material.
  ///
  /// In en, this message translates to:
  /// **'Material'**
  String get material;

  /// No description provided for @centimeters.
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get centimeters;

  /// No description provided for @productIsActive.
  ///
  /// In en, this message translates to:
  /// **'Product is Active'**
  String get productIsActive;

  /// No description provided for @enableDisableProduct.
  ///
  /// In en, this message translates to:
  /// **'Enable/Disable Product'**
  String get enableDisableProduct;

  /// No description provided for @productIsTaxable.
  ///
  /// In en, this message translates to:
  /// **'Product is Taxable'**
  String get productIsTaxable;

  /// No description provided for @applyTaxToProduct.
  ///
  /// In en, this message translates to:
  /// **'Apply Tax to Product'**
  String get applyTaxToProduct;

  /// No description provided for @trackAvailableProductQuantity.
  ///
  /// In en, this message translates to:
  /// **'Track Available Product Quantity'**
  String get trackAvailableProductQuantity;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @exitAppConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Exit App'**
  String get exitAppConfirmation;

  /// No description provided for @exitAppConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit the app?'**
  String get exitAppConfirmationMessage;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @noCustomersFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Press the add button to create a new customer'**
  String get noCustomersFoundMessage;

  /// No description provided for @customersList.
  ///
  /// In en, this message translates to:
  /// **'Customers List'**
  String get customersList;

  /// No description provided for @addCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get addCustomer;

  /// No description provided for @editCustomer.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get editCustomer;

  /// No description provided for @deleteCustomer.
  ///
  /// In en, this message translates to:
  /// **'Delete Customer'**
  String get deleteCustomer;

  /// No description provided for @customerDetails.
  ///
  /// In en, this message translates to:
  /// **'Customer Details'**
  String get customerDetails;

  /// No description provided for @customerName.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customerName;

  /// No description provided for @customerNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Customer name is required'**
  String get customerNameRequired;

  /// No description provided for @customerEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get customerEmail;

  /// No description provided for @customerPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get customerPhone;

  /// No description provided for @customerAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get customerAddress;

  /// No description provided for @customerTaxNumber.
  ///
  /// In en, this message translates to:
  /// **'Tax Number'**
  String get customerTaxNumber;

  /// No description provided for @customerNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get customerNotes;

  /// No description provided for @customerStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get customerStatus;

  /// No description provided for @customerStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get customerStatusActive;

  /// No description provided for @customerStatusInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get customerStatusInactive;

  /// No description provided for @customerBasicInfo.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get customerBasicInfo;

  /// No description provided for @customerBasicInfoSection.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get customerBasicInfoSection;

  /// No description provided for @customerCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Company/Organization Name'**
  String get customerCompanyName;

  /// No description provided for @customerPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get customerPhoneRequired;

  /// No description provided for @phoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get phoneInvalid;

  /// No description provided for @customerCommercialRegister.
  ///
  /// In en, this message translates to:
  /// **'Commercial Register'**
  String get customerCommercialRegister;

  /// No description provided for @customerCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get customerCity;

  /// No description provided for @customerRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get customerRegion;

  /// No description provided for @customerPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get customerPostalCode;

  /// No description provided for @customerDetailedAddress.
  ///
  /// In en, this message translates to:
  /// **'Detailed Address'**
  String get customerDetailedAddress;

  /// No description provided for @customerAdditionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get customerAdditionalInfo;

  /// No description provided for @customerResponsiblePerson.
  ///
  /// In en, this message translates to:
  /// **'Responsible Person'**
  String get customerResponsiblePerson;

  /// No description provided for @customerCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer \"{name}\" created successfully'**
  String customerCreatedSuccessfully(String name);

  /// No description provided for @customerUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer \"{name}\" updated successfully'**
  String customerUpdatedSuccessfully(String name);

  /// No description provided for @customerDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer deleted successfully'**
  String get customerDeletedSuccessfully;

  /// No description provided for @confirmDeleteCustomer.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete Customer'**
  String get confirmDeleteCustomer;

  /// No description provided for @confirmDeleteCustomerMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete customer \"{name}\"?'**
  String confirmDeleteCustomerMessage(String name);

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear Filters'**
  String get clearFilters;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @formHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer Form'**
  String get formHelpTitle;

  /// No description provided for @formHelpDescription.
  ///
  /// In en, this message translates to:
  /// **'This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information'**
  String get formHelpDescription;

  /// No description provided for @addressInformation.
  ///
  /// In en, this message translates to:
  /// **'Address Information'**
  String get addressInformation;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Info'**
  String get contactInfo;

  /// No description provided for @statusInfo.
  ///
  /// In en, this message translates to:
  /// **'Status Info'**
  String get statusInfo;

  /// No description provided for @createdDate.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get createdDate;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// No description provided for @deleteCustomerConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete customer \"{name}\"?'**
  String deleteCustomerConfirmation(Object name);

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @customerDataCopied.
  ///
  /// In en, this message translates to:
  /// **'Customer data copied to clipboard'**
  String get customerDataCopied;

  /// No description provided for @addExpenseHelp.
  ///
  /// In en, this message translates to:
  /// **'Help for adding an expense'**
  String get addExpenseHelp;

  /// No description provided for @addExpenseHelpDescription.
  ///
  /// In en, this message translates to:
  /// **'This screen allows you to create and track business expenses. Here\'s what you can do:'**
  String get addExpenseHelpDescription;

  /// No description provided for @enterExpenseTitleAndDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter expense title and description'**
  String get enterExpenseTitleAndDescription;

  /// No description provided for @setAmountDateAndPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Set amount, date, and payment method'**
  String get setAmountDateAndPaymentMethod;

  /// No description provided for @selectAppropriateExpenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Select appropriate expense category'**
  String get selectAppropriateExpenseCategory;

  /// No description provided for @addReferenceNumberAndNotes.
  ///
  /// In en, this message translates to:
  /// **'Add reference number and notes'**
  String get addReferenceNumberAndNotes;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
  String get gotIt;

  /// No description provided for @categorization.
  ///
  /// In en, this message translates to:
  /// **'Categorization'**
  String get categorization;

  /// No description provided for @additionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Additional Info'**
  String get additionalInfo;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @expenseDate.
  ///
  /// In en, this message translates to:
  /// **'Expense Date'**
  String get expenseDate;

  /// No description provided for @selectTheDateThisExpenseOccurred.
  ///
  /// In en, this message translates to:
  /// **'Select the date this expense occurred'**
  String get selectTheDateThisExpenseOccurred;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @debitCard.
  ///
  /// In en, this message translates to:
  /// **'Debit Card'**
  String get debitCard;

  /// No description provided for @bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get bankTransfer;

  /// No description provided for @check.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get check;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @loadingMore.
  ///
  /// In en, this message translates to:
  /// **'Loading more...'**
  String get loadingMore;

  /// No description provided for @loadingExpenses.
  ///
  /// In en, this message translates to:
  /// **'Loading expenses...'**
  String get loadingExpenses;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @expenseDetails.
  ///
  /// In en, this message translates to:
  /// **'Expense Details'**
  String get expenseDetails;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @financialInformation.
  ///
  /// In en, this message translates to:
  /// **'Financial Information'**
  String get financialInformation;

  /// No description provided for @paymentInformation.
  ///
  /// In en, this message translates to:
  /// **'Payment Information'**
  String get paymentInformation;

  /// No description provided for @metadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get metadata;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'Created By'**
  String get createdBy;

  /// No description provided for @createdAt.
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get createdAt;

  /// No description provided for @updatedAt.
  ///
  /// In en, this message translates to:
  /// **'Updated At'**
  String get updatedAt;

  /// No description provided for @expenseUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Expense updated successfully'**
  String get expenseUpdatedSuccessfully;

  /// No description provided for @editExpense.
  ///
  /// In en, this message translates to:
  /// **'Edit Expense'**
  String get editExpense;

  /// No description provided for @addNewExpenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Add New Expense Category'**
  String get addNewExpenseCategory;

  /// No description provided for @backToCategories.
  ///
  /// In en, this message translates to:
  /// **'Back to Categories'**
  String get backToCategories;

  /// No description provided for @newCategoryDetails.
  ///
  /// In en, this message translates to:
  /// **'New Category Details'**
  String get newCategoryDetails;

  /// No description provided for @categoryName.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get categoryName;

  /// No description provided for @categoryNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Category name is required'**
  String get categoryNameRequired;

  /// No description provided for @enterCategoryName.
  ///
  /// In en, this message translates to:
  /// **'Enter category name'**
  String get enterCategoryName;

  /// No description provided for @categoryDescription.
  ///
  /// In en, this message translates to:
  /// **'Category Description'**
  String get categoryDescription;

  /// No description provided for @enterCategoryDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter a brief description for the category'**
  String get enterCategoryDescription;

  /// No description provided for @icon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get icon;

  /// No description provided for @categoryPreview.
  ///
  /// In en, this message translates to:
  /// **'Category Preview'**
  String get categoryPreview;

  /// No description provided for @saveCategory.
  ///
  /// In en, this message translates to:
  /// **'Save Category'**
  String get saveCategory;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @editExpenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit Expense Category'**
  String get editExpenseCategory;

  /// No description provided for @updateCategory.
  ///
  /// In en, this message translates to:
  /// **'Update Category'**
  String get updateCategory;

  /// No description provided for @categoryCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Category created successfully'**
  String get categoryCreatedSuccessfully;

  /// No description provided for @noCategoriesFound.
  ///
  /// In en, this message translates to:
  /// **'No Categories Found'**
  String get noCategoriesFound;

  /// No description provided for @createYourFirstExpenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Create your first expense category'**
  String get createYourFirstExpenseCategory;

  /// No description provided for @errorLoadingCategories.
  ///
  /// In en, this message translates to:
  /// **'Error Loading Categories'**
  String get errorLoadingCategories;

  /// No description provided for @deleteAllCategories.
  ///
  /// In en, this message translates to:
  /// **'Delete All Categories'**
  String get deleteAllCategories;

  /// No description provided for @deleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Category'**
  String get deleteCategory;

  /// No description provided for @deleteCategoryConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete category \"{name}\"?'**
  String deleteCategoryConfirmation(String name);

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorMessage(String error);

  /// No description provided for @statusCategory.
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String statusCategory(String status);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @companyEmail.
  ///
  /// In en, this message translates to:
  /// **'Company Email'**
  String get companyEmail;

  /// No description provided for @companyPhone.
  ///
  /// In en, this message translates to:
  /// **'Company Phone'**
  String get companyPhone;

  /// No description provided for @companyAddress.
  ///
  /// In en, this message translates to:
  /// **'Company Address'**
  String get companyAddress;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @enableDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Enable Dark Mode'**
  String get enableDarkMode;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @receiveNotifications.
  ///
  /// In en, this message translates to:
  /// **'Receive Notifications'**
  String get receiveNotifications;

  /// No description provided for @appInfo.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInfo;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @usersManagement.
  ///
  /// In en, this message translates to:
  /// **'Users and Permissions'**
  String get usersManagement;

  /// No description provided for @customersManagement.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customersManagement;

  /// No description provided for @productsCategoriesManagement.
  ///
  /// In en, this message translates to:
  /// **'Products and Categories'**
  String get productsCategoriesManagement;

  /// No description provided for @expensesManagement.
  ///
  /// In en, this message translates to:
  /// **'Expenses & Categories'**
  String get expensesManagement;

  /// No description provided for @supportEmail.
  ///
  /// In en, this message translates to:
  /// **'Support Email'**
  String get supportEmail;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @saveSettings.
  ///
  /// In en, this message translates to:
  /// **'Save Settings'**
  String get saveSettings;

  /// No description provided for @savingSettings.
  ///
  /// In en, this message translates to:
  /// **'Saving Settings...'**
  String get savingSettings;

  /// No description provided for @settingsSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Settings saved successfully'**
  String get settingsSavedSuccessfully;

  /// No description provided for @companyNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Company name is required'**
  String get companyNameRequired;

  /// No description provided for @companyEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Company email is required'**
  String get companyEmailRequired;

  /// No description provided for @companyEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid company email'**
  String get companyEmailInvalid;

  /// No description provided for @companyPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Company phone is required'**
  String get companyPhoneRequired;

  /// No description provided for @companyAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Company address is required'**
  String get companyAddressRequired;

  /// No description provided for @enterCompanyEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter company email'**
  String get enterCompanyEmail;

  /// No description provided for @enterCompanyPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter company phone'**
  String get enterCompanyPhone;

  /// No description provided for @enterCompanyAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter company address'**
  String get enterCompanyAddress;

  /// No description provided for @languageChangedToArabic.
  ///
  /// In en, this message translates to:
  /// **'Language changed to Arabic'**
  String get languageChangedToArabic;

  /// No description provided for @languageChangedToEnglish.
  ///
  /// In en, this message translates to:
  /// **'Language changed to English'**
  String get languageChangedToEnglish;

  /// No description provided for @darkModeEnabled.
  ///
  /// In en, this message translates to:
  /// **'Dark mode enabled'**
  String get darkModeEnabled;

  /// No description provided for @darkModeDisabled.
  ///
  /// In en, this message translates to:
  /// **'Dark mode disabled'**
  String get darkModeDisabled;

  /// No description provided for @notificationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled'**
  String get notificationsEnabled;

  /// No description provided for @notificationsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications disabled'**
  String get notificationsDisabled;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @passwordChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangedSuccessfully;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning: Your account will be permanently deleted'**
  String get deleteAccountWarning;

  /// No description provided for @enterPasswordToConfirm.
  ///
  /// In en, this message translates to:
  /// **'Enter password to confirm'**
  String get enterPasswordToConfirm;

  /// No description provided for @accountDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account deleted successfully'**
  String get accountDeletedSuccessfully;

  /// No description provided for @deleteAccountConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get deleteAccountConfirmation;

  /// No description provided for @changePasswordConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to change your password?'**
  String get changePasswordConfirmation;

  /// No description provided for @deleteAccountFinalConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you absolutely sure you want to delete your account? This action cannot be undone'**
  String get deleteAccountFinalConfirmation;

  /// No description provided for @yesDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete my account'**
  String get yesDeleteAccount;

  /// No description provided for @changePasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordButton;

  /// No description provided for @deleteAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Delete Account Permanently'**
  String get deleteAccountButton;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @userManagement.
  ///
  /// In en, this message translates to:
  /// **'User Management'**
  String get userManagement;

  /// No description provided for @permissionsManagement.
  ///
  /// In en, this message translates to:
  /// **'Permissions Management'**
  String get permissionsManagement;

  /// No description provided for @clientsManagement.
  ///
  /// In en, this message translates to:
  /// **'Clients Management'**
  String get clientsManagement;

  /// No description provided for @productsManagement.
  ///
  /// In en, this message translates to:
  /// **'Products & Categories Management'**
  String get productsManagement;

  /// No description provided for @welcomeToInvotek.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Invotek App'**
  String get welcomeToInvotek;

  /// No description provided for @manageInvoicesAndCustomers.
  ///
  /// In en, this message translates to:
  /// **'Manage invoices and customers easily'**
  String get manageInvoicesAndCustomers;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @manageCustomers.
  ///
  /// In en, this message translates to:
  /// **'Manage Customers'**
  String get manageCustomers;

  /// No description provided for @addAndEditCustomers.
  ///
  /// In en, this message translates to:
  /// **'Add, edit and delete customers'**
  String get addAndEditCustomers;

  /// No description provided for @manageInvoices.
  ///
  /// In en, this message translates to:
  /// **'Manage Invoices'**
  String get manageInvoices;

  /// No description provided for @createAndEditInvoices.
  ///
  /// In en, this message translates to:
  /// **'Create and edit invoices'**
  String get createAndEditInvoices;

  /// No description provided for @viewReportsAndStatistics.
  ///
  /// In en, this message translates to:
  /// **'View reports and statistics'**
  String get viewReportsAndStatistics;

  /// No description provided for @createNewInvoice.
  ///
  /// In en, this message translates to:
  /// **'Create New Invoice'**
  String get createNewInvoice;

  /// No description provided for @viewAllInvoices.
  ///
  /// In en, this message translates to:
  /// **'View All Invoices'**
  String get viewAllInvoices;

  /// No description provided for @deviceInfo.
  ///
  /// In en, this message translates to:
  /// **'Device Information'**
  String get deviceInfo;

  /// No description provided for @screenDimensionsAndPerformance.
  ///
  /// In en, this message translates to:
  /// **'Screen dimensions and performance'**
  String get screenDimensionsAndPerformance;

  /// No description provided for @deviceType.
  ///
  /// In en, this message translates to:
  /// **'Device Type'**
  String get deviceType;

  /// No description provided for @tablet.
  ///
  /// In en, this message translates to:
  /// **'Tablet'**
  String get tablet;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @themeDemo.
  ///
  /// In en, this message translates to:
  /// **'Theme Demo'**
  String get themeDemo;

  /// No description provided for @themeInfo.
  ///
  /// In en, this message translates to:
  /// **'Theme Information'**
  String get themeInfo;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @screenDimensions.
  ///
  /// In en, this message translates to:
  /// **'Screen Dimensions'**
  String get screenDimensions;

  /// No description provided for @textStyles.
  ///
  /// In en, this message translates to:
  /// **'Text Styles'**
  String get textStyles;

  /// No description provided for @mainTitle.
  ///
  /// In en, this message translates to:
  /// **'Main Title'**
  String get mainTitle;

  /// No description provided for @subTitle.
  ///
  /// In en, this message translates to:
  /// **'Sub Title'**
  String get subTitle;

  /// No description provided for @normalText.
  ///
  /// In en, this message translates to:
  /// **'Normal Text'**
  String get normalText;

  /// No description provided for @smallText.
  ///
  /// In en, this message translates to:
  /// **'Small Text'**
  String get smallText;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get link;

  /// No description provided for @errorText.
  ///
  /// In en, this message translates to:
  /// **'Error Text'**
  String get errorText;

  /// No description provided for @successText.
  ///
  /// In en, this message translates to:
  /// **'Success Text'**
  String get successText;

  /// No description provided for @buttons.
  ///
  /// In en, this message translates to:
  /// **'Buttons'**
  String get buttons;

  /// No description provided for @normalButton.
  ///
  /// In en, this message translates to:
  /// **'Normal Button'**
  String get normalButton;

  /// No description provided for @outlinedButton.
  ///
  /// In en, this message translates to:
  /// **'Outlined Button'**
  String get outlinedButton;

  /// No description provided for @loadingButton.
  ///
  /// In en, this message translates to:
  /// **'Loading Button'**
  String get loadingButton;

  /// No description provided for @inputFields.
  ///
  /// In en, this message translates to:
  /// **'Input Fields'**
  String get inputFields;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @enterUsername.
  ///
  /// In en, this message translates to:
  /// **'Enter username'**
  String get enterUsername;

  /// No description provided for @cards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cards;

  /// No description provided for @interactiveCard.
  ///
  /// In en, this message translates to:
  /// **'Interactive Card'**
  String get interactiveCard;

  /// No description provided for @interactiveCardDescription.
  ///
  /// In en, this message translates to:
  /// **'This is an interactive card that can be pressed'**
  String get interactiveCardDescription;

  /// No description provided for @loadingCard.
  ///
  /// In en, this message translates to:
  /// **'Loading Card'**
  String get loadingCard;

  /// No description provided for @responsiveTexts.
  ///
  /// In en, this message translates to:
  /// **'Responsive Texts'**
  String get responsiveTexts;

  /// No description provided for @smallResponsiveText.
  ///
  /// In en, this message translates to:
  /// **'Small Responsive Text'**
  String get smallResponsiveText;

  /// No description provided for @mediumResponsiveText.
  ///
  /// In en, this message translates to:
  /// **'Medium Responsive Text'**
  String get mediumResponsiveText;

  /// No description provided for @largeResponsiveText.
  ///
  /// In en, this message translates to:
  /// **'Large Responsive Text'**
  String get largeResponsiveText;

  /// No description provided for @buttonPressed.
  ///
  /// In en, this message translates to:
  /// **'Normal button pressed'**
  String get buttonPressed;

  /// No description provided for @outlinedButtonPressed.
  ///
  /// In en, this message translates to:
  /// **'Outlined button pressed'**
  String get outlinedButtonPressed;

  /// No description provided for @cardPressed.
  ///
  /// In en, this message translates to:
  /// **'Card pressed'**
  String get cardPressed;

  /// No description provided for @calling.
  ///
  /// In en, this message translates to:
  /// **'Calling {phone}'**
  String calling(Object phone);

  /// No description provided for @openingEmail.
  ///
  /// In en, this message translates to:
  /// **'Opening email to {email}'**
  String openingEmail(Object email);

  /// No description provided for @viewingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Viewing invoices for {name}'**
  String viewingInvoices(Object name);

  /// No description provided for @viewingOrders.
  ///
  /// In en, this message translates to:
  /// **'Viewing orders for {name}'**
  String viewingOrders(Object name);

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @openingMap.
  ///
  /// In en, this message translates to:
  /// **'Opening map'**
  String get openingMap;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @phoneNumberInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get phoneNumberInvalid;

  /// No description provided for @advancedTechCompany.
  ///
  /// In en, this message translates to:
  /// **'Advanced Technology Company'**
  String get advancedTechCompany;

  /// No description provided for @financialServicesInstitution.
  ///
  /// In en, this message translates to:
  /// **'Financial Services Institution'**
  String get financialServicesInstitution;

  /// No description provided for @constructionDevelopmentCompany.
  ///
  /// In en, this message translates to:
  /// **'Construction & Development Company'**
  String get constructionDevelopmentCompany;

  /// No description provided for @modernEducationInstitution.
  ///
  /// In en, this message translates to:
  /// **'Modern Education Institution'**
  String get modernEducationInstitution;

  /// No description provided for @tourismEntertainmentCompany.
  ///
  /// In en, this message translates to:
  /// **'Tourism & Entertainment Company'**
  String get tourismEntertainmentCompany;

  /// No description provided for @healthcareInstitution.
  ///
  /// In en, this message translates to:
  /// **'Healthcare Institution'**
  String get healthcareInstitution;

  /// No description provided for @transportLogisticsCompany.
  ///
  /// In en, this message translates to:
  /// **'Transport & Logistics Company'**
  String get transportLogisticsCompany;

  /// No description provided for @ecommerceInstitution.
  ///
  /// In en, this message translates to:
  /// **'E-commerce Institution'**
  String get ecommerceInstitution;

  /// No description provided for @productHelp.
  ///
  /// In en, this message translates to:
  /// **'Product Help'**
  String get productHelp;

  /// No description provided for @fillAllRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all required fields'**
  String get fillAllRequiredFields;

  /// No description provided for @productNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Product name is required'**
  String get productNameRequired;

  /// No description provided for @productPriceRequired.
  ///
  /// In en, this message translates to:
  /// **'Product price is required'**
  String get productPriceRequired;

  /// No description provided for @productQuantityRequired.
  ///
  /// In en, this message translates to:
  /// **'Product quantity is required'**
  String get productQuantityRequired;

  /// No description provided for @enterValidQuantity.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid quantity'**
  String get enterValidQuantity;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @areYouSureDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String areYouSureDelete(Object name);

  /// No description provided for @errorLoadingProduct.
  ///
  /// In en, this message translates to:
  /// **'Error loading product data'**
  String get errorLoadingProduct;

  /// No description provided for @noCategoriesToDelete.
  ///
  /// In en, this message translates to:
  /// **'No categories to delete'**
  String get noCategoriesToDelete;

  /// No description provided for @allCategoriesDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'All categories deleted successfully'**
  String get allCategoriesDeletedSuccessfully;

  /// No description provided for @allStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get allStatus;

  /// No description provided for @operationCompletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Operation completed successfully'**
  String get operationCompletedSuccessfully;

  /// No description provided for @editUser.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get editUser;

  /// No description provided for @addNewRole.
  ///
  /// In en, this message translates to:
  /// **'Add New Role'**
  String get addNewRole;

  /// No description provided for @editRole.
  ///
  /// In en, this message translates to:
  /// **'Edit Role'**
  String get editRole;

  /// No description provided for @noEmail.
  ///
  /// In en, this message translates to:
  /// **'No email'**
  String get noEmail;

  /// No description provided for @noRole.
  ///
  /// In en, this message translates to:
  /// **'No role'**
  String get noRole;

  /// No description provided for @accountant.
  ///
  /// In en, this message translates to:
  /// **'Accountant'**
  String get accountant;

  /// No description provided for @supervisor.
  ///
  /// In en, this message translates to:
  /// **'Supervisor'**
  String get supervisor;

  /// No description provided for @failedToLoadRoles.
  ///
  /// In en, this message translates to:
  /// **'Failed to load roles and permissions: {error}'**
  String failedToLoadRoles(Object error);

  /// No description provided for @failedToLoadUserPermissions.
  ///
  /// In en, this message translates to:
  /// **'Failed to load user permissions: {error}'**
  String failedToLoadUserPermissions(Object error);

  /// No description provided for @failedToAddRole.
  ///
  /// In en, this message translates to:
  /// **'Failed to add role: {error}'**
  String failedToAddRole(Object error);

  /// No description provided for @failedToUpdateRole.
  ///
  /// In en, this message translates to:
  /// **'Failed to update role: {error}'**
  String failedToUpdateRole(Object error);

  /// No description provided for @failedToDeleteRole.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete role: {error}'**
  String failedToDeleteRole(Object error);

  /// No description provided for @failedToUpdateUserPermissions.
  ///
  /// In en, this message translates to:
  /// **'Failed to update user permissions: {error}'**
  String failedToUpdateUserPermissions(Object error);

  /// No description provided for @viewUsers.
  ///
  /// In en, this message translates to:
  /// **'View Users'**
  String get viewUsers;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get pageNotFound;

  /// No description provided for @requestedPageNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested page was not found'**
  String get requestedPageNotFound;

  /// No description provided for @cannotOpenEmailApp.
  ///
  /// In en, this message translates to:
  /// **'Cannot open email application'**
  String get cannotOpenEmailApp;

  /// No description provided for @cannotOpenWebsite.
  ///
  /// In en, this message translates to:
  /// **'Cannot open website'**
  String get cannotOpenWebsite;

  /// No description provided for @privacyPolicyComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy Coming Soon'**
  String get privacyPolicyComingSoon;

  /// No description provided for @termsOfUseComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use Coming Soon'**
  String get termsOfUseComingSoon;

  /// No description provided for @appVersionWithBuild.
  ///
  /// In en, this message translates to:
  /// **'Version {version} (Build {build})'**
  String appVersionWithBuild(Object build, Object version);

  /// No description provided for @contactUsForSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact us for support'**
  String get contactUsForSupport;

  /// No description provided for @visitInvotekWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit Invotek website'**
  String get visitInvotekWebsite;

  /// No description provided for @viewPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'View privacy policy'**
  String get viewPrivacyPolicy;

  /// No description provided for @viewTermsOfUse.
  ///
  /// In en, this message translates to:
  /// **'View terms of use'**
  String get viewTermsOfUse;

  /// No description provided for @welcomeToInvotekApp.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Invotek app'**
  String get welcomeToInvotekApp;

  /// No description provided for @easyInvoiceCustomerManagement.
  ///
  /// In en, this message translates to:
  /// **'Easy invoice and customer management'**
  String get easyInvoiceCustomerManagement;

  /// No description provided for @customerManagement.
  ///
  /// In en, this message translates to:
  /// **'Customer Management'**
  String get customerManagement;

  /// No description provided for @addEditDeleteCustomers.
  ///
  /// In en, this message translates to:
  /// **'Add, edit and delete customers'**
  String get addEditDeleteCustomers;

  /// No description provided for @invoiceManagement.
  ///
  /// In en, this message translates to:
  /// **'Invoice Management'**
  String get invoiceManagement;

  /// No description provided for @createEditInvoices.
  ///
  /// In en, this message translates to:
  /// **'Create and edit invoices'**
  String get createEditInvoices;

  /// No description provided for @viewReportsStatistics.
  ///
  /// In en, this message translates to:
  /// **'View reports and statistics'**
  String get viewReportsStatistics;

  /// No description provided for @quickActionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActionsTitle;

  /// No description provided for @screenDimensionsPerformance.
  ///
  /// In en, this message translates to:
  /// **'Screen dimensions and performance'**
  String get screenDimensionsPerformance;

  /// No description provided for @enterProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter product description'**
  String get enterProductDescription;

  /// No description provided for @pieceKgMeter.
  ///
  /// In en, this message translates to:
  /// **'piece, kg, meter...'**
  String get pieceKgMeter;

  /// No description provided for @enterProductSku.
  ///
  /// In en, this message translates to:
  /// **'Enter product SKU'**
  String get enterProductSku;

  /// No description provided for @enterBarcode.
  ///
  /// In en, this message translates to:
  /// **'Enter barcode'**
  String get enterBarcode;

  /// No description provided for @enterSellingPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter selling price'**
  String get enterSellingPrice;

  /// No description provided for @enterCostPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter cost price'**
  String get enterCostPrice;

  /// No description provided for @enterTaxRatePercentage.
  ///
  /// In en, this message translates to:
  /// **'Enter tax rate percentage'**
  String get enterTaxRatePercentage;

  /// No description provided for @enterResponsiblePerson.
  ///
  /// In en, this message translates to:
  /// **'Enter responsible person'**
  String get enterResponsiblePerson;

  /// No description provided for @enterNotes.
  ///
  /// In en, this message translates to:
  /// **'Enter notes'**
  String get enterNotes;

  /// No description provided for @exampleEmail.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get exampleEmail;

  /// No description provided for @examplePhone.
  ///
  /// In en, this message translates to:
  /// **'0500000000'**
  String get examplePhone;

  /// No description provided for @enterCity.
  ///
  /// In en, this message translates to:
  /// **'Enter city'**
  String get enterCity;

  /// No description provided for @enterRegion.
  ///
  /// In en, this message translates to:
  /// **'Enter region'**
  String get enterRegion;

  /// No description provided for @enterPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Enter postal code'**
  String get enterPostalCode;

  /// No description provided for @enterDetailedAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter detailed address'**
  String get enterDetailedAddress;

  /// No description provided for @enterCustomerName.
  ///
  /// In en, this message translates to:
  /// **'Enter customer name'**
  String get enterCustomerName;

  /// No description provided for @enterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter email address'**
  String get enterEmailAddress;

  /// No description provided for @enterTaxNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter tax number'**
  String get enterTaxNumber;

  /// No description provided for @enterCommercialRegister.
  ///
  /// In en, this message translates to:
  /// **'Enter commercial register'**
  String get enterCommercialRegister;

  /// No description provided for @enterClientName.
  ///
  /// In en, this message translates to:
  /// **'Enter client name'**
  String get enterClientName;

  /// No description provided for @enterClientEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enterClientEmail;

  /// No description provided for @enterClientPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enterClientPhone;

  /// No description provided for @enterClientAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter client address'**
  String get enterClientAddress;

  /// No description provided for @enterClientCompany.
  ///
  /// In en, this message translates to:
  /// **'Enter company name'**
  String get enterClientCompany;

  /// No description provided for @areYouSureDeleteClient.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete client \"{name}\"?'**
  String areYouSureDeleteClient(Object name);

  /// No description provided for @clientUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Client updated successfully'**
  String get clientUpdatedSuccessfully;

  /// No description provided for @clientAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Client added successfully'**
  String get clientAddedSuccessfully;

  /// No description provided for @clientDetails.
  ///
  /// In en, this message translates to:
  /// **'Client Details'**
  String get clientDetails;

  /// No description provided for @editClient.
  ///
  /// In en, this message translates to:
  /// **'Edit Client'**
  String get editClient;

  /// No description provided for @addNewClient.
  ///
  /// In en, this message translates to:
  /// **'Add New Client'**
  String get addNewClient;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @userId.
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userId;

  /// No description provided for @viewUserDetails.
  ///
  /// In en, this message translates to:
  /// **'View user details'**
  String get viewUserDetails;

  /// No description provided for @editUserInformation.
  ///
  /// In en, this message translates to:
  /// **'Edit user information'**
  String get editUserInformation;

  /// No description provided for @deleteUserPermanently.
  ///
  /// In en, this message translates to:
  /// **'Delete user permanently'**
  String get deleteUserPermanently;

  /// No description provided for @paidInvoices.
  ///
  /// In en, this message translates to:
  /// **'8 Paid'**
  String get paidInvoices;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @boughtThis.
  ///
  /// In en, this message translates to:
  /// **'Bought This'**
  String get boughtThis;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available: {count}'**
  String available(int count);

  /// No description provided for @productManagement.
  ///
  /// In en, this message translates to:
  /// **'Product Management'**
  String get productManagement;

  /// No description provided for @expenseManagement.
  ///
  /// In en, this message translates to:
  /// **'Expense Management'**
  String get expenseManagement;

  /// No description provided for @systemAccess.
  ///
  /// In en, this message translates to:
  /// **'System Access'**
  String get systemAccess;

  /// No description provided for @viewUsersDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to view users list'**
  String get viewUsersDescription;

  /// No description provided for @addUserDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to add new user'**
  String get addUserDescription;

  /// No description provided for @editUserDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to edit user data'**
  String get editUserDescription;

  /// No description provided for @deleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get deleteUser;

  /// No description provided for @deleteUserDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to delete user'**
  String get deleteUserDescription;

  /// No description provided for @managePermissionsDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to manage user permissions'**
  String get managePermissionsDescription;

  /// No description provided for @viewClients.
  ///
  /// In en, this message translates to:
  /// **'View Clients'**
  String get viewClients;

  /// No description provided for @viewClientsDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to view clients list'**
  String get viewClientsDescription;

  /// No description provided for @addClientDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to add new client'**
  String get addClientDescription;

  /// No description provided for @editClientDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to edit client data'**
  String get editClientDescription;

  /// No description provided for @deleteClient.
  ///
  /// In en, this message translates to:
  /// **'Delete Client'**
  String get deleteClient;

  /// No description provided for @deleteClientDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to delete client'**
  String get deleteClientDescription;

  /// No description provided for @viewProducts.
  ///
  /// In en, this message translates to:
  /// **'View Products'**
  String get viewProducts;

  /// No description provided for @viewProductsDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to view products list'**
  String get viewProductsDescription;

  /// No description provided for @addProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to add new product'**
  String get addProductDescription;

  /// No description provided for @editProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to edit product data'**
  String get editProductDescription;

  /// No description provided for @deleteProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to delete product'**
  String get deleteProductDescription;

  /// No description provided for @viewInvoices.
  ///
  /// In en, this message translates to:
  /// **'View Invoices'**
  String get viewInvoices;

  /// No description provided for @viewInvoicesDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to view invoices list'**
  String get viewInvoicesDescription;

  /// No description provided for @createInvoiceDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to create new invoice'**
  String get createInvoiceDescription;

  /// No description provided for @editInvoice.
  ///
  /// In en, this message translates to:
  /// **'Edit Invoice'**
  String get editInvoice;

  /// No description provided for @editInvoiceDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to edit invoice'**
  String get editInvoiceDescription;

  /// No description provided for @deleteInvoice.
  ///
  /// In en, this message translates to:
  /// **'Delete Invoice'**
  String get deleteInvoice;

  /// No description provided for @deleteInvoiceDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to delete invoice'**
  String get deleteInvoiceDescription;

  /// No description provided for @sendInvoice.
  ///
  /// In en, this message translates to:
  /// **'Send Invoice'**
  String get sendInvoice;

  /// No description provided for @sendInvoiceDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to send invoice to client'**
  String get sendInvoiceDescription;

  /// No description provided for @viewExpenses.
  ///
  /// In en, this message translates to:
  /// **'View Expenses'**
  String get viewExpenses;

  /// No description provided for @viewExpensesDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to view expenses list'**
  String get viewExpensesDescription;

  /// No description provided for @addExpenseDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to add new expense'**
  String get addExpenseDescription;

  /// No description provided for @editExpenseDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to edit expense'**
  String get editExpenseDescription;

  /// No description provided for @deleteExpense.
  ///
  /// In en, this message translates to:
  /// **'Delete Expense'**
  String get deleteExpense;

  /// No description provided for @deleteExpenseDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to delete expense'**
  String get deleteExpenseDescription;

  /// No description provided for @viewReports.
  ///
  /// In en, this message translates to:
  /// **'View Reports'**
  String get viewReports;

  /// No description provided for @viewReportsDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to view reports'**
  String get viewReportsDescription;

  /// No description provided for @exportReports.
  ///
  /// In en, this message translates to:
  /// **'Export Reports'**
  String get exportReports;

  /// No description provided for @exportReportsDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to export reports'**
  String get exportReportsDescription;

  /// No description provided for @companySettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to edit company settings'**
  String get companySettingsDescription;

  /// No description provided for @systemSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Ability to edit system settings'**
  String get systemSettingsDescription;

  /// No description provided for @systemAdministrator.
  ///
  /// In en, this message translates to:
  /// **'System Administrator'**
  String get systemAdministrator;

  /// No description provided for @systemAdministratorDescription.
  ///
  /// In en, this message translates to:
  /// **'Has all permissions in the system'**
  String get systemAdministratorDescription;

  /// No description provided for @accountantDescription.
  ///
  /// In en, this message translates to:
  /// **'Manages invoices, expenses and financial reports'**
  String get accountantDescription;

  /// No description provided for @userDescription.
  ///
  /// In en, this message translates to:
  /// **'Limited permissions for viewing and reading'**
  String get userDescription;

  /// No description provided for @supervisorDescription.
  ///
  /// In en, this message translates to:
  /// **'Manages users and permissions'**
  String get supervisorDescription;

  /// No description provided for @searchInClients.
  ///
  /// In en, this message translates to:
  /// **'Search in clients...'**
  String get searchInClients;

  /// No description provided for @noClients.
  ///
  /// In en, this message translates to:
  /// **'No clients'**
  String get noClients;

  /// No description provided for @pressAddToCreateClient.
  ///
  /// In en, this message translates to:
  /// **'Press add button to create new client'**
  String get pressAddToCreateClient;

  /// No description provided for @taxNumber.
  ///
  /// In en, this message translates to:
  /// **'Tax Number'**
  String get taxNumber;

  /// No description provided for @contactPersonInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Person Information'**
  String get contactPersonInformation;

  /// No description provided for @contactPersonName.
  ///
  /// In en, this message translates to:
  /// **'Contact Person Name'**
  String get contactPersonName;

  /// No description provided for @contactPersonPhone.
  ///
  /// In en, this message translates to:
  /// **'Contact Person Phone'**
  String get contactPersonPhone;

  /// No description provided for @contactPersonEmail.
  ///
  /// In en, this message translates to:
  /// **'Contact Person Email'**
  String get contactPersonEmail;

  /// No description provided for @creationDate.
  ///
  /// In en, this message translates to:
  /// **'Creation Date'**
  String get creationDate;

  /// No description provided for @clientName.
  ///
  /// In en, this message translates to:
  /// **'Client Name'**
  String get clientName;

  /// No description provided for @enterWebsite.
  ///
  /// In en, this message translates to:
  /// **'Enter website'**
  String get enterWebsite;

  /// No description provided for @enterContactPersonName.
  ///
  /// In en, this message translates to:
  /// **'Enter contact person name'**
  String get enterContactPersonName;

  /// No description provided for @enterContactPersonPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter contact person phone'**
  String get enterContactPersonPhone;

  /// No description provided for @enterContactPersonEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter contact person email'**
  String get enterContactPersonEmail;

  /// No description provided for @enterAdditionalNotes.
  ///
  /// In en, this message translates to:
  /// **'Enter additional notes'**
  String get enterAdditionalNotes;

  /// No description provided for @editClientData.
  ///
  /// In en, this message translates to:
  /// **'Edit client data for \"{name}\"'**
  String editClientData(Object name);

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @errorUpdatingClient.
  ///
  /// In en, this message translates to:
  /// **'Error updating client: {error}'**
  String errorUpdatingClient(Object error);

  /// No description provided for @fillFormToAddClient.
  ///
  /// In en, this message translates to:
  /// **'Fill the form below to add new client to the system'**
  String get fillFormToAddClient;

  /// No description provided for @errorCreatingClient.
  ///
  /// In en, this message translates to:
  /// **'Error creating client: {error}'**
  String errorCreatingClient(Object error);

  /// No description provided for @errorLoadingClients.
  ///
  /// In en, this message translates to:
  /// **'Error loading clients: {error}'**
  String errorLoadingClients(Object error);

  /// No description provided for @errorDeletingClient.
  ///
  /// In en, this message translates to:
  /// **'Error deleting client: {error}'**
  String errorDeletingClient(Object error);

  /// No description provided for @errorLoadingStatistics.
  ///
  /// In en, this message translates to:
  /// **'Error loading statistics: {error}'**
  String errorLoadingStatistics(Object error);

  /// No description provided for @errorDeletingClients.
  ///
  /// In en, this message translates to:
  /// **'Error deleting clients: {error}'**
  String errorDeletingClients(Object error);

  /// No description provided for @errorUpdatingClientStatus.
  ///
  /// In en, this message translates to:
  /// **'Error updating client status: {error}'**
  String errorUpdatingClientStatus(Object error);

  /// No description provided for @dataConversionError.
  ///
  /// In en, this message translates to:
  /// **'Data conversion error: {error}'**
  String dataConversionError(Object error);

  /// No description provided for @nameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get nameMinLength;

  /// No description provided for @nameMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be less than 50 characters'**
  String get nameMaxLength;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneRequired;

  /// No description provided for @phoneMinLength.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be at least 10 digits'**
  String get phoneMinLength;

  /// No description provided for @phoneMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be less than 15 digits'**
  String get phoneMaxLength;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be less than 50 characters'**
  String get passwordMaxLength;

  /// No description provided for @passwordUppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get passwordUppercase;

  /// No description provided for @passwordLowercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get passwordLowercase;

  /// No description provided for @passwordNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get passwordNumber;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @thisField.
  ///
  /// In en, this message translates to:
  /// **'This field'**
  String get thisField;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @loadingUsers.
  ///
  /// In en, this message translates to:
  /// **'Loading users...'**
  String get loadingUsers;

  /// No description provided for @signInFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign in failed'**
  String get signInFailed;

  /// No description provided for @loginCancelled.
  ///
  /// In en, this message translates to:
  /// **'Login cancelled'**
  String get loginCancelled;

  /// No description provided for @failedToGetUserData.
  ///
  /// In en, this message translates to:
  /// **'Failed to get user data'**
  String get failedToGetUserData;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Login error'**
  String get loginError;

  /// No description provided for @playServicesNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Play services not available'**
  String get playServicesNotAvailable;

  /// No description provided for @googleSignInError.
  ///
  /// In en, this message translates to:
  /// **'Google sign in error'**
  String get googleSignInError;

  /// No description provided for @addInvoice.
  ///
  /// In en, this message translates to:
  /// **'Add Invoice'**
  String get addInvoice;

  /// No description provided for @invoices.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get invoices;

  /// No description provided for @searchInInvoices.
  ///
  /// In en, this message translates to:
  /// **'Search in invoices...'**
  String get searchInInvoices;

  /// No description provided for @allPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'All Payment Methods'**
  String get allPaymentMethods;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @allCustomers.
  ///
  /// In en, this message translates to:
  /// **'All Customers'**
  String get allCustomers;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get draft;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get total;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal:'**
  String get subtotal;

  /// No description provided for @tax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get tax;

  /// No description provided for @noItems.
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get noItems;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// No description provided for @searchItems.
  ///
  /// In en, this message translates to:
  /// **'Search items...'**
  String get searchItems;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLess;

  /// No description provided for @showAllItems.
  ///
  /// In en, this message translates to:
  /// **'Show All Items ({count})'**
  String showAllItems(Object count);

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetails;

  /// No description provided for @markAsPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark as Paid'**
  String get markAsPaid;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @duplicate.
  ///
  /// In en, this message translates to:
  /// **'Duplicate'**
  String get duplicate;

  /// No description provided for @downloadPDF.
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get downloadPDF;

  /// No description provided for @noInvoices.
  ///
  /// In en, this message translates to:
  /// **'No Invoices'**
  String get noInvoices;

  /// No description provided for @noInvoicesDescription.
  ///
  /// In en, this message translates to:
  /// **'Press the add button to create a new invoice'**
  String get noInvoicesDescription;

  /// No description provided for @addFirstInvoice.
  ///
  /// In en, this message translates to:
  /// **'Add First Invoice'**
  String get addFirstInvoice;

  /// No description provided for @deleteInvoiceConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete Invoice Confirmation'**
  String get deleteInvoiceConfirmation;

  /// No description provided for @deleteInvoiceWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this invoice? This action cannot be undone.'**
  String get deleteInvoiceWarning;

  /// No description provided for @sendMethod.
  ///
  /// In en, this message translates to:
  /// **'Send Method'**
  String get sendMethod;

  /// No description provided for @sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get sms;

  /// No description provided for @emailDetails.
  ///
  /// In en, this message translates to:
  /// **'Email Details'**
  String get emailDetails;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @enterSubject.
  ///
  /// In en, this message translates to:
  /// **'Enter subject'**
  String get enterSubject;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @enterMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter message'**
  String get enterMessage;

  /// No description provided for @includePDF.
  ///
  /// In en, this message translates to:
  /// **'Include PDF'**
  String get includePDF;

  /// No description provided for @paymentDate.
  ///
  /// In en, this message translates to:
  /// **'Payment Date'**
  String get paymentDate;

  /// No description provided for @addNotes.
  ///
  /// In en, this message translates to:
  /// **'Add Notes'**
  String get addNotes;

  /// No description provided for @invoiceHelp.
  ///
  /// In en, this message translates to:
  /// **'Invoice Help'**
  String get invoiceHelp;

  /// No description provided for @creatingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Creating Invoices'**
  String get creatingInvoices;

  /// No description provided for @createInvoiceStep1.
  ///
  /// In en, this message translates to:
  /// **'1. Enter basic customer information'**
  String get createInvoiceStep1;

  /// No description provided for @createInvoiceStep2.
  ///
  /// In en, this message translates to:
  /// **'2. Add items and quantities'**
  String get createInvoiceStep2;

  /// No description provided for @createInvoiceStep3.
  ///
  /// In en, this message translates to:
  /// **'3. Set payment method and date'**
  String get createInvoiceStep3;

  /// No description provided for @createInvoiceStep4.
  ///
  /// In en, this message translates to:
  /// **'4. Review and save the invoice'**
  String get createInvoiceStep4;

  /// No description provided for @managingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Managing Invoices'**
  String get managingInvoices;

  /// No description provided for @manageInvoiceStep1.
  ///
  /// In en, this message translates to:
  /// **'1. Use search and filters to find invoices'**
  String get manageInvoiceStep1;

  /// No description provided for @manageInvoiceStep2.
  ///
  /// In en, this message translates to:
  /// **'2. Tap on invoice to view details'**
  String get manageInvoiceStep2;

  /// No description provided for @manageInvoiceStep3.
  ///
  /// In en, this message translates to:
  /// **'3. Use buttons to edit or delete'**
  String get manageInvoiceStep3;

  /// No description provided for @manageInvoiceStep4.
  ///
  /// In en, this message translates to:
  /// **'4. Send invoice to customer when needed'**
  String get manageInvoiceStep4;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @paymentMethodCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get paymentMethodCash;

  /// No description provided for @paymentMethodCard.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get paymentMethodCard;

  /// No description provided for @paymentMethodBank.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get paymentMethodBank;

  /// No description provided for @paymentMethodCheck.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get paymentMethodCheck;

  /// No description provided for @taxIntegration.
  ///
  /// In en, this message translates to:
  /// **'Tax Integration'**
  String get taxIntegration;

  /// No description provided for @taxIntegrationStep1.
  ///
  /// In en, this message translates to:
  /// **'1. Enable tax integration'**
  String get taxIntegrationStep1;

  /// No description provided for @taxIntegrationStep2.
  ///
  /// In en, this message translates to:
  /// **'2. Enter company tax information'**
  String get taxIntegrationStep2;

  /// No description provided for @taxIntegrationStep3.
  ///
  /// In en, this message translates to:
  /// **'3. Test connection and save settings'**
  String get taxIntegrationStep3;

  /// No description provided for @invoiceDetails.
  ///
  /// In en, this message translates to:
  /// **'Invoice Details'**
  String get invoiceDetails;

  /// No description provided for @customerInformation.
  ///
  /// In en, this message translates to:
  /// **'Customer Information'**
  String get customerInformation;

  /// No description provided for @amountInformation.
  ///
  /// In en, this message translates to:
  /// **'Amount Information'**
  String get amountInformation;

  /// No description provided for @invoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Invoice Number'**
  String get invoiceNumber;

  /// No description provided for @enterInvoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter invoice number'**
  String get enterInvoiceNumber;

  /// No description provided for @issueDate.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get issueDate;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @enterCustomerEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enterCustomerEmail;

  /// No description provided for @enterCustomerPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enterCustomerPhone;

  /// No description provided for @enterSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Enter subtotal'**
  String get enterSubtotal;

  /// No description provided for @enterTaxAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter tax amount'**
  String get enterTaxAmount;

  /// No description provided for @taxIntegrationSettings.
  ///
  /// In en, this message translates to:
  /// **'Tax Integration Settings'**
  String get taxIntegrationSettings;

  /// No description provided for @configureTaxIntegration.
  ///
  /// In en, this message translates to:
  /// **'Configure Tax Integration'**
  String get configureTaxIntegration;

  /// No description provided for @enableTaxIntegration.
  ///
  /// In en, this message translates to:
  /// **'Enable Tax Integration'**
  String get enableTaxIntegration;

  /// No description provided for @taxType.
  ///
  /// In en, this message translates to:
  /// **'Tax Type'**
  String get taxType;

  /// No description provided for @vat.
  ///
  /// In en, this message translates to:
  /// **'VAT'**
  String get vat;

  /// No description provided for @salesTax.
  ///
  /// In en, this message translates to:
  /// **'Sales Tax'**
  String get salesTax;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @saudiArabia.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get saudiArabia;

  /// No description provided for @uae.
  ///
  /// In en, this message translates to:
  /// **'United Arab Emirates'**
  String get uae;

  /// No description provided for @kuwait.
  ///
  /// In en, this message translates to:
  /// **'Kuwait'**
  String get kuwait;

  /// No description provided for @testConnection.
  ///
  /// In en, this message translates to:
  /// **'Test Connection'**
  String get testConnection;

  /// No description provided for @vatNumber.
  ///
  /// In en, this message translates to:
  /// **'VAT Number'**
  String get vatNumber;

  /// No description provided for @enterVatNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter VAT number'**
  String get enterVatNumber;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @postalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get postalCode;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter phone'**
  String get enterPhone;

  /// No description provided for @testingConnection.
  ///
  /// In en, this message translates to:
  /// **'Testing connection...'**
  String get testingConnection;

  /// No description provided for @taxAmount.
  ///
  /// In en, this message translates to:
  /// **'Tax Amount:'**
  String get taxAmount;

  /// No description provided for @enterDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get enterDescription;

  /// No description provided for @searchInvoices.
  ///
  /// In en, this message translates to:
  /// **'Search invoices...'**
  String get searchInvoices;

  /// No description provided for @loadingInvoiceDetails.
  ///
  /// In en, this message translates to:
  /// **'Loading invoice details...'**
  String get loadingInvoiceDetails;

  /// No description provided for @errorLoadingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Error loading invoice'**
  String get errorLoadingInvoice;

  /// No description provided for @noInvoiceData.
  ///
  /// In en, this message translates to:
  /// **'No invoice data available'**
  String get noInvoiceData;

  /// No description provided for @invoiceNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Invoice Number: {number}'**
  String invoiceNumberLabel(String number);

  /// No description provided for @shareInvoice.
  ///
  /// In en, this message translates to:
  /// **'Share Invoice'**
  String get shareInvoice;

  /// No description provided for @printInvoice.
  ///
  /// In en, this message translates to:
  /// **'Print Invoice'**
  String get printInvoice;

  /// No description provided for @duplicateInvoice.
  ///
  /// In en, this message translates to:
  /// **'Duplicate Invoice'**
  String get duplicateInvoice;

  /// No description provided for @viewQRCode.
  ///
  /// In en, this message translates to:
  /// **'View QR Code'**
  String get viewQRCode;

  /// No description provided for @viewTaxUID.
  ///
  /// In en, this message translates to:
  /// **'View Tax UID'**
  String get viewTaxUID;

  /// No description provided for @updateStatus.
  ///
  /// In en, this message translates to:
  /// **'Update Status'**
  String get updateStatus;

  /// No description provided for @changeStatus.
  ///
  /// In en, this message translates to:
  /// **'Change Status'**
  String get changeStatus;

  /// No description provided for @moreOptions.
  ///
  /// In en, this message translates to:
  /// **'More Options'**
  String get moreOptions;

  /// No description provided for @refreshData.
  ///
  /// In en, this message translates to:
  /// **'Refresh Data'**
  String get refreshData;

  /// No description provided for @invoiceCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Invoice details copied to clipboard'**
  String get invoiceCopiedToClipboard;

  /// No description provided for @invoiceCopiedForPrinting.
  ///
  /// In en, this message translates to:
  /// **'Invoice details copied for printing'**
  String get invoiceCopiedForPrinting;

  /// No description provided for @invoiceSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Invoice sent successfully'**
  String get invoiceSentSuccessfully;

  /// No description provided for @invoiceDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Invoice deleted successfully'**
  String get invoiceDeletedSuccessfully;

  /// No description provided for @invoiceStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'Invoice status updated to: {status}'**
  String invoiceStatusUpdated(String status);

  /// No description provided for @fileSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'File saved to: {path}'**
  String fileSavedSuccessfully(String path);

  /// No description provided for @noQRCodeAvailable.
  ///
  /// In en, this message translates to:
  /// **'No QR code available for this invoice'**
  String get noQRCodeAvailable;

  /// No description provided for @noTaxUIDAvailable.
  ///
  /// In en, this message translates to:
  /// **'No tax UID available for this invoice'**
  String get noTaxUIDAvailable;

  /// No description provided for @taxUIDCopied.
  ///
  /// In en, this message translates to:
  /// **'Tax UID copied'**
  String get taxUIDCopied;

  /// No description provided for @shareInvoiceText.
  ///
  /// In en, this message translates to:
  /// **'Invoice Number: {number}\nCustomer: {customer}\nDate: {date}\nAmount: {amount} SAR\nStatus: {status}\n\nCreated by Invotek App'**
  String shareInvoiceText(
    String number,
    String customer,
    String date,
    String amount,
    String status,
  );

  /// No description provided for @printInvoiceText.
  ///
  /// In en, this message translates to:
  /// **'Invoice\n{separator}\nInvoice Number: {number}\nDate: {date}\nStatus: {status}\n\nCustomer Information:\nName: {customer}\n{contact}\n\nInvoice Items:\n{items}\n\nTotals:\nSubtotal: {subtotal} SAR\n{tax}\nTotal: {total} SAR\n\n{separator}\nThank you for your business\nThis invoice was created by Invotek App\n{separator}'**
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
  );

  /// No description provided for @statusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get statusPaid;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get statusOverdue;

  /// No description provided for @statusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get statusDraft;

  /// No description provided for @statusSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get statusSent;

  /// No description provided for @itemDetails.
  ///
  /// In en, this message translates to:
  /// **'Item Details'**
  String get itemDetails;

  /// No description provided for @changePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Change Payment Method'**
  String get changePaymentMethod;

  /// No description provided for @creatingFile.
  ///
  /// In en, this message translates to:
  /// **'Creating file...'**
  String get creatingFile;

  /// No description provided for @sendingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Sending invoice...'**
  String get sendingInvoice;

  /// No description provided for @deletingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Deleting invoice...'**
  String get deletingInvoice;

  /// No description provided for @updatingStatus.
  ///
  /// In en, this message translates to:
  /// **'Updating status...'**
  String get updatingStatus;

  /// No description provided for @errorSharingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Failed to share invoice: {error}'**
  String errorSharingInvoice(String error);

  /// No description provided for @errorPrintingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Failed to print invoice: {error}'**
  String errorPrintingInvoice(String error);

  /// No description provided for @errorSendingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Failed to send invoice: {error}'**
  String errorSendingInvoice(String error);

  /// No description provided for @errorDeletingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete invoice: {error}'**
  String errorDeletingInvoice(String error);

  /// No description provided for @errorCreatingFile.
  ///
  /// In en, this message translates to:
  /// **'Failed to create file: {error}'**
  String errorCreatingFile(String error);

  /// No description provided for @errorUpdatingStatus.
  ///
  /// In en, this message translates to:
  /// **'Failed to update status: {error}'**
  String errorUpdatingStatus(String error);

  /// No description provided for @duplicateInvoiceMessage.
  ///
  /// In en, this message translates to:
  /// **'Duplicate invoice {number}'**
  String duplicateInvoiceMessage(String number);

  /// No description provided for @viewCustomerDetails.
  ///
  /// In en, this message translates to:
  /// **'View customer details: {name}'**
  String viewCustomerDetails(String name);

  /// No description provided for @viewItemDetails.
  ///
  /// In en, this message translates to:
  /// **'View item details: {name}'**
  String viewItemDetails(String name);

  /// No description provided for @changePaymentMethodForInvoice.
  ///
  /// In en, this message translates to:
  /// **'Change payment method for invoice {number}'**
  String changePaymentMethodForInvoice(String number);

  /// No description provided for @taxUID.
  ///
  /// In en, this message translates to:
  /// **'Tax UID'**
  String get taxUID;

  /// No description provided for @taxUIDForInvoice.
  ///
  /// In en, this message translates to:
  /// **'Tax UID for invoice {number}:'**
  String taxUIDForInvoice(String number);

  /// No description provided for @itemName.
  ///
  /// In en, this message translates to:
  /// **'Item Name'**
  String get itemName;

  /// No description provided for @itemQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get itemQuantity;

  /// No description provided for @itemPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get itemPrice;

  /// No description provided for @itemTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get itemTotal;

  /// No description provided for @thankYouMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your business'**
  String get thankYouMessage;

  /// No description provided for @createdByInvotek.
  ///
  /// In en, this message translates to:
  /// **'This invoice was created by Invotek App'**
  String get createdByInvotek;

  /// No description provided for @separator.
  ///
  /// In en, this message translates to:
  /// **'='**
  String get separator;

  /// No description provided for @itemSeparator.
  ///
  /// In en, this message translates to:
  /// **'-'**
  String get itemSeparator;

  /// No description provided for @itemHeader.
  ///
  /// In en, this message translates to:
  /// **'Name\t\tQuantity\tPrice\tTotal'**
  String get itemHeader;

  /// No description provided for @itemRow.
  ///
  /// In en, this message translates to:
  /// **'{name}\t\t{quantity}\t{price}\t{total}'**
  String itemRow(String name, String quantity, String price, String total);

  /// No description provided for @taxLine.
  ///
  /// In en, this message translates to:
  /// **'Tax: {amount} SAR'**
  String taxLine(String amount);

  /// No description provided for @subtotalLine.
  ///
  /// In en, this message translates to:
  /// **'Subtotal: {amount} SAR'**
  String subtotalLine(String amount);

  /// No description provided for @totalLine.
  ///
  /// In en, this message translates to:
  /// **'Total: {amount} SAR'**
  String totalLine(String amount);

  /// No description provided for @fileName.
  ///
  /// In en, this message translates to:
  /// **'Invoice_{number}_{timestamp}'**
  String fileName(String number, String timestamp);

  /// No description provided for @loadingProductDetails.
  ///
  /// In en, this message translates to:
  /// **'Loading product details...'**
  String loadingProductDetails(String name);

  /// No description provided for @createNewInvoiceStepper.
  ///
  /// In en, this message translates to:
  /// **'Create New Invoice'**
  String get createNewInvoiceStepper;

  /// No description provided for @invoiceBasicInfo.
  ///
  /// In en, this message translates to:
  /// **'Invoice Information'**
  String get invoiceBasicInfo;

  /// No description provided for @reviewCalculations.
  ///
  /// In en, this message translates to:
  /// **'Review Calculations'**
  String get reviewCalculations;

  /// No description provided for @invoiceCreationHelp.
  ///
  /// In en, this message translates to:
  /// **'This form helps you create a new invoice step by step:\n\n1. Invoice Information: Choose action, payment method, and status\n2. Select Customer: Choose existing customer or add new one\n3. Invoice Items: Add items, quantities, and prices\n4. Review Calculations: Review final details before saving'**
  String get invoiceCreationHelp;

  /// No description provided for @invoiceCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Invoice created successfully'**
  String get invoiceCreatedSuccessfully;

  /// No description provided for @errorCreatingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorCreatingInvoice(String error);

  /// No description provided for @fillRequiredFieldsBasicInfo.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields in Invoice Information'**
  String get fillRequiredFieldsBasicInfo;

  /// No description provided for @selectOrAddCustomer.
  ///
  /// In en, this message translates to:
  /// **'Please select a customer or enter customer data'**
  String get selectOrAddCustomer;

  /// No description provided for @addAtLeastOneItem.
  ///
  /// In en, this message translates to:
  /// **'Please add at least one item'**
  String get addAtLeastOneItem;

  /// No description provided for @actionRequired.
  ///
  /// In en, this message translates to:
  /// **'Action is required'**
  String get actionRequired;

  /// No description provided for @paymentMethodRequired.
  ///
  /// In en, this message translates to:
  /// **'Payment method is required'**
  String get paymentMethodRequired;

  /// No description provided for @statusRequired.
  ///
  /// In en, this message translates to:
  /// **'Invoice status is required'**
  String get statusRequired;

  /// No description provided for @customerRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a customer or enter customer data'**
  String get customerRequired;

  /// No description provided for @itemsRequired.
  ///
  /// In en, this message translates to:
  /// **'Please add at least one item'**
  String get itemsRequired;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @saveOnly.
  ///
  /// In en, this message translates to:
  /// **'Save Only'**
  String get saveOnly;

  /// No description provided for @saveAndSend.
  ///
  /// In en, this message translates to:
  /// **'Save and Send'**
  String get saveAndSend;

  /// No description provided for @debts.
  ///
  /// In en, this message translates to:
  /// **'Debts'**
  String get debts;

  /// No description provided for @invoiceStatus.
  ///
  /// In en, this message translates to:
  /// **'Invoice Status'**
  String get invoiceStatus;

  /// No description provided for @sent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get sent;

  /// No description provided for @invoiceDescription.
  ///
  /// In en, this message translates to:
  /// **'Invoice Description'**
  String get invoiceDescription;

  /// No description provided for @enterInvoiceDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter invoice description (optional)'**
  String get enterInvoiceDescription;

  /// No description provided for @customerType.
  ///
  /// In en, this message translates to:
  /// **'Customer Type'**
  String get customerType;

  /// No description provided for @existingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Existing Customer'**
  String get existingCustomer;

  /// No description provided for @newCustomer.
  ///
  /// In en, this message translates to:
  /// **'New Customer'**
  String get newCustomer;

  /// No description provided for @enterCustomerAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get enterCustomerAddress;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get addItem;

  /// No description provided for @addFirstItem.
  ///
  /// In en, this message translates to:
  /// **'Add First Item'**
  String get addFirstItem;

  /// No description provided for @taxPercent.
  ///
  /// In en, this message translates to:
  /// **'Tax Percent (%)'**
  String get taxPercent;

  /// No description provided for @enterItemName.
  ///
  /// In en, this message translates to:
  /// **'Enter item name'**
  String get enterItemName;

  /// No description provided for @enterDiscount.
  ///
  /// In en, this message translates to:
  /// **'Enter discount'**
  String get enterDiscount;

  /// No description provided for @enterTaxPercent.
  ///
  /// In en, this message translates to:
  /// **'Enter tax percent'**
  String get enterTaxPercent;

  /// No description provided for @enterTotal.
  ///
  /// In en, this message translates to:
  /// **'Enter total'**
  String get enterTotal;

  /// No description provided for @removeItem.
  ///
  /// In en, this message translates to:
  /// **'Remove Item'**
  String get removeItem;

  /// No description provided for @editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get editItem;

  /// No description provided for @invoiceInfo.
  ///
  /// In en, this message translates to:
  /// **'Invoice Information'**
  String get invoiceInfo;

  /// No description provided for @customerInfo.
  ///
  /// In en, this message translates to:
  /// **'Customer Information'**
  String get customerInfo;

  /// No description provided for @itemsInfo.
  ///
  /// In en, this message translates to:
  /// **'Items Information'**
  String get itemsInfo;

  /// No description provided for @financialInfo.
  ///
  /// In en, this message translates to:
  /// **'Financial Information'**
  String get financialInfo;

  /// No description provided for @actionType.
  ///
  /// In en, this message translates to:
  /// **'Action Type'**
  String get actionType;

  /// No description provided for @paymentMethodType.
  ///
  /// In en, this message translates to:
  /// **'Payment Method Type'**
  String get paymentMethodType;

  /// No description provided for @statusType.
  ///
  /// In en, this message translates to:
  /// **'Status Type'**
  String get statusType;

  /// No description provided for @issueDateValue.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get issueDateValue;

  /// No description provided for @descriptionValue.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionValue;

  /// No description provided for @customerNameValue.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customerNameValue;

  /// No description provided for @customerEmailValue.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get customerEmailValue;

  /// No description provided for @customerPhoneValue.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get customerPhoneValue;

  /// No description provided for @customerAddressValue.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get customerAddressValue;

  /// No description provided for @itemDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get itemDiscount;

  /// No description provided for @itemTax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get itemTax;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear Search'**
  String get clearSearch;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load More'**
  String get loadMore;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @totalInvoices.
  ///
  /// In en, this message translates to:
  /// **'Total Invoices'**
  String get totalInvoices;

  /// No description provided for @newInvoices.
  ///
  /// In en, this message translates to:
  /// **'New Invoices'**
  String get newInvoices;

  /// No description provided for @totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get totalSales;

  /// No description provided for @totalExpenses.
  ///
  /// In en, this message translates to:
  /// **'Total Expenses'**
  String get totalExpenses;

  /// No description provided for @monthlyExpenses.
  ///
  /// In en, this message translates to:
  /// **'Monthly Expenses'**
  String get monthlyExpenses;

  /// No description provided for @totalCustomers.
  ///
  /// In en, this message translates to:
  /// **'Total Customers'**
  String get totalCustomers;

  /// No description provided for @newCustomers.
  ///
  /// In en, this message translates to:
  /// **'New Customers'**
  String get newCustomers;

  /// No description provided for @totalProducts.
  ///
  /// In en, this message translates to:
  /// **'Total Products'**
  String get totalProducts;

  /// No description provided for @newProducts.
  ///
  /// In en, this message translates to:
  /// **'New Products'**
  String get newProducts;

  /// No description provided for @netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get netProfit;

  /// No description provided for @salesGrowth.
  ///
  /// In en, this message translates to:
  /// **'Sales Growth'**
  String get salesGrowth;

  /// No description provided for @profitGrowth.
  ///
  /// In en, this message translates to:
  /// **'Profit Growth'**
  String get profitGrowth;

  /// No description provided for @topSellingProducts.
  ///
  /// In en, this message translates to:
  /// **'Top Selling Products'**
  String get topSellingProducts;

  /// No description provided for @loadingDashboard.
  ///
  /// In en, this message translates to:
  /// **'Loading dashboard data...'**
  String get loadingDashboard;

  /// No description provided for @errorLoadingDashboard.
  ///
  /// In en, this message translates to:
  /// **'Error loading dashboard'**
  String get errorLoadingDashboard;

  /// No description provided for @dashboardError.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get dashboardError;

  /// No description provided for @dashboardErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading dashboard data'**
  String get dashboardErrorMessage;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataAvailable;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Dinar'**
  String get currency;

  /// No description provided for @growth.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get growth;

  /// No description provided for @decrease.
  ///
  /// In en, this message translates to:
  /// **'Decrease'**
  String get decrease;

  /// No description provided for @increase.
  ///
  /// In en, this message translates to:
  /// **'Increase'**
  String get increase;

  /// No description provided for @newThisMonth.
  ///
  /// In en, this message translates to:
  /// **'New This Month'**
  String get newThisMonth;

  /// No description provided for @productsInStock.
  ///
  /// In en, this message translates to:
  /// **'Products in Stock'**
  String get productsInStock;

  /// No description provided for @salesDistribution.
  ///
  /// In en, this message translates to:
  /// **'Sales Distribution'**
  String get salesDistribution;

  /// No description provided for @invoiceStatistics.
  ///
  /// In en, this message translates to:
  /// **'Invoice Statistics'**
  String get invoiceStatistics;

  /// No description provided for @allInvoices.
  ///
  /// In en, this message translates to:
  /// **'All Invoices'**
  String get allInvoices;

  /// No description provided for @regularInvoices.
  ///
  /// In en, this message translates to:
  /// **'Regular Invoices'**
  String get regularInvoices;

  /// No description provided for @monthlySalesStatistics.
  ///
  /// In en, this message translates to:
  /// **'Monthly Sales Statistics'**
  String get monthlySalesStatistics;

  /// No description provided for @salesCategories.
  ///
  /// In en, this message translates to:
  /// **'Sales Categories'**
  String get salesCategories;

  /// No description provided for @firstCategory.
  ///
  /// In en, this message translates to:
  /// **'First Category'**
  String get firstCategory;

  /// No description provided for @uncategorized.
  ///
  /// In en, this message translates to:
  /// **'Uncategorized'**
  String get uncategorized;

  /// No description provided for @printOptions.
  ///
  /// In en, this message translates to:
  /// **'Print Options'**
  String get printOptions;

  /// No description provided for @thermalPrint.
  ///
  /// In en, this message translates to:
  /// **'Thermal Print'**
  String get thermalPrint;

  /// No description provided for @thermalPrintDesc.
  ///
  /// In en, this message translates to:
  /// **'For thermal printers - 80mm'**
  String get thermalPrintDesc;

  /// No description provided for @pdfPrint.
  ///
  /// In en, this message translates to:
  /// **'PDF Print'**
  String get pdfPrint;

  /// No description provided for @pdfPrintDesc.
  ///
  /// In en, this message translates to:
  /// **'View and save PDF'**
  String get pdfPrintDesc;

  /// No description provided for @printerStatus.
  ///
  /// In en, this message translates to:
  /// **'Printer Status'**
  String get printerStatus;

  /// No description provided for @printerConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected to printer'**
  String get printerConnected;

  /// No description provided for @printerDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected from printer'**
  String get printerDisconnected;

  /// No description provided for @checkingConnection.
  ///
  /// In en, this message translates to:
  /// **'Checking connection...'**
  String get checkingConnection;

  /// No description provided for @searchingPrinter.
  ///
  /// In en, this message translates to:
  /// **'Searching for printer...'**
  String get searchingPrinter;

  /// No description provided for @printReceipt.
  ///
  /// In en, this message translates to:
  /// **'Print Receipt'**
  String get printReceipt;

  /// No description provided for @retryConnection.
  ///
  /// In en, this message translates to:
  /// **'Retry Connection'**
  String get retryConnection;

  /// No description provided for @pdfPreview.
  ///
  /// In en, this message translates to:
  /// **'PDF Preview'**
  String get pdfPreview;

  /// No description provided for @savePDF.
  ///
  /// In en, this message translates to:
  /// **'Save PDF'**
  String get savePDF;

  /// No description provided for @generatingPDF.
  ///
  /// In en, this message translates to:
  /// **'Generating PDF...'**
  String get generatingPDF;

  /// No description provided for @pdfGenerated.
  ///
  /// In en, this message translates to:
  /// **'PDF generated successfully'**
  String get pdfGenerated;

  /// No description provided for @pdfSaved.
  ///
  /// In en, this message translates to:
  /// **'PDF saved successfully'**
  String get pdfSaved;

  /// No description provided for @printError.
  ///
  /// In en, this message translates to:
  /// **'Print error'**
  String get printError;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get connectionError;

  /// No description provided for @thermalReceipt.
  ///
  /// In en, this message translates to:
  /// **'Thermal Receipt'**
  String get thermalReceipt;

  /// No description provided for @thankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your business'**
  String get thankYou;

  /// No description provided for @printSuccess.
  ///
  /// In en, this message translates to:
  /// **'Print successful'**
  String get printSuccess;

  /// No description provided for @printFailed.
  ///
  /// In en, this message translates to:
  /// **'Print failed'**
  String get printFailed;

  /// No description provided for @pdfError.
  ///
  /// In en, this message translates to:
  /// **'PDF generation error'**
  String get pdfError;

  /// No description provided for @saveError.
  ///
  /// In en, this message translates to:
  /// **'Save error'**
  String get saveError;

  /// No description provided for @printSettings.
  ///
  /// In en, this message translates to:
  /// **'Print Settings'**
  String get printSettings;

  /// No description provided for @paperSize.
  ///
  /// In en, this message translates to:
  /// **'Paper Size'**
  String get paperSize;

  /// No description provided for @printerName.
  ///
  /// In en, this message translates to:
  /// **'Printer Name'**
  String get printerName;

  /// No description provided for @connectionType.
  ///
  /// In en, this message translates to:
  /// **'Connection Type'**
  String get connectionType;

  /// No description provided for @bluetooth.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get bluetooth;

  /// No description provided for @usb.
  ///
  /// In en, this message translates to:
  /// **'USB'**
  String get usb;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// No description provided for @selectPrinter.
  ///
  /// In en, this message translates to:
  /// **'Select Printer'**
  String get selectPrinter;

  /// No description provided for @noPrintersFound.
  ///
  /// In en, this message translates to:
  /// **'No printers found'**
  String get noPrintersFound;

  /// No description provided for @refreshPrinters.
  ///
  /// In en, this message translates to:
  /// **'Refresh Printers'**
  String get refreshPrinters;

  /// No description provided for @printerSettings.
  ///
  /// In en, this message translates to:
  /// **'Printer Settings'**
  String get printerSettings;

  /// No description provided for @testPrint.
  ///
  /// In en, this message translates to:
  /// **'Test Print'**
  String get testPrint;

  /// No description provided for @printQuality.
  ///
  /// In en, this message translates to:
  /// **'Print Quality'**
  String get printQuality;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @searchExpenses.
  ///
  /// In en, this message translates to:
  /// **'.... Search expenses'**
  String get searchExpenses;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget password?'**
  String get forgetPassword;

  /// No description provided for @forgetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgetPasswordTitle;

  /// No description provided for @forgetPasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to send verification code'**
  String get forgetPasswordDesc;

  /// No description provided for @sendVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendVerificationCode;

  /// No description provided for @verifyCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCodeTitle;

  /// No description provided for @verifyCodeDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to {email}'**
  String verifyCodeDesc(Object email);

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Code'**
  String get enterCode;

  /// No description provided for @verifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @resendCodeIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds} seconds'**
  String resendCodeIn(Object seconds);

  /// No description provided for @codeResent.
  ///
  /// In en, this message translates to:
  /// **'Code resent successfully'**
  String get codeResent;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get resetPasswordDesc;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @passwordStrengthWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get passwordStrengthWeak;

  /// No description provided for @passwordStrengthMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get passwordStrengthMedium;

  /// No description provided for @passwordStrengthStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get passwordStrengthStrong;

  /// No description provided for @resetPasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get resetPasswordSuccess;

  /// No description provided for @accessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access Denied'**
  String get accessDenied;

  /// No description provided for @noPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, you don\'t have permission to access {feature}'**
  String noPermissionMessage(Object feature);

  /// No description provided for @contactAdminForAccess.
  ///
  /// In en, this message translates to:
  /// **'Please contact the system administrator for access'**
  String get contactAdminForAccess;

  /// No description provided for @pasteCode.
  ///
  /// In en, this message translates to:
  /// **'Paste Code'**
  String get pasteCode;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get invalidCode;

  /// No description provided for @codeMustBe6Digits.
  ///
  /// In en, this message translates to:
  /// **'Code must be 6 digits'**
  String get codeMustBe6Digits;

  /// No description provided for @enterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enterVerificationCode;

  /// No description provided for @checkYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get checkYourEmail;

  /// No description provided for @otpSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent to your email'**
  String get otpSentToEmail;

  /// No description provided for @copyCodeFromEmail.
  ///
  /// In en, this message translates to:
  /// **'Copy the code from email and paste here'**
  String get copyCodeFromEmail;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @backToLoginScreen.
  ///
  /// In en, this message translates to:
  /// **'Back to Login Screen'**
  String get backToLoginScreen;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, 👋'**
  String get welcomeBack;

  /// No description provided for @welcomeBackWithName.
  ///
  /// In en, this message translates to:
  /// **'Welcome {name}, 👋'**
  String welcomeBackWithName(String name);

  /// No description provided for @subscriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Subscription Required'**
  String get subscriptionRequired;

  /// No description provided for @subscriptionRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'You must choose a suitable subscription to use this feature'**
  String get subscriptionRequiredMessage;

  /// No description provided for @chooseSubscription.
  ///
  /// In en, this message translates to:
  /// **'Choose Subscription'**
  String get chooseSubscription;

  /// No description provided for @cannotOpenSubscriptionLink.
  ///
  /// In en, this message translates to:
  /// **'Cannot open subscription link'**
  String get cannotOpenSubscriptionLink;

  /// No description provided for @noProductsSoldYet.
  ///
  /// In en, this message translates to:
  /// **'No products sold yet'**
  String get noProductsSoldYet;

  /// No description provided for @noProductsSoldMessage.
  ///
  /// In en, this message translates to:
  /// **'Start creating your first invoices to see the top selling products'**
  String get noProductsSoldMessage;

  /// No description provided for @undefinedProduct.
  ///
  /// In en, this message translates to:
  /// **'Undefined Product'**
  String get undefinedProduct;

  /// No description provided for @customerAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Customer Analytics'**
  String get customerAnalytics;

  /// No description provided for @lastInvoices.
  ///
  /// In en, this message translates to:
  /// **'Last Invoices'**
  String get lastInvoices;

  /// No description provided for @lastFiveInvoices.
  ///
  /// In en, this message translates to:
  /// **'Last 5 Invoices'**
  String get lastFiveInvoices;

  /// No description provided for @saudiRiyal.
  ///
  /// In en, this message translates to:
  /// **'Saudi Riyal'**
  String get saudiRiyal;

  /// No description provided for @loadingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Loading Invoices...'**
  String get loadingInvoices;

  /// No description provided for @errorLoadingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Error Loading Invoices'**
  String get errorLoadingInvoices;

  /// No description provided for @invoiceAmount.
  ///
  /// In en, this message translates to:
  /// **'Invoice Amount'**
  String get invoiceAmount;

  /// No description provided for @invoiceDate.
  ///
  /// In en, this message translates to:
  /// **'Invoice Date'**
  String get invoiceDate;

  /// No description provided for @invoicePaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get invoicePaid;

  /// No description provided for @invoicePending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get invoicePending;

  /// No description provided for @invoiceCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get invoiceCancelled;

  /// No description provided for @invoiceDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get invoiceDraft;

  /// No description provided for @invoiceOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get invoiceOverdue;

  /// No description provided for @invoiceSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get invoiceSent;

  /// No description provided for @invoiceReturned.
  ///
  /// In en, this message translates to:
  /// **'Returned'**
  String get invoiceReturned;

  /// No description provided for @invoiceUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get invoiceUnknown;

  /// No description provided for @andMoreInvoices.
  ///
  /// In en, this message translates to:
  /// **'and {count} more invoices...'**
  String andMoreInvoices(int count);

  /// No description provided for @customerContactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get customerContactInfo;

  /// No description provided for @customerAccountStatus.
  ///
  /// In en, this message translates to:
  /// **'Account Status'**
  String get customerAccountStatus;

  /// No description provided for @customerQuickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get customerQuickActions;

  /// No description provided for @customerCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get customerCompany;

  /// No description provided for @customerActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get customerActive;

  /// No description provided for @customerInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get customerInactive;

  /// No description provided for @customerCreatedDate.
  ///
  /// In en, this message translates to:
  /// **'Created Date'**
  String get customerCreatedDate;

  /// No description provided for @customerLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get customerLastUpdated;

  /// No description provided for @customerAddressInfo.
  ///
  /// In en, this message translates to:
  /// **'Address Information'**
  String get customerAddressInfo;

  /// No description provided for @customerFormHelp.
  ///
  /// In en, this message translates to:
  /// **'Customer Form Help'**
  String get customerFormHelp;

  /// No description provided for @customerFormHelpDescription.
  ///
  /// In en, this message translates to:
  /// **'This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information'**
  String get customerFormHelpDescription;

  /// No description provided for @errorUpdatingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Error updating customer'**
  String get errorUpdatingCustomer;

  /// No description provided for @errorDeletingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Error deleting customer'**
  String get errorDeletingCustomer;

  /// No description provided for @errorLoadingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Error loading customer'**
  String get errorLoadingCustomer;

  /// No description provided for @customerEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get customerEmailRequired;

  /// No description provided for @customerAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get customerAddressRequired;

  /// No description provided for @customerCompanyRequired.
  ///
  /// In en, this message translates to:
  /// **'Company name is required'**
  String get customerCompanyRequired;

  /// No description provided for @customerTaxNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Tax number is required'**
  String get customerTaxNumberRequired;

  /// No description provided for @customerCommercialRegisterRequired.
  ///
  /// In en, this message translates to:
  /// **'Commercial register is required'**
  String get customerCommercialRegisterRequired;

  /// No description provided for @customerCityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get customerCityRequired;

  /// No description provided for @customerRegionRequired.
  ///
  /// In en, this message translates to:
  /// **'Region is required'**
  String get customerRegionRequired;

  /// No description provided for @customerPostalCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Postal code is required'**
  String get customerPostalCodeRequired;

  /// No description provided for @customerDetailedAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Detailed address is required'**
  String get customerDetailedAddressRequired;

  /// No description provided for @customerResponsiblePersonRequired.
  ///
  /// In en, this message translates to:
  /// **'Responsible person is required'**
  String get customerResponsiblePersonRequired;

  /// No description provided for @customerNotesRequired.
  ///
  /// In en, this message translates to:
  /// **'Notes are required'**
  String get customerNotesRequired;

  /// No description provided for @customerStatusRequired.
  ///
  /// In en, this message translates to:
  /// **'Status is required'**
  String get customerStatusRequired;

  /// No description provided for @enterCustomerCompany.
  ///
  /// In en, this message translates to:
  /// **'Enter company name'**
  String get enterCustomerCompany;

  /// No description provided for @enterCustomerTaxNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter tax number'**
  String get enterCustomerTaxNumber;

  /// No description provided for @enterCustomerCommercialRegister.
  ///
  /// In en, this message translates to:
  /// **'Enter commercial register'**
  String get enterCustomerCommercialRegister;

  /// No description provided for @enterCustomerCity.
  ///
  /// In en, this message translates to:
  /// **'Enter city'**
  String get enterCustomerCity;

  /// No description provided for @enterCustomerRegion.
  ///
  /// In en, this message translates to:
  /// **'Enter region'**
  String get enterCustomerRegion;

  /// No description provided for @enterCustomerPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Enter postal code'**
  String get enterCustomerPostalCode;

  /// No description provided for @enterCustomerDetailedAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter detailed address'**
  String get enterCustomerDetailedAddress;

  /// No description provided for @enterCustomerResponsiblePerson.
  ///
  /// In en, this message translates to:
  /// **'Enter responsible person'**
  String get enterCustomerResponsiblePerson;

  /// No description provided for @enterCustomerNotes.
  ///
  /// In en, this message translates to:
  /// **'Enter notes'**
  String get enterCustomerNotes;

  /// No description provided for @selectCustomerStatus.
  ///
  /// In en, this message translates to:
  /// **'Select customer status'**
  String get selectCustomerStatus;

  /// No description provided for @customerFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Customer Form'**
  String get customerFormTitle;

  /// No description provided for @customerFormDescription.
  ///
  /// In en, this message translates to:
  /// **'Fill out the form below to add a new customer to the system'**
  String get customerFormDescription;

  /// No description provided for @viewCustomer.
  ///
  /// In en, this message translates to:
  /// **'View Customer'**
  String get viewCustomer;

  /// No description provided for @customerOptions.
  ///
  /// In en, this message translates to:
  /// **'Customer Options'**
  String get customerOptions;

  /// No description provided for @customerActions.
  ///
  /// In en, this message translates to:
  /// **'Customer Actions'**
  String get customerActions;

  /// No description provided for @customerList.
  ///
  /// In en, this message translates to:
  /// **'Customer List'**
  String get customerList;

  /// No description provided for @customerSearch.
  ///
  /// In en, this message translates to:
  /// **'Search Customers'**
  String get customerSearch;

  /// No description provided for @customerFilters.
  ///
  /// In en, this message translates to:
  /// **'Customer Filters'**
  String get customerFilters;

  /// No description provided for @customerSort.
  ///
  /// In en, this message translates to:
  /// **'Sort Customers'**
  String get customerSort;

  /// No description provided for @customerExport.
  ///
  /// In en, this message translates to:
  /// **'Export Customers'**
  String get customerExport;

  /// No description provided for @customerImport.
  ///
  /// In en, this message translates to:
  /// **'Import Customers'**
  String get customerImport;

  /// No description provided for @customerReports.
  ///
  /// In en, this message translates to:
  /// **'Customer Reports'**
  String get customerReports;

  /// No description provided for @customerStatistics.
  ///
  /// In en, this message translates to:
  /// **'Customer Statistics'**
  String get customerStatistics;

  /// No description provided for @customerPerformance.
  ///
  /// In en, this message translates to:
  /// **'Customer Performance'**
  String get customerPerformance;

  /// No description provided for @customerSatisfaction.
  ///
  /// In en, this message translates to:
  /// **'Customer Satisfaction'**
  String get customerSatisfaction;

  /// No description provided for @customerRetention.
  ///
  /// In en, this message translates to:
  /// **'Customer Retention'**
  String get customerRetention;

  /// No description provided for @customerLoyalty.
  ///
  /// In en, this message translates to:
  /// **'Customer Loyalty'**
  String get customerLoyalty;

  /// No description provided for @customerValue.
  ///
  /// In en, this message translates to:
  /// **'Customer Value'**
  String get customerValue;

  /// No description provided for @customerLifetimeValue.
  ///
  /// In en, this message translates to:
  /// **'Customer Lifetime Value'**
  String get customerLifetimeValue;

  /// No description provided for @customerAcquisition.
  ///
  /// In en, this message translates to:
  /// **'Customer Acquisition'**
  String get customerAcquisition;

  /// No description provided for @customerConversion.
  ///
  /// In en, this message translates to:
  /// **'Customer Conversion'**
  String get customerConversion;

  /// No description provided for @customerEngagement.
  ///
  /// In en, this message translates to:
  /// **'Customer Engagement'**
  String get customerEngagement;

  /// No description provided for @customerFeedback.
  ///
  /// In en, this message translates to:
  /// **'Customer Feedback'**
  String get customerFeedback;

  /// No description provided for @customerSupport.
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get customerSupport;

  /// No description provided for @customerService.
  ///
  /// In en, this message translates to:
  /// **'Customer Service'**
  String get customerService;

  /// No description provided for @customerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Customer Success'**
  String get customerSuccess;

  /// No description provided for @customerOnboarding.
  ///
  /// In en, this message translates to:
  /// **'Customer Onboarding'**
  String get customerOnboarding;

  /// No description provided for @customerTraining.
  ///
  /// In en, this message translates to:
  /// **'Customer Training'**
  String get customerTraining;

  /// No description provided for @customerDocumentation.
  ///
  /// In en, this message translates to:
  /// **'Customer Documentation'**
  String get customerDocumentation;

  /// No description provided for @customerResources.
  ///
  /// In en, this message translates to:
  /// **'Customer Resources'**
  String get customerResources;

  /// No description provided for @customerPortal.
  ///
  /// In en, this message translates to:
  /// **'Customer Portal'**
  String get customerPortal;

  /// No description provided for @customerDashboard.
  ///
  /// In en, this message translates to:
  /// **'Customer Dashboard'**
  String get customerDashboard;

  /// No description provided for @customerProfile.
  ///
  /// In en, this message translates to:
  /// **'Customer Profile'**
  String get customerProfile;

  /// No description provided for @customerHistory.
  ///
  /// In en, this message translates to:
  /// **'Customer History'**
  String get customerHistory;

  /// No description provided for @customerTransactions.
  ///
  /// In en, this message translates to:
  /// **'Customer Transactions'**
  String get customerTransactions;

  /// No description provided for @customerOrders.
  ///
  /// In en, this message translates to:
  /// **'Customer Orders'**
  String get customerOrders;

  /// No description provided for @customerInvoices.
  ///
  /// In en, this message translates to:
  /// **'Customer Invoices'**
  String get customerInvoices;

  /// No description provided for @customerPayments.
  ///
  /// In en, this message translates to:
  /// **'Customer Payments'**
  String get customerPayments;

  /// No description provided for @customerCredits.
  ///
  /// In en, this message translates to:
  /// **'Customer Credits'**
  String get customerCredits;

  /// No description provided for @customerDebits.
  ///
  /// In en, this message translates to:
  /// **'Customer Debits'**
  String get customerDebits;

  /// No description provided for @customerBalance.
  ///
  /// In en, this message translates to:
  /// **'Customer Balance'**
  String get customerBalance;

  /// No description provided for @customerCreditLimit.
  ///
  /// In en, this message translates to:
  /// **'Credit Limit'**
  String get customerCreditLimit;

  /// No description provided for @customerPaymentTerms.
  ///
  /// In en, this message translates to:
  /// **'Payment Terms'**
  String get customerPaymentTerms;

  /// No description provided for @customerDiscount.
  ///
  /// In en, this message translates to:
  /// **'Customer Discount'**
  String get customerDiscount;

  /// No description provided for @customerTaxExempt.
  ///
  /// In en, this message translates to:
  /// **'Tax Exempt'**
  String get customerTaxExempt;

  /// No description provided for @customerVip.
  ///
  /// In en, this message translates to:
  /// **'VIP Customer'**
  String get customerVip;

  /// No description provided for @customerPriority.
  ///
  /// In en, this message translates to:
  /// **'Customer Priority'**
  String get customerPriority;

  /// No description provided for @customerSegment.
  ///
  /// In en, this message translates to:
  /// **'Customer Segment'**
  String get customerSegment;

  /// No description provided for @customerCategory.
  ///
  /// In en, this message translates to:
  /// **'Customer Category'**
  String get customerCategory;

  /// No description provided for @customerSize.
  ///
  /// In en, this message translates to:
  /// **'Customer Size'**
  String get customerSize;

  /// No description provided for @customerIndustry.
  ///
  /// In en, this message translates to:
  /// **'Customer Industry'**
  String get customerIndustry;

  /// No description provided for @customerLocation.
  ///
  /// In en, this message translates to:
  /// **'Customer Location'**
  String get customerLocation;

  /// No description provided for @customerTimezone.
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get customerTimezone;

  /// No description provided for @customerLanguage.
  ///
  /// In en, this message translates to:
  /// **'Customer Language'**
  String get customerLanguage;

  /// No description provided for @customerCurrency.
  ///
  /// In en, this message translates to:
  /// **'Customer Currency'**
  String get customerCurrency;

  /// No description provided for @customerPreferences.
  ///
  /// In en, this message translates to:
  /// **'Customer Preferences'**
  String get customerPreferences;

  /// No description provided for @customerSettings.
  ///
  /// In en, this message translates to:
  /// **'Customer Settings'**
  String get customerSettings;

  /// No description provided for @customerNotifications.
  ///
  /// In en, this message translates to:
  /// **'Customer Notifications'**
  String get customerNotifications;

  /// No description provided for @customerAlerts.
  ///
  /// In en, this message translates to:
  /// **'Customer Alerts'**
  String get customerAlerts;

  /// No description provided for @customerReminders.
  ///
  /// In en, this message translates to:
  /// **'Customer Reminders'**
  String get customerReminders;

  /// No description provided for @customerFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Customer Follow-up'**
  String get customerFollowUp;

  /// No description provided for @customerCommunication.
  ///
  /// In en, this message translates to:
  /// **'Customer Communication'**
  String get customerCommunication;

  /// No description provided for @customerMeetings.
  ///
  /// In en, this message translates to:
  /// **'Customer Meetings'**
  String get customerMeetings;

  /// No description provided for @customerCalls.
  ///
  /// In en, this message translates to:
  /// **'Customer Calls'**
  String get customerCalls;

  /// No description provided for @customerEmails.
  ///
  /// In en, this message translates to:
  /// **'Customer Emails'**
  String get customerEmails;

  /// No description provided for @customerMessages.
  ///
  /// In en, this message translates to:
  /// **'Customer Messages'**
  String get customerMessages;

  /// No description provided for @customerChats.
  ///
  /// In en, this message translates to:
  /// **'Customer Chats'**
  String get customerChats;

  /// No description provided for @customerTickets.
  ///
  /// In en, this message translates to:
  /// **'Customer Tickets'**
  String get customerTickets;

  /// No description provided for @customerIssues.
  ///
  /// In en, this message translates to:
  /// **'Customer Issues'**
  String get customerIssues;

  /// No description provided for @customerComplaints.
  ///
  /// In en, this message translates to:
  /// **'Customer Complaints'**
  String get customerComplaints;

  /// No description provided for @customerRequests.
  ///
  /// In en, this message translates to:
  /// **'Customer Requests'**
  String get customerRequests;

  /// No description provided for @customerSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Customer Suggestions'**
  String get customerSuggestions;

  /// No description provided for @customerReviews.
  ///
  /// In en, this message translates to:
  /// **'Customer Reviews'**
  String get customerReviews;

  /// No description provided for @customerRatings.
  ///
  /// In en, this message translates to:
  /// **'Customer Ratings'**
  String get customerRatings;

  /// No description provided for @customerTestimonials.
  ///
  /// In en, this message translates to:
  /// **'Customer Testimonials'**
  String get customerTestimonials;

  /// No description provided for @customerReferences.
  ///
  /// In en, this message translates to:
  /// **'Customer References'**
  String get customerReferences;

  /// No description provided for @customerRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Customer Recommendations'**
  String get customerRecommendations;

  /// No description provided for @customerReferrals.
  ///
  /// In en, this message translates to:
  /// **'Customer Referrals'**
  String get customerReferrals;

  /// No description provided for @customerPartnerships.
  ///
  /// In en, this message translates to:
  /// **'Customer Partnerships'**
  String get customerPartnerships;

  /// No description provided for @customerContracts.
  ///
  /// In en, this message translates to:
  /// **'Customer Contracts'**
  String get customerContracts;

  /// No description provided for @customerAgreements.
  ///
  /// In en, this message translates to:
  /// **'Customer Agreements'**
  String get customerAgreements;

  /// No description provided for @customerTerms.
  ///
  /// In en, this message translates to:
  /// **'Customer Terms'**
  String get customerTerms;

  /// No description provided for @customerPolicies.
  ///
  /// In en, this message translates to:
  /// **'Customer Policies'**
  String get customerPolicies;

  /// No description provided for @customerProcedures.
  ///
  /// In en, this message translates to:
  /// **'Customer Procedures'**
  String get customerProcedures;

  /// No description provided for @customerGuidelines.
  ///
  /// In en, this message translates to:
  /// **'Customer Guidelines'**
  String get customerGuidelines;

  /// No description provided for @customerStandards.
  ///
  /// In en, this message translates to:
  /// **'Customer Standards'**
  String get customerStandards;

  /// No description provided for @customerRequirements.
  ///
  /// In en, this message translates to:
  /// **'Customer Requirements'**
  String get customerRequirements;

  /// No description provided for @customerSpecifications.
  ///
  /// In en, this message translates to:
  /// **'Customer Specifications'**
  String get customerSpecifications;

  /// No description provided for @customerExpectations.
  ///
  /// In en, this message translates to:
  /// **'Customer Expectations'**
  String get customerExpectations;

  /// No description provided for @customerGoals.
  ///
  /// In en, this message translates to:
  /// **'Customer Goals'**
  String get customerGoals;

  /// No description provided for @customerObjectives.
  ///
  /// In en, this message translates to:
  /// **'Customer Objectives'**
  String get customerObjectives;

  /// No description provided for @customerTargets.
  ///
  /// In en, this message translates to:
  /// **'Customer Targets'**
  String get customerTargets;

  /// No description provided for @customerMilestones.
  ///
  /// In en, this message translates to:
  /// **'Customer Milestones'**
  String get customerMilestones;

  /// No description provided for @customerDeadlines.
  ///
  /// In en, this message translates to:
  /// **'Customer Deadlines'**
  String get customerDeadlines;

  /// No description provided for @customerSchedules.
  ///
  /// In en, this message translates to:
  /// **'Customer Schedules'**
  String get customerSchedules;

  /// No description provided for @customerTimelines.
  ///
  /// In en, this message translates to:
  /// **'Customer Timelines'**
  String get customerTimelines;

  /// No description provided for @customerCalendars.
  ///
  /// In en, this message translates to:
  /// **'Customer Calendars'**
  String get customerCalendars;

  /// No description provided for @customerEvents.
  ///
  /// In en, this message translates to:
  /// **'Customer Events'**
  String get customerEvents;

  /// No description provided for @customerActivities.
  ///
  /// In en, this message translates to:
  /// **'Customer Activities'**
  String get customerActivities;

  /// No description provided for @customerTasks.
  ///
  /// In en, this message translates to:
  /// **'Customer Tasks'**
  String get customerTasks;

  /// No description provided for @customerProjects.
  ///
  /// In en, this message translates to:
  /// **'Customer Projects'**
  String get customerProjects;

  /// No description provided for @customerCampaigns.
  ///
  /// In en, this message translates to:
  /// **'Customer Campaigns'**
  String get customerCampaigns;

  /// No description provided for @customerPromotions.
  ///
  /// In en, this message translates to:
  /// **'Customer Promotions'**
  String get customerPromotions;

  /// No description provided for @customerOffers.
  ///
  /// In en, this message translates to:
  /// **'Customer Offers'**
  String get customerOffers;

  /// No description provided for @customerDeals.
  ///
  /// In en, this message translates to:
  /// **'Customer Deals'**
  String get customerDeals;

  /// No description provided for @customerSales.
  ///
  /// In en, this message translates to:
  /// **'Customer Sales'**
  String get customerSales;

  /// No description provided for @customerRevenue.
  ///
  /// In en, this message translates to:
  /// **'Customer Revenue'**
  String get customerRevenue;

  /// No description provided for @customerProfit.
  ///
  /// In en, this message translates to:
  /// **'Customer Profit'**
  String get customerProfit;

  /// No description provided for @customerMargin.
  ///
  /// In en, this message translates to:
  /// **'Customer Margin'**
  String get customerMargin;

  /// No description provided for @customerCost.
  ///
  /// In en, this message translates to:
  /// **'Customer Cost'**
  String get customerCost;

  /// No description provided for @customerExpense.
  ///
  /// In en, this message translates to:
  /// **'Customer Expense'**
  String get customerExpense;

  /// No description provided for @customerInvestment.
  ///
  /// In en, this message translates to:
  /// **'Customer Investment'**
  String get customerInvestment;

  /// No description provided for @customerReturn.
  ///
  /// In en, this message translates to:
  /// **'Customer Return'**
  String get customerReturn;

  /// No description provided for @customerRisk.
  ///
  /// In en, this message translates to:
  /// **'Customer Risk'**
  String get customerRisk;

  /// No description provided for @customerOpportunity.
  ///
  /// In en, this message translates to:
  /// **'Customer Opportunity'**
  String get customerOpportunity;

  /// No description provided for @customerThreat.
  ///
  /// In en, this message translates to:
  /// **'Customer Threat'**
  String get customerThreat;

  /// No description provided for @customerStrengths.
  ///
  /// In en, this message translates to:
  /// **'Customer Strengths'**
  String get customerStrengths;

  /// No description provided for @customerWeaknesses.
  ///
  /// In en, this message translates to:
  /// **'Customer Weaknesses'**
  String get customerWeaknesses;

  /// No description provided for @customerOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Customer Opportunities'**
  String get customerOpportunities;

  /// No description provided for @customerThreats.
  ///
  /// In en, this message translates to:
  /// **'Customer Threats'**
  String get customerThreats;

  /// No description provided for @customerAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Customer Analysis'**
  String get customerAnalysis;

  /// No description provided for @customerAssessment.
  ///
  /// In en, this message translates to:
  /// **'Customer Assessment'**
  String get customerAssessment;

  /// No description provided for @customerEvaluation.
  ///
  /// In en, this message translates to:
  /// **'Customer Evaluation'**
  String get customerEvaluation;

  /// No description provided for @customerReview.
  ///
  /// In en, this message translates to:
  /// **'Customer Review'**
  String get customerReview;

  /// No description provided for @customerAudit.
  ///
  /// In en, this message translates to:
  /// **'Customer Audit'**
  String get customerAudit;

  /// No description provided for @customerInspection.
  ///
  /// In en, this message translates to:
  /// **'Customer Inspection'**
  String get customerInspection;

  /// No description provided for @customerVerification.
  ///
  /// In en, this message translates to:
  /// **'Customer Verification'**
  String get customerVerification;

  /// No description provided for @customerValidation.
  ///
  /// In en, this message translates to:
  /// **'Customer Validation'**
  String get customerValidation;

  /// No description provided for @customerAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Customer Authentication'**
  String get customerAuthentication;

  /// No description provided for @customerAuthorization.
  ///
  /// In en, this message translates to:
  /// **'Customer Authorization'**
  String get customerAuthorization;

  /// No description provided for @customerPermission.
  ///
  /// In en, this message translates to:
  /// **'Customer Permission'**
  String get customerPermission;

  /// No description provided for @customerAccess.
  ///
  /// In en, this message translates to:
  /// **'Customer Access'**
  String get customerAccess;

  /// No description provided for @customerSecurity.
  ///
  /// In en, this message translates to:
  /// **'Customer Security'**
  String get customerSecurity;

  /// No description provided for @customerPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Customer Privacy'**
  String get customerPrivacy;

  /// No description provided for @customerConfidentiality.
  ///
  /// In en, this message translates to:
  /// **'Customer Confidentiality'**
  String get customerConfidentiality;

  /// No description provided for @customerData.
  ///
  /// In en, this message translates to:
  /// **'Customer Data'**
  String get customerData;

  /// No description provided for @customerRecords.
  ///
  /// In en, this message translates to:
  /// **'Customer Records'**
  String get customerRecords;

  /// No description provided for @customerFiles.
  ///
  /// In en, this message translates to:
  /// **'Customer Files'**
  String get customerFiles;

  /// No description provided for @customerDocuments.
  ///
  /// In en, this message translates to:
  /// **'Customer Documents'**
  String get customerDocuments;

  /// No description provided for @customerArchives.
  ///
  /// In en, this message translates to:
  /// **'Customer Archives'**
  String get customerArchives;

  /// No description provided for @customerDatabase.
  ///
  /// In en, this message translates to:
  /// **'Customer Database'**
  String get customerDatabase;

  /// No description provided for @customerRepository.
  ///
  /// In en, this message translates to:
  /// **'Customer Repository'**
  String get customerRepository;

  /// No description provided for @customerStorage.
  ///
  /// In en, this message translates to:
  /// **'Customer Storage'**
  String get customerStorage;

  /// No description provided for @customerBackup.
  ///
  /// In en, this message translates to:
  /// **'Customer Backup'**
  String get customerBackup;

  /// No description provided for @customerRecovery.
  ///
  /// In en, this message translates to:
  /// **'Customer Recovery'**
  String get customerRecovery;

  /// No description provided for @customerRestore.
  ///
  /// In en, this message translates to:
  /// **'Customer Restore'**
  String get customerRestore;

  /// No description provided for @customerMigration.
  ///
  /// In en, this message translates to:
  /// **'Customer Migration'**
  String get customerMigration;

  /// No description provided for @customerIntegration.
  ///
  /// In en, this message translates to:
  /// **'Customer Integration'**
  String get customerIntegration;

  /// No description provided for @customerSynchronization.
  ///
  /// In en, this message translates to:
  /// **'Customer Synchronization'**
  String get customerSynchronization;

  /// No description provided for @customerReplication.
  ///
  /// In en, this message translates to:
  /// **'Customer Replication'**
  String get customerReplication;

  /// No description provided for @customerDistribution.
  ///
  /// In en, this message translates to:
  /// **'Customer Distribution'**
  String get customerDistribution;

  /// No description provided for @customerDeployment.
  ///
  /// In en, this message translates to:
  /// **'Customer Deployment'**
  String get customerDeployment;

  /// No description provided for @customerImplementation.
  ///
  /// In en, this message translates to:
  /// **'Customer Implementation'**
  String get customerImplementation;

  /// No description provided for @customerInstallation.
  ///
  /// In en, this message translates to:
  /// **'Customer Installation'**
  String get customerInstallation;

  /// No description provided for @customerConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Customer Configuration'**
  String get customerConfiguration;

  /// No description provided for @customerCustomization.
  ///
  /// In en, this message translates to:
  /// **'Customer Customization'**
  String get customerCustomization;

  /// No description provided for @customerPersonalization.
  ///
  /// In en, this message translates to:
  /// **'Customer Personalization'**
  String get customerPersonalization;

  /// No description provided for @customerLocalization.
  ///
  /// In en, this message translates to:
  /// **'Customer Localization'**
  String get customerLocalization;

  /// No description provided for @customerInternationalization.
  ///
  /// In en, this message translates to:
  /// **'Customer Internationalization'**
  String get customerInternationalization;

  /// No description provided for @customerTranslation.
  ///
  /// In en, this message translates to:
  /// **'Customer Translation'**
  String get customerTranslation;

  /// No description provided for @customerRegionalization.
  ///
  /// In en, this message translates to:
  /// **'Customer Regionalization'**
  String get customerRegionalization;

  /// No description provided for @customerGlobalization.
  ///
  /// In en, this message translates to:
  /// **'Customer Globalization'**
  String get customerGlobalization;

  /// No description provided for @customerMultilingual.
  ///
  /// In en, this message translates to:
  /// **'Customer Multilingual'**
  String get customerMultilingual;

  /// No description provided for @customerMulticultural.
  ///
  /// In en, this message translates to:
  /// **'Customer Multicultural'**
  String get customerMulticultural;

  /// No description provided for @customerDiversity.
  ///
  /// In en, this message translates to:
  /// **'Customer Diversity'**
  String get customerDiversity;

  /// No description provided for @customerInclusion.
  ///
  /// In en, this message translates to:
  /// **'Customer Inclusion'**
  String get customerInclusion;

  /// No description provided for @customerEquity.
  ///
  /// In en, this message translates to:
  /// **'Customer Equity'**
  String get customerEquity;

  /// No description provided for @customerFairness.
  ///
  /// In en, this message translates to:
  /// **'Customer Fairness'**
  String get customerFairness;

  /// No description provided for @customerTransparency.
  ///
  /// In en, this message translates to:
  /// **'Customer Transparency'**
  String get customerTransparency;

  /// No description provided for @customerAccountability.
  ///
  /// In en, this message translates to:
  /// **'Customer Accountability'**
  String get customerAccountability;

  /// No description provided for @customerResponsibility.
  ///
  /// In en, this message translates to:
  /// **'Customer Responsibility'**
  String get customerResponsibility;

  /// No description provided for @customerLiability.
  ///
  /// In en, this message translates to:
  /// **'Customer Liability'**
  String get customerLiability;

  /// No description provided for @customerObligation.
  ///
  /// In en, this message translates to:
  /// **'Customer Obligation'**
  String get customerObligation;

  /// No description provided for @customerDuty.
  ///
  /// In en, this message translates to:
  /// **'Customer Duty'**
  String get customerDuty;

  /// No description provided for @customerCommitment.
  ///
  /// In en, this message translates to:
  /// **'Customer Commitment'**
  String get customerCommitment;

  /// No description provided for @customerPromise.
  ///
  /// In en, this message translates to:
  /// **'Customer Promise'**
  String get customerPromise;

  /// No description provided for @customerGuarantee.
  ///
  /// In en, this message translates to:
  /// **'Customer Guarantee'**
  String get customerGuarantee;

  /// No description provided for @customerWarranty.
  ///
  /// In en, this message translates to:
  /// **'Customer Warranty'**
  String get customerWarranty;

  /// No description provided for @customerAssurance.
  ///
  /// In en, this message translates to:
  /// **'Customer Assurance'**
  String get customerAssurance;

  /// No description provided for @customerConfidence.
  ///
  /// In en, this message translates to:
  /// **'Customer Confidence'**
  String get customerConfidence;

  /// No description provided for @customerTrust.
  ///
  /// In en, this message translates to:
  /// **'Customer Trust'**
  String get customerTrust;

  /// No description provided for @customerReliability.
  ///
  /// In en, this message translates to:
  /// **'Customer Reliability'**
  String get customerReliability;

  /// No description provided for @customerDependability.
  ///
  /// In en, this message translates to:
  /// **'Customer Dependability'**
  String get customerDependability;

  /// No description provided for @customerConsistency.
  ///
  /// In en, this message translates to:
  /// **'Customer Consistency'**
  String get customerConsistency;

  /// No description provided for @customerStability.
  ///
  /// In en, this message translates to:
  /// **'Customer Stability'**
  String get customerStability;

  /// No description provided for @customerPredictability.
  ///
  /// In en, this message translates to:
  /// **'Customer Predictability'**
  String get customerPredictability;

  /// No description provided for @customerFlexibility.
  ///
  /// In en, this message translates to:
  /// **'Customer Flexibility'**
  String get customerFlexibility;

  /// No description provided for @customerAdaptability.
  ///
  /// In en, this message translates to:
  /// **'Customer Adaptability'**
  String get customerAdaptability;

  /// No description provided for @customerScalability.
  ///
  /// In en, this message translates to:
  /// **'Customer Scalability'**
  String get customerScalability;

  /// No description provided for @customerSustainability.
  ///
  /// In en, this message translates to:
  /// **'Customer Sustainability'**
  String get customerSustainability;

  /// No description provided for @customerGrowth.
  ///
  /// In en, this message translates to:
  /// **'Customer Growth'**
  String get customerGrowth;

  /// No description provided for @customerDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Customer Development'**
  String get customerDevelopment;

  /// No description provided for @customerImprovement.
  ///
  /// In en, this message translates to:
  /// **'Customer Improvement'**
  String get customerImprovement;

  /// No description provided for @customerEnhancement.
  ///
  /// In en, this message translates to:
  /// **'Customer Enhancement'**
  String get customerEnhancement;

  /// No description provided for @customerOptimization.
  ///
  /// In en, this message translates to:
  /// **'Customer Optimization'**
  String get customerOptimization;

  /// No description provided for @customerEfficiency.
  ///
  /// In en, this message translates to:
  /// **'Customer Efficiency'**
  String get customerEfficiency;

  /// No description provided for @customerEffectiveness.
  ///
  /// In en, this message translates to:
  /// **'Customer Effectiveness'**
  String get customerEffectiveness;

  /// No description provided for @customerProductivity.
  ///
  /// In en, this message translates to:
  /// **'Customer Productivity'**
  String get customerProductivity;

  /// No description provided for @customerQuality.
  ///
  /// In en, this message translates to:
  /// **'Customer Quality'**
  String get customerQuality;

  /// No description provided for @customerExcellence.
  ///
  /// In en, this message translates to:
  /// **'Customer Excellence'**
  String get customerExcellence;

  /// No description provided for @customerInnovation.
  ///
  /// In en, this message translates to:
  /// **'Customer Innovation'**
  String get customerInnovation;

  /// No description provided for @customerCreativity.
  ///
  /// In en, this message translates to:
  /// **'Customer Creativity'**
  String get customerCreativity;

  /// No description provided for @customerOriginality.
  ///
  /// In en, this message translates to:
  /// **'Customer Originality'**
  String get customerOriginality;

  /// No description provided for @customerUniqueness.
  ///
  /// In en, this message translates to:
  /// **'Customer Uniqueness'**
  String get customerUniqueness;

  /// No description provided for @customerDistinctiveness.
  ///
  /// In en, this message translates to:
  /// **'Customer Distinctiveness'**
  String get customerDistinctiveness;

  /// No description provided for @customerSpecialization.
  ///
  /// In en, this message translates to:
  /// **'Customer Specialization'**
  String get customerSpecialization;

  /// No description provided for @customerExpertise.
  ///
  /// In en, this message translates to:
  /// **'Customer Expertise'**
  String get customerExpertise;

  /// No description provided for @customerKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Customer Knowledge'**
  String get customerKnowledge;

  /// No description provided for @customerSkills.
  ///
  /// In en, this message translates to:
  /// **'Customer Skills'**
  String get customerSkills;

  /// No description provided for @customerAbilities.
  ///
  /// In en, this message translates to:
  /// **'Customer Abilities'**
  String get customerAbilities;

  /// No description provided for @customerCapabilities.
  ///
  /// In en, this message translates to:
  /// **'Customer Capabilities'**
  String get customerCapabilities;

  /// No description provided for @customerCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Customer Competencies'**
  String get customerCompetencies;

  /// No description provided for @customerQualifications.
  ///
  /// In en, this message translates to:
  /// **'Customer Qualifications'**
  String get customerQualifications;

  /// No description provided for @customerCredentials.
  ///
  /// In en, this message translates to:
  /// **'Customer Credentials'**
  String get customerCredentials;

  /// No description provided for @customerCertifications.
  ///
  /// In en, this message translates to:
  /// **'Customer Certifications'**
  String get customerCertifications;

  /// No description provided for @customerLicenses.
  ///
  /// In en, this message translates to:
  /// **'Customer Licenses'**
  String get customerLicenses;

  /// No description provided for @customerPermits.
  ///
  /// In en, this message translates to:
  /// **'Customer Permits'**
  String get customerPermits;

  /// No description provided for @customerApprovals.
  ///
  /// In en, this message translates to:
  /// **'Customer Approvals'**
  String get customerApprovals;

  /// No description provided for @customerAuthorizations.
  ///
  /// In en, this message translates to:
  /// **'Customer Authorizations'**
  String get customerAuthorizations;

  /// No description provided for @customerEndorsements.
  ///
  /// In en, this message translates to:
  /// **'Customer Endorsements'**
  String get customerEndorsements;

  /// No description provided for @customerComments.
  ///
  /// In en, this message translates to:
  /// **'Customer Comments'**
  String get customerComments;

  /// No description provided for @customerIdeas.
  ///
  /// In en, this message translates to:
  /// **'Customer Ideas'**
  String get customerIdeas;

  /// No description provided for @customerProposals.
  ///
  /// In en, this message translates to:
  /// **'Customer Proposals'**
  String get customerProposals;

  /// No description provided for @customerPlans.
  ///
  /// In en, this message translates to:
  /// **'Customer Plans'**
  String get customerPlans;

  /// No description provided for @customerStrategies.
  ///
  /// In en, this message translates to:
  /// **'Customer Strategies'**
  String get customerStrategies;

  /// No description provided for @customerTactics.
  ///
  /// In en, this message translates to:
  /// **'Customer Tactics'**
  String get customerTactics;

  /// No description provided for @customerMethods.
  ///
  /// In en, this message translates to:
  /// **'Customer Methods'**
  String get customerMethods;

  /// No description provided for @customerApproaches.
  ///
  /// In en, this message translates to:
  /// **'Customer Approaches'**
  String get customerApproaches;

  /// No description provided for @customerTechniques.
  ///
  /// In en, this message translates to:
  /// **'Customer Techniques'**
  String get customerTechniques;

  /// No description provided for @customerTools.
  ///
  /// In en, this message translates to:
  /// **'Customer Tools'**
  String get customerTools;

  /// No description provided for @customerAssets.
  ///
  /// In en, this message translates to:
  /// **'Customer Assets'**
  String get customerAssets;

  /// No description provided for @customerCapital.
  ///
  /// In en, this message translates to:
  /// **'Customer Capital'**
  String get customerCapital;

  /// No description provided for @customerFunding.
  ///
  /// In en, this message translates to:
  /// **'Customer Funding'**
  String get customerFunding;

  /// No description provided for @customerFinancing.
  ///
  /// In en, this message translates to:
  /// **'Customer Financing'**
  String get customerFinancing;

  /// No description provided for @customerBudget.
  ///
  /// In en, this message translates to:
  /// **'Customer Budget'**
  String get customerBudget;

  /// No description provided for @customerPrice.
  ///
  /// In en, this message translates to:
  /// **'Customer Price'**
  String get customerPrice;

  /// No description provided for @customerWorth.
  ///
  /// In en, this message translates to:
  /// **'Customer Worth'**
  String get customerWorth;

  /// No description provided for @customerBenefit.
  ///
  /// In en, this message translates to:
  /// **'Customer Benefit'**
  String get customerBenefit;

  /// No description provided for @customerAdvantage.
  ///
  /// In en, this message translates to:
  /// **'Customer Advantage'**
  String get customerAdvantage;

  /// No description provided for @customerGain.
  ///
  /// In en, this message translates to:
  /// **'Customer Gain'**
  String get customerGain;

  /// No description provided for @customerIncome.
  ///
  /// In en, this message translates to:
  /// **'Customer Income'**
  String get customerIncome;

  /// No description provided for @customerEarnings.
  ///
  /// In en, this message translates to:
  /// **'Customer Earnings'**
  String get customerEarnings;

  /// No description provided for @customerSavings.
  ///
  /// In en, this message translates to:
  /// **'Customer Savings'**
  String get customerSavings;

  /// No description provided for @customerWealth.
  ///
  /// In en, this message translates to:
  /// **'Customer Wealth'**
  String get customerWealth;

  /// No description provided for @customerFortune.
  ///
  /// In en, this message translates to:
  /// **'Customer Fortune'**
  String get customerFortune;

  /// No description provided for @customerAchievement.
  ///
  /// In en, this message translates to:
  /// **'Customer Achievement'**
  String get customerAchievement;

  /// No description provided for @customerAccomplishment.
  ///
  /// In en, this message translates to:
  /// **'Customer Accomplishment'**
  String get customerAccomplishment;

  /// No description provided for @customerVictory.
  ///
  /// In en, this message translates to:
  /// **'Customer Victory'**
  String get customerVictory;

  /// No description provided for @customerTriumph.
  ///
  /// In en, this message translates to:
  /// **'Customer Triumph'**
  String get customerTriumph;

  /// No description provided for @customerWin.
  ///
  /// In en, this message translates to:
  /// **'Customer Win'**
  String get customerWin;

  /// No description provided for @customerEdge.
  ///
  /// In en, this message translates to:
  /// **'Customer Edge'**
  String get customerEdge;

  /// No description provided for @customerSuperiority.
  ///
  /// In en, this message translates to:
  /// **'Customer Superiority'**
  String get customerSuperiority;

  /// No description provided for @customerPerfection.
  ///
  /// In en, this message translates to:
  /// **'Customer Perfection'**
  String get customerPerfection;

  /// No description provided for @customerFlawlessness.
  ///
  /// In en, this message translates to:
  /// **'Customer Flawlessness'**
  String get customerFlawlessness;

  /// No description provided for @customerIdeal.
  ///
  /// In en, this message translates to:
  /// **'Customer Ideal'**
  String get customerIdeal;

  /// No description provided for @customerOptimal.
  ///
  /// In en, this message translates to:
  /// **'Customer Optimal'**
  String get customerOptimal;

  /// No description provided for @customerBest.
  ///
  /// In en, this message translates to:
  /// **'Customer Best'**
  String get customerBest;

  /// No description provided for @customerTop.
  ///
  /// In en, this message translates to:
  /// **'Customer Top'**
  String get customerTop;

  /// No description provided for @customerHighest.
  ///
  /// In en, this message translates to:
  /// **'Customer Highest'**
  String get customerHighest;

  /// No description provided for @customerMaximum.
  ///
  /// In en, this message translates to:
  /// **'Customer Maximum'**
  String get customerMaximum;

  /// No description provided for @customerPeak.
  ///
  /// In en, this message translates to:
  /// **'Customer Peak'**
  String get customerPeak;

  /// No description provided for @customerSummit.
  ///
  /// In en, this message translates to:
  /// **'Customer Summit'**
  String get customerSummit;

  /// No description provided for @customerPinnacle.
  ///
  /// In en, this message translates to:
  /// **'Customer Pinnacle'**
  String get customerPinnacle;

  /// No description provided for @customerCrown.
  ///
  /// In en, this message translates to:
  /// **'Customer Crown'**
  String get customerCrown;

  /// No description provided for @customerJewel.
  ///
  /// In en, this message translates to:
  /// **'Customer Jewel'**
  String get customerJewel;

  /// No description provided for @customerGem.
  ///
  /// In en, this message translates to:
  /// **'Customer Gem'**
  String get customerGem;

  /// No description provided for @customerTreasure.
  ///
  /// In en, this message translates to:
  /// **'Customer Treasure'**
  String get customerTreasure;

  /// No description provided for @customerGold.
  ///
  /// In en, this message translates to:
  /// **'Customer Gold'**
  String get customerGold;

  /// No description provided for @customerDiamond.
  ///
  /// In en, this message translates to:
  /// **'Customer Diamond'**
  String get customerDiamond;

  /// No description provided for @customerPearl.
  ///
  /// In en, this message translates to:
  /// **'Customer Pearl'**
  String get customerPearl;

  /// No description provided for @customerRuby.
  ///
  /// In en, this message translates to:
  /// **'Customer Ruby'**
  String get customerRuby;

  /// No description provided for @customerEmerald.
  ///
  /// In en, this message translates to:
  /// **'Customer Emerald'**
  String get customerEmerald;

  /// No description provided for @customerSapphire.
  ///
  /// In en, this message translates to:
  /// **'Customer Sapphire'**
  String get customerSapphire;

  /// No description provided for @customerAmethyst.
  ///
  /// In en, this message translates to:
  /// **'Customer Amethyst'**
  String get customerAmethyst;

  /// No description provided for @customerTopaz.
  ///
  /// In en, this message translates to:
  /// **'Customer Topaz'**
  String get customerTopaz;

  /// No description provided for @customerGarnet.
  ///
  /// In en, this message translates to:
  /// **'Customer Garnet'**
  String get customerGarnet;

  /// No description provided for @customerOpal.
  ///
  /// In en, this message translates to:
  /// **'Customer Opal'**
  String get customerOpal;

  /// No description provided for @customerTurquoise.
  ///
  /// In en, this message translates to:
  /// **'Customer Turquoise'**
  String get customerTurquoise;

  /// No description provided for @customerCoral.
  ///
  /// In en, this message translates to:
  /// **'Customer Coral'**
  String get customerCoral;

  /// No description provided for @customerJade.
  ///
  /// In en, this message translates to:
  /// **'Customer Jade'**
  String get customerJade;

  /// No description provided for @customerAgate.
  ///
  /// In en, this message translates to:
  /// **'Customer Agate'**
  String get customerAgate;

  /// No description provided for @customerOnyx.
  ///
  /// In en, this message translates to:
  /// **'Customer Onyx'**
  String get customerOnyx;

  /// No description provided for @customerQuartz.
  ///
  /// In en, this message translates to:
  /// **'Customer Quartz'**
  String get customerQuartz;

  /// No description provided for @customerCrystal.
  ///
  /// In en, this message translates to:
  /// **'Customer Crystal'**
  String get customerCrystal;

  /// No description provided for @customerAmber.
  ///
  /// In en, this message translates to:
  /// **'Customer Amber'**
  String get customerAmber;

  /// No description provided for @customerJet.
  ///
  /// In en, this message translates to:
  /// **'Customer Jet'**
  String get customerJet;

  /// No description provided for @customerIvory.
  ///
  /// In en, this message translates to:
  /// **'Customer Ivory'**
  String get customerIvory;

  /// No description provided for @customerBone.
  ///
  /// In en, this message translates to:
  /// **'Customer Bone'**
  String get customerBone;

  /// No description provided for @customerWood.
  ///
  /// In en, this message translates to:
  /// **'Customer Wood'**
  String get customerWood;

  /// No description provided for @customerStone.
  ///
  /// In en, this message translates to:
  /// **'Customer Stone'**
  String get customerStone;

  /// No description provided for @customerRock.
  ///
  /// In en, this message translates to:
  /// **'Customer Rock'**
  String get customerRock;

  /// No description provided for @customerMetal.
  ///
  /// In en, this message translates to:
  /// **'Customer Metal'**
  String get customerMetal;

  /// No description provided for @customerIron.
  ///
  /// In en, this message translates to:
  /// **'Customer Iron'**
  String get customerIron;

  /// No description provided for @customerSteel.
  ///
  /// In en, this message translates to:
  /// **'Customer Steel'**
  String get customerSteel;

  /// No description provided for @customerCopper.
  ///
  /// In en, this message translates to:
  /// **'Customer Copper'**
  String get customerCopper;

  /// No description provided for @customerBronze.
  ///
  /// In en, this message translates to:
  /// **'Customer Bronze'**
  String get customerBronze;

  /// No description provided for @customerSilver.
  ///
  /// In en, this message translates to:
  /// **'Customer Silver'**
  String get customerSilver;

  /// No description provided for @customerPlatinum.
  ///
  /// In en, this message translates to:
  /// **'Customer Platinum'**
  String get customerPlatinum;

  /// No description provided for @customerTitanium.
  ///
  /// In en, this message translates to:
  /// **'Customer Titanium'**
  String get customerTitanium;

  /// No description provided for @customerAluminum.
  ///
  /// In en, this message translates to:
  /// **'Customer Aluminum'**
  String get customerAluminum;

  /// No description provided for @customerZinc.
  ///
  /// In en, this message translates to:
  /// **'Customer Zinc'**
  String get customerZinc;

  /// No description provided for @customerLead.
  ///
  /// In en, this message translates to:
  /// **'Customer Lead'**
  String get customerLead;

  /// No description provided for @customerTin.
  ///
  /// In en, this message translates to:
  /// **'Customer Tin'**
  String get customerTin;

  /// No description provided for @customerNickel.
  ///
  /// In en, this message translates to:
  /// **'Customer Nickel'**
  String get customerNickel;

  /// No description provided for @customerChromium.
  ///
  /// In en, this message translates to:
  /// **'Customer Chromium'**
  String get customerChromium;

  /// No description provided for @customerManganese.
  ///
  /// In en, this message translates to:
  /// **'Customer Manganese'**
  String get customerManganese;

  /// No description provided for @customerCobalt.
  ///
  /// In en, this message translates to:
  /// **'Customer Cobalt'**
  String get customerCobalt;

  /// No description provided for @customerVanadium.
  ///
  /// In en, this message translates to:
  /// **'Customer Vanadium'**
  String get customerVanadium;

  /// No description provided for @customerTungsten.
  ///
  /// In en, this message translates to:
  /// **'Customer Tungsten'**
  String get customerTungsten;

  /// No description provided for @customerMolybdenum.
  ///
  /// In en, this message translates to:
  /// **'Customer Molybdenum'**
  String get customerMolybdenum;

  /// No description provided for @customerTantalum.
  ///
  /// In en, this message translates to:
  /// **'Customer Tantalum'**
  String get customerTantalum;

  /// No description provided for @customerNiobium.
  ///
  /// In en, this message translates to:
  /// **'Customer Niobium'**
  String get customerNiobium;

  /// No description provided for @customerHafnium.
  ///
  /// In en, this message translates to:
  /// **'Customer Hafnium'**
  String get customerHafnium;

  /// No description provided for @customerZirconium.
  ///
  /// In en, this message translates to:
  /// **'Customer Zirconium'**
  String get customerZirconium;

  /// No description provided for @customerRuthenium.
  ///
  /// In en, this message translates to:
  /// **'Customer Ruthenium'**
  String get customerRuthenium;

  /// No description provided for @customerRhodium.
  ///
  /// In en, this message translates to:
  /// **'Customer Rhodium'**
  String get customerRhodium;

  /// No description provided for @customerPalladium.
  ///
  /// In en, this message translates to:
  /// **'Customer Palladium'**
  String get customerPalladium;

  /// No description provided for @customerOsmium.
  ///
  /// In en, this message translates to:
  /// **'Customer Osmium'**
  String get customerOsmium;

  /// No description provided for @customerIridium.
  ///
  /// In en, this message translates to:
  /// **'Customer Iridium'**
  String get customerIridium;

  /// No description provided for @customerRhenium.
  ///
  /// In en, this message translates to:
  /// **'Customer Rhenium'**
  String get customerRhenium;

  /// No description provided for @customerTechnetium.
  ///
  /// In en, this message translates to:
  /// **'Customer Technetium'**
  String get customerTechnetium;

  /// No description provided for @customerPromethium.
  ///
  /// In en, this message translates to:
  /// **'Customer Promethium'**
  String get customerPromethium;

  /// No description provided for @customerPolonium.
  ///
  /// In en, this message translates to:
  /// **'Customer Polonium'**
  String get customerPolonium;

  /// No description provided for @customerAstatine.
  ///
  /// In en, this message translates to:
  /// **'Customer Astatine'**
  String get customerAstatine;

  /// No description provided for @customerRadon.
  ///
  /// In en, this message translates to:
  /// **'Customer Radon'**
  String get customerRadon;

  /// No description provided for @customerFrancium.
  ///
  /// In en, this message translates to:
  /// **'Customer Francium'**
  String get customerFrancium;

  /// No description provided for @customerRadium.
  ///
  /// In en, this message translates to:
  /// **'Customer Radium'**
  String get customerRadium;

  /// No description provided for @customerActinium.
  ///
  /// In en, this message translates to:
  /// **'Customer Actinium'**
  String get customerActinium;

  /// No description provided for @customerThorium.
  ///
  /// In en, this message translates to:
  /// **'Customer Thorium'**
  String get customerThorium;

  /// No description provided for @customerProtactinium.
  ///
  /// In en, this message translates to:
  /// **'Customer Protactinium'**
  String get customerProtactinium;

  /// No description provided for @customerUranium.
  ///
  /// In en, this message translates to:
  /// **'Customer Uranium'**
  String get customerUranium;

  /// No description provided for @customerNeptunium.
  ///
  /// In en, this message translates to:
  /// **'Customer Neptunium'**
  String get customerNeptunium;

  /// No description provided for @customerPlutonium.
  ///
  /// In en, this message translates to:
  /// **'Customer Plutonium'**
  String get customerPlutonium;

  /// No description provided for @customerAmericium.
  ///
  /// In en, this message translates to:
  /// **'Customer Americium'**
  String get customerAmericium;

  /// No description provided for @customerCurium.
  ///
  /// In en, this message translates to:
  /// **'Customer Curium'**
  String get customerCurium;

  /// No description provided for @customerBerkelium.
  ///
  /// In en, this message translates to:
  /// **'Customer Berkelium'**
  String get customerBerkelium;

  /// No description provided for @customerCalifornium.
  ///
  /// In en, this message translates to:
  /// **'Customer Californium'**
  String get customerCalifornium;

  /// No description provided for @customerEinsteinium.
  ///
  /// In en, this message translates to:
  /// **'Customer Einsteinium'**
  String get customerEinsteinium;

  /// No description provided for @customerFermium.
  ///
  /// In en, this message translates to:
  /// **'Customer Fermium'**
  String get customerFermium;

  /// No description provided for @customerMendelevium.
  ///
  /// In en, this message translates to:
  /// **'Customer Mendelevium'**
  String get customerMendelevium;

  /// No description provided for @customerNobelium.
  ///
  /// In en, this message translates to:
  /// **'Customer Nobelium'**
  String get customerNobelium;

  /// No description provided for @customerLawrencium.
  ///
  /// In en, this message translates to:
  /// **'Customer Lawrencium'**
  String get customerLawrencium;

  /// No description provided for @customerRutherfordium.
  ///
  /// In en, this message translates to:
  /// **'Customer Rutherfordium'**
  String get customerRutherfordium;

  /// No description provided for @customerDubnium.
  ///
  /// In en, this message translates to:
  /// **'Customer Dubnium'**
  String get customerDubnium;

  /// No description provided for @customerSeaborgium.
  ///
  /// In en, this message translates to:
  /// **'Customer Seaborgium'**
  String get customerSeaborgium;

  /// No description provided for @customerBohrium.
  ///
  /// In en, this message translates to:
  /// **'Customer Bohrium'**
  String get customerBohrium;

  /// No description provided for @customerHassium.
  ///
  /// In en, this message translates to:
  /// **'Customer Hassium'**
  String get customerHassium;

  /// No description provided for @customerMeitnerium.
  ///
  /// In en, this message translates to:
  /// **'Customer Meitnerium'**
  String get customerMeitnerium;

  /// No description provided for @customerDarmstadtium.
  ///
  /// In en, this message translates to:
  /// **'Customer Darmstadtium'**
  String get customerDarmstadtium;

  /// No description provided for @customerRoentgenium.
  ///
  /// In en, this message translates to:
  /// **'Customer Roentgenium'**
  String get customerRoentgenium;

  /// No description provided for @customerCopernicium.
  ///
  /// In en, this message translates to:
  /// **'Customer Copernicium'**
  String get customerCopernicium;

  /// No description provided for @customerNihonium.
  ///
  /// In en, this message translates to:
  /// **'Customer Nihonium'**
  String get customerNihonium;

  /// No description provided for @customerFlerovium.
  ///
  /// In en, this message translates to:
  /// **'Customer Flerovium'**
  String get customerFlerovium;

  /// No description provided for @customerMoscovium.
  ///
  /// In en, this message translates to:
  /// **'Customer Moscovium'**
  String get customerMoscovium;

  /// No description provided for @customerLivermorium.
  ///
  /// In en, this message translates to:
  /// **'Customer Livermorium'**
  String get customerLivermorium;

  /// No description provided for @customerTennessine.
  ///
  /// In en, this message translates to:
  /// **'Customer Tennessine'**
  String get customerTennessine;

  /// No description provided for @customerOganesson.
  ///
  /// In en, this message translates to:
  /// **'Customer Oganesson'**
  String get customerOganesson;

  /// No description provided for @filterCustomers.
  ///
  /// In en, this message translates to:
  /// **'Filter Customers'**
  String get filterCustomers;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// No description provided for @sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get sortOrder;

  /// No description provided for @sortByName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sortByName;

  /// No description provided for @sortByEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get sortByEmail;

  /// No description provided for @sortByCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Created Date'**
  String get sortByCreatedAt;

  /// No description provided for @sortByUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Updated Date'**
  String get sortByUpdatedAt;

  /// No description provided for @ascending.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get ascending;

  /// No description provided for @descending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get descending;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// No description provided for @resetFilters.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetFilters;

  /// No description provided for @activeStatus.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeStatus;

  /// No description provided for @inactiveStatus.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactiveStatus;

  /// No description provided for @updatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Updated Successfully'**
  String get updatedSuccessfully;

  /// No description provided for @photoUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Photo Updated Successfully'**
  String get photoUpdatedSuccessfully;

  /// No description provided for @errorOccurredWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Error Occurred: {message}'**
  String errorOccurredWithMessage(Object message);

  /// No description provided for @updatePhoto.
  ///
  /// In en, this message translates to:
  /// **'Update Photo'**
  String get updatePhoto;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @fieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'{field} is required'**
  String fieldIsRequired(String field);

  /// No description provided for @activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate;

  /// No description provided for @deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get deactivate;

  /// No description provided for @taxMerchantCode.
  ///
  /// In en, this message translates to:
  /// **'Tax Merchant Code'**
  String get taxMerchantCode;

  /// No description provided for @taxInvoiceType.
  ///
  /// In en, this message translates to:
  /// **'Tax Invoice Type'**
  String get taxInvoiceType;

  /// No description provided for @noPermission.
  ///
  /// In en, this message translates to:
  /// **'Not allowed'**
  String get noPermission;

  /// No description provided for @authLoadingDashboard.
  ///
  /// In en, this message translates to:
  /// **'Loading dashboard data...'**
  String get authLoadingDashboard;

  /// No description provided for @authLoadingComplete.
  ///
  /// In en, this message translates to:
  /// **'Loading complete!'**
  String get authLoadingComplete;

  /// No description provided for @authLoadingError.
  ///
  /// In en, this message translates to:
  /// **'Loading error'**
  String get authLoadingError;

  /// No description provided for @authSubscriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Subscription required'**
  String get authSubscriptionRequired;

  /// No description provided for @authLoadingStatistics.
  ///
  /// In en, this message translates to:
  /// **'Loading statistics...'**
  String get authLoadingStatistics;

  /// No description provided for @authPreparingHome.
  ///
  /// In en, this message translates to:
  /// **'Preparing home screen...'**
  String get authPreparingHome;

  /// No description provided for @authCopyCodeFromEmail.
  ///
  /// In en, this message translates to:
  /// **'Copy the code from email and paste it here'**
  String get authCopyCodeFromEmail;

  /// No description provided for @authConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter password confirmation'**
  String get authConfirmPasswordHint;

  /// No description provided for @authSignInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get authSignInWithGoogle;

  /// No description provided for @clientsAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add New Client'**
  String get clientsAddNew;

  /// No description provided for @clientsAddNewDesc.
  ///
  /// In en, this message translates to:
  /// **'Fill the form below to add a new client to the system'**
  String get clientsAddNewDesc;

  /// No description provided for @clientsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Client'**
  String get clientsEdit;

  /// No description provided for @clientsEditDesc.
  ///
  /// In en, this message translates to:
  /// **'Edit client data \"{clientName}\"'**
  String clientsEditDesc(String clientName);

  /// No description provided for @clientsDetails.
  ///
  /// In en, this message translates to:
  /// **'Client Details'**
  String get clientsDetails;

  /// No description provided for @clientsBasicInfo.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get clientsBasicInfo;

  /// No description provided for @clientsCompanyInfo.
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get clientsCompanyInfo;

  /// No description provided for @clientsContactPersonInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Person Information'**
  String get clientsContactPersonInfo;

  /// No description provided for @clientsAdditionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get clientsAdditionalInfo;

  /// No description provided for @clientsClientName.
  ///
  /// In en, this message translates to:
  /// **'Client Name'**
  String get clientsClientName;

  /// No description provided for @clientsEnterClientName.
  ///
  /// In en, this message translates to:
  /// **'Enter client name'**
  String get clientsEnterClientName;

  /// No description provided for @clientsEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get clientsEnterEmail;

  /// No description provided for @clientsEnterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get clientsEnterPhone;

  /// No description provided for @clientsEnterAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter client address'**
  String get clientsEnterAddress;

  /// No description provided for @clientsCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get clientsCompanyName;

  /// No description provided for @clientsEnterCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Enter company name'**
  String get clientsEnterCompanyName;

  /// No description provided for @clientsTaxNumber.
  ///
  /// In en, this message translates to:
  /// **'Tax Number'**
  String get clientsTaxNumber;

  /// No description provided for @clientsEnterTaxNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter tax number'**
  String get clientsEnterTaxNumber;

  /// No description provided for @clientsWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get clientsWebsite;

  /// No description provided for @clientsEnterWebsite.
  ///
  /// In en, this message translates to:
  /// **'Enter website'**
  String get clientsEnterWebsite;

  /// No description provided for @clientsContactPersonName.
  ///
  /// In en, this message translates to:
  /// **'Contact Person Name'**
  String get clientsContactPersonName;

  /// No description provided for @clientsEnterContactPersonName.
  ///
  /// In en, this message translates to:
  /// **'Enter contact person name'**
  String get clientsEnterContactPersonName;

  /// No description provided for @clientsContactPersonPhone.
  ///
  /// In en, this message translates to:
  /// **'Contact Person Phone'**
  String get clientsContactPersonPhone;

  /// No description provided for @clientsEnterContactPersonPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter contact person phone'**
  String get clientsEnterContactPersonPhone;

  /// No description provided for @clientsContactPersonEmail.
  ///
  /// In en, this message translates to:
  /// **'Contact Person Email'**
  String get clientsContactPersonEmail;

  /// No description provided for @clientsEnterContactPersonEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter contact person email'**
  String get clientsEnterContactPersonEmail;

  /// No description provided for @clientsStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get clientsStatus;

  /// No description provided for @clientsNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get clientsNotes;

  /// No description provided for @clientsEnterNotes.
  ///
  /// In en, this message translates to:
  /// **'Enter additional notes'**
  String get clientsEnterNotes;

  /// No description provided for @clientsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get clientsActive;

  /// No description provided for @clientsInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get clientsInactive;

  /// No description provided for @clientsAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get clientsAll;

  /// No description provided for @clientsAddClient.
  ///
  /// In en, this message translates to:
  /// **'Add Client'**
  String get clientsAddClient;

  /// No description provided for @clientsSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get clientsSaveChanges;

  /// No description provided for @clientsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get clientsCancel;

  /// No description provided for @clientsEditAction.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get clientsEditAction;

  /// No description provided for @clientsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get clientsDelete;

  /// No description provided for @clientsView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get clientsView;

  /// No description provided for @clientsDeleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get clientsDeleteConfirmation;

  /// No description provided for @clientsDeleteConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete client \"{clientName}\"?'**
  String clientsDeleteConfirmationMessage(String clientName);

  /// No description provided for @clientsClientAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Client added successfully'**
  String get clientsClientAddedSuccess;

  /// No description provided for @clientsClientUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Client updated successfully'**
  String get clientsClientUpdatedSuccess;

  /// No description provided for @clientsErrorCreatingClient.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while creating client: {error}'**
  String clientsErrorCreatingClient(String error);

  /// No description provided for @clientsErrorUpdatingClient.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while updating client: {error}'**
  String clientsErrorUpdatingClient(String error);

  /// No description provided for @clientsName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get clientsName;

  /// No description provided for @clientsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get clientsEmail;

  /// No description provided for @clientsPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get clientsPhone;

  /// No description provided for @clientsAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get clientsAddress;

  /// No description provided for @clientsCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get clientsCreatedAt;

  /// No description provided for @clientsUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get clientsUpdatedAt;

  /// No description provided for @clientsNoPermissionToView.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view this content'**
  String get clientsNoPermissionToView;

  /// No description provided for @clientsNoPermissionToAct.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get clientsNoPermissionToAct;

  /// No description provided for @clientsLockedAction.
  ///
  /// In en, this message translates to:
  /// **'Locked Action'**
  String get clientsLockedAction;

  /// No description provided for @clientsSearchClients.
  ///
  /// In en, this message translates to:
  /// **'Search clients...'**
  String get clientsSearchClients;

  /// No description provided for @clientsNoClientsFound.
  ///
  /// In en, this message translates to:
  /// **'No clients found'**
  String get clientsNoClientsFound;

  /// No description provided for @clientsStartByAddingFirst.
  ///
  /// In en, this message translates to:
  /// **'Start by adding your first client to the system'**
  String get clientsStartByAddingFirst;

  /// No description provided for @clientsAddFirstClient.
  ///
  /// In en, this message translates to:
  /// **'Add First Client'**
  String get clientsAddFirstClient;

  /// No description provided for @clientsTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get clientsTotal;

  /// No description provided for @clientsCount.
  ///
  /// In en, this message translates to:
  /// **'Clients ({count})'**
  String clientsCount(int count);

  /// No description provided for @customersNoPermissionToView.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view this content'**
  String get customersNoPermissionToView;

  /// No description provided for @customersNoPermissionToAct.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get customersNoPermissionToAct;

  /// No description provided for @customersLockedAction.
  ///
  /// In en, this message translates to:
  /// **'Locked Action'**
  String get customersLockedAction;

  /// No description provided for @customersCannotMakeCall.
  ///
  /// In en, this message translates to:
  /// **'Cannot make call'**
  String get customersCannotMakeCall;

  /// No description provided for @customersCallPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Call permission denied'**
  String get customersCallPermissionDenied;

  /// No description provided for @customersCallPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Call Permission Required'**
  String get customersCallPermissionRequired;

  /// No description provided for @customersCallPermissionRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'You must allow call permission to use this feature. Please go to app settings and allow call permission.'**
  String get customersCallPermissionRequiredMessage;

  /// No description provided for @customersCannotSendEmail.
  ///
  /// In en, this message translates to:
  /// **'Cannot send email'**
  String get customersCannotSendEmail;

  /// No description provided for @customersEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'Message from Invotek App'**
  String get customersEmailSubject;

  /// No description provided for @customersCannotOpenMap.
  ///
  /// In en, this message translates to:
  /// **'Cannot open map'**
  String get customersCannotOpenMap;

  /// No description provided for @customersLocationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get customersLocationPermissionDenied;

  /// No description provided for @customersLocationPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Location Permission Required'**
  String get customersLocationPermissionRequired;

  /// No description provided for @customersLocationPermissionRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'You must allow location permission to use this feature. Please go to app settings and allow location permission.'**
  String get customersLocationPermissionRequiredMessage;

  /// No description provided for @customersAppSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get customersAppSettings;

  /// No description provided for @customersInvalidPhoneFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get customersInvalidPhoneFormat;

  /// No description provided for @customersDeleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get customersDeleteAction;

  /// No description provided for @customersEditCustomerAction.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get customersEditCustomerAction;

  /// No description provided for @customersCustomerFormHelpDescription.
  ///
  /// In en, this message translates to:
  /// **'This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information'**
  String get customersCustomerFormHelpDescription;

  /// No description provided for @expensesNoPermissionToView.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view this content'**
  String get expensesNoPermissionToView;

  /// No description provided for @expensesNoPermissionToAct.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get expensesNoPermissionToAct;

  /// No description provided for @expensesLockedAction.
  ///
  /// In en, this message translates to:
  /// **'Locked Action'**
  String get expensesLockedAction;

  /// No description provided for @expensesDeleteExpense.
  ///
  /// In en, this message translates to:
  /// **'Delete Expense'**
  String get expensesDeleteExpense;

  /// No description provided for @expensesEditExpense.
  ///
  /// In en, this message translates to:
  /// **'Edit Expense'**
  String get expensesEditExpense;

  /// No description provided for @expensesViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get expensesViewDetails;

  /// No description provided for @expensesDeleteExpenseConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete expense \"{expenseTitle}\"? This action cannot be undone.'**
  String expensesDeleteExpenseConfirmation(String expenseTitle);

  /// No description provided for @expensesAreYouSureDeleteExpense.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this expense?'**
  String get expensesAreYouSureDeleteExpense;

  /// No description provided for @expensesThisActionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get expensesThisActionCannotBeUndone;

  /// No description provided for @expensesNoDescription.
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get expensesNoDescription;

  /// No description provided for @expensesUnknownCategory.
  ///
  /// In en, this message translates to:
  /// **'Unknown Category'**
  String get expensesUnknownCategory;

  /// No description provided for @expensesLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get expensesLoading;

  /// No description provided for @expensesDeleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Category'**
  String get expensesDeleteCategory;

  /// No description provided for @expensesAreYouSureDeleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this expense category?'**
  String get expensesAreYouSureDeleteCategory;

  /// No description provided for @expensesStatus.
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String expensesStatus(String status);

  /// No description provided for @expensesCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get expensesCopiedToClipboard;

  /// No description provided for @expensesErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String expensesErrorOccurred(String error);

  /// No description provided for @expensesExpenseDetailsHelpDescription.
  ///
  /// In en, this message translates to:
  /// **'This screen shows detailed information about the expense including financial details, payment information, and metadata.'**
  String get expensesExpenseDetailsHelpDescription;

  /// No description provided for @expensesExpenseDetailsHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get expensesExpenseDetailsHelpTitle;

  /// No description provided for @homeNoPermissionToView.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view this content'**
  String get homeNoPermissionToView;

  /// No description provided for @homeNoPermissionToAct.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get homeNoPermissionToAct;

  /// No description provided for @homeLockedAction.
  ///
  /// In en, this message translates to:
  /// **'Locked Action'**
  String get homeLockedAction;

  /// No description provided for @homeLoadingDashboard.
  ///
  /// In en, this message translates to:
  /// **'Loading dashboard data'**
  String get homeLoadingDashboard;

  /// No description provided for @homeAddNotificationsFeature.
  ///
  /// In en, this message translates to:
  /// **'Add notifications feature here'**
  String get homeAddNotificationsFeature;

  /// No description provided for @homeAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access Denied'**
  String get homeAccessDenied;

  /// No description provided for @homeNoPermissionToAccess.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to access {featureName}'**
  String homeNoPermissionToAccess(String featureName);

  /// No description provided for @homeAreYouSureLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get homeAreYouSureLogout;

  /// No description provided for @homeVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String homeVersion(String version);

  /// No description provided for @homeAddNewCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add New Customer'**
  String get homeAddNewCustomer;

  /// No description provided for @homeCreateNewInvoice.
  ///
  /// In en, this message translates to:
  /// **'Create New Invoice'**
  String get homeCreateNewInvoice;

  /// No description provided for @homeViewAllInvoices.
  ///
  /// In en, this message translates to:
  /// **'View All Invoices'**
  String get homeViewAllInvoices;

  /// No description provided for @homeDeviceInfo.
  ///
  /// In en, this message translates to:
  /// **'Device Information'**
  String get homeDeviceInfo;

  /// No description provided for @homeWidth.
  ///
  /// In en, this message translates to:
  /// **'Width: {width}px'**
  String homeWidth(String width);

  /// No description provided for @homeHeight.
  ///
  /// In en, this message translates to:
  /// **'Height: {height}px'**
  String homeHeight(String height);

  /// No description provided for @homeDeviceType.
  ///
  /// In en, this message translates to:
  /// **'Device Type: {deviceType}'**
  String homeDeviceType(String deviceType);

  /// No description provided for @homePixelRatio.
  ///
  /// In en, this message translates to:
  /// **'Pixel Ratio: {ratio}'**
  String homePixelRatio(String ratio);

  /// No description provided for @homeTablet.
  ///
  /// In en, this message translates to:
  /// **'Tablet'**
  String get homeTablet;

  /// No description provided for @homePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get homePhone;

  /// No description provided for @invoicesNoPermissionToView.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view this content'**
  String get invoicesNoPermissionToView;

  /// No description provided for @invoicesNoPermissionToAct.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get invoicesNoPermissionToAct;

  /// No description provided for @invoicesLockedAction.
  ///
  /// In en, this message translates to:
  /// **'Locked Action'**
  String get invoicesLockedAction;

  /// No description provided for @invoicesCannotDeleteNonDraft.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete this invoice because it is not a draft'**
  String get invoicesCannotDeleteNonDraft;

  /// No description provided for @invoicesInvoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Invoice Number'**
  String get invoicesInvoiceNumber;

  /// No description provided for @invoicesCustomerName.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get invoicesCustomerName;

  /// No description provided for @invoicesCustomerEmail.
  ///
  /// In en, this message translates to:
  /// **'Customer Email'**
  String get invoicesCustomerEmail;

  /// No description provided for @invoicesCustomerPhone.
  ///
  /// In en, this message translates to:
  /// **'Customer Phone'**
  String get invoicesCustomerPhone;

  /// No description provided for @invoicesCustomerAddress.
  ///
  /// In en, this message translates to:
  /// **'Customer Address'**
  String get invoicesCustomerAddress;

  /// No description provided for @invoicesCustomerNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get invoicesCustomerNotes;

  /// No description provided for @invoicesNoProductIdAvailable.
  ///
  /// In en, this message translates to:
  /// **'No product ID available'**
  String get invoicesNoProductIdAvailable;

  /// No description provided for @invoicesDuplicateInvoice.
  ///
  /// In en, this message translates to:
  /// **'Duplicate Invoice'**
  String get invoicesDuplicateInvoice;

  /// No description provided for @invoicesDownloadPDF.
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get invoicesDownloadPDF;

  /// No description provided for @invoicesEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get invoicesEmail;

  /// No description provided for @invoicesInvoiceNumberPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Invoice {number}'**
  String invoicesInvoiceNumberPlaceholder(String number);

  /// No description provided for @invoicesPleaseFindAttachedInvoice.
  ///
  /// In en, this message translates to:
  /// **'Please find attached your invoice.'**
  String get invoicesPleaseFindAttachedInvoice;

  /// No description provided for @invoicesDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get invoicesDiscount;

  /// No description provided for @invoicesTaxPercentage.
  ///
  /// In en, this message translates to:
  /// **'Tax Percentage'**
  String get invoicesTaxPercentage;

  /// No description provided for @invoicesItemDetailsCopied.
  ///
  /// In en, this message translates to:
  /// **'Item details copied to clipboard'**
  String get invoicesItemDetailsCopied;

  /// No description provided for @invoicesItemDetails.
  ///
  /// In en, this message translates to:
  /// **'Item Details:'**
  String get invoicesItemDetails;

  /// No description provided for @invoicesItemNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name:'**
  String get invoicesItemNameLabel;

  /// No description provided for @invoicesItemDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description:'**
  String get invoicesItemDescriptionLabel;

  /// No description provided for @invoicesItemQuantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Quantity:'**
  String get invoicesItemQuantityLabel;

  /// No description provided for @invoicesItemPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price:'**
  String get invoicesItemPriceLabel;

  /// No description provided for @invoicesItemDiscountLabel.
  ///
  /// In en, this message translates to:
  /// **'Discount:'**
  String get invoicesItemDiscountLabel;

  /// No description provided for @invoicesItemTaxPercentageLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax Percentage:'**
  String get invoicesItemTaxPercentageLabel;

  /// No description provided for @invoicesItemTaxAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax Amount:'**
  String get invoicesItemTaxAmountLabel;

  /// No description provided for @invoicesItemTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get invoicesItemTotalLabel;

  /// No description provided for @invoicesProductInfo.
  ///
  /// In en, this message translates to:
  /// **'Product Information:'**
  String get invoicesProductInfo;

  /// No description provided for @invoicesProductNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Product Name:'**
  String get invoicesProductNameLabel;

  /// No description provided for @invoicesQRCode.
  ///
  /// In en, this message translates to:
  /// **'QR Code'**
  String get invoicesQRCode;

  /// No description provided for @invoicesScanQRCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'You can scan this code to access invoice details'**
  String get invoicesScanQRCodeMessage;

  /// No description provided for @invoicesProductInformation.
  ///
  /// In en, this message translates to:
  /// **'Product Information'**
  String get invoicesProductInformation;

  /// No description provided for @invoicesFilterInvoices.
  ///
  /// In en, this message translates to:
  /// **'Filter Invoices'**
  String get invoicesFilterInvoices;

  /// No description provided for @invoicesStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get invoicesStatus;

  /// No description provided for @invoicesSortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get invoicesSortOrder;

  /// No description provided for @invoicesApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get invoicesApply;

  /// No description provided for @invoicesAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get invoicesAll;

  /// No description provided for @invoicesPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get invoicesPending;

  /// No description provided for @invoicesSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get invoicesSent;

  /// No description provided for @invoicesDescending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get invoicesDescending;

  /// No description provided for @invoicesAscending.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get invoicesAscending;

  /// No description provided for @invoicesLoadingMore.
  ///
  /// In en, this message translates to:
  /// **'Loading more...'**
  String get invoicesLoadingMore;

  /// No description provided for @invoicesLoadingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Loading invoices...'**
  String get invoicesLoadingInvoices;

  /// No description provided for @productsNoPermissionToView.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view this content'**
  String get productsNoPermissionToView;

  /// No description provided for @productsNoPermissionToAct.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get productsNoPermissionToAct;

  /// No description provided for @productsSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get productsSettings;

  /// No description provided for @productsEnterProductName.
  ///
  /// In en, this message translates to:
  /// **'Enter product name'**
  String get productsEnterProductName;

  /// No description provided for @productsEnterProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter product description'**
  String get productsEnterProductDescription;

  /// No description provided for @productsEnterSellingPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter selling price'**
  String get productsEnterSellingPrice;

  /// No description provided for @productsEnterCostPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter cost price'**
  String get productsEnterCostPrice;

  /// No description provided for @productsEnterTaxRatePercentage.
  ///
  /// In en, this message translates to:
  /// **'Enter tax rate percentage'**
  String get productsEnterTaxRatePercentage;

  /// No description provided for @productsEnterQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter quantity'**
  String get productsEnterQuantity;

  /// No description provided for @productsEnterUnit.
  ///
  /// In en, this message translates to:
  /// **'Enter unit (e.g., piece)'**
  String get productsEnterUnit;

  /// No description provided for @productsEnterSKU.
  ///
  /// In en, this message translates to:
  /// **'Enter SKU'**
  String get productsEnterSKU;

  /// No description provided for @productsEnterBarcode.
  ///
  /// In en, this message translates to:
  /// **'Enter barcode'**
  String get productsEnterBarcode;

  /// No description provided for @productsProductNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Product name is required'**
  String get productsProductNameRequired;

  /// No description provided for @productsProductStatusRequired.
  ///
  /// In en, this message translates to:
  /// **'Product status is required'**
  String get productsProductStatusRequired;

  /// No description provided for @productsSellingPriceRequired.
  ///
  /// In en, this message translates to:
  /// **'Selling price is required'**
  String get productsSellingPriceRequired;

  /// No description provided for @productsPleaseEnterValidPrice.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid price'**
  String get productsPleaseEnterValidPrice;

  /// No description provided for @productsQuantityRequired.
  ///
  /// In en, this message translates to:
  /// **'Quantity is required'**
  String get productsQuantityRequired;

  /// No description provided for @productsPleaseEnterValidQuantity.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid quantity'**
  String get productsPleaseEnterValidQuantity;

  /// No description provided for @productsUnnamedProduct.
  ///
  /// In en, this message translates to:
  /// **'Unnamed Product'**
  String get productsUnnamedProduct;

  /// No description provided for @productsThisActionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get productsThisActionCannotBeUndone;

  /// No description provided for @productsCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get productsCopiedToClipboard;

  /// No description provided for @productsNoCategoriesFound.
  ///
  /// In en, this message translates to:
  /// **'No categories found'**
  String get productsNoCategoriesFound;

  /// No description provided for @productsDeleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Category'**
  String get productsDeleteCategory;

  /// No description provided for @productsCategoryState.
  ///
  /// In en, this message translates to:
  /// **'Category State'**
  String get productsCategoryState;

  /// No description provided for @productsCheckIfCategoryIsActiveOrInactive.
  ///
  /// In en, this message translates to:
  /// **'check if the category is active or inactive'**
  String get productsCheckIfCategoryIsActiveOrInactive;

  /// No description provided for @productsAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get productsAdd;

  /// No description provided for @productsUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get productsUpdate;

  /// No description provided for @productsDeleteCategoryConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete category \"{name}\"?'**
  String productsDeleteCategoryConfirmation(String name);

  /// No description provided for @productsAreYouSureYouWantToDeleteThisProduct.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product?'**
  String get productsAreYouSureYouWantToDeleteThisProduct;

  /// No description provided for @productsProductIsTaxable.
  ///
  /// In en, this message translates to:
  /// **'Product is Taxable'**
  String get productsProductIsTaxable;

  /// No description provided for @productsApplyTaxToProduct.
  ///
  /// In en, this message translates to:
  /// **'Apply tax to product'**
  String get productsApplyTaxToProduct;

  /// No description provided for @productsTrackAvailableProductQuantity.
  ///
  /// In en, this message translates to:
  /// **'Track available product quantity'**
  String get productsTrackAvailableProductQuantity;

  /// No description provided for @settingsNoPermissionToView.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view settings'**
  String get settingsNoPermissionToView;

  /// No description provided for @settingsNoPermissionToAct.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get settingsNoPermissionToAct;

  /// No description provided for @settingsTaxIntegration.
  ///
  /// In en, this message translates to:
  /// **'Tax Integration'**
  String get settingsTaxIntegration;

  /// No description provided for @settingsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get settingsRetry;

  /// No description provided for @settingsUpdateStatus.
  ///
  /// In en, this message translates to:
  /// **'Update Status'**
  String get settingsUpdateStatus;

  /// No description provided for @settingsStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get settingsStatus;

  /// No description provided for @settingsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get settingsActive;

  /// No description provided for @settingsInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get settingsInactive;

  /// No description provided for @settingsTaxInvoiceType.
  ///
  /// In en, this message translates to:
  /// **'Tax Invoice Type'**
  String get settingsTaxInvoiceType;

  /// No description provided for @settingsTaxMerchantCode.
  ///
  /// In en, this message translates to:
  /// **'Tax Merchant Code'**
  String get settingsTaxMerchantCode;

  /// No description provided for @settingsActivateIntegration.
  ///
  /// In en, this message translates to:
  /// **'Activate Integration'**
  String get settingsActivateIntegration;

  /// No description provided for @settingsInvoiceType.
  ///
  /// In en, this message translates to:
  /// **'Invoice Type'**
  String get settingsInvoiceType;

  /// No description provided for @settingsIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get settingsIncome;

  /// No description provided for @settingsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneral;

  /// No description provided for @settingsVAT.
  ///
  /// In en, this message translates to:
  /// **'VAT'**
  String get settingsVAT;

  /// No description provided for @settingsActivate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get settingsActivate;

  /// No description provided for @settingsDeactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get settingsDeactivate;

  /// No description provided for @settingsSupportEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'Technical Support - Invotek App'**
  String get settingsSupportEmailSubject;

  /// No description provided for @usersNoPermissionToView.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view this content'**
  String get usersNoPermissionToView;

  /// No description provided for @usersNoPermissionToAct.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get usersNoPermissionToAct;

  /// No description provided for @usersDeleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get usersDeleteUser;

  /// No description provided for @usersAreYouSureYouWantToDeleteUser.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete user'**
  String get usersAreYouSureYouWantToDeleteUser;

  /// No description provided for @usersThisActionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get usersThisActionCannotBeUndone;

  /// No description provided for @usersUnknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown User'**
  String get usersUnknownUser;

  /// No description provided for @usersNoEmail.
  ///
  /// In en, this message translates to:
  /// **'No email'**
  String get usersNoEmail;

  /// No description provided for @usersViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get usersViewDetails;

  /// No description provided for @usersViewUserDetails.
  ///
  /// In en, this message translates to:
  /// **'View user details'**
  String get usersViewUserDetails;

  /// No description provided for @usersEditUser.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get usersEditUser;

  /// No description provided for @usersEditUserInformation.
  ///
  /// In en, this message translates to:
  /// **'Edit user information'**
  String get usersEditUserInformation;

  /// No description provided for @usersDeleteUserPermanently.
  ///
  /// In en, this message translates to:
  /// **'Delete user permanently'**
  String get usersDeleteUserPermanently;

  /// No description provided for @usersCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get usersCopiedToClipboard;

  /// No description provided for @usersNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get usersNameRequired;

  /// No description provided for @usersEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get usersEmailRequired;

  /// No description provided for @usersPleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get usersPleaseEnterValidEmail;

  /// No description provided for @usersPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get usersPasswordRequired;

  /// No description provided for @usersPasswordMustBeAtLeast6Characters.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get usersPasswordMustBeAtLeast6Characters;

  /// No description provided for @usersPleaseConfirmYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get usersPleaseConfirmYourPassword;

  /// No description provided for @usersPasswordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get usersPasswordsDoNotMatch;

  /// No description provided for @usersManagePermissions.
  ///
  /// In en, this message translates to:
  /// **'Manage Permissions'**
  String get usersManagePermissions;

  /// No description provided for @usersManageRolesAndPermissions.
  ///
  /// In en, this message translates to:
  /// **'Manage roles and permissions'**
  String get usersManageRolesAndPermissions;

  /// No description provided for @usersRoles.
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get usersRoles;

  /// No description provided for @usersSelectModule.
  ///
  /// In en, this message translates to:
  /// **'Select Module'**
  String get usersSelectModule;

  /// No description provided for @usersModulePermissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get usersModulePermissions;

  /// No description provided for @usersNoPermissionsForThisModule.
  ///
  /// In en, this message translates to:
  /// **'No permissions for this module'**
  String get usersNoPermissionsForThisModule;

  /// No description provided for @usersTotalPermissions.
  ///
  /// In en, this message translates to:
  /// **'Total Permissions'**
  String get usersTotalPermissions;

  /// No description provided for @usersAddNewRole.
  ///
  /// In en, this message translates to:
  /// **'Add New Role'**
  String get usersAddNewRole;

  /// No description provided for @usersRoleName.
  ///
  /// In en, this message translates to:
  /// **'Role Name'**
  String get usersRoleName;

  /// No description provided for @usersRoleDescription.
  ///
  /// In en, this message translates to:
  /// **'Role Description'**
  String get usersRoleDescription;

  /// No description provided for @usersAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get usersAdd;

  /// No description provided for @usersEditRole.
  ///
  /// In en, this message translates to:
  /// **'Edit Role'**
  String get usersEditRole;

  /// No description provided for @usersConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get usersConfirmDelete;

  /// No description provided for @usersAreYouSureYouWantToDeleteRole.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the role \"{name}\"?'**
  String usersAreYouSureYouWantToDeleteRole(String name);

  /// No description provided for @usersActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get usersActive;

  /// No description provided for @usersInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get usersInactive;

  /// No description provided for @usersModule.
  ///
  /// In en, this message translates to:
  /// **'Module'**
  String get usersModule;

  /// No description provided for @usersUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get usersUsers;

  /// No description provided for @usersClients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get usersClients;

  /// No description provided for @usersProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get usersProducts;

  /// No description provided for @usersInvoices.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get usersInvoices;

  /// No description provided for @usersExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get usersExpenses;

  /// No description provided for @usersReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get usersReports;

  /// No description provided for @usersSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get usersSettings;

  /// No description provided for @creditInvoicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Returned Invoices'**
  String get creditInvoicesTitle;

  /// No description provided for @dinar.
  ///
  /// In en, this message translates to:
  /// **'Dinar'**
  String get dinar;

  /// No description provided for @manageExpensesAndBudgets.
  ///
  /// In en, this message translates to:
  /// **'Manage expenses and budgets'**
  String get manageExpensesAndBudgets;

  /// No description provided for @enterPosition.
  ///
  /// In en, this message translates to:
  /// **'Enter position'**
  String get enterPosition;

  /// No description provided for @confirmPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPasswordPlaceholder;

  /// No description provided for @selectRole.
  ///
  /// In en, this message translates to:
  /// **'Select Role'**
  String get selectRole;

  /// No description provided for @selectStatus.
  ///
  /// In en, this message translates to:
  /// **'Select Status'**
  String get selectStatus;

  /// No description provided for @searchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search users'**
  String get searchUsers;

  /// No description provided for @usersManagementTitle.
  ///
  /// In en, this message translates to:
  /// **'Users Management'**
  String get usersManagementTitle;

  /// No description provided for @manageUsersAndPermissions.
  ///
  /// In en, this message translates to:
  /// **'Manage users and permissions'**
  String get manageUsersAndPermissions;

  /// No description provided for @userDetails.
  ///
  /// In en, this message translates to:
  /// **'User Details'**
  String get userDetails;

  /// No description provided for @unknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown User'**
  String get unknownUser;

  /// No description provided for @notProvided.
  ///
  /// In en, this message translates to:
  /// **'Not provided'**
  String get notProvided;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get notAvailable;

  /// No description provided for @notAssigned.
  ///
  /// In en, this message translates to:
  /// **'Not assigned'**
  String get notAssigned;

  /// No description provided for @noNotesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No notes available'**
  String get noNotesAvailable;

  /// No description provided for @userInformation.
  ///
  /// In en, this message translates to:
  /// **'User Information'**
  String get userInformation;

  /// No description provided for @userSummary.
  ///
  /// In en, this message translates to:
  /// **'User Summary'**
  String get userSummary;

  /// No description provided for @lastLogin.
  ///
  /// In en, this message translates to:
  /// **'Last Login'**
  String get lastLogin;

  /// No description provided for @never.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get never;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'(Unknown)'**
  String get unknown;

  /// No description provided for @allRoles.
  ///
  /// In en, this message translates to:
  /// **'All Roles'**
  String get allRoles;

  /// No description provided for @employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// No description provided for @viewer.
  ///
  /// In en, this message translates to:
  /// **'Viewer'**
  String get viewer;

  /// No description provided for @suspended.
  ///
  /// In en, this message translates to:
  /// **'Suspended'**
  String get suspended;

  /// No description provided for @startByAddingFirstUser.
  ///
  /// In en, this message translates to:
  /// **'Start by adding your first user to the system'**
  String get startByAddingFirstUser;

  /// No description provided for @addFirstUser.
  ///
  /// In en, this message translates to:
  /// **'Add First User'**
  String get addFirstUser;

  /// No description provided for @userPermissions.
  ///
  /// In en, this message translates to:
  /// **'User Permissions'**
  String get userPermissions;

  /// No description provided for @createUsers.
  ///
  /// In en, this message translates to:
  /// **'Create Users'**
  String get createUsers;

  /// No description provided for @editUsers.
  ///
  /// In en, this message translates to:
  /// **'Edit Users'**
  String get editUsers;

  /// No description provided for @deleteUsers.
  ///
  /// In en, this message translates to:
  /// **'Delete Users'**
  String get deleteUsers;

  /// No description provided for @createProducts.
  ///
  /// In en, this message translates to:
  /// **'Create Products'**
  String get createProducts;

  /// No description provided for @editProducts.
  ///
  /// In en, this message translates to:
  /// **'Edit Products'**
  String get editProducts;

  /// No description provided for @deleteProducts.
  ///
  /// In en, this message translates to:
  /// **'Delete Products'**
  String get deleteProducts;

  /// No description provided for @viewCustomers.
  ///
  /// In en, this message translates to:
  /// **'View Customers'**
  String get viewCustomers;

  /// No description provided for @createCustomers.
  ///
  /// In en, this message translates to:
  /// **'Create Customers'**
  String get createCustomers;

  /// No description provided for @editCustomers.
  ///
  /// In en, this message translates to:
  /// **'Edit Customers'**
  String get editCustomers;

  /// No description provided for @deleteCustomers.
  ///
  /// In en, this message translates to:
  /// **'Delete Customers'**
  String get deleteCustomers;

  /// No description provided for @createExpenses.
  ///
  /// In en, this message translates to:
  /// **'Create Expenses'**
  String get createExpenses;

  /// No description provided for @editExpenses.
  ///
  /// In en, this message translates to:
  /// **'Edit Expenses'**
  String get editExpenses;

  /// No description provided for @deleteExpenses.
  ///
  /// In en, this message translates to:
  /// **'Delete Expenses'**
  String get deleteExpenses;

  /// No description provided for @manageSettings.
  ///
  /// In en, this message translates to:
  /// **'Manage Settings'**
  String get manageSettings;

  /// No description provided for @profileInformation.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInformation;

  /// No description provided for @enterDepartment.
  ///
  /// In en, this message translates to:
  /// **'Enter department'**
  String get enterDepartment;

  /// No description provided for @accountStatus.
  ///
  /// In en, this message translates to:
  /// **'Account Status'**
  String get accountStatus;

  /// No description provided for @enableOrDisableUserAccount.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable user account'**
  String get enableOrDisableUserAccount;

  /// No description provided for @userCreatedSuccessfullyMessage.
  ///
  /// In en, this message translates to:
  /// **'User created successfully'**
  String get userCreatedSuccessfullyMessage;

  /// No description provided for @userUpdatedSuccessfullyMessage.
  ///
  /// In en, this message translates to:
  /// **'User updated successfully'**
  String get userUpdatedSuccessfullyMessage;

  /// No description provided for @userDeletedSuccessfullyMessage.
  ///
  /// In en, this message translates to:
  /// **'User deleted successfully'**
  String get userDeletedSuccessfullyMessage;

  /// No description provided for @completedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'completed successfully'**
  String get completedSuccessfully;

  /// No description provided for @usersNoName.
  ///
  /// In en, this message translates to:
  /// **'No name'**
  String get usersNoName;

  /// No description provided for @usersNoRole.
  ///
  /// In en, this message translates to:
  /// **'No role'**
  String get usersNoRole;

  /// No description provided for @usersUndefined.
  ///
  /// In en, this message translates to:
  /// **'Undefined'**
  String get usersUndefined;

  /// No description provided for @usersUnknownStatus.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get usersUnknownStatus;

  /// No description provided for @usersRoleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get usersRoleAdmin;

  /// No description provided for @usersRoleAccountant.
  ///
  /// In en, this message translates to:
  /// **'Accountant'**
  String get usersRoleAccountant;

  /// No description provided for @usersRoleUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get usersRoleUser;

  /// No description provided for @usersRoleSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Supervisor'**
  String get usersRoleSupervisor;

  /// No description provided for @usersStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get usersStatusActive;

  /// No description provided for @usersStatusInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get usersStatusInactive;

  /// No description provided for @noStatus.
  ///
  /// In en, this message translates to:
  /// **'No Status'**
  String get noStatus;

  /// No description provided for @noPhone.
  ///
  /// In en, this message translates to:
  /// **'No Phone'**
  String get noPhone;

  /// No description provided for @taxIntegrationNotActive.
  ///
  /// In en, this message translates to:
  /// **'Tax integration is not active'**
  String get taxIntegrationNotActive;

  /// No description provided for @taxIntegrationNotActiveMessage.
  ///
  /// In en, this message translates to:
  /// **'You have not activated tax integration. Please activate it from settings if you have permission to do so'**
  String get taxIntegrationNotActiveMessage;

  /// No description provided for @goToSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to Settings'**
  String get goToSettings;

  /// No description provided for @customersUnnamedCustomer.
  ///
  /// In en, this message translates to:
  /// **'Unnamed Customer'**
  String get customersUnnamedCustomer;

  /// No description provided for @customersInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get customersInactive;

  /// No description provided for @customersCompanyTech.
  ///
  /// In en, this message translates to:
  /// **'Advanced Technology Company'**
  String get customersCompanyTech;

  /// No description provided for @customersCompanyFinance.
  ///
  /// In en, this message translates to:
  /// **'Financial Services Institution'**
  String get customersCompanyFinance;

  /// No description provided for @customersCompanyConstruction.
  ///
  /// In en, this message translates to:
  /// **'Construction & Development Company'**
  String get customersCompanyConstruction;

  /// No description provided for @customersCompanyEducation.
  ///
  /// In en, this message translates to:
  /// **'Modern Education Institution'**
  String get customersCompanyEducation;

  /// No description provided for @customersCompanyTourism.
  ///
  /// In en, this message translates to:
  /// **'Tourism & Entertainment Company'**
  String get customersCompanyTourism;

  /// No description provided for @customersCompanyHealthcare.
  ///
  /// In en, this message translates to:
  /// **'Healthcare Institution'**
  String get customersCompanyHealthcare;

  /// No description provided for @customersCompanyTransport.
  ///
  /// In en, this message translates to:
  /// **'Transport & Logistics Company'**
  String get customersCompanyTransport;

  /// No description provided for @customersCompanyEcommerce.
  ///
  /// In en, this message translates to:
  /// **'E-commerce Institution'**
  String get customersCompanyEcommerce;

  /// No description provided for @customersLastFiveInvoices.
  ///
  /// In en, this message translates to:
  /// **'The last 5 invoices'**
  String get customersLastFiveInvoices;

  /// No description provided for @customersContactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get customersContactInformation;

  /// No description provided for @customersNotProvided.
  ///
  /// In en, this message translates to:
  /// **'Not provided'**
  String get customersNotProvided;

  /// No description provided for @customersCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get customersCall;

  /// No description provided for @customersMap.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get customersMap;

  /// No description provided for @customersAccountStatus.
  ///
  /// In en, this message translates to:
  /// **'Account Status'**
  String get customersAccountStatus;

  /// No description provided for @customersCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get customersCreated;

  /// No description provided for @customersLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get customersLastUpdated;

  /// No description provided for @customersLoadingMore.
  ///
  /// In en, this message translates to:
  /// **'Loading more...'**
  String get customersLoadingMore;

  /// No description provided for @customersNoInvoicesForCustomer.
  ///
  /// In en, this message translates to:
  /// **'No invoices for this customer'**
  String get customersNoInvoicesForCustomer;

  /// No description provided for @usersCannotDeleteAdmin.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete admin user'**
  String get usersCannotDeleteAdmin;

  /// No description provided for @usersCannotDeleteYourself.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete your own account'**
  String get usersCannotDeleteYourself;

  /// No description provided for @usersCannotDeleteAdminMessage.
  ///
  /// In en, this message translates to:
  /// **'Admin users cannot be deleted'**
  String get usersCannotDeleteAdminMessage;

  /// No description provided for @usersCannotDeleteYourselfMessage.
  ///
  /// In en, this message translates to:
  /// **'You cannot delete your own account'**
  String get usersCannotDeleteYourselfMessage;

  /// No description provided for @productsHelp.
  ///
  /// In en, this message translates to:
  /// **'Product Help'**
  String get productsHelp;

  /// No description provided for @productsHelpDescription.
  ///
  /// In en, this message translates to:
  /// **'This screen helps you add new products to your inventory. Here\'s what you need to know:'**
  String get productsHelpDescription;

  /// No description provided for @productsBasicInformation.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get productsBasicInformation;

  /// No description provided for @productsBasicInformationDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter product name, description, category, and status.'**
  String get productsBasicInformationDescription;

  /// No description provided for @productsPricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get productsPricing;

  /// No description provided for @productsPricingDescription.
  ///
  /// In en, this message translates to:
  /// **'Set selling price, cost price, and tax rate.'**
  String get productsPricingDescription;

  /// No description provided for @productsInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get productsInventory;

  /// No description provided for @productsInventoryDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage quantity, units, and stock levels.'**
  String get productsInventoryDescription;

  /// No description provided for @productsProductDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productsProductDetails;

  /// No description provided for @productsProductDetailsDescription.
  ///
  /// In en, this message translates to:
  /// **'Add SKU, barcode, brand, model, and other details.'**
  String get productsProductDetailsDescription;

  /// No description provided for @subscriptionRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscription Required'**
  String get subscriptionRequiredTitle;

  /// No description provided for @subscriptionRequiredAction.
  ///
  /// In en, this message translates to:
  /// **'Choose Package'**
  String get subscriptionRequiredAction;

  /// No description provided for @productsProductInformation.
  ///
  /// In en, this message translates to:
  /// **'Product Information'**
  String get productsProductInformation;

  /// No description provided for @productsDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get productsDescription;

  /// No description provided for @productsCostPrice.
  ///
  /// In en, this message translates to:
  /// **'Cost Price'**
  String get productsCostPrice;

  /// No description provided for @productsNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get productsNotSet;

  /// No description provided for @productsTaxRate.
  ///
  /// In en, this message translates to:
  /// **'Tax Rate'**
  String get productsTaxRate;

  /// No description provided for @productsUnit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get productsUnit;

  /// No description provided for @productsNotSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get productsNotSpecified;

  /// No description provided for @productsTaxable.
  ///
  /// In en, this message translates to:
  /// **'Taxable'**
  String get productsTaxable;

  /// No description provided for @productsYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get productsYes;

  /// No description provided for @productsNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get productsNo;

  /// No description provided for @productsTrackInventory.
  ///
  /// In en, this message translates to:
  /// **'Track Inventory'**
  String get productsTrackInventory;

  /// No description provided for @productsBarcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get productsBarcode;

  /// No description provided for @productsTapToCopy.
  ///
  /// In en, this message translates to:
  /// **'Tap to copy'**
  String get productsTapToCopy;

  /// No description provided for @productsSku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get productsSku;

  /// No description provided for @productsQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get productsQuantity;

  /// No description provided for @productsQty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get productsQty;

  /// No description provided for @productsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get productsEdit;

  /// No description provided for @productsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get productsDelete;

  /// No description provided for @productsCreateFirstProduct.
  ///
  /// In en, this message translates to:
  /// **'Create your first product to get started'**
  String get productsCreateFirstProduct;

  /// No description provided for @productsErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Error Occurred'**
  String get productsErrorOccurred;

  /// No description provided for @productsUnitHint.
  ///
  /// In en, this message translates to:
  /// **'piece, kg, meter...'**
  String get productsUnitHint;

  /// No description provided for @productsEnterProductSku.
  ///
  /// In en, this message translates to:
  /// **'Enter product SKU'**
  String get productsEnterProductSku;

  /// No description provided for @productsManageProductsAndInventory.
  ///
  /// In en, this message translates to:
  /// **'Manage products and inventory'**
  String get productsManageProductsAndInventory;

  /// No description provided for @productsViewAndManageProductInformation.
  ///
  /// In en, this message translates to:
  /// **'View and manage product information'**
  String get productsViewAndManageProductInformation;

  /// No description provided for @productsEditProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get productsEditProduct;

  /// No description provided for @productsProductInsights.
  ///
  /// In en, this message translates to:
  /// **'Product Insights'**
  String get productsProductInsights;

  /// No description provided for @productsInvoices.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get productsInvoices;

  /// No description provided for @productsThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get productsThisMonth;

  /// No description provided for @productsCustomers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get productsCustomers;

  /// No description provided for @productsBoughtThis.
  ///
  /// In en, this message translates to:
  /// **'Bought This'**
  String get productsBoughtThis;

  /// No description provided for @productsSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get productsSales;

  /// No description provided for @productsStock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get productsStock;

  /// No description provided for @productsAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get productsAvailable;

  /// No description provided for @expensesPaymentMethodCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get expensesPaymentMethodCash;

  /// No description provided for @expensesPaymentMethodCard.
  ///
  /// In en, this message translates to:
  /// **'Credit/Debit Card'**
  String get expensesPaymentMethodCard;

  /// No description provided for @expensesPaymentMethodBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get expensesPaymentMethodBankTransfer;

  /// No description provided for @expensesPaymentMethodCheck.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get expensesPaymentMethodCheck;

  /// No description provided for @expensesNoCategoriesToDelete.
  ///
  /// In en, this message translates to:
  /// **'No categories to delete'**
  String get expensesNoCategoriesToDelete;

  /// No description provided for @expensesAllCategoriesDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'All categories deleted successfully'**
  String get expensesAllCategoriesDeletedSuccessfully;

  /// No description provided for @expensesDeleteAllCategories.
  ///
  /// In en, this message translates to:
  /// **'Delete All Categories'**
  String get expensesDeleteAllCategories;

  /// No description provided for @expensesCurrentCategories.
  ///
  /// In en, this message translates to:
  /// **'Current Categories'**
  String get expensesCurrentCategories;

  /// No description provided for @expensesNoCategoriesFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'No categories found. You can now start creating new ones!'**
  String get expensesNoCategoriesFoundMessage;

  /// No description provided for @expensesStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get expensesStatusLabel;

  /// No description provided for @expensesDeleting.
  ///
  /// In en, this message translates to:
  /// **'Deleting...'**
  String get expensesDeleting;

  /// No description provided for @expensesDeleteAllCategoriesCount.
  ///
  /// In en, this message translates to:
  /// **'Delete All Categories'**
  String get expensesDeleteAllCategoriesCount;

  /// No description provided for @expensesSortByTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get expensesSortByTitle;

  /// No description provided for @expensesSortByAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get expensesSortByAmount;

  /// No description provided for @expensesSortByCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get expensesSortByCreatedAt;

  /// No description provided for @expensesSortByUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Updated At'**
  String get expensesSortByUpdatedAt;

  /// No description provided for @expensesSortByDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get expensesSortByDate;

  /// No description provided for @expensesSortOrderAsc.
  ///
  /// In en, this message translates to:
  /// **'ASC'**
  String get expensesSortOrderAsc;

  /// No description provided for @expensesSortOrderDesc.
  ///
  /// In en, this message translates to:
  /// **'DESC'**
  String get expensesSortOrderDesc;

  /// No description provided for @expensesAllCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get expensesAllCategories;

  /// No description provided for @expensesSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get expensesSortBy;

  /// No description provided for @expensesOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get expensesOrder;

  /// No description provided for @expensesAllStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get expensesAllStatus;

  /// No description provided for @expensesSearchCategories.
  ///
  /// In en, this message translates to:
  /// **'Search categories...'**
  String get expensesSearchCategories;

  /// No description provided for @expensesErrorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get expensesErrorPrefix;

  /// No description provided for @expensesEditCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get expensesEditCategory;

  /// No description provided for @expensesNoExpensesYet.
  ///
  /// In en, this message translates to:
  /// **'No expenses yet'**
  String get expensesNoExpensesYet;

  /// No description provided for @expensesStartTrackingExpenses.
  ///
  /// In en, this message translates to:
  /// **'Start tracking your business expenses by adding your first expense'**
  String get expensesStartTrackingExpenses;

  /// No description provided for @expensesAddFirstExpense.
  ///
  /// In en, this message translates to:
  /// **'Add First Expense'**
  String get expensesAddFirstExpense;

  /// No description provided for @expensesSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get expensesSomethingWentWrong;

  /// No description provided for @expensesTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get expensesTryAgain;

  /// No description provided for @expensesNoCategoriesYet.
  ///
  /// In en, this message translates to:
  /// **'No categories yet'**
  String get expensesNoCategoriesYet;

  /// No description provided for @expensesCreateExpenseCategories.
  ///
  /// In en, this message translates to:
  /// **'Create expense categories to organize your business expenses'**
  String get expensesCreateExpenseCategories;

  /// No description provided for @expensesAddFirstCategory.
  ///
  /// In en, this message translates to:
  /// **'Add First Category'**
  String get expensesAddFirstCategory;

  /// No description provided for @notificationsAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get notificationsAll;

  /// No description provided for @notificationsRead.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get notificationsRead;

  /// No description provided for @notificationsUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notificationsUnread;

  /// No description provided for @notificationsTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get notificationsTotal;

  /// No description provided for @notificationsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search notifications...'**
  String get notificationsSearchHint;

  /// No description provided for @notificationsDetails.
  ///
  /// In en, this message translates to:
  /// **'Notification Details'**
  String get notificationsDetails;

  /// No description provided for @notificationsMarkAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark as Read'**
  String get notificationsMarkAsRead;

  /// No description provided for @notificationsMarkAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All as Read'**
  String get notificationsMarkAllAsRead;

  /// No description provided for @notificationsClearRead.
  ///
  /// In en, this message translates to:
  /// **'Clear Read'**
  String get notificationsClearRead;

  /// No description provided for @notificationsDeleteNotification.
  ///
  /// In en, this message translates to:
  /// **'Delete Notification'**
  String get notificationsDeleteNotification;

  /// No description provided for @notificationsDeleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this notification?'**
  String get notificationsDeleteConfirmation;

  /// No description provided for @notificationsClearReadConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all read notifications?'**
  String get notificationsClearReadConfirmation;

  /// No description provided for @notificationsMarkAsReadSuccess.
  ///
  /// In en, this message translates to:
  /// **'Notification marked as read successfully'**
  String get notificationsMarkAsReadSuccess;

  /// No description provided for @notificationsMarkAllAsReadSuccess.
  ///
  /// In en, this message translates to:
  /// **'All notifications marked as read successfully'**
  String get notificationsMarkAllAsReadSuccess;

  /// No description provided for @notificationsDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Notification deleted successfully'**
  String get notificationsDeleteSuccess;

  /// No description provided for @notificationsClearReadSuccess.
  ///
  /// In en, this message translates to:
  /// **'All read notifications cleared successfully'**
  String get notificationsClearReadSuccess;

  /// No description provided for @notificationsNoNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get notificationsNoNotifications;

  /// No description provided for @notificationsTypeInvoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get notificationsTypeInvoice;

  /// No description provided for @notificationsTypePayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get notificationsTypePayment;

  /// No description provided for @notificationsTypeUserCreated.
  ///
  /// In en, this message translates to:
  /// **'User Created'**
  String get notificationsTypeUserCreated;

  /// No description provided for @notificationsTypeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get notificationsTypeSystem;

  /// No description provided for @notificationsAdditionalData.
  ///
  /// In en, this message translates to:
  /// **'Additional Data'**
  String get notificationsAdditionalData;

  /// No description provided for @printInvoiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Print Invoice'**
  String get printInvoiceTitle;

  /// No description provided for @noPreview.
  ///
  /// In en, this message translates to:
  /// **'No Preview'**
  String get noPreview;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @printCancelled.
  ///
  /// In en, this message translates to:
  /// **'Print Cancelled'**
  String get printCancelled;

  /// No description provided for @previewError.
  ///
  /// In en, this message translates to:
  /// **'Preview Error: {error}'**
  String previewError(String error);

  /// No description provided for @printerNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Printer Not Connected'**
  String get printerNotConnected;

  /// No description provided for @connectPrinterFromSettings.
  ///
  /// In en, this message translates to:
  /// **'Please connect printer from settings'**
  String get connectPrinterFromSettings;

  /// No description provided for @pleaseConnectPrinterFirst.
  ///
  /// In en, this message translates to:
  /// **'Please connect printer first'**
  String get pleaseConnectPrinterFirst;

  /// No description provided for @printErrorWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Print Error: {error}'**
  String printErrorWithMessage(String error);

  /// No description provided for @subscriptionPackageSelectionPage.
  ///
  /// In en, this message translates to:
  /// **'Subscription Packages Page'**
  String get subscriptionPackageSelectionPage;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @cannotOpenPackageLink.
  ///
  /// In en, this message translates to:
  /// **'Cannot open package link'**
  String get cannotOpenPackageLink;

  /// No description provided for @deleteItemConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item?'**
  String get deleteItemConfirmation;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @disconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get disconnect;

  /// No description provided for @sliceHeight.
  ///
  /// In en, this message translates to:
  /// **'Slice Height (pixels)'**
  String get sliceHeight;

  /// No description provided for @checkingBluetoothStatus.
  ///
  /// In en, this message translates to:
  /// **'Checking Bluetooth status...'**
  String get checkingBluetoothStatus;

  /// No description provided for @bluetoothOff.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is off. Please enable it.'**
  String get bluetoothOff;

  /// No description provided for @checkingPrinterConnection.
  ///
  /// In en, this message translates to:
  /// **'Checking printer connection...'**
  String get checkingPrinterConnection;

  /// No description provided for @printerNotConnectedStatus.
  ///
  /// In en, this message translates to:
  /// **'Not connected to printer'**
  String get printerNotConnectedStatus;

  /// No description provided for @printingInProgress.
  ///
  /// In en, this message translates to:
  /// **'Printing in progress...'**
  String get printingInProgress;

  /// No description provided for @statusCode.
  ///
  /// In en, this message translates to:
  /// **'Status Code: {code}'**
  String statusCode(String code);

  /// No description provided for @emailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailIsRequired;

  /// No description provided for @verifyTokenIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Verify token is required'**
  String get verifyTokenIsRequired;

  /// No description provided for @newNotifications.
  ///
  /// In en, this message translates to:
  /// **'New Notifications'**
  String get newNotifications;

  /// No description provided for @youHaveNewNotification.
  ///
  /// In en, this message translates to:
  /// **'You have {count} new notification'**
  String youHaveNewNotification(int count);

  /// No description provided for @searchingForPrinters.
  ///
  /// In en, this message translates to:
  /// **'Searching for printers...'**
  String get searchingForPrinters;

  /// No description provided for @connectedPrinterShownAtTop.
  ///
  /// In en, this message translates to:
  /// **'Connected printer is shown at the top'**
  String get connectedPrinterShownAtTop;

  /// No description provided for @noPrintersPressSearch.
  ///
  /// In en, this message translates to:
  /// **'No printers found. Press \"Search\" to search'**
  String get noPrintersPressSearch;

  /// No description provided for @previewAndTestPrint.
  ///
  /// In en, this message translates to:
  /// **'Preview and Test Print'**
  String get previewAndTestPrint;

  /// No description provided for @connectingToPrinter.
  ///
  /// In en, this message translates to:
  /// **'Connecting to printer...'**
  String get connectingToPrinter;

  /// No description provided for @noPrinterDeviceSaved.
  ///
  /// In en, this message translates to:
  /// **'No printer device saved'**
  String get noPrinterDeviceSaved;

  /// No description provided for @printerDeviceNotFound.
  ///
  /// In en, this message translates to:
  /// **'No saved printer device found. Please go to settings and add a printer device.'**
  String get printerDeviceNotFound;

  /// No description provided for @connectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Connection Failed'**
  String get connectionFailed;

  /// No description provided for @connectionFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to printer. Please check printer settings and try again.'**
  String get connectionFailedMessage;

  /// No description provided for @bluetoothIsOff.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is Off'**
  String get bluetoothIsOff;

  /// No description provided for @bluetoothIsOffMessage.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is off. Please enable Bluetooth to connect to printer.'**
  String get bluetoothIsOffMessage;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @disconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get disconnected;

  /// No description provided for @connectedPrinter.
  ///
  /// In en, this message translates to:
  /// **'Connected Printer'**
  String get connectedPrinter;

  /// No description provided for @printers.
  ///
  /// In en, this message translates to:
  /// **'Printers'**
  String get printers;

  /// No description provided for @previewLabel.
  ///
  /// In en, this message translates to:
  /// **'Preview:'**
  String get previewLabel;

  /// No description provided for @invoiceLanguage.
  ///
  /// In en, this message translates to:
  /// **'Invoice Language'**
  String get invoiceLanguage;

  /// No description provided for @pleaseEnableBluetooth.
  ///
  /// In en, this message translates to:
  /// **'Please Enable Bluetooth'**
  String get pleaseEnableBluetooth;

  /// No description provided for @testCustomer.
  ///
  /// In en, this message translates to:
  /// **'Test Customer'**
  String get testCustomer;

  /// No description provided for @testProduct1.
  ///
  /// In en, this message translates to:
  /// **'Test Product 1'**
  String get testProduct1;

  /// No description provided for @testProduct2.
  ///
  /// In en, this message translates to:
  /// **'Test Product 2'**
  String get testProduct2;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @updateYourProfileInformation.
  ///
  /// In en, this message translates to:
  /// **'Update your profile information'**
  String get updateYourProfileInformation;

  /// No description provided for @operationDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get operationDelete;

  /// No description provided for @operationStatusUpdate.
  ///
  /// In en, this message translates to:
  /// **'Status Update'**
  String get operationStatusUpdate;

  /// No description provided for @operationBulkDelete.
  ///
  /// In en, this message translates to:
  /// **'Bulk Delete'**
  String get operationBulkDelete;

  /// No description provided for @operationBulkStatusUpdate.
  ///
  /// In en, this message translates to:
  /// **'Bulk Status Update'**
  String get operationBulkStatusUpdate;

  /// No description provided for @additionalInvoiceDetails.
  ///
  /// In en, this message translates to:
  /// **'Additional Invoice Details'**
  String get additionalInvoiceDetails;

  /// No description provided for @invoiceType.
  ///
  /// In en, this message translates to:
  /// **'Invoice Type'**
  String get invoiceType;

  /// No description provided for @sentDate.
  ///
  /// In en, this message translates to:
  /// **'Sent Date'**
  String get sentDate;

  /// No description provided for @qrCode.
  ///
  /// In en, this message translates to:
  /// **'QR- Code'**
  String get qrCode;

  /// No description provided for @qrCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'QR Code'**
  String get qrCodeLabel;

  /// No description provided for @errorMessageLabel.
  ///
  /// In en, this message translates to:
  /// **'Error Message'**
  String get errorMessageLabel;

  /// No description provided for @invoiceTypeStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard Invoice'**
  String get invoiceTypeStandard;

  /// No description provided for @invoiceTypeCreditNote.
  ///
  /// In en, this message translates to:
  /// **'Credit Note'**
  String get invoiceTypeCreditNote;

  /// No description provided for @invoiceTypeDebitNote.
  ///
  /// In en, this message translates to:
  /// **'Debit Note'**
  String get invoiceTypeDebitNote;

  /// No description provided for @invoiceTypeProforma.
  ///
  /// In en, this message translates to:
  /// **'Proforma Invoice'**
  String get invoiceTypeProforma;

  /// No description provided for @customerNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customerNamePlaceholder;

  /// No description provided for @customerEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Customer Email'**
  String get customerEmailPlaceholder;

  /// No description provided for @customerPhonePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Customer Phone'**
  String get customerPhonePlaceholder;

  /// No description provided for @customerAddressPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Customer Address'**
  String get customerAddressPlaceholder;

  /// No description provided for @customerTaxNumberPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Customer Tax Number'**
  String get customerTaxNumberPlaceholder;

  /// No description provided for @addNewItem.
  ///
  /// In en, this message translates to:
  /// **'Add New Item'**
  String get addNewItem;

  /// No description provided for @itemNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Item name is required'**
  String get itemNameRequired;

  /// No description provided for @quantityMustBeGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be greater than zero'**
  String get quantityMustBeGreaterThanZero;

  /// No description provided for @quantityExceedsAvailableStock.
  ///
  /// In en, this message translates to:
  /// **'Quantity exceeds available stock ({count})'**
  String quantityExceedsAvailableStock(int count);

  /// No description provided for @priceMustBeGreaterThanOrEqualZero.
  ///
  /// In en, this message translates to:
  /// **'Price must be greater than or equal to zero'**
  String get priceMustBeGreaterThanOrEqualZero;

  /// No description provided for @priceMustBeGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Price must be greater than zero'**
  String get priceMustBeGreaterThanZero;

  /// No description provided for @discountPercent.
  ///
  /// In en, this message translates to:
  /// **'Discount (%)'**
  String get discountPercent;

  /// No description provided for @discountRequired.
  ///
  /// In en, this message translates to:
  /// **'Discount is required'**
  String get discountRequired;

  /// No description provided for @discountMustBeGreaterThanOrEqualZero.
  ///
  /// In en, this message translates to:
  /// **'Discount must be greater than or equal to zero'**
  String get discountMustBeGreaterThanOrEqualZero;

  /// No description provided for @taxPercentRequired.
  ///
  /// In en, this message translates to:
  /// **'Tax percent is required'**
  String get taxPercentRequired;

  /// No description provided for @taxPercentMustBeGreaterThanOrEqualZero.
  ///
  /// In en, this message translates to:
  /// **'Tax percent must be greater than or equal to zero'**
  String get taxPercentMustBeGreaterThanOrEqualZero;

  /// No description provided for @saveEdit.
  ///
  /// In en, this message translates to:
  /// **'Save Edit'**
  String get saveEdit;

  /// No description provided for @itemTaxAmount.
  ///
  /// In en, this message translates to:
  /// **'Tax Amount'**
  String get itemTaxAmount;

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'Items Count:'**
  String get itemsCount;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @paymentMethodBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get paymentMethodBankTransfer;

  /// No description provided for @logoLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load company logo'**
  String get logoLoadError;

  /// No description provided for @usingDefaultLogo.
  ///
  /// In en, this message translates to:
  /// **'Using default logo'**
  String get usingDefaultLogo;

  /// No description provided for @preparingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Preparing invoice...'**
  String get preparingInvoice;

  /// No description provided for @renderingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Rendering invoice...'**
  String get renderingInvoice;

  /// No description provided for @loadingCompanyLogo.
  ///
  /// In en, this message translates to:
  /// **'Loading company logo...'**
  String get loadingCompanyLogo;

  /// No description provided for @companyLogoLoaded.
  ///
  /// In en, this message translates to:
  /// **'Company logo loaded successfully'**
  String get companyLogoLoaded;

  /// No description provided for @companyLogoFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load company logo'**
  String get companyLogoFailed;

  /// No description provided for @loadingDefaultLogo.
  ///
  /// In en, this message translates to:
  /// **'Loading default logo'**
  String get loadingDefaultLogo;

  /// No description provided for @logoLoadedFromCache.
  ///
  /// In en, this message translates to:
  /// **'Logo loaded from cache'**
  String get logoLoadedFromCache;

  /// No description provided for @retryingLogoLoad.
  ///
  /// In en, this message translates to:
  /// **'Retrying logo load...'**
  String get retryingLogoLoad;

  /// No description provided for @failedToLoadCompanyLogoUsingDefault.
  ///
  /// In en, this message translates to:
  /// **'Failed to load company logo, using default logo'**
  String get failedToLoadCompanyLogoUsingDefault;

  /// No description provided for @settingsRegionalSettings.
  ///
  /// In en, this message translates to:
  /// **'Regional Settings'**
  String get settingsRegionalSettings;

  /// No description provided for @settingsNotificationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled'**
  String get settingsNotificationsEnabled;

  /// No description provided for @settingsNotificationsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications disabled'**
  String get settingsNotificationsDisabled;

  /// No description provided for @enterCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter current password'**
  String get enterCurrentPassword;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// No description provided for @settingsPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get settingsPasswordMinLength;

  /// No description provided for @settingsPasswordRequirements.
  ///
  /// In en, this message translates to:
  /// **'Password Requirements'**
  String get settingsPasswordRequirements;

  /// No description provided for @settingsPasswordUppercase.
  ///
  /// In en, this message translates to:
  /// **'At least one uppercase letter'**
  String get settingsPasswordUppercase;

  /// No description provided for @settingsPasswordNumber.
  ///
  /// In en, this message translates to:
  /// **'At least one number'**
  String get settingsPasswordNumber;

  /// No description provided for @settingsPasswordSpecial.
  ///
  /// In en, this message translates to:
  /// **'At least one special character'**
  String get settingsPasswordSpecial;

  /// No description provided for @settingsPasswordWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get settingsPasswordWeak;

  /// No description provided for @settingsPasswordMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get settingsPasswordMedium;

  /// No description provided for @settingsPasswordStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get settingsPasswordStrong;

  /// No description provided for @settingsSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Changes saved successfully'**
  String get settingsSaveChanges;

  /// No description provided for @settingsBasicInfo.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get settingsBasicInfo;

  /// No description provided for @settingsCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get settingsCompanyName;

  /// No description provided for @pleaseEnterCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Please enter company name'**
  String get pleaseEnterCompanyName;

  /// No description provided for @settingsPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get settingsPhone;

  /// No description provided for @settingsAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get settingsAddress;

  /// No description provided for @settingsUserActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get settingsUserActive;

  /// No description provided for @settingsUserInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get settingsUserInactive;

  /// No description provided for @settingsMerchantCode.
  ///
  /// In en, this message translates to:
  /// **'Merchant Code'**
  String get settingsMerchantCode;

  /// No description provided for @settingsInvoiceTypeStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get settingsInvoiceTypeStandard;

  /// No description provided for @settingsInvoiceTypeSimplified.
  ///
  /// In en, this message translates to:
  /// **'Simplified'**
  String get settingsInvoiceTypeSimplified;

  /// No description provided for @settingsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settingsCancel;

  /// No description provided for @settingsAccountSecurity.
  ///
  /// In en, this message translates to:
  /// **'Account Security'**
  String get settingsAccountSecurity;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get settingsAccount;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// No description provided for @settingsChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePassword;

  /// No description provided for @settingsChangePasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Update your password to keep your account secure'**
  String get settingsChangePasswordDesc;

  /// No description provided for @settingsUsersManagement.
  ///
  /// In en, this message translates to:
  /// **'Users Management'**
  String get settingsUsersManagement;

  /// No description provided for @settingsPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get settingsPersonalInfo;

  /// No description provided for @settingsWhatHappens.
  ///
  /// In en, this message translates to:
  /// **'What happens when you delete your account?'**
  String get settingsWhatHappens;

  /// No description provided for @settingsAccountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Your account will be permanently deleted'**
  String get settingsAccountDeleted;

  /// No description provided for @settingsDataDeleted.
  ///
  /// In en, this message translates to:
  /// **'All your data will be permanently deleted'**
  String get settingsDataDeleted;

  /// No description provided for @settingsCannotUndo.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone'**
  String get settingsCannotUndo;

  /// No description provided for @settingsTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get settingsTakePhoto;

  /// No description provided for @settingsChooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get settingsChooseFromGallery;

  /// No description provided for @settingsRemovePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove Photo'**
  String get settingsRemovePhoto;

  /// No description provided for @companyLogo.
  ///
  /// In en, this message translates to:
  /// **'Company Logo'**
  String get companyLogo;

  /// No description provided for @settingsHardware.
  ///
  /// In en, this message translates to:
  /// **'Hardware'**
  String get settingsHardware;

  /// No description provided for @settingsPrinter.
  ///
  /// In en, this message translates to:
  /// **'Printer'**
  String get settingsPrinter;

  /// No description provided for @settingsManage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get settingsManage;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// No description provided for @settingsUnsavedChanges.
  ///
  /// In en, this message translates to:
  /// **'Unsaved Changes'**
  String get settingsUnsavedChanges;

  /// No description provided for @settingsDiscardChanges.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes. Are you sure you want to discard them?'**
  String get settingsDiscardChanges;

  /// No description provided for @settingsDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get settingsDiscard;

  /// No description provided for @pleaseEnterMerchantCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter merchant code'**
  String get pleaseEnterMerchantCode;

  /// No description provided for @pleaseSelectInvoiceType.
  ///
  /// In en, this message translates to:
  /// **'Please select invoice type'**
  String get pleaseSelectInvoiceType;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @aboutUsDescription.
  ///
  /// In en, this message translates to:
  /// **'Invotek is a comprehensive invoice management system designed to help businesses manage their invoicing needs efficiently.'**
  String get aboutUsDescription;

  /// No description provided for @appInformation.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInformation;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'App Name'**
  String get appName;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @buildNumber.
  ///
  /// In en, this message translates to:
  /// **'Build Number'**
  String get buildNumber;

  /// No description provided for @packageName.
  ///
  /// In en, this message translates to:
  /// **'Package Name'**
  String get packageName;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'Copyright'**
  String get copyright;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareApp;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contactForm.
  ///
  /// In en, this message translates to:
  /// **'Contact Form'**
  String get contactForm;

  /// No description provided for @subjectRequired.
  ///
  /// In en, this message translates to:
  /// **'Subject is required'**
  String get subjectRequired;

  /// No description provided for @messageRequired.
  ///
  /// In en, this message translates to:
  /// **'Message is required'**
  String get messageRequired;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @quickContact.
  ///
  /// In en, this message translates to:
  /// **'Quick Contact'**
  String get quickContact;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// No description provided for @contactViaWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Contact us via WhatsApp'**
  String get contactViaWhatsApp;

  /// No description provided for @emailOpened.
  ///
  /// In en, this message translates to:
  /// **'Email app opened'**
  String get emailOpened;

  /// No description provided for @cannotOpenEmail.
  ///
  /// In en, this message translates to:
  /// **'Cannot open email app'**
  String get cannotOpenEmail;

  /// No description provided for @cannotOpenPhone.
  ///
  /// In en, this message translates to:
  /// **'Cannot open phone app'**
  String get cannotOpenPhone;

  /// No description provided for @cannotOpenWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Cannot open WhatsApp'**
  String get cannotOpenWhatsApp;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: {date}'**
  String privacyPolicyLastUpdated(Object date);

  /// No description provided for @privacyPolicyLastUpdatedPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Last updated: January 2024'**
  String get privacyPolicyLastUpdatedPlaceholder;

  /// No description provided for @privacyPolicyIntroductionTitle.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get privacyPolicyIntroductionTitle;

  /// No description provided for @privacyPolicyIntroductionContent.
  ///
  /// In en, this message translates to:
  /// **'This Privacy Policy describes how Invotek collects, uses, and protects your personal information when you use our application.'**
  String get privacyPolicyIntroductionContent;

  /// No description provided for @privacyPolicyDataCollectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Collection'**
  String get privacyPolicyDataCollectionTitle;

  /// No description provided for @privacyPolicyDataCollectionContent.
  ///
  /// In en, this message translates to:
  /// **'We collect information that you provide directly to us, such as when you create an account, make a purchase, or contact us for support.'**
  String get privacyPolicyDataCollectionContent;

  /// No description provided for @privacyPolicyDataUsageTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Usage'**
  String get privacyPolicyDataUsageTitle;

  /// No description provided for @privacyPolicyDataUsageContent.
  ///
  /// In en, this message translates to:
  /// **'We use the information we collect to provide, maintain, and improve our services, process transactions, and communicate with you.'**
  String get privacyPolicyDataUsageContent;

  /// No description provided for @privacyPolicyDataSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get privacyPolicyDataSecurityTitle;

  /// No description provided for @privacyPolicyDataSecurityContent.
  ///
  /// In en, this message translates to:
  /// **'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.'**
  String get privacyPolicyDataSecurityContent;

  /// No description provided for @privacyPolicyUserRightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Rights'**
  String get privacyPolicyUserRightsTitle;

  /// No description provided for @privacyPolicyUserRightsContent.
  ///
  /// In en, this message translates to:
  /// **'You have the right to access, update, or delete your personal information at any time through your account settings.'**
  String get privacyPolicyUserRightsContent;

  /// No description provided for @privacyPolicyContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get privacyPolicyContactTitle;

  /// No description provided for @privacyPolicyContactContent.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about this Privacy Policy, please contact us at support@invotik.com.'**
  String get privacyPolicyContactContent;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @searchFAQs.
  ///
  /// In en, this message translates to:
  /// **'Search FAQs'**
  String get searchFAQs;

  /// No description provided for @noFAQsFound.
  ///
  /// In en, this message translates to:
  /// **'No FAQs found'**
  String get noFAQsFound;

  /// No description provided for @tryDifferentSearchTerm.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term'**
  String get tryDifferentSearchTerm;

  /// No description provided for @faqQuestion1.
  ///
  /// In en, this message translates to:
  /// **'How do I create an invoice?'**
  String get faqQuestion1;

  /// No description provided for @faqAnswer1.
  ///
  /// In en, this message translates to:
  /// **'To create an invoice, go to the Invoices section and tap the \'+\' button. Fill in the required information and save.'**
  String get faqAnswer1;

  /// No description provided for @faqQuestion2.
  ///
  /// In en, this message translates to:
  /// **'How do I change my password?'**
  String get faqQuestion2;

  /// No description provided for @faqAnswer2.
  ///
  /// In en, this message translates to:
  /// **'Go to Settings > Account Settings > Change Password. Enter your current password and new password.'**
  String get faqAnswer2;

  /// No description provided for @faqQuestion3.
  ///
  /// In en, this message translates to:
  /// **'How do I add a customer?'**
  String get faqQuestion3;

  /// No description provided for @faqAnswer3.
  ///
  /// In en, this message translates to:
  /// **'Go to the Customers section and tap the \'+\' button. Fill in the customer information and save.'**
  String get faqAnswer3;

  /// No description provided for @faqQuestion4.
  ///
  /// In en, this message translates to:
  /// **'How do I print an invoice?'**
  String get faqQuestion4;

  /// No description provided for @faqAnswer4.
  ///
  /// In en, this message translates to:
  /// **'Open the invoice details and tap the print button. Select your printer and print.'**
  String get faqAnswer4;

  /// No description provided for @faqQuestion5.
  ///
  /// In en, this message translates to:
  /// **'How do I contact support?'**
  String get faqQuestion5;

  /// No description provided for @faqAnswer5.
  ///
  /// In en, this message translates to:
  /// **'You can contact support through the Contact Us screen in Settings or email us at support@invotik.com.'**
  String get faqAnswer5;

  /// No description provided for @languageSettings.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettings;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @arabicDescription.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabicDescription;

  /// No description provided for @englishDescription.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishDescription;

  /// No description provided for @languageChangeNote.
  ///
  /// In en, this message translates to:
  /// **'Changing the language will restart the app to apply the changes.'**
  String get languageChangeNote;

  /// No description provided for @notificationsSettings.
  ///
  /// In en, this message translates to:
  /// **'Notifications Settings'**
  String get notificationsSettings;

  /// No description provided for @notificationTypes.
  ///
  /// In en, this message translates to:
  /// **'Notification Types'**
  String get notificationTypes;

  /// No description provided for @generalNotifications.
  ///
  /// In en, this message translates to:
  /// **'General Notifications'**
  String get generalNotifications;

  /// No description provided for @generalNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive general app notifications'**
  String get generalNotificationsDescription;

  /// No description provided for @invoiceNotifications.
  ///
  /// In en, this message translates to:
  /// **'Invoice Notifications'**
  String get invoiceNotifications;

  /// No description provided for @invoiceNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive notifications about invoices'**
  String get invoiceNotificationsDescription;

  /// No description provided for @paymentNotifications.
  ///
  /// In en, this message translates to:
  /// **'Payment Notifications'**
  String get paymentNotifications;

  /// No description provided for @paymentNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive notifications about payments'**
  String get paymentNotificationsDescription;

  /// No description provided for @systemNotifications.
  ///
  /// In en, this message translates to:
  /// **'System Notifications'**
  String get systemNotifications;

  /// No description provided for @systemNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive system and update notifications'**
  String get systemNotificationsDescription;

  /// No description provided for @notificationsSettingsNote.
  ///
  /// In en, this message translates to:
  /// **'You can close and open the general notifications.'**
  String get notificationsSettingsNote;

  /// No description provided for @dataStorage.
  ///
  /// In en, this message translates to:
  /// **'Data & Storage'**
  String get dataStorage;

  /// No description provided for @storageInformation.
  ///
  /// In en, this message translates to:
  /// **'Storage Information'**
  String get storageInformation;

  /// No description provided for @cacheSize.
  ///
  /// In en, this message translates to:
  /// **'Cache Size'**
  String get cacheSize;

  /// No description provided for @dataSize.
  ///
  /// In en, this message translates to:
  /// **'Data Size'**
  String get dataSize;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get clearCache;

  /// No description provided for @clearCacheDescription.
  ///
  /// In en, this message translates to:
  /// **'Clear temporary files and cached data to free up storage space.'**
  String get clearCacheDescription;

  /// No description provided for @clearCacheConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear the cache? This will remove temporary files but not your personal data.'**
  String get clearCacheConfirmation;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @cacheClearedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared successfully'**
  String get cacheClearedSuccessfully;

  /// No description provided for @errorClearingCache.
  ///
  /// In en, this message translates to:
  /// **'Error clearing cache'**
  String get errorClearingCache;

  /// No description provided for @clearAllData.
  ///
  /// In en, this message translates to:
  /// **'Clear All Data'**
  String get clearAllData;

  /// No description provided for @clearAllDataConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all data? This will remove all cached files and preferences. This action cannot be undone.'**
  String get clearAllDataConfirmation;

  /// No description provided for @clearAllDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Warning: This will delete all cached data and preferences. Your account data will remain safe.'**
  String get clearAllDataDescription;

  /// No description provided for @allDataClearedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'All data cleared successfully'**
  String get allDataClearedSuccessfully;

  /// No description provided for @errorClearingData.
  ///
  /// In en, this message translates to:
  /// **'Error clearing data'**
  String get errorClearingData;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @returnInvoice.
  ///
  /// In en, this message translates to:
  /// **'Return Invoice'**
  String get returnInvoice;

  /// No description provided for @creditInvoice.
  ///
  /// In en, this message translates to:
  /// **'Returned Invoice'**
  String get creditInvoice;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @createCreditInvoice.
  ///
  /// In en, this message translates to:
  /// **'Create Returned Invoice'**
  String get createCreditInvoice;

  /// No description provided for @basicInfo.
  ///
  /// In en, this message translates to:
  /// **'Basic Info'**
  String get basicInfo;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @returnReason.
  ///
  /// In en, this message translates to:
  /// **'Return Reason'**
  String get returnReason;

  /// No description provided for @enterReasonForReturn.
  ///
  /// In en, this message translates to:
  /// **'Enter reason for return'**
  String get enterReasonForReturn;

  /// No description provided for @returnedInvoice.
  ///
  /// In en, this message translates to:
  /// **'Returned Invoice'**
  String get returnedInvoice;

  /// No description provided for @invoiceAlreadyHasCreditInvoice.
  ///
  /// In en, this message translates to:
  /// **'This invoice already has a returned invoice associated with it'**
  String get invoiceAlreadyHasCreditInvoice;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
