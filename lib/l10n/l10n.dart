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
  /// **'Invalid email format'**
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
  /// **'Confirm password is required'**
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
  /// **'Unknown error occurred'**
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
  /// **'Tax invoices'**
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
  /// **'العربية'**
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
  /// **'Add New User'**
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
  /// **'Add New Client'**
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
  /// **'Add New Expense'**
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
  /// **'Create New Invoice'**
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
  String deleteUserConfirmation(Object name);

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
