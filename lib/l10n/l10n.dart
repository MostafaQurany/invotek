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
  /// **'Please check the entered data'**
  String get validationError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network connection error. Please check your connection and try again.'**
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
  /// **'Users and Permissions'**
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

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

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

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get searchProducts;

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

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get noProductsFound;

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

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

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

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @sku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get sku;

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

  /// No description provided for @noCustomersFound.
  ///
  /// In en, this message translates to:
  /// **'No customers found'**
  String get noCustomersFound;

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
  /// **'Customer Information'**
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

  /// No description provided for @customerCommercialRegister.
  ///
  /// In en, this message translates to:
  /// **'Commercial Register Number'**
  String get customerCommercialRegister;

  /// No description provided for @customerCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get customerCity;

  /// No description provided for @customerRegion.
  ///
  /// In en, this message translates to:
  /// **'Region/Province'**
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
  String customerCreatedSuccessfully(Object name);

  /// No description provided for @customerUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer \"{name}\" updated successfully'**
  String customerUpdatedSuccessfully(Object name);

  /// No description provided for @customerDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer deleted successfully'**
  String get customerDeletedSuccessfully;

  /// No description provided for @confirmDeleteCustomer.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDeleteCustomer;

  /// No description provided for @confirmDeleteCustomerMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete customer \"{name}\"?'**
  String confirmDeleteCustomerMessage(Object name);

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

  /// No description provided for @addNewCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add New Customer'**
  String get addNewCustomer;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorOccurred(Object error);

  /// No description provided for @searchCustomers.
  ///
  /// In en, this message translates to:
  /// **'Search customers...'**
  String get searchCustomers;

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

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

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
  /// **'Users and Permissions Management'**
  String get usersManagement;

  /// No description provided for @customersManagement.
  ///
  /// In en, this message translates to:
  /// **'Customers Management'**
  String get customersManagement;

  /// No description provided for @productsCategoriesManagement.
  ///
  /// In en, this message translates to:
  /// **'Products and Categories Management'**
  String get productsCategoriesManagement;

  /// No description provided for @expensesManagement.
  ///
  /// In en, this message translates to:
  /// **'Expenses & Categories Management'**
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

  /// No description provided for @enterCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Enter company name'**
  String get enterCompanyName;

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

  /// No description provided for @errorLoadingProducts.
  ///
  /// In en, this message translates to:
  /// **'Error loading products'**
  String get errorLoadingProducts;

  /// No description provided for @errorLoadingProduct.
  ///
  /// In en, this message translates to:
  /// **'Error loading product data'**
  String get errorLoadingProduct;

  /// No description provided for @errorCreatingProduct.
  ///
  /// In en, this message translates to:
  /// **'Error creating product'**
  String get errorCreatingProduct;

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

  /// No description provided for @passwordChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangedSuccessfully;

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

  /// No description provided for @enterProductName.
  ///
  /// In en, this message translates to:
  /// **'Enter product name'**
  String get enterProductName;

  /// No description provided for @enterProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter product description'**
  String get enterProductDescription;

  /// No description provided for @enterQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter quantity'**
  String get enterQuantity;

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

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter client address'**
  String get enterAddress;

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
  /// **'SAR 15,420'**
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
  /// **'Available'**
  String get available;

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

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @companyInformation.
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get companyInformation;

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
