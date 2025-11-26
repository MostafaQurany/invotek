// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `WELCOME!`
  String get welcome {
    return Intl.message('WELCOME!', name: 'welcome', desc: '', args: []);
  }

  /// `TekPart`
  String get tekpart {
    return Intl.message('TekPart', name: 'tekpart', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get emailInvalid {
    return Intl.message(
      'Invalid email',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordShort {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain uppercase, lowercase and number`
  String get passwordWeak {
    return Intl.message(
      'Password must contain uppercase, lowercase and number',
      name: 'passwordWeak',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation is required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Password confirmation is required',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 2 characters`
  String get nameShort {
    return Intl.message(
      'Name must be at least 2 characters',
      name: 'nameShort',
      desc: '',
      args: [],
    );
  }

  /// `Name must contain only letters`
  String get nameInvalid {
    return Intl.message(
      'Name must contain only letters',
      name: 'nameInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Data validation error`
  String get validationError {
    return Intl.message(
      'Data validation error',
      name: 'validationError',
      desc: '',
      args: [],
    );
  }

  /// `Network error`
  String get networkError {
    return Intl.message(
      'Network error',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Server error. Please try again later.`
  String get serverError {
    return Intl.message(
      'Server error. Please try again later.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Login failed. Please check your email and password.`
  String get authError {
    return Intl.message(
      'Login failed. Please check your email and password.',
      name: 'authError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again.`
  String get unknownError {
    return Intl.message(
      'An unexpected error occurred. Please try again.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Local storage error`
  String get cacheError {
    return Intl.message(
      'Local storage error',
      name: 'cacheError',
      desc: '',
      args: [],
    );
  }

  /// `Request timeout`
  String get timeoutError {
    return Intl.message(
      'Request timeout',
      name: 'timeoutError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access`
  String get unauthorizedError {
    return Intl.message(
      'Unauthorized access',
      name: 'unauthorizedError',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Error loading customers`
  String get customersLoadError {
    return Intl.message(
      'Error loading customers',
      name: 'customersLoadError',
      desc: '',
      args: [],
    );
  }

  /// `Network error - Customers`
  String get customersNetworkError {
    return Intl.message(
      'Network error - Customers',
      name: 'customersNetworkError',
      desc: '',
      args: [],
    );
  }

  /// `Validation error - Customers`
  String get customersValidationError {
    return Intl.message(
      'Validation error - Customers',
      name: 'customersValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error - Customers`
  String get customersUnknownError {
    return Intl.message(
      'Unknown error - Customers',
      name: 'customersUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Timeout error - Customers`
  String get customersTimeoutError {
    return Intl.message(
      'Timeout error - Customers',
      name: 'customersTimeoutError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized error - Customers`
  String get customersUnauthorizedError {
    return Intl.message(
      'Unauthorized error - Customers',
      name: 'customersUnauthorizedError',
      desc: '',
      args: [],
    );
  }

  /// `Cache error - Customers`
  String get customersCacheError {
    return Intl.message(
      'Cache error - Customers',
      name: 'customersCacheError',
      desc: '',
      args: [],
    );
  }

  /// `Error loading products`
  String get productsLoadError {
    return Intl.message(
      'Error loading products',
      name: 'productsLoadError',
      desc: '',
      args: [],
    );
  }

  /// `Network error - Products`
  String get productsNetworkError {
    return Intl.message(
      'Network error - Products',
      name: 'productsNetworkError',
      desc: '',
      args: [],
    );
  }

  /// `Validation error - Products`
  String get productsValidationError {
    return Intl.message(
      'Validation error - Products',
      name: 'productsValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error - Products`
  String get productsUnknownError {
    return Intl.message(
      'Unknown error - Products',
      name: 'productsUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Timeout error - Products`
  String get productsTimeoutError {
    return Intl.message(
      'Timeout error - Products',
      name: 'productsTimeoutError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized error - Products`
  String get productsUnauthorizedError {
    return Intl.message(
      'Unauthorized error - Products',
      name: 'productsUnauthorizedError',
      desc: '',
      args: [],
    );
  }

  /// `Cache error - Products`
  String get productsCacheError {
    return Intl.message(
      'Cache error - Products',
      name: 'productsCacheError',
      desc: '',
      args: [],
    );
  }

  /// `Error loading expenses`
  String get expensesLoadError {
    return Intl.message(
      'Error loading expenses',
      name: 'expensesLoadError',
      desc: '',
      args: [],
    );
  }

  /// `Network error - Expenses`
  String get expensesNetworkError {
    return Intl.message(
      'Network error - Expenses',
      name: 'expensesNetworkError',
      desc: '',
      args: [],
    );
  }

  /// `Validation error - Expenses`
  String get expensesValidationError {
    return Intl.message(
      'Validation error - Expenses',
      name: 'expensesValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error - Expenses`
  String get expensesUnknownError {
    return Intl.message(
      'Unknown error - Expenses',
      name: 'expensesUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Timeout error - Expenses`
  String get expensesTimeoutError {
    return Intl.message(
      'Timeout error - Expenses',
      name: 'expensesTimeoutError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized error - Expenses`
  String get expensesUnauthorizedError {
    return Intl.message(
      'Unauthorized error - Expenses',
      name: 'expensesUnauthorizedError',
      desc: '',
      args: [],
    );
  }

  /// `Cache error - Expenses`
  String get expensesCacheError {
    return Intl.message(
      'Cache error - Expenses',
      name: 'expensesCacheError',
      desc: '',
      args: [],
    );
  }

  /// `Error loading invoices`
  String get invoicesLoadError {
    return Intl.message(
      'Error loading invoices',
      name: 'invoicesLoadError',
      desc: '',
      args: [],
    );
  }

  /// `Network error - Invoices`
  String get invoicesNetworkError {
    return Intl.message(
      'Network error - Invoices',
      name: 'invoicesNetworkError',
      desc: '',
      args: [],
    );
  }

  /// `Validation error - Invoices`
  String get invoicesValidationError {
    return Intl.message(
      'Validation error - Invoices',
      name: 'invoicesValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error - Invoices`
  String get invoicesUnknownError {
    return Intl.message(
      'Unknown error - Invoices',
      name: 'invoicesUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Timeout error - Invoices`
  String get invoicesTimeoutError {
    return Intl.message(
      'Timeout error - Invoices',
      name: 'invoicesTimeoutError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized error - Invoices`
  String get invoicesUnauthorizedError {
    return Intl.message(
      'Unauthorized error - Invoices',
      name: 'invoicesUnauthorizedError',
      desc: '',
      args: [],
    );
  }

  /// `Cache error - Invoices`
  String get invoicesCacheError {
    return Intl.message(
      'Cache error - Invoices',
      name: 'invoicesCacheError',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Logging in...`
  String get loggingIn {
    return Intl.message('Logging in...', name: 'loggingIn', desc: '', args: []);
  }

  /// `Registering...`
  String get registering {
    return Intl.message(
      'Registering...',
      name: 'registering',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Login successful`
  String get loginSuccess {
    return Intl.message(
      'Login successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful! Please login.`
  String get registerSuccess {
    return Intl.message(
      'Registration successful! Please login.',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get usersPermissions {
    return Intl.message(
      'Permissions',
      name: 'usersPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Control of clients and permissions`
  String get usersPermissionsDesc {
    return Intl.message(
      'Control of clients and permissions',
      name: 'usersPermissionsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Clients and Products`
  String get clientsProducts {
    return Intl.message(
      'Clients and Products',
      name: 'clientsProducts',
      desc: '',
      args: [],
    );
  }

  /// `Control of clients and products`
  String get clientsProductsDesc {
    return Intl.message(
      'Control of clients and products',
      name: 'clientsProductsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expenses {
    return Intl.message('Expenses', name: 'expenses', desc: '', args: []);
  }

  /// `Expense categories & Expense management`
  String get expensesDesc {
    return Intl.message(
      'Expense categories & Expense management',
      name: 'expensesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Tax Invoices`
  String get taxInvoices {
    return Intl.message(
      'Tax Invoices',
      name: 'taxInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Unposted invoices & Postpaid invoices & Returned invoices & Create a new invoice`
  String get taxInvoicesDesc {
    return Intl.message(
      'Unposted invoices & Postpaid invoices & Returned invoices & Create a new invoice',
      name: 'taxInvoicesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccessfully {
    return Intl.message(
      'Login successful',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful! Please login.`
  String get rejesterSuccessfully {
    return Intl.message(
      'Registration successful! Please login.',
      name: 'rejesterSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get loginLoadin {
    return Intl.message(
      'Logging in...',
      name: 'loginLoadin',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get rejester {
    return Intl.message('Login', name: 'rejester', desc: '', args: []);
  }

  /// `Logging in...`
  String get rejesterLoading {
    return Intl.message(
      'Logging in...',
      name: 'rejesterLoading',
      desc: '',
      args: [],
    );
  }

  /// `Have an account? Login`
  String get haveAccountLogin {
    return Intl.message(
      'Have an account? Login',
      name: 'haveAccountLogin',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? Create new account`
  String get noHaveAccountRejester {
    return Intl.message(
      'Don\'t have an account? Create new account',
      name: 'noHaveAccountRejester',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Not a member?`
  String get notAMember {
    return Intl.message(
      'Not a member?',
      name: 'notAMember',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAnAccount {
    return Intl.message(
      'Create an account',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Invotek`
  String get onboardingWelcome {
    return Intl.message(
      'Welcome to Invotek',
      name: 'onboardingWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Integrated system for electronic invoice management with integration with the Jordanian national billing system`
  String get onboardingWelcomeDesc {
    return Intl.message(
      'Integrated system for electronic invoice management with integration with the Jordanian national billing system',
      name: 'onboardingWelcomeDesc',
      desc: '',
      args: [],
    );
  }

  /// `User and Permission Management`
  String get onboardingUsers {
    return Intl.message(
      'User and Permission Management',
      name: 'onboardingUsers',
      desc: '',
      args: [],
    );
  }

  /// `Complete control over users and their permissions within the company`
  String get onboardingUsersDesc {
    return Intl.message(
      'Complete control over users and their permissions within the company',
      name: 'onboardingUsersDesc',
      desc: '',
      args: [],
    );
  }

  /// `Client and Product Management`
  String get onboardingClients {
    return Intl.message(
      'Client and Product Management',
      name: 'onboardingClients',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive management of clients and products with inventory tracking`
  String get onboardingClientsDesc {
    return Intl.message(
      'Comprehensive management of clients and products with inventory tracking',
      name: 'onboardingClientsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Expense Management`
  String get onboardingExpenses {
    return Intl.message(
      'Expense Management',
      name: 'onboardingExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Track and manage expenses with multiple categories`
  String get onboardingExpensesDesc {
    return Intl.message(
      'Track and manage expenses with multiple categories',
      name: 'onboardingExpensesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Tax Invoices`
  String get onboardingInvoices {
    return Intl.message(
      'Tax Invoices',
      name: 'onboardingInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Create and manage tax invoices with integration with the national invoice system`
  String get onboardingInvoicesDesc {
    return Intl.message(
      'Create and manage tax invoices with integration with the national invoice system',
      name: 'onboardingInvoicesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `Choose the feature you want to manage`
  String get chooseFeature {
    return Intl.message(
      'Choose the feature you want to manage',
      name: 'chooseFeature',
      desc: '',
      args: [],
    );
  }

  /// `Users and Permissions`
  String get usersPermissionsTitle {
    return Intl.message(
      'Users and Permissions',
      name: 'usersPermissionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Clients and Products`
  String get clientsProductsTitle {
    return Intl.message(
      'Clients and Products',
      name: 'clientsProductsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expensesTitle {
    return Intl.message('Expenses', name: 'expensesTitle', desc: '', args: []);
  }

  /// `Tax Invoices`
  String get taxInvoicesTitle {
    return Intl.message(
      'Tax Invoices',
      name: 'taxInvoicesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Users List`
  String get usersList {
    return Intl.message('Users List', name: 'usersList', desc: '', args: []);
  }

  /// `Add User`
  String get addUser {
    return Intl.message('Add User', name: 'addUser', desc: '', args: []);
  }

  /// `Manage Permissions`
  String get managePermissions {
    return Intl.message(
      'Manage Permissions',
      name: 'managePermissions',
      desc: '',
      args: [],
    );
  }

  /// `Clients List`
  String get clientsList {
    return Intl.message(
      'Clients List',
      name: 'clientsList',
      desc: '',
      args: [],
    );
  }

  /// `Add Client`
  String get addClient {
    return Intl.message('Add Client', name: 'addClient', desc: '', args: []);
  }

  /// `Manage Products`
  String get manageProducts {
    return Intl.message(
      'Manage Products',
      name: 'manageProducts',
      desc: '',
      args: [],
    );
  }

  /// `Product Categories`
  String get productCategories {
    return Intl.message(
      'Product Categories',
      name: 'productCategories',
      desc: '',
      args: [],
    );
  }

  /// `Expenses List`
  String get expensesList {
    return Intl.message(
      'Expenses List',
      name: 'expensesList',
      desc: '',
      args: [],
    );
  }

  /// `Add Expense`
  String get addExpense {
    return Intl.message('Add Expense', name: 'addExpense', desc: '', args: []);
  }

  /// `Expense Categories`
  String get expenseCategories {
    return Intl.message(
      'Expense Categories',
      name: 'expenseCategories',
      desc: '',
      args: [],
    );
  }

  /// `Invoices List`
  String get invoicesList {
    return Intl.message(
      'Invoices List',
      name: 'invoicesList',
      desc: '',
      args: [],
    );
  }

  /// `Create Invoice`
  String get createInvoice {
    return Intl.message(
      'Create Invoice',
      name: 'createInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Posted Invoices`
  String get postedInvoices {
    return Intl.message(
      'Posted Invoices',
      name: 'postedInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Returned Invoices`
  String get returnedInvoices {
    return Intl.message(
      'Returned Invoices',
      name: 'returnedInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Sales Report`
  String get salesReport {
    return Intl.message(
      'Sales Report',
      name: 'salesReport',
      desc: '',
      args: [],
    );
  }

  /// `Expenses Report`
  String get expensesReport {
    return Intl.message(
      'Expenses Report',
      name: 'expensesReport',
      desc: '',
      args: [],
    );
  }

  /// `New Expense`
  String get newExpense {
    return Intl.message('New Expense', name: 'newExpense', desc: '', args: []);
  }

  /// `Track your business expenses`
  String get trackYourBusinessExpenses {
    return Intl.message(
      'Track your business expenses',
      name: 'trackYourBusinessExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get basicInformation {
    return Intl.message(
      'Basic Information',
      name: 'basicInformation',
      desc: '',
      args: [],
    );
  }

  /// `Expense Title`
  String get expenseTitle {
    return Intl.message(
      'Expense Title',
      name: 'expenseTitle',
      desc: '',
      args: [],
    );
  }

  /// `e.g., Office supplies, Travel expenses`
  String get expenseTitleHint {
    return Intl.message(
      'e.g., Office supplies, Travel expenses',
      name: 'expenseTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Title is required`
  String get titleIsRequired {
    return Intl.message(
      'Title is required',
      name: 'titleIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Add more details about this expense`
  String get descriptionHint {
    return Intl.message(
      'Add more details about this expense',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Financial Details`
  String get financialDetails {
    return Intl.message(
      'Financial Details',
      name: 'financialDetails',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `0.00`
  String get amountHint {
    return Intl.message('0.00', name: 'amountHint', desc: '', args: []);
  }

  /// `Enter the total amount spent including tax`
  String get amountHelperText {
    return Intl.message(
      'Enter the total amount spent including tax',
      name: 'amountHelperText',
      desc: '',
      args: [],
    );
  }

  /// `Amount is required`
  String get amountIsRequired {
    return Intl.message(
      'Amount is required',
      name: 'amountIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid amount`
  String get pleaseEnterValidAmount {
    return Intl.message(
      'Please enter a valid amount',
      name: 'pleaseEnterValidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Additional Information`
  String get additionalInformation {
    return Intl.message(
      'Additional Information',
      name: 'additionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Reference Number`
  String get referenceNumber {
    return Intl.message(
      'Reference Number',
      name: 'referenceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invoice number, receipt ID, etc.`
  String get referenceNumberHint {
    return Intl.message(
      'Invoice number, receipt ID, etc.',
      name: 'referenceNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Any additional information or context`
  String get notesHint {
    return Intl.message(
      'Any additional information or context',
      name: 'notesHint',
      desc: '',
      args: [],
    );
  }

  /// `Create Expense`
  String get createExpense {
    return Intl.message(
      'Create Expense',
      name: 'createExpense',
      desc: '',
      args: [],
    );
  }

  /// `Expense created successfully!`
  String get expenseCreatedSuccessfully {
    return Intl.message(
      'Expense created successfully!',
      name: 'expenseCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please select a category`
  String get pleaseSelectCategory {
    return Intl.message(
      'Please select a category',
      name: 'pleaseSelectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Complete required fields`
  String get completeRequiredFields {
    return Intl.message(
      'Complete required fields',
      name: 'completeRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `Customers Report`
  String get customersReport {
    return Intl.message(
      'Customers Report',
      name: 'customersReport',
      desc: '',
      args: [],
    );
  }

  /// `Products Report`
  String get productsReport {
    return Intl.message(
      'Products Report',
      name: 'productsReport',
      desc: '',
      args: [],
    );
  }

  /// `Company Settings`
  String get companySettings {
    return Intl.message(
      'Company Settings',
      name: 'companySettings',
      desc: '',
      args: [],
    );
  }

  /// `System Settings`
  String get systemSettings {
    return Intl.message(
      'System Settings',
      name: 'systemSettings',
      desc: '',
      args: [],
    );
  }

  /// `Backup`
  String get backup {
    return Intl.message('Backup', name: 'backup', desc: '', args: []);
  }

  /// `User added successfully`
  String get userAddedSuccessfully {
    return Intl.message(
      'User added successfully',
      name: 'userAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error creating user: $e`
  String get errorCreatingUser {
    return Intl.message(
      'Error creating user: \$e',
      name: 'errorCreatingUser',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Users and Permissions Management`
  String get usersAndPermissionsManagement {
    return Intl.message(
      'Users and Permissions Management',
      name: 'usersAndPermissionsManagement',
      desc: '',
      args: [],
    );
  }

  /// `View and manage users and their permissions`
  String get usersAndPermissionsDescription {
    return Intl.message(
      'View and manage users and their permissions',
      name: 'usersAndPermissionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search for user...`
  String get searchForUser {
    return Intl.message(
      'Search for user...',
      name: 'searchForUser',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Role`
  String get role {
    return Intl.message('Role', name: 'role', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Inactive`
  String get inactive {
    return Intl.message('Inactive', name: 'inactive', desc: '', args: []);
  }

  /// `Admin`
  String get admin {
    return Intl.message('Admin', name: 'admin', desc: '', args: []);
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Manager`
  String get manager {
    return Intl.message('Manager', name: 'manager', desc: '', args: []);
  }

  /// `No users found`
  String get noUsersFound {
    return Intl.message(
      'No users found',
      name: 'noUsersFound',
      desc: '',
      args: [],
    );
  }

  /// `Press the add button to create a new user`
  String get addNewUserMessage {
    return Intl.message(
      'Press the add button to create a new user',
      name: 'addNewUserMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete Confirmation`
  String get deleteConfirmation {
    return Intl.message(
      'Delete Confirmation',
      name: 'deleteConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete user {name}?`
  String deleteUserConfirmation(String name) {
    return Intl.message(
      'Are you sure you want to delete user $name?',
      name: 'deleteUserConfirmation',
      desc: '',
      args: [name],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Fill the form below to add a new user to the system`
  String get fillTheFormBelowToAddANewUserTo {
    return Intl.message(
      'Fill the form below to add a new user to the system',
      name: 'fillTheFormBelowToAddANewUserTo',
      desc: '',
      args: [],
    );
  }

  /// `Add a new user`
  String get addANewUser {
    return Intl.message(
      'Add a new user',
      name: 'addANewUser',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get state {
    return Intl.message('Status', name: 'state', desc: '', args: []);
  }

  /// `Role`
  String get rule {
    return Intl.message('Role', name: 'rule', desc: '', args: []);
  }

  /// `User settings`
  String get userSettings {
    return Intl.message(
      'User settings',
      name: 'userSettings',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Security Information`
  String get securityInformation {
    return Intl.message(
      'Security Information',
      name: 'securityInformation',
      desc: '',
      args: [],
    );
  }

  /// `Enter full name`
  String get enterFullName {
    return Intl.message(
      'Enter full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get enterEmail {
    return Intl.message('Enter email', name: 'enterEmail', desc: '', args: []);
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `No data received from server`
  String get noDataReceived {
    return Intl.message(
      'No data received from server',
      name: 'noDataReceived',
      desc: '',
      args: [],
    );
  }

  /// `Cannot Edit Invoice`
  String get cannotEditInvoice {
    return Intl.message(
      'Cannot Edit Invoice',
      name: 'cannotEditInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Already Sent`
  String get invoiceAlreadySent {
    return Intl.message(
      'Invoice Already Sent',
      name: 'invoiceAlreadySent',
      desc: '',
      args: [],
    );
  }

  /// `Cannot edit sent invoices`
  String get cannotEditSentInvoice {
    return Intl.message(
      'Cannot edit sent invoices',
      name: 'cannotEditSentInvoice',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message('No data', name: 'noData', desc: '', args: []);
  }

  /// `Select Customer`
  String get selectCustomer {
    return Intl.message(
      'Select Customer',
      name: 'selectCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Search customers`
  String get searchCustomers {
    return Intl.message(
      'Search customers',
      name: 'searchCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Loading customers...`
  String get loadingCustomers {
    return Intl.message(
      'Loading customers...',
      name: 'loadingCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Error loading customers`
  String get errorLoadingCustomers {
    return Intl.message(
      'Error loading customers',
      name: 'errorLoadingCustomers',
      desc: '',
      args: [],
    );
  }

  /// `No customers found`
  String get noCustomersFound {
    return Intl.message(
      'No customers found',
      name: 'noCustomersFound',
      desc: '',
      args: [],
    );
  }

  /// `No customers match your search`
  String get noCustomersMatchSearch {
    return Intl.message(
      'No customers match your search',
      name: 'noCustomersMatchSearch',
      desc: '',
      args: [],
    );
  }

  /// `Add first customer`
  String get addFirstCustomer {
    return Intl.message(
      'Add first customer',
      name: 'addFirstCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Try a different search`
  String get tryDifferentSearch {
    return Intl.message(
      'Try a different search',
      name: 'tryDifferentSearch',
      desc: '',
      args: [],
    );
  }

  /// `Add New Customer`
  String get addNewCustomer {
    return Intl.message(
      'Add New Customer',
      name: 'addNewCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Company Information`
  String get companyInformation {
    return Intl.message(
      'Company Information',
      name: 'companyInformation',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Enter company name`
  String get enterCompanyName {
    return Intl.message(
      'Enter company name',
      name: 'enterCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Enter address`
  String get enterAddress {
    return Intl.message(
      'Enter address',
      name: 'enterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Error creating customer`
  String get errorCreatingCustomer {
    return Intl.message(
      'Error creating customer',
      name: 'errorCreatingCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Select Product`
  String get selectProduct {
    return Intl.message(
      'Select Product',
      name: 'selectProduct',
      desc: '',
      args: [],
    );
  }

  /// `Search products...`
  String get searchProducts {
    return Intl.message(
      'Search products...',
      name: 'searchProducts',
      desc: '',
      args: [],
    );
  }

  /// `Loading products...`
  String get loadingProducts {
    return Intl.message(
      'Loading products...',
      name: 'loadingProducts',
      desc: '',
      args: [],
    );
  }

  /// `Error loading products`
  String get errorLoadingProducts {
    return Intl.message(
      'Error loading products',
      name: 'errorLoadingProducts',
      desc: '',
      args: [],
    );
  }

  /// `No products found`
  String get noProductsFound {
    return Intl.message(
      'No products found',
      name: 'noProductsFound',
      desc: '',
      args: [],
    );
  }

  /// `No products match search`
  String get noProductsMatchSearch {
    return Intl.message(
      'No products match search',
      name: 'noProductsMatchSearch',
      desc: '',
      args: [],
    );
  }

  /// `Add first product`
  String get addFirstProduct {
    return Intl.message(
      'Add first product',
      name: 'addFirstProduct',
      desc: '',
      args: [],
    );
  }

  /// `Add New Product`
  String get addNewProduct {
    return Intl.message(
      'Add New Product',
      name: 'addNewProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Enter product name`
  String get enterProductName {
    return Intl.message(
      'Enter product name',
      name: 'enterProductName',
      desc: '',
      args: [],
    );
  }

  /// `SKU`
  String get sku {
    return Intl.message('SKU', name: 'sku', desc: '', args: []);
  }

  /// `Enter SKU`
  String get enterSku {
    return Intl.message('Enter SKU', name: 'enterSku', desc: '', args: []);
  }

  /// `Pricing Information`
  String get pricingInformation {
    return Intl.message(
      'Pricing Information',
      name: 'pricingInformation',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Enter price`
  String get enterPrice {
    return Intl.message('Enter price', name: 'enterPrice', desc: '', args: []);
  }

  /// `Price is required`
  String get priceRequired {
    return Intl.message(
      'Price is required',
      name: 'priceRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid price`
  String get invalidPrice {
    return Intl.message(
      'Invalid price',
      name: 'invalidPrice',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Enter quantity`
  String get enterQuantity {
    return Intl.message(
      'Enter quantity',
      name: 'enterQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Quantity is required`
  String get quantityRequired {
    return Intl.message(
      'Quantity is required',
      name: 'quantityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid quantity`
  String get invalidQuantity {
    return Intl.message(
      'Invalid quantity',
      name: 'invalidQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Error creating product`
  String get errorCreatingProduct {
    return Intl.message(
      'Error creating product',
      name: 'errorCreatingProduct',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Items`
  String get invoiceItems {
    return Intl.message(
      'Invoice Items',
      name: 'invoiceItems',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message('Items', name: 'items', desc: '', args: []);
  }

  /// `No items added yet`
  String get noItemsAdded {
    return Intl.message(
      'No items added yet',
      name: 'noItemsAdded',
      desc: '',
      args: [],
    );
  }

  /// `Add items to invoice`
  String get addItemsToInvoice {
    return Intl.message(
      'Add items to invoice',
      name: 'addItemsToInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Manual Item`
  String get manualItem {
    return Intl.message('Manual Item', name: 'manualItem', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Add from Products`
  String get addFromProducts {
    return Intl.message(
      'Add from Products',
      name: 'addFromProducts',
      desc: '',
      args: [],
    );
  }

  /// `Add Manual Item`
  String get addManualItem {
    return Intl.message(
      'Add Manual Item',
      name: 'addManualItem',
      desc: '',
      args: [],
    );
  }

  /// `Customer Selection`
  String get customerSelection {
    return Intl.message(
      'Customer Selection',
      name: 'customerSelection',
      desc: '',
      args: [],
    );
  }

  /// `No customer selected`
  String get noCustomerSelected {
    return Intl.message(
      'No customer selected',
      name: 'noCustomerSelected',
      desc: '',
      args: [],
    );
  }

  /// `Invoice updated successfully`
  String get invoiceUpdatedSuccessfully {
    return Intl.message(
      'Invoice updated successfully',
      name: 'invoiceUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error updating invoice`
  String get errorUpdatingInvoice {
    return Intl.message(
      'Error updating invoice',
      name: 'errorUpdatingInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Error loading users`
  String get errorLoadingUsers {
    return Intl.message(
      'Error loading users',
      name: 'errorLoadingUsers',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update user`
  String get failedToUpdateUser {
    return Intl.message(
      'Failed to update user',
      name: 'failedToUpdateUser',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting user`
  String get errorDeletingUser {
    return Intl.message(
      'Error deleting user',
      name: 'errorDeletingUser',
      desc: '',
      args: [],
    );
  }

  /// `Error parsing user data`
  String get errorParsingUserData {
    return Intl.message(
      'Error parsing user data',
      name: 'errorParsingUserData',
      desc: '',
      args: [],
    );
  }

  /// `User created successfully`
  String get userCreatedSuccessfully {
    return Intl.message(
      'User created successfully',
      name: 'userCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `User updated successfully`
  String get userUpdatedSuccessfully {
    return Intl.message(
      'User updated successfully',
      name: 'userUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `User deleted successfully`
  String get userDeletedSuccessfully {
    return Intl.message(
      'User deleted successfully',
      name: 'userDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Follow all your bills in one place`
  String get onboardingOne {
    return Intl.message(
      'Follow all your bills in one place',
      name: 'onboardingOne',
      desc: '',
      args: [],
    );
  }

  /// `You don't forget and no bill`
  String get onboardingTwo {
    return Intl.message(
      'You don\'t forget and no bill',
      name: 'onboardingTwo',
      desc: '',
      args: [],
    );
  }

  /// `Pay and follow every need in seconds`
  String get onboardingThree {
    return Intl.message(
      'Pay and follow every need in seconds',
      name: 'onboardingThree',
      desc: '',
      args: [],
    );
  }

  /// `Organ your monthly bills, and follow the payment dates, without paper or headache.`
  String get onboardingOneDec {
    return Intl.message(
      'Organ your monthly bills, and follow the payment dates, without paper or headache.',
      name: 'onboardingOneDec',
      desc: '',
      args: [],
    );
  }

  /// `You receive an alert before the payment date, in order to avoid any delay or fines.`
  String get onboardingTwoDec {
    return Intl.message(
      'You receive an alert before the payment date, in order to avoid any delay or fines.',
      name: 'onboardingTwoDec',
      desc: '',
      args: [],
    );
  }

  /// `Pay electronically, and save your records automatically to review them at any time.`
  String get onboardingThreeDec {
    return Intl.message(
      'Pay electronically, and save your records automatically to review them at any time.',
      name: 'onboardingThreeDec',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get onboardingStartNow {
    return Intl.message(
      'Start now',
      name: 'onboardingStartNow',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get productsCategories {
    return Intl.message(
      'Products',
      name: 'productsCategories',
      desc: '',
      args: [],
    );
  }

  /// `Products List`
  String get productsList {
    return Intl.message(
      'Products List',
      name: 'productsList',
      desc: '',
      args: [],
    );
  }

  /// `Product Categories`
  String get categoriesAppbar {
    return Intl.message(
      'Product Categories',
      name: 'categoriesAppbar',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `All Categories`
  String get allCategories {
    return Intl.message(
      'All Categories',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `All Statuses`
  String get allStatuses {
    return Intl.message(
      'All Statuses',
      name: 'allStatuses',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock`
  String get outOfStock {
    return Intl.message('Out of Stock', name: 'outOfStock', desc: '', args: []);
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Edit Product`
  String get editProduct {
    return Intl.message(
      'Edit Product',
      name: 'editProduct',
      desc: '',
      args: [],
    );
  }

  /// `Delete Product`
  String get deleteProduct {
    return Intl.message(
      'Delete Product',
      name: 'deleteProduct',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete product "{name}"?`
  String deleteProductConfirmation(String name) {
    return Intl.message(
      'Are you sure you want to delete product "$name"?',
      name: 'deleteProductConfirmation',
      desc: '',
      args: [name],
    );
  }

  /// `No name`
  String get noName {
    return Intl.message('No name', name: 'noName', desc: '', args: []);
  }

  /// `Undefined`
  String get undefined {
    return Intl.message('Undefined', name: 'undefined', desc: '', args: []);
  }

  /// `Edit Category`
  String get editCategory {
    return Intl.message(
      'Edit Category',
      name: 'editCategory',
      desc: '',
      args: [],
    );
  }

  /// `Add Category`
  String get addCategory {
    return Intl.message(
      'Add Category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Category added successfully`
  String get categoryAddedSuccessfully {
    return Intl.message(
      'Category added successfully',
      name: 'categoryAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Category updated successfully`
  String get categoryUpdatedSuccessfully {
    return Intl.message(
      'Category updated successfully',
      name: 'categoryUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Category deleted successfully`
  String get categoryDeletedSuccessfully {
    return Intl.message(
      'Category deleted successfully',
      name: 'categoryDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error adding category`
  String get errorAddingCategory {
    return Intl.message(
      'Error adding category',
      name: 'errorAddingCategory',
      desc: '',
      args: [],
    );
  }

  /// `Error updating category`
  String get errorUpdatingCategory {
    return Intl.message(
      'Error updating category',
      name: 'errorUpdatingCategory',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting category`
  String get errorDeletingCategory {
    return Intl.message(
      'Error deleting category',
      name: 'errorDeletingCategory',
      desc: '',
      args: [],
    );
  }

  /// `Barcode`
  String get barcode {
    return Intl.message('Barcode', name: 'barcode', desc: '', args: []);
  }

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `Dimensions`
  String get dimensions {
    return Intl.message('Dimensions', name: 'dimensions', desc: '', args: []);
  }

  /// `Inventory Settings`
  String get inventorySettings {
    return Intl.message(
      'Inventory Settings',
      name: 'inventorySettings',
      desc: '',
      args: [],
    );
  }

  /// `Track Inventory`
  String get trackInventory {
    return Intl.message(
      'Track Inventory',
      name: 'trackInventory',
      desc: '',
      args: [],
    );
  }

  /// `Low Stock Alert`
  String get lowStockAlert {
    return Intl.message(
      'Low Stock Alert',
      name: 'lowStockAlert',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Quantity`
  String get minimumQuantity {
    return Intl.message(
      'Minimum Quantity',
      name: 'minimumQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Tax Settings`
  String get taxSettings {
    return Intl.message(
      'Tax Settings',
      name: 'taxSettings',
      desc: '',
      args: [],
    );
  }

  /// `Has Tax`
  String get hasTax {
    return Intl.message('Has Tax', name: 'hasTax', desc: '', args: []);
  }

  /// `Tax Rate`
  String get taxRate {
    return Intl.message('Tax Rate', name: 'taxRate', desc: '', args: []);
  }

  /// `Additional Settings`
  String get additionalSettings {
    return Intl.message(
      'Additional Settings',
      name: 'additionalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Is Active`
  String get isActive {
    return Intl.message('Is Active', name: 'isActive', desc: '', args: []);
  }

  /// `Product added successfully`
  String get productAddedSuccessfully {
    return Intl.message(
      'Product added successfully',
      name: 'productAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Product updated successfully`
  String get productUpdatedSuccessfully {
    return Intl.message(
      'Product updated successfully',
      name: 'productUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Product deleted successfully`
  String get productDeletedSuccessfully {
    return Intl.message(
      'Product deleted successfully',
      name: 'productDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error adding product`
  String get errorAddingProduct {
    return Intl.message(
      'Error adding product',
      name: 'errorAddingProduct',
      desc: '',
      args: [],
    );
  }

  /// `Error updating product`
  String get errorUpdatingProduct {
    return Intl.message(
      'Error updating product',
      name: 'errorUpdatingProduct',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting product`
  String get errorDeletingProduct {
    return Intl.message(
      'Error deleting product',
      name: 'errorDeletingProduct',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message('Add Product', name: 'addProduct', desc: '', args: []);
  }

  /// `Pricing`
  String get pricing {
    return Intl.message('Pricing', name: 'pricing', desc: '', args: []);
  }

  /// `Selling Price`
  String get sellingPrice {
    return Intl.message(
      'Selling Price',
      name: 'sellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Cost Price`
  String get costPrice {
    return Intl.message('Cost Price', name: 'costPrice', desc: '', args: []);
  }

  /// `Inventory`
  String get inventory {
    return Intl.message('Inventory', name: 'inventory', desc: '', args: []);
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Quantity must be a positive integer`
  String get quantityMustBeAPositiveInteger {
    return Intl.message(
      'Quantity must be a positive integer',
      name: 'quantityMustBeAPositiveInteger',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message('Unit', name: 'unit', desc: '', args: []);
  }

  /// `Piece`
  String get piece {
    return Intl.message('Piece', name: 'piece', desc: '', args: []);
  }

  /// `kg`
  String get kilogram {
    return Intl.message('kg', name: 'kilogram', desc: '', args: []);
  }

  /// `m`
  String get meter {
    return Intl.message('m', name: 'meter', desc: '', args: []);
  }

  /// `Invalid number`
  String get invalidNumber {
    return Intl.message(
      'Invalid number',
      name: 'invalidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Quantity`
  String get maximumQuantity {
    return Intl.message(
      'Maximum Quantity',
      name: 'maximumQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Product SKU`
  String get productSku {
    return Intl.message('Product SKU', name: 'productSku', desc: '', args: []);
  }

  /// `Brand`
  String get brand {
    return Intl.message('Brand', name: 'brand', desc: '', args: []);
  }

  /// `Model`
  String get model {
    return Intl.message('Model', name: 'model', desc: '', args: []);
  }

  /// `Color`
  String get color {
    return Intl.message('Color', name: 'color', desc: '', args: []);
  }

  /// `Material`
  String get material {
    return Intl.message('Material', name: 'material', desc: '', args: []);
  }

  /// `cm`
  String get centimeters {
    return Intl.message('cm', name: 'centimeters', desc: '', args: []);
  }

  /// `Product is Active`
  String get productIsActive {
    return Intl.message(
      'Product is Active',
      name: 'productIsActive',
      desc: '',
      args: [],
    );
  }

  /// `Enable/Disable Product`
  String get enableDisableProduct {
    return Intl.message(
      'Enable/Disable Product',
      name: 'enableDisableProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product is Taxable`
  String get productIsTaxable {
    return Intl.message(
      'Product is Taxable',
      name: 'productIsTaxable',
      desc: '',
      args: [],
    );
  }

  /// `Apply Tax to Product`
  String get applyTaxToProduct {
    return Intl.message(
      'Apply Tax to Product',
      name: 'applyTaxToProduct',
      desc: '',
      args: [],
    );
  }

  /// `Track Available Product Quantity`
  String get trackAvailableProductQuantity {
    return Intl.message(
      'Track Available Product Quantity',
      name: 'trackAvailableProductQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get selectCategory {
    return Intl.message(
      'Select Category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Exit App`
  String get exitAppConfirmation {
    return Intl.message(
      'Exit App',
      name: 'exitAppConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the app?`
  String get exitAppConfirmationMessage {
    return Intl.message(
      'Are you sure you want to exit the app?',
      name: 'exitAppConfirmationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Press the add button to create a new customer`
  String get noCustomersFoundMessage {
    return Intl.message(
      'Press the add button to create a new customer',
      name: 'noCustomersFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Customers List`
  String get customersList {
    return Intl.message(
      'Customers List',
      name: 'customersList',
      desc: '',
      args: [],
    );
  }

  /// `Add Customer`
  String get addCustomer {
    return Intl.message(
      'Add Customer',
      name: 'addCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Edit Customer`
  String get editCustomer {
    return Intl.message(
      'Edit Customer',
      name: 'editCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Delete Customer`
  String get deleteCustomer {
    return Intl.message(
      'Delete Customer',
      name: 'deleteCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Customer Details`
  String get customerDetails {
    return Intl.message(
      'Customer Details',
      name: 'customerDetails',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get customerName {
    return Intl.message(
      'Customer Name',
      name: 'customerName',
      desc: '',
      args: [],
    );
  }

  /// `Customer name is required`
  String get customerNameRequired {
    return Intl.message(
      'Customer name is required',
      name: 'customerNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get customerEmail {
    return Intl.message('Email', name: 'customerEmail', desc: '', args: []);
  }

  /// `Phone Number`
  String get customerPhone {
    return Intl.message(
      'Phone Number',
      name: 'customerPhone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get customerAddress {
    return Intl.message('Address', name: 'customerAddress', desc: '', args: []);
  }

  /// `Tax Number`
  String get customerTaxNumber {
    return Intl.message(
      'Tax Number',
      name: 'customerTaxNumber',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get customerNotes {
    return Intl.message('Notes', name: 'customerNotes', desc: '', args: []);
  }

  /// `Status`
  String get customerStatus {
    return Intl.message('Status', name: 'customerStatus', desc: '', args: []);
  }

  /// `Active`
  String get customerStatusActive {
    return Intl.message(
      'Active',
      name: 'customerStatusActive',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get customerStatusInactive {
    return Intl.message(
      'Inactive',
      name: 'customerStatusInactive',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get customerBasicInfo {
    return Intl.message(
      'Basic Information',
      name: 'customerBasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get customerBasicInfoSection {
    return Intl.message(
      'Basic Information',
      name: 'customerBasicInfoSection',
      desc: '',
      args: [],
    );
  }

  /// `Company/Organization Name`
  String get customerCompanyName {
    return Intl.message(
      'Company/Organization Name',
      name: 'customerCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get customerPhoneRequired {
    return Intl.message(
      'Phone number is required',
      name: 'customerPhoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number format`
  String get phoneInvalid {
    return Intl.message(
      'Invalid phone number format',
      name: 'phoneInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Commercial Register`
  String get customerCommercialRegister {
    return Intl.message(
      'Commercial Register',
      name: 'customerCommercialRegister',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get customerCity {
    return Intl.message('City', name: 'customerCity', desc: '', args: []);
  }

  /// `Region`
  String get customerRegion {
    return Intl.message('Region', name: 'customerRegion', desc: '', args: []);
  }

  /// `Postal Code`
  String get customerPostalCode {
    return Intl.message(
      'Postal Code',
      name: 'customerPostalCode',
      desc: '',
      args: [],
    );
  }

  /// `Detailed Address`
  String get customerDetailedAddress {
    return Intl.message(
      'Detailed Address',
      name: 'customerDetailedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Additional Information`
  String get customerAdditionalInfo {
    return Intl.message(
      'Additional Information',
      name: 'customerAdditionalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Responsible Person`
  String get customerResponsiblePerson {
    return Intl.message(
      'Responsible Person',
      name: 'customerResponsiblePerson',
      desc: '',
      args: [],
    );
  }

  /// `Customer "{name}" created successfully`
  String customerCreatedSuccessfully(String name) {
    return Intl.message(
      'Customer "$name" created successfully',
      name: 'customerCreatedSuccessfully',
      desc: '',
      args: [name],
    );
  }

  /// `Customer "{name}" updated successfully`
  String customerUpdatedSuccessfully(String name) {
    return Intl.message(
      'Customer "$name" updated successfully',
      name: 'customerUpdatedSuccessfully',
      desc: '',
      args: [name],
    );
  }

  /// `Customer deleted successfully`
  String get customerDeletedSuccessfully {
    return Intl.message(
      'Customer deleted successfully',
      name: 'customerDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete Customer`
  String get confirmDeleteCustomer {
    return Intl.message(
      'Confirm Delete Customer',
      name: 'confirmDeleteCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete customer "{name}"?`
  String confirmDeleteCustomerMessage(String name) {
    return Intl.message(
      'Are you sure you want to delete customer "$name"?',
      name: 'confirmDeleteCustomerMessage',
      desc: '',
      args: [name],
    );
  }

  /// `View`
  String get view {
    return Intl.message('View', name: 'view', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `An error occurred`
  String get errorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get company {
    return Intl.message('Company', name: 'company', desc: '', args: []);
  }

  /// `Clear Filters`
  String get clearFilters {
    return Intl.message(
      'Clear Filters',
      name: 'clearFilters',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get customers {
    return Intl.message('Customers', name: 'customers', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Edit Customer Form`
  String get formHelpTitle {
    return Intl.message(
      'Edit Customer Form',
      name: 'formHelpTitle',
      desc: '',
      args: [],
    );
  }

  /// `This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information`
  String get formHelpDescription {
    return Intl.message(
      'This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information',
      name: 'formHelpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Address Information`
  String get addressInformation {
    return Intl.message(
      'Address Information',
      name: 'addressInformation',
      desc: '',
      args: [],
    );
  }

  /// `Contact Info`
  String get contactInfo {
    return Intl.message(
      'Contact Info',
      name: 'contactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Status Info`
  String get statusInfo {
    return Intl.message('Status Info', name: 'statusInfo', desc: '', args: []);
  }

  /// `Created`
  String get createdDate {
    return Intl.message('Created', name: 'createdDate', desc: '', args: []);
  }

  /// `Last Updated`
  String get lastUpdated {
    return Intl.message(
      'Last Updated',
      name: 'lastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete customer "{name}"?`
  String deleteCustomerConfirmation(Object name) {
    return Intl.message(
      'Are you sure you want to delete customer "$name"?',
      name: 'deleteCustomerConfirmation',
      desc: '',
      args: [name],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Customer data copied to clipboard`
  String get customerDataCopied {
    return Intl.message(
      'Customer data copied to clipboard',
      name: 'customerDataCopied',
      desc: '',
      args: [],
    );
  }

  /// `Help for adding an expense`
  String get addExpenseHelp {
    return Intl.message(
      'Help for adding an expense',
      name: 'addExpenseHelp',
      desc: '',
      args: [],
    );
  }

  /// `This screen allows you to create and track business expenses. Here's what you can do:`
  String get addExpenseHelpDescription {
    return Intl.message(
      'This screen allows you to create and track business expenses. Here\'s what you can do:',
      name: 'addExpenseHelpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter expense title and description`
  String get enterExpenseTitleAndDescription {
    return Intl.message(
      'Enter expense title and description',
      name: 'enterExpenseTitleAndDescription',
      desc: '',
      args: [],
    );
  }

  /// `Set amount, date, and payment method`
  String get setAmountDateAndPaymentMethod {
    return Intl.message(
      'Set amount, date, and payment method',
      name: 'setAmountDateAndPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Select appropriate expense category`
  String get selectAppropriateExpenseCategory {
    return Intl.message(
      'Select appropriate expense category',
      name: 'selectAppropriateExpenseCategory',
      desc: '',
      args: [],
    );
  }

  /// `Add reference number and notes`
  String get addReferenceNumberAndNotes {
    return Intl.message(
      'Add reference number and notes',
      name: 'addReferenceNumberAndNotes',
      desc: '',
      args: [],
    );
  }

  /// `Got it!`
  String get gotIt {
    return Intl.message('Got it!', name: 'gotIt', desc: '', args: []);
  }

  /// `Categorization`
  String get categorization {
    return Intl.message(
      'Categorization',
      name: 'categorization',
      desc: '',
      args: [],
    );
  }

  /// `Additional Info`
  String get additionalInfo {
    return Intl.message(
      'Additional Info',
      name: 'additionalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `Expense Date`
  String get expenseDate {
    return Intl.message(
      'Expense Date',
      name: 'expenseDate',
      desc: '',
      args: [],
    );
  }

  /// `Select the date this expense occurred`
  String get selectTheDateThisExpenseOccurred {
    return Intl.message(
      'Select the date this expense occurred',
      name: 'selectTheDateThisExpenseOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message('Credit Card', name: 'creditCard', desc: '', args: []);
  }

  /// `Debit Card`
  String get debitCard {
    return Intl.message('Debit Card', name: 'debitCard', desc: '', args: []);
  }

  /// `Bank Transfer`
  String get bankTransfer {
    return Intl.message(
      'Bank Transfer',
      name: 'bankTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get check {
    return Intl.message('Check', name: 'check', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Loading more...`
  String get loadingMore {
    return Intl.message(
      'Loading more...',
      name: 'loadingMore',
      desc: '',
      args: [],
    );
  }

  /// `Loading expenses...`
  String get loadingExpenses {
    return Intl.message(
      'Loading expenses...',
      name: 'loadingExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Expense Details`
  String get expenseDetails {
    return Intl.message(
      'Expense Details',
      name: 'expenseDetails',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Financial Information`
  String get financialInformation {
    return Intl.message(
      'Financial Information',
      name: 'financialInformation',
      desc: '',
      args: [],
    );
  }

  /// `Payment Information`
  String get paymentInformation {
    return Intl.message(
      'Payment Information',
      name: 'paymentInformation',
      desc: '',
      args: [],
    );
  }

  /// `Metadata`
  String get metadata {
    return Intl.message('Metadata', name: 'metadata', desc: '', args: []);
  }

  /// `Created By`
  String get createdBy {
    return Intl.message('Created By', name: 'createdBy', desc: '', args: []);
  }

  /// `Created At`
  String get createdAt {
    return Intl.message('Created At', name: 'createdAt', desc: '', args: []);
  }

  /// `Updated At`
  String get updatedAt {
    return Intl.message('Updated At', name: 'updatedAt', desc: '', args: []);
  }

  /// `Expense updated successfully`
  String get expenseUpdatedSuccessfully {
    return Intl.message(
      'Expense updated successfully',
      name: 'expenseUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit Expense`
  String get editExpense {
    return Intl.message(
      'Edit Expense',
      name: 'editExpense',
      desc: '',
      args: [],
    );
  }

  /// `Add New Expense Category`
  String get addNewExpenseCategory {
    return Intl.message(
      'Add New Expense Category',
      name: 'addNewExpenseCategory',
      desc: '',
      args: [],
    );
  }

  /// `Back to Categories`
  String get backToCategories {
    return Intl.message(
      'Back to Categories',
      name: 'backToCategories',
      desc: '',
      args: [],
    );
  }

  /// `New Category Details`
  String get newCategoryDetails {
    return Intl.message(
      'New Category Details',
      name: 'newCategoryDetails',
      desc: '',
      args: [],
    );
  }

  /// `Category Name`
  String get categoryName {
    return Intl.message(
      'Category Name',
      name: 'categoryName',
      desc: '',
      args: [],
    );
  }

  /// `Category name is required`
  String get categoryNameRequired {
    return Intl.message(
      'Category name is required',
      name: 'categoryNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter category name`
  String get enterCategoryName {
    return Intl.message(
      'Enter category name',
      name: 'enterCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Category Description`
  String get categoryDescription {
    return Intl.message(
      'Category Description',
      name: 'categoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter a brief description for the category`
  String get enterCategoryDescription {
    return Intl.message(
      'Enter a brief description for the category',
      name: 'enterCategoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Icon`
  String get icon {
    return Intl.message('Icon', name: 'icon', desc: '', args: []);
  }

  /// `Category Preview`
  String get categoryPreview {
    return Intl.message(
      'Category Preview',
      name: 'categoryPreview',
      desc: '',
      args: [],
    );
  }

  /// `Save Category`
  String get saveCategory {
    return Intl.message(
      'Save Category',
      name: 'saveCategory',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get saving {
    return Intl.message('Saving...', name: 'saving', desc: '', args: []);
  }

  /// `Edit Expense Category`
  String get editExpenseCategory {
    return Intl.message(
      'Edit Expense Category',
      name: 'editExpenseCategory',
      desc: '',
      args: [],
    );
  }

  /// `Update Category`
  String get updateCategory {
    return Intl.message(
      'Update Category',
      name: 'updateCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category created successfully`
  String get categoryCreatedSuccessfully {
    return Intl.message(
      'Category created successfully',
      name: 'categoryCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No Categories Found`
  String get noCategoriesFound {
    return Intl.message(
      'No Categories Found',
      name: 'noCategoriesFound',
      desc: '',
      args: [],
    );
  }

  /// `Create your first expense category`
  String get createYourFirstExpenseCategory {
    return Intl.message(
      'Create your first expense category',
      name: 'createYourFirstExpenseCategory',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading Categories`
  String get errorLoadingCategories {
    return Intl.message(
      'Error Loading Categories',
      name: 'errorLoadingCategories',
      desc: '',
      args: [],
    );
  }

  /// `Delete All Categories`
  String get deleteAllCategories {
    return Intl.message(
      'Delete All Categories',
      name: 'deleteAllCategories',
      desc: '',
      args: [],
    );
  }

  /// `Delete Category`
  String get deleteCategory {
    return Intl.message(
      'Delete Category',
      name: 'deleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete category "{name}"?`
  String deleteCategoryConfirmation(String name) {
    return Intl.message(
      'Are you sure you want to delete category "$name"?',
      name: 'deleteCategoryConfirmation',
      desc: '',
      args: [name],
    );
  }

  /// `Error: {error}`
  String errorMessage(String error) {
    return Intl.message(
      'Error: $error',
      name: 'errorMessage',
      desc: '',
      args: [error],
    );
  }

  /// `Status: {status}`
  String statusCategory(String status) {
    return Intl.message(
      'Status: $status',
      name: 'statusCategory',
      desc: '',
      args: [status],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Company Email`
  String get companyEmail {
    return Intl.message(
      'Company Email',
      name: 'companyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Company Phone`
  String get companyPhone {
    return Intl.message(
      'Company Phone',
      name: 'companyPhone',
      desc: '',
      args: [],
    );
  }

  /// `Company Address`
  String get companyAddress {
    return Intl.message(
      'Company Address',
      name: 'companyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Enable Dark Mode`
  String get enableDarkMode {
    return Intl.message(
      'Enable Dark Mode',
      name: 'enableDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Receive Notifications`
  String get receiveNotifications {
    return Intl.message(
      'Receive Notifications',
      name: 'receiveNotifications',
      desc: '',
      args: [],
    );
  }

  /// `App Information`
  String get appInfo {
    return Intl.message('App Information', name: 'appInfo', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Users and Permissions`
  String get usersManagement {
    return Intl.message(
      'Users and Permissions',
      name: 'usersManagement',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get customersManagement {
    return Intl.message(
      'Customers',
      name: 'customersManagement',
      desc: '',
      args: [],
    );
  }

  /// `Products and Categories`
  String get productsCategoriesManagement {
    return Intl.message(
      'Products and Categories',
      name: 'productsCategoriesManagement',
      desc: '',
      args: [],
    );
  }

  /// `Expenses & Categories`
  String get expensesManagement {
    return Intl.message(
      'Expenses & Categories',
      name: 'expensesManagement',
      desc: '',
      args: [],
    );
  }

  /// `Support Email`
  String get supportEmail {
    return Intl.message(
      'Support Email',
      name: 'supportEmail',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message('Website', name: 'website', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message('Terms of Use', name: 'termsOfUse', desc: '', args: []);
  }

  /// `Save Settings`
  String get saveSettings {
    return Intl.message(
      'Save Settings',
      name: 'saveSettings',
      desc: '',
      args: [],
    );
  }

  /// `Saving Settings...`
  String get savingSettings {
    return Intl.message(
      'Saving Settings...',
      name: 'savingSettings',
      desc: '',
      args: [],
    );
  }

  /// `Settings saved successfully`
  String get settingsSavedSuccessfully {
    return Intl.message(
      'Settings saved successfully',
      name: 'settingsSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Company name is required`
  String get companyNameRequired {
    return Intl.message(
      'Company name is required',
      name: 'companyNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Company email is required`
  String get companyEmailRequired {
    return Intl.message(
      'Company email is required',
      name: 'companyEmailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid company email`
  String get companyEmailInvalid {
    return Intl.message(
      'Invalid company email',
      name: 'companyEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Company phone is required`
  String get companyPhoneRequired {
    return Intl.message(
      'Company phone is required',
      name: 'companyPhoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Company address is required`
  String get companyAddressRequired {
    return Intl.message(
      'Company address is required',
      name: 'companyAddressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter company email`
  String get enterCompanyEmail {
    return Intl.message(
      'Enter company email',
      name: 'enterCompanyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter company phone`
  String get enterCompanyPhone {
    return Intl.message(
      'Enter company phone',
      name: 'enterCompanyPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter company address`
  String get enterCompanyAddress {
    return Intl.message(
      'Enter company address',
      name: 'enterCompanyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Language changed to Arabic`
  String get languageChangedToArabic {
    return Intl.message(
      'Language changed to Arabic',
      name: 'languageChangedToArabic',
      desc: '',
      args: [],
    );
  }

  /// `Language changed to English`
  String get languageChangedToEnglish {
    return Intl.message(
      'Language changed to English',
      name: 'languageChangedToEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode enabled`
  String get darkModeEnabled {
    return Intl.message(
      'Dark mode enabled',
      name: 'darkModeEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode disabled`
  String get darkModeDisabled {
    return Intl.message(
      'Dark mode disabled',
      name: 'darkModeDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Notifications enabled`
  String get notificationsEnabled {
    return Intl.message(
      'Notifications enabled',
      name: 'notificationsEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Notifications disabled`
  String get notificationsDisabled {
    return Intl.message(
      'Notifications disabled',
      name: 'notificationsDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Warning: Your account will be permanently deleted`
  String get deleteAccountWarning {
    return Intl.message(
      'Warning: Your account will be permanently deleted',
      name: 'deleteAccountWarning',
      desc: '',
      args: [],
    );
  }

  /// `Enter password to confirm`
  String get enterPasswordToConfirm {
    return Intl.message(
      'Enter password to confirm',
      name: 'enterPasswordToConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Account deleted successfully`
  String get accountDeletedSuccessfully {
    return Intl.message(
      'Account deleted successfully',
      name: 'accountDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get deleteAccountConfirmation {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'deleteAccountConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to change your password?`
  String get changePasswordConfirmation {
    return Intl.message(
      'Are you sure you want to change your password?',
      name: 'changePasswordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you absolutely sure you want to delete your account? This action cannot be undone`
  String get deleteAccountFinalConfirmation {
    return Intl.message(
      'Are you absolutely sure you want to delete your account? This action cannot be undone',
      name: 'deleteAccountFinalConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes, delete my account`
  String get yesDeleteAccount {
    return Intl.message(
      'Yes, delete my account',
      name: 'yesDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePasswordButton {
    return Intl.message(
      'Change Password',
      name: 'changePasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account Permanently`
  String get deleteAccountButton {
    return Intl.message(
      'Delete Account Permanently',
      name: 'deleteAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Reports`
  String get reports {
    return Intl.message('Reports', name: 'reports', desc: '', args: []);
  }

  /// `User Management`
  String get userManagement {
    return Intl.message(
      'User Management',
      name: 'userManagement',
      desc: '',
      args: [],
    );
  }

  /// `Permissions Management`
  String get permissionsManagement {
    return Intl.message(
      'Permissions Management',
      name: 'permissionsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Clients Management`
  String get clientsManagement {
    return Intl.message(
      'Clients Management',
      name: 'clientsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Products & Categories Management`
  String get productsManagement {
    return Intl.message(
      'Products & Categories Management',
      name: 'productsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Invotek App`
  String get welcomeToInvotek {
    return Intl.message(
      'Welcome to Invotek App',
      name: 'welcomeToInvotek',
      desc: '',
      args: [],
    );
  }

  /// `Manage invoices and customers easily`
  String get manageInvoicesAndCustomers {
    return Intl.message(
      'Manage invoices and customers easily',
      name: 'manageInvoicesAndCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Quick Actions`
  String get quickActions {
    return Intl.message(
      'Quick Actions',
      name: 'quickActions',
      desc: '',
      args: [],
    );
  }

  /// `Manage Customers`
  String get manageCustomers {
    return Intl.message(
      'Manage Customers',
      name: 'manageCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Add, edit and delete customers`
  String get addAndEditCustomers {
    return Intl.message(
      'Add, edit and delete customers',
      name: 'addAndEditCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Manage Invoices`
  String get manageInvoices {
    return Intl.message(
      'Manage Invoices',
      name: 'manageInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Create and edit invoices`
  String get createAndEditInvoices {
    return Intl.message(
      'Create and edit invoices',
      name: 'createAndEditInvoices',
      desc: '',
      args: [],
    );
  }

  /// `View reports and statistics`
  String get viewReportsAndStatistics {
    return Intl.message(
      'View reports and statistics',
      name: 'viewReportsAndStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Create New Invoice`
  String get createNewInvoice {
    return Intl.message(
      'Create New Invoice',
      name: 'createNewInvoice',
      desc: '',
      args: [],
    );
  }

  /// `View All Invoices`
  String get viewAllInvoices {
    return Intl.message(
      'View All Invoices',
      name: 'viewAllInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Device Information`
  String get deviceInfo {
    return Intl.message(
      'Device Information',
      name: 'deviceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Screen dimensions and performance`
  String get screenDimensionsAndPerformance {
    return Intl.message(
      'Screen dimensions and performance',
      name: 'screenDimensionsAndPerformance',
      desc: '',
      args: [],
    );
  }

  /// `Device Type`
  String get deviceType {
    return Intl.message('Device Type', name: 'deviceType', desc: '', args: []);
  }

  /// `Tablet`
  String get tablet {
    return Intl.message('Tablet', name: 'tablet', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Theme Demo`
  String get themeDemo {
    return Intl.message('Theme Demo', name: 'themeDemo', desc: '', args: []);
  }

  /// `Theme Information`
  String get themeInfo {
    return Intl.message(
      'Theme Information',
      name: 'themeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Screen Dimensions`
  String get screenDimensions {
    return Intl.message(
      'Screen Dimensions',
      name: 'screenDimensions',
      desc: '',
      args: [],
    );
  }

  /// `Text Styles`
  String get textStyles {
    return Intl.message('Text Styles', name: 'textStyles', desc: '', args: []);
  }

  /// `Main Title`
  String get mainTitle {
    return Intl.message('Main Title', name: 'mainTitle', desc: '', args: []);
  }

  /// `Sub Title`
  String get subTitle {
    return Intl.message('Sub Title', name: 'subTitle', desc: '', args: []);
  }

  /// `Normal Text`
  String get normalText {
    return Intl.message('Normal Text', name: 'normalText', desc: '', args: []);
  }

  /// `Small Text`
  String get smallText {
    return Intl.message('Small Text', name: 'smallText', desc: '', args: []);
  }

  /// `Link`
  String get link {
    return Intl.message('Link', name: 'link', desc: '', args: []);
  }

  /// `Error Text`
  String get errorText {
    return Intl.message('Error Text', name: 'errorText', desc: '', args: []);
  }

  /// `Success Text`
  String get successText {
    return Intl.message(
      'Success Text',
      name: 'successText',
      desc: '',
      args: [],
    );
  }

  /// `Buttons`
  String get buttons {
    return Intl.message('Buttons', name: 'buttons', desc: '', args: []);
  }

  /// `Normal Button`
  String get normalButton {
    return Intl.message(
      'Normal Button',
      name: 'normalButton',
      desc: '',
      args: [],
    );
  }

  /// `Outlined Button`
  String get outlinedButton {
    return Intl.message(
      'Outlined Button',
      name: 'outlinedButton',
      desc: '',
      args: [],
    );
  }

  /// `Loading Button`
  String get loadingButton {
    return Intl.message(
      'Loading Button',
      name: 'loadingButton',
      desc: '',
      args: [],
    );
  }

  /// `Input Fields`
  String get inputFields {
    return Intl.message(
      'Input Fields',
      name: 'inputFields',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Enter username`
  String get enterUsername {
    return Intl.message(
      'Enter username',
      name: 'enterUsername',
      desc: '',
      args: [],
    );
  }

  /// `Cards`
  String get cards {
    return Intl.message('Cards', name: 'cards', desc: '', args: []);
  }

  /// `Interactive Card`
  String get interactiveCard {
    return Intl.message(
      'Interactive Card',
      name: 'interactiveCard',
      desc: '',
      args: [],
    );
  }

  /// `This is an interactive card that can be pressed`
  String get interactiveCardDescription {
    return Intl.message(
      'This is an interactive card that can be pressed',
      name: 'interactiveCardDescription',
      desc: '',
      args: [],
    );
  }

  /// `Loading Card`
  String get loadingCard {
    return Intl.message(
      'Loading Card',
      name: 'loadingCard',
      desc: '',
      args: [],
    );
  }

  /// `Responsive Texts`
  String get responsiveTexts {
    return Intl.message(
      'Responsive Texts',
      name: 'responsiveTexts',
      desc: '',
      args: [],
    );
  }

  /// `Small Responsive Text`
  String get smallResponsiveText {
    return Intl.message(
      'Small Responsive Text',
      name: 'smallResponsiveText',
      desc: '',
      args: [],
    );
  }

  /// `Medium Responsive Text`
  String get mediumResponsiveText {
    return Intl.message(
      'Medium Responsive Text',
      name: 'mediumResponsiveText',
      desc: '',
      args: [],
    );
  }

  /// `Large Responsive Text`
  String get largeResponsiveText {
    return Intl.message(
      'Large Responsive Text',
      name: 'largeResponsiveText',
      desc: '',
      args: [],
    );
  }

  /// `Normal button pressed`
  String get buttonPressed {
    return Intl.message(
      'Normal button pressed',
      name: 'buttonPressed',
      desc: '',
      args: [],
    );
  }

  /// `Outlined button pressed`
  String get outlinedButtonPressed {
    return Intl.message(
      'Outlined button pressed',
      name: 'outlinedButtonPressed',
      desc: '',
      args: [],
    );
  }

  /// `Card pressed`
  String get cardPressed {
    return Intl.message(
      'Card pressed',
      name: 'cardPressed',
      desc: '',
      args: [],
    );
  }

  /// `Calling {phone}`
  String calling(Object phone) {
    return Intl.message(
      'Calling $phone',
      name: 'calling',
      desc: '',
      args: [phone],
    );
  }

  /// `Opening email to {email}`
  String openingEmail(Object email) {
    return Intl.message(
      'Opening email to $email',
      name: 'openingEmail',
      desc: '',
      args: [email],
    );
  }

  /// `Viewing invoices for {name}`
  String viewingInvoices(Object name) {
    return Intl.message(
      'Viewing invoices for $name',
      name: 'viewingInvoices',
      desc: '',
      args: [name],
    );
  }

  /// `Viewing orders for {name}`
  String viewingOrders(Object name) {
    return Intl.message(
      'Viewing orders for $name',
      name: 'viewingOrders',
      desc: '',
      args: [name],
    );
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Opening map`
  String get openingMap {
    return Intl.message('Opening map', name: 'openingMap', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Invalid phone number`
  String get phoneNumberInvalid {
    return Intl.message(
      'Invalid phone number',
      name: 'phoneNumberInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Advanced Technology Company`
  String get advancedTechCompany {
    return Intl.message(
      'Advanced Technology Company',
      name: 'advancedTechCompany',
      desc: '',
      args: [],
    );
  }

  /// `Financial Services Institution`
  String get financialServicesInstitution {
    return Intl.message(
      'Financial Services Institution',
      name: 'financialServicesInstitution',
      desc: '',
      args: [],
    );
  }

  /// `Construction & Development Company`
  String get constructionDevelopmentCompany {
    return Intl.message(
      'Construction & Development Company',
      name: 'constructionDevelopmentCompany',
      desc: '',
      args: [],
    );
  }

  /// `Modern Education Institution`
  String get modernEducationInstitution {
    return Intl.message(
      'Modern Education Institution',
      name: 'modernEducationInstitution',
      desc: '',
      args: [],
    );
  }

  /// `Tourism & Entertainment Company`
  String get tourismEntertainmentCompany {
    return Intl.message(
      'Tourism & Entertainment Company',
      name: 'tourismEntertainmentCompany',
      desc: '',
      args: [],
    );
  }

  /// `Healthcare Institution`
  String get healthcareInstitution {
    return Intl.message(
      'Healthcare Institution',
      name: 'healthcareInstitution',
      desc: '',
      args: [],
    );
  }

  /// `Transport & Logistics Company`
  String get transportLogisticsCompany {
    return Intl.message(
      'Transport & Logistics Company',
      name: 'transportLogisticsCompany',
      desc: '',
      args: [],
    );
  }

  /// `E-commerce Institution`
  String get ecommerceInstitution {
    return Intl.message(
      'E-commerce Institution',
      name: 'ecommerceInstitution',
      desc: '',
      args: [],
    );
  }

  /// `Product Help`
  String get productHelp {
    return Intl.message(
      'Product Help',
      name: 'productHelp',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all required fields`
  String get fillAllRequiredFields {
    return Intl.message(
      'Please fill in all required fields',
      name: 'fillAllRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `Product name is required`
  String get productNameRequired {
    return Intl.message(
      'Product name is required',
      name: 'productNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Product price is required`
  String get productPriceRequired {
    return Intl.message(
      'Product price is required',
      name: 'productPriceRequired',
      desc: '',
      args: [],
    );
  }

  /// `Product quantity is required`
  String get productQuantityRequired {
    return Intl.message(
      'Product quantity is required',
      name: 'productQuantityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid quantity`
  String get enterValidQuantity {
    return Intl.message(
      'Please enter a valid quantity',
      name: 'enterValidQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Are you sure you want to delete "{name}"?`
  String areYouSureDelete(Object name) {
    return Intl.message(
      'Are you sure you want to delete "$name"?',
      name: 'areYouSureDelete',
      desc: '',
      args: [name],
    );
  }

  /// `Error loading product data`
  String get errorLoadingProduct {
    return Intl.message(
      'Error loading product data',
      name: 'errorLoadingProduct',
      desc: '',
      args: [],
    );
  }

  /// `No categories to delete`
  String get noCategoriesToDelete {
    return Intl.message(
      'No categories to delete',
      name: 'noCategoriesToDelete',
      desc: '',
      args: [],
    );
  }

  /// `All categories deleted successfully`
  String get allCategoriesDeletedSuccessfully {
    return Intl.message(
      'All categories deleted successfully',
      name: 'allCategoriesDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `All Status`
  String get allStatus {
    return Intl.message('All Status', name: 'allStatus', desc: '', args: []);
  }

  /// `Operation completed successfully`
  String get operationCompletedSuccessfully {
    return Intl.message(
      'Operation completed successfully',
      name: 'operationCompletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit User`
  String get editUser {
    return Intl.message('Edit User', name: 'editUser', desc: '', args: []);
  }

  /// `Add New Role`
  String get addNewRole {
    return Intl.message('Add New Role', name: 'addNewRole', desc: '', args: []);
  }

  /// `Edit Role`
  String get editRole {
    return Intl.message('Edit Role', name: 'editRole', desc: '', args: []);
  }

  /// `No email`
  String get noEmail {
    return Intl.message('No email', name: 'noEmail', desc: '', args: []);
  }

  /// `No role`
  String get noRole {
    return Intl.message('No role', name: 'noRole', desc: '', args: []);
  }

  /// `Accountant`
  String get accountant {
    return Intl.message('Accountant', name: 'accountant', desc: '', args: []);
  }

  /// `Supervisor`
  String get supervisor {
    return Intl.message('Supervisor', name: 'supervisor', desc: '', args: []);
  }

  /// `Failed to load roles and permissions: {error}`
  String failedToLoadRoles(Object error) {
    return Intl.message(
      'Failed to load roles and permissions: $error',
      name: 'failedToLoadRoles',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to load user permissions: {error}`
  String failedToLoadUserPermissions(Object error) {
    return Intl.message(
      'Failed to load user permissions: $error',
      name: 'failedToLoadUserPermissions',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to add role: {error}`
  String failedToAddRole(Object error) {
    return Intl.message(
      'Failed to add role: $error',
      name: 'failedToAddRole',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to update role: {error}`
  String failedToUpdateRole(Object error) {
    return Intl.message(
      'Failed to update role: $error',
      name: 'failedToUpdateRole',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to delete role: {error}`
  String failedToDeleteRole(Object error) {
    return Intl.message(
      'Failed to delete role: $error',
      name: 'failedToDeleteRole',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to update user permissions: {error}`
  String failedToUpdateUserPermissions(Object error) {
    return Intl.message(
      'Failed to update user permissions: $error',
      name: 'failedToUpdateUserPermissions',
      desc: '',
      args: [error],
    );
  }

  /// `View Users`
  String get viewUsers {
    return Intl.message('View Users', name: 'viewUsers', desc: '', args: []);
  }

  /// `Page Not Found`
  String get pageNotFound {
    return Intl.message(
      'Page Not Found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The requested page was not found`
  String get requestedPageNotFound {
    return Intl.message(
      'The requested page was not found',
      name: 'requestedPageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open email application`
  String get cannotOpenEmailApp {
    return Intl.message(
      'Cannot open email application',
      name: 'cannotOpenEmailApp',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open website`
  String get cannotOpenWebsite {
    return Intl.message(
      'Cannot open website',
      name: 'cannotOpenWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy Coming Soon`
  String get privacyPolicyComingSoon {
    return Intl.message(
      'Privacy Policy Coming Soon',
      name: 'privacyPolicyComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use Coming Soon`
  String get termsOfUseComingSoon {
    return Intl.message(
      'Terms of Use Coming Soon',
      name: 'termsOfUseComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Version {version} (Build {build})`
  String appVersionWithBuild(Object version, Object build) {
    return Intl.message(
      'Version $version (Build $build)',
      name: 'appVersionWithBuild',
      desc: '',
      args: [version, build],
    );
  }

  /// `Contact us for support`
  String get contactUsForSupport {
    return Intl.message(
      'Contact us for support',
      name: 'contactUsForSupport',
      desc: '',
      args: [],
    );
  }

  /// `Visit Invotek website`
  String get visitInvotekWebsite {
    return Intl.message(
      'Visit Invotek website',
      name: 'visitInvotekWebsite',
      desc: '',
      args: [],
    );
  }

  /// `View privacy policy`
  String get viewPrivacyPolicy {
    return Intl.message(
      'View privacy policy',
      name: 'viewPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `View terms of use`
  String get viewTermsOfUse {
    return Intl.message(
      'View terms of use',
      name: 'viewTermsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Invotek app`
  String get welcomeToInvotekApp {
    return Intl.message(
      'Welcome to Invotek app',
      name: 'welcomeToInvotekApp',
      desc: '',
      args: [],
    );
  }

  /// `Easy invoice and customer management`
  String get easyInvoiceCustomerManagement {
    return Intl.message(
      'Easy invoice and customer management',
      name: 'easyInvoiceCustomerManagement',
      desc: '',
      args: [],
    );
  }

  /// `Customer Management`
  String get customerManagement {
    return Intl.message(
      'Customer Management',
      name: 'customerManagement',
      desc: '',
      args: [],
    );
  }

  /// `Add, edit and delete customers`
  String get addEditDeleteCustomers {
    return Intl.message(
      'Add, edit and delete customers',
      name: 'addEditDeleteCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Management`
  String get invoiceManagement {
    return Intl.message(
      'Invoice Management',
      name: 'invoiceManagement',
      desc: '',
      args: [],
    );
  }

  /// `Create and edit invoices`
  String get createEditInvoices {
    return Intl.message(
      'Create and edit invoices',
      name: 'createEditInvoices',
      desc: '',
      args: [],
    );
  }

  /// `View reports and statistics`
  String get viewReportsStatistics {
    return Intl.message(
      'View reports and statistics',
      name: 'viewReportsStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Quick Actions`
  String get quickActionsTitle {
    return Intl.message(
      'Quick Actions',
      name: 'quickActionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Screen dimensions and performance`
  String get screenDimensionsPerformance {
    return Intl.message(
      'Screen dimensions and performance',
      name: 'screenDimensionsPerformance',
      desc: '',
      args: [],
    );
  }

  /// `Enter product description`
  String get enterProductDescription {
    return Intl.message(
      'Enter product description',
      name: 'enterProductDescription',
      desc: '',
      args: [],
    );
  }

  /// `piece, kg, meter...`
  String get pieceKgMeter {
    return Intl.message(
      'piece, kg, meter...',
      name: 'pieceKgMeter',
      desc: '',
      args: [],
    );
  }

  /// `Enter product SKU`
  String get enterProductSku {
    return Intl.message(
      'Enter product SKU',
      name: 'enterProductSku',
      desc: '',
      args: [],
    );
  }

  /// `Enter barcode`
  String get enterBarcode {
    return Intl.message(
      'Enter barcode',
      name: 'enterBarcode',
      desc: '',
      args: [],
    );
  }

  /// `Enter selling price`
  String get enterSellingPrice {
    return Intl.message(
      'Enter selling price',
      name: 'enterSellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Enter cost price`
  String get enterCostPrice {
    return Intl.message(
      'Enter cost price',
      name: 'enterCostPrice',
      desc: '',
      args: [],
    );
  }

  /// `Enter tax rate percentage`
  String get enterTaxRatePercentage {
    return Intl.message(
      'Enter tax rate percentage',
      name: 'enterTaxRatePercentage',
      desc: '',
      args: [],
    );
  }

  /// `Enter responsible person`
  String get enterResponsiblePerson {
    return Intl.message(
      'Enter responsible person',
      name: 'enterResponsiblePerson',
      desc: '',
      args: [],
    );
  }

  /// `Enter notes`
  String get enterNotes {
    return Intl.message('Enter notes', name: 'enterNotes', desc: '', args: []);
  }

  /// `example@email.com`
  String get exampleEmail {
    return Intl.message(
      'example@email.com',
      name: 'exampleEmail',
      desc: '',
      args: [],
    );
  }

  /// `0500000000`
  String get examplePhone {
    return Intl.message('0500000000', name: 'examplePhone', desc: '', args: []);
  }

  /// `Enter city`
  String get enterCity {
    return Intl.message('Enter city', name: 'enterCity', desc: '', args: []);
  }

  /// `Enter region`
  String get enterRegion {
    return Intl.message(
      'Enter region',
      name: 'enterRegion',
      desc: '',
      args: [],
    );
  }

  /// `Enter postal code`
  String get enterPostalCode {
    return Intl.message(
      'Enter postal code',
      name: 'enterPostalCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter detailed address`
  String get enterDetailedAddress {
    return Intl.message(
      'Enter detailed address',
      name: 'enterDetailedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter customer name`
  String get enterCustomerName {
    return Intl.message(
      'Enter customer name',
      name: 'enterCustomerName',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter tax number`
  String get enterTaxNumber {
    return Intl.message(
      'Enter tax number',
      name: 'enterTaxNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter commercial register`
  String get enterCommercialRegister {
    return Intl.message(
      'Enter commercial register',
      name: 'enterCommercialRegister',
      desc: '',
      args: [],
    );
  }

  /// `Enter client name`
  String get enterClientName {
    return Intl.message(
      'Enter client name',
      name: 'enterClientName',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get enterClientEmail {
    return Intl.message(
      'Enter email',
      name: 'enterClientEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterClientPhone {
    return Intl.message(
      'Enter phone number',
      name: 'enterClientPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter client address`
  String get enterClientAddress {
    return Intl.message(
      'Enter client address',
      name: 'enterClientAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter company name`
  String get enterClientCompany {
    return Intl.message(
      'Enter company name',
      name: 'enterClientCompany',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete client "{name}"?`
  String areYouSureDeleteClient(Object name) {
    return Intl.message(
      'Are you sure you want to delete client "$name"?',
      name: 'areYouSureDeleteClient',
      desc: '',
      args: [name],
    );
  }

  /// `Client updated successfully`
  String get clientUpdatedSuccessfully {
    return Intl.message(
      'Client updated successfully',
      name: 'clientUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Client added successfully`
  String get clientAddedSuccessfully {
    return Intl.message(
      'Client added successfully',
      name: 'clientAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Client Details`
  String get clientDetails {
    return Intl.message(
      'Client Details',
      name: 'clientDetails',
      desc: '',
      args: [],
    );
  }

  /// `Edit Client`
  String get editClient {
    return Intl.message('Edit Client', name: 'editClient', desc: '', args: []);
  }

  /// `Add New Client`
  String get addNewClient {
    return Intl.message(
      'Add New Client',
      name: 'addNewClient',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get department {
    return Intl.message('Department', name: 'department', desc: '', args: []);
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get userId {
    return Intl.message('User ID', name: 'userId', desc: '', args: []);
  }

  /// `View user details`
  String get viewUserDetails {
    return Intl.message(
      'View user details',
      name: 'viewUserDetails',
      desc: '',
      args: [],
    );
  }

  /// `Edit user information`
  String get editUserInformation {
    return Intl.message(
      'Edit user information',
      name: 'editUserInformation',
      desc: '',
      args: [],
    );
  }

  /// `Delete user permanently`
  String get deleteUserPermanently {
    return Intl.message(
      'Delete user permanently',
      name: 'deleteUserPermanently',
      desc: '',
      args: [],
    );
  }

  /// `8 Paid`
  String get paidInvoices {
    return Intl.message('8 Paid', name: 'paidInvoices', desc: '', args: []);
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `This Month`
  String get thisMonth {
    return Intl.message('This Month', name: 'thisMonth', desc: '', args: []);
  }

  /// `Bought This`
  String get boughtThis {
    return Intl.message('Bought This', name: 'boughtThis', desc: '', args: []);
  }

  /// `Available: {count}`
  String available(int count) {
    return Intl.message(
      'Available: $count',
      name: 'available',
      desc: '',
      args: [count],
    );
  }

  /// `Product Management`
  String get productManagement {
    return Intl.message(
      'Product Management',
      name: 'productManagement',
      desc: '',
      args: [],
    );
  }

  /// `Expense Management`
  String get expenseManagement {
    return Intl.message(
      'Expense Management',
      name: 'expenseManagement',
      desc: '',
      args: [],
    );
  }

  /// `System Access`
  String get systemAccess {
    return Intl.message(
      'System Access',
      name: 'systemAccess',
      desc: '',
      args: [],
    );
  }

  /// `Ability to view users list`
  String get viewUsersDescription {
    return Intl.message(
      'Ability to view users list',
      name: 'viewUsersDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to add new user`
  String get addUserDescription {
    return Intl.message(
      'Ability to add new user',
      name: 'addUserDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to edit user data`
  String get editUserDescription {
    return Intl.message(
      'Ability to edit user data',
      name: 'editUserDescription',
      desc: '',
      args: [],
    );
  }

  /// `Delete User`
  String get deleteUser {
    return Intl.message('Delete User', name: 'deleteUser', desc: '', args: []);
  }

  /// `Ability to delete user`
  String get deleteUserDescription {
    return Intl.message(
      'Ability to delete user',
      name: 'deleteUserDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to manage user permissions`
  String get managePermissionsDescription {
    return Intl.message(
      'Ability to manage user permissions',
      name: 'managePermissionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `View Clients`
  String get viewClients {
    return Intl.message(
      'View Clients',
      name: 'viewClients',
      desc: '',
      args: [],
    );
  }

  /// `Ability to view clients list`
  String get viewClientsDescription {
    return Intl.message(
      'Ability to view clients list',
      name: 'viewClientsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to add new client`
  String get addClientDescription {
    return Intl.message(
      'Ability to add new client',
      name: 'addClientDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to edit client data`
  String get editClientDescription {
    return Intl.message(
      'Ability to edit client data',
      name: 'editClientDescription',
      desc: '',
      args: [],
    );
  }

  /// `Delete Client`
  String get deleteClient {
    return Intl.message(
      'Delete Client',
      name: 'deleteClient',
      desc: '',
      args: [],
    );
  }

  /// `Ability to delete client`
  String get deleteClientDescription {
    return Intl.message(
      'Ability to delete client',
      name: 'deleteClientDescription',
      desc: '',
      args: [],
    );
  }

  /// `View Products`
  String get viewProducts {
    return Intl.message(
      'View Products',
      name: 'viewProducts',
      desc: '',
      args: [],
    );
  }

  /// `Ability to view products list`
  String get viewProductsDescription {
    return Intl.message(
      'Ability to view products list',
      name: 'viewProductsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to add new product`
  String get addProductDescription {
    return Intl.message(
      'Ability to add new product',
      name: 'addProductDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to edit product data`
  String get editProductDescription {
    return Intl.message(
      'Ability to edit product data',
      name: 'editProductDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to delete product`
  String get deleteProductDescription {
    return Intl.message(
      'Ability to delete product',
      name: 'deleteProductDescription',
      desc: '',
      args: [],
    );
  }

  /// `View Invoices`
  String get viewInvoices {
    return Intl.message(
      'View Invoices',
      name: 'viewInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Ability to view invoices list`
  String get viewInvoicesDescription {
    return Intl.message(
      'Ability to view invoices list',
      name: 'viewInvoicesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to create new invoice`
  String get createInvoiceDescription {
    return Intl.message(
      'Ability to create new invoice',
      name: 'createInvoiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Edit Invoice`
  String get editInvoice {
    return Intl.message(
      'Edit Invoice',
      name: 'editInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Ability to edit invoice`
  String get editInvoiceDescription {
    return Intl.message(
      'Ability to edit invoice',
      name: 'editInvoiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Delete Invoice`
  String get deleteInvoice {
    return Intl.message(
      'Delete Invoice',
      name: 'deleteInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Ability to delete invoice`
  String get deleteInvoiceDescription {
    return Intl.message(
      'Ability to delete invoice',
      name: 'deleteInvoiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Send Invoice`
  String get sendInvoice {
    return Intl.message(
      'Send Invoice',
      name: 'sendInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Ability to send invoice to client`
  String get sendInvoiceDescription {
    return Intl.message(
      'Ability to send invoice to client',
      name: 'sendInvoiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `View Expenses`
  String get viewExpenses {
    return Intl.message(
      'View Expenses',
      name: 'viewExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Ability to view expenses list`
  String get viewExpensesDescription {
    return Intl.message(
      'Ability to view expenses list',
      name: 'viewExpensesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to add new expense`
  String get addExpenseDescription {
    return Intl.message(
      'Ability to add new expense',
      name: 'addExpenseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to edit expense`
  String get editExpenseDescription {
    return Intl.message(
      'Ability to edit expense',
      name: 'editExpenseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Delete Expense`
  String get deleteExpense {
    return Intl.message(
      'Delete Expense',
      name: 'deleteExpense',
      desc: '',
      args: [],
    );
  }

  /// `Ability to delete expense`
  String get deleteExpenseDescription {
    return Intl.message(
      'Ability to delete expense',
      name: 'deleteExpenseDescription',
      desc: '',
      args: [],
    );
  }

  /// `View Reports`
  String get viewReports {
    return Intl.message(
      'View Reports',
      name: 'viewReports',
      desc: '',
      args: [],
    );
  }

  /// `Ability to view reports`
  String get viewReportsDescription {
    return Intl.message(
      'Ability to view reports',
      name: 'viewReportsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Export Reports`
  String get exportReports {
    return Intl.message(
      'Export Reports',
      name: 'exportReports',
      desc: '',
      args: [],
    );
  }

  /// `Ability to export reports`
  String get exportReportsDescription {
    return Intl.message(
      'Ability to export reports',
      name: 'exportReportsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to edit company settings`
  String get companySettingsDescription {
    return Intl.message(
      'Ability to edit company settings',
      name: 'companySettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ability to edit system settings`
  String get systemSettingsDescription {
    return Intl.message(
      'Ability to edit system settings',
      name: 'systemSettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `System Administrator`
  String get systemAdministrator {
    return Intl.message(
      'System Administrator',
      name: 'systemAdministrator',
      desc: '',
      args: [],
    );
  }

  /// `Has all permissions in the system`
  String get systemAdministratorDescription {
    return Intl.message(
      'Has all permissions in the system',
      name: 'systemAdministratorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Manages invoices, expenses and financial reports`
  String get accountantDescription {
    return Intl.message(
      'Manages invoices, expenses and financial reports',
      name: 'accountantDescription',
      desc: '',
      args: [],
    );
  }

  /// `Limited permissions for viewing and reading`
  String get userDescription {
    return Intl.message(
      'Limited permissions for viewing and reading',
      name: 'userDescription',
      desc: '',
      args: [],
    );
  }

  /// `Manages users and permissions`
  String get supervisorDescription {
    return Intl.message(
      'Manages users and permissions',
      name: 'supervisorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search in clients...`
  String get searchInClients {
    return Intl.message(
      'Search in clients...',
      name: 'searchInClients',
      desc: '',
      args: [],
    );
  }

  /// `No clients`
  String get noClients {
    return Intl.message('No clients', name: 'noClients', desc: '', args: []);
  }

  /// `Press add button to create new client`
  String get pressAddToCreateClient {
    return Intl.message(
      'Press add button to create new client',
      name: 'pressAddToCreateClient',
      desc: '',
      args: [],
    );
  }

  /// `Tax Number`
  String get taxNumber {
    return Intl.message('Tax Number', name: 'taxNumber', desc: '', args: []);
  }

  /// `Contact Person Information`
  String get contactPersonInformation {
    return Intl.message(
      'Contact Person Information',
      name: 'contactPersonInformation',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Name`
  String get contactPersonName {
    return Intl.message(
      'Contact Person Name',
      name: 'contactPersonName',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Phone`
  String get contactPersonPhone {
    return Intl.message(
      'Contact Person Phone',
      name: 'contactPersonPhone',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Email`
  String get contactPersonEmail {
    return Intl.message(
      'Contact Person Email',
      name: 'contactPersonEmail',
      desc: '',
      args: [],
    );
  }

  /// `Creation Date`
  String get creationDate {
    return Intl.message(
      'Creation Date',
      name: 'creationDate',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get clientName {
    return Intl.message('Client Name', name: 'clientName', desc: '', args: []);
  }

  /// `Enter website`
  String get enterWebsite {
    return Intl.message(
      'Enter website',
      name: 'enterWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Enter contact person name`
  String get enterContactPersonName {
    return Intl.message(
      'Enter contact person name',
      name: 'enterContactPersonName',
      desc: '',
      args: [],
    );
  }

  /// `Enter contact person phone`
  String get enterContactPersonPhone {
    return Intl.message(
      'Enter contact person phone',
      name: 'enterContactPersonPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter contact person email`
  String get enterContactPersonEmail {
    return Intl.message(
      'Enter contact person email',
      name: 'enterContactPersonEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter additional notes`
  String get enterAdditionalNotes {
    return Intl.message(
      'Enter additional notes',
      name: 'enterAdditionalNotes',
      desc: '',
      args: [],
    );
  }

  /// `Edit client data for "{name}"`
  String editClientData(Object name) {
    return Intl.message(
      'Edit client data for "$name"',
      name: 'editClientData',
      desc: '',
      args: [name],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Error updating client: {error}`
  String errorUpdatingClient(Object error) {
    return Intl.message(
      'Error updating client: $error',
      name: 'errorUpdatingClient',
      desc: '',
      args: [error],
    );
  }

  /// `Fill the form below to add new client to the system`
  String get fillFormToAddClient {
    return Intl.message(
      'Fill the form below to add new client to the system',
      name: 'fillFormToAddClient',
      desc: '',
      args: [],
    );
  }

  /// `Error creating client: {error}`
  String errorCreatingClient(Object error) {
    return Intl.message(
      'Error creating client: $error',
      name: 'errorCreatingClient',
      desc: '',
      args: [error],
    );
  }

  /// `Error loading clients: {error}`
  String errorLoadingClients(Object error) {
    return Intl.message(
      'Error loading clients: $error',
      name: 'errorLoadingClients',
      desc: '',
      args: [error],
    );
  }

  /// `Error deleting client: {error}`
  String errorDeletingClient(Object error) {
    return Intl.message(
      'Error deleting client: $error',
      name: 'errorDeletingClient',
      desc: '',
      args: [error],
    );
  }

  /// `Error loading statistics: {error}`
  String errorLoadingStatistics(Object error) {
    return Intl.message(
      'Error loading statistics: $error',
      name: 'errorLoadingStatistics',
      desc: '',
      args: [error],
    );
  }

  /// `Error deleting clients: {error}`
  String errorDeletingClients(Object error) {
    return Intl.message(
      'Error deleting clients: $error',
      name: 'errorDeletingClients',
      desc: '',
      args: [error],
    );
  }

  /// `Error updating client status: {error}`
  String errorUpdatingClientStatus(Object error) {
    return Intl.message(
      'Error updating client status: $error',
      name: 'errorUpdatingClientStatus',
      desc: '',
      args: [error],
    );
  }

  /// `Data conversion error: {error}`
  String dataConversionError(Object error) {
    return Intl.message(
      'Data conversion error: $error',
      name: 'dataConversionError',
      desc: '',
      args: [error],
    );
  }

  /// `Name must be at least 3 characters`
  String get nameMinLength {
    return Intl.message(
      'Name must be at least 3 characters',
      name: 'nameMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Name must be less than 50 characters`
  String get nameMaxLength {
    return Intl.message(
      'Name must be less than 50 characters',
      name: 'nameMaxLength',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be at least 10 digits`
  String get phoneMinLength {
    return Intl.message(
      'Phone number must be at least 10 digits',
      name: 'phoneMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be less than 15 digits`
  String get phoneMaxLength {
    return Intl.message(
      'Phone number must be less than 15 digits',
      name: 'phoneMaxLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must be less than 50 characters`
  String get passwordMaxLength {
    return Intl.message(
      'Password must be less than 50 characters',
      name: 'passwordMaxLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get passwordUppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'passwordUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get passwordLowercase {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'passwordLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get passwordNumber {
    return Intl.message(
      'Password must contain at least one number',
      name: 'passwordNumber',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `This field`
  String get thisField {
    return Intl.message('This field', name: 'thisField', desc: '', args: []);
  }

  /// `Search...`
  String get search {
    return Intl.message('Search...', name: 'search', desc: '', args: []);
  }

  /// `Loading users...`
  String get loadingUsers {
    return Intl.message(
      'Loading users...',
      name: 'loadingUsers',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed`
  String get signInFailed {
    return Intl.message(
      'Sign in failed',
      name: 'signInFailed',
      desc: '',
      args: [],
    );
  }

  /// `Login cancelled`
  String get loginCancelled {
    return Intl.message(
      'Login cancelled',
      name: 'loginCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get user data`
  String get failedToGetUserData {
    return Intl.message(
      'Failed to get user data',
      name: 'failedToGetUserData',
      desc: '',
      args: [],
    );
  }

  /// `Login error`
  String get loginError {
    return Intl.message('Login error', name: 'loginError', desc: '', args: []);
  }

  /// `Play services not available`
  String get playServicesNotAvailable {
    return Intl.message(
      'Play services not available',
      name: 'playServicesNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Google sign in error`
  String get googleSignInError {
    return Intl.message(
      'Google sign in error',
      name: 'googleSignInError',
      desc: '',
      args: [],
    );
  }

  /// `Add Invoice`
  String get addInvoice {
    return Intl.message('Add Invoice', name: 'addInvoice', desc: '', args: []);
  }

  /// `Invoices`
  String get invoices {
    return Intl.message('Invoices', name: 'invoices', desc: '', args: []);
  }

  /// `Search in invoices...`
  String get searchInInvoices {
    return Intl.message(
      'Search in invoices...',
      name: 'searchInInvoices',
      desc: '',
      args: [],
    );
  }

  /// `All Payment Methods`
  String get allPaymentMethods {
    return Intl.message(
      'All Payment Methods',
      name: 'allPaymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer {
    return Intl.message('Customer', name: 'customer', desc: '', args: []);
  }

  /// `All Customers`
  String get allCustomers {
    return Intl.message(
      'All Customers',
      name: 'allCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message('Paid', name: 'paid', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Overdue`
  String get overdue {
    return Intl.message('Overdue', name: 'overdue', desc: '', args: []);
  }

  /// `Draft`
  String get draft {
    return Intl.message('Draft', name: 'draft', desc: '', args: []);
  }

  /// `Card`
  String get card {
    return Intl.message('Card', name: 'card', desc: '', args: []);
  }

  /// `Total:`
  String get total {
    return Intl.message('Total:', name: 'total', desc: '', args: []);
  }

  /// `Subtotal:`
  String get subtotal {
    return Intl.message('Subtotal:', name: 'subtotal', desc: '', args: []);
  }

  /// `Tax`
  String get tax {
    return Intl.message('Tax', name: 'tax', desc: '', args: []);
  }

  /// `No items`
  String get noItems {
    return Intl.message('No items', name: 'noItems', desc: '', args: []);
  }

  /// `Qty`
  String get qty {
    return Intl.message('Qty', name: 'qty', desc: '', args: []);
  }

  /// `Search items...`
  String get searchItems {
    return Intl.message(
      'Search items...',
      name: 'searchItems',
      desc: '',
      args: [],
    );
  }

  /// `Show Less`
  String get showLess {
    return Intl.message('Show Less', name: 'showLess', desc: '', args: []);
  }

  /// `Show All Items ({count})`
  String showAllItems(Object count) {
    return Intl.message(
      'Show All Items ($count)',
      name: 'showAllItems',
      desc: '',
      args: [count],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Payment Details`
  String get paymentDetails {
    return Intl.message(
      'Payment Details',
      name: 'paymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Mark as Paid`
  String get markAsPaid {
    return Intl.message('Mark as Paid', name: 'markAsPaid', desc: '', args: []);
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Duplicate`
  String get duplicate {
    return Intl.message('Duplicate', name: 'duplicate', desc: '', args: []);
  }

  /// `Download PDF`
  String get downloadPDF {
    return Intl.message(
      'Download PDF',
      name: 'downloadPDF',
      desc: '',
      args: [],
    );
  }

  /// `No Invoices`
  String get noInvoices {
    return Intl.message('No Invoices', name: 'noInvoices', desc: '', args: []);
  }

  /// `Press the add button to create a new invoice`
  String get noInvoicesDescription {
    return Intl.message(
      'Press the add button to create a new invoice',
      name: 'noInvoicesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add First Invoice`
  String get addFirstInvoice {
    return Intl.message(
      'Add First Invoice',
      name: 'addFirstInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Delete Invoice Confirmation`
  String get deleteInvoiceConfirmation {
    return Intl.message(
      'Delete Invoice Confirmation',
      name: 'deleteInvoiceConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this invoice? This action cannot be undone.`
  String get deleteInvoiceWarning {
    return Intl.message(
      'Are you sure you want to delete this invoice? This action cannot be undone.',
      name: 'deleteInvoiceWarning',
      desc: '',
      args: [],
    );
  }

  /// `Send Method`
  String get sendMethod {
    return Intl.message('Send Method', name: 'sendMethod', desc: '', args: []);
  }

  /// `SMS`
  String get sms {
    return Intl.message('SMS', name: 'sms', desc: '', args: []);
  }

  /// `Email Details`
  String get emailDetails {
    return Intl.message(
      'Email Details',
      name: 'emailDetails',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message('Subject', name: 'subject', desc: '', args: []);
  }

  /// `Enter subject`
  String get enterSubject {
    return Intl.message(
      'Enter subject',
      name: 'enterSubject',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Enter message`
  String get enterMessage {
    return Intl.message(
      'Enter message',
      name: 'enterMessage',
      desc: '',
      args: [],
    );
  }

  /// `Include PDF`
  String get includePDF {
    return Intl.message('Include PDF', name: 'includePDF', desc: '', args: []);
  }

  /// `Payment Date`
  String get paymentDate {
    return Intl.message(
      'Payment Date',
      name: 'paymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Add Notes`
  String get addNotes {
    return Intl.message('Add Notes', name: 'addNotes', desc: '', args: []);
  }

  /// `Invoice Help`
  String get invoiceHelp {
    return Intl.message(
      'Invoice Help',
      name: 'invoiceHelp',
      desc: '',
      args: [],
    );
  }

  /// `Creating Invoices`
  String get creatingInvoices {
    return Intl.message(
      'Creating Invoices',
      name: 'creatingInvoices',
      desc: '',
      args: [],
    );
  }

  /// `1. Enter basic customer information`
  String get createInvoiceStep1 {
    return Intl.message(
      '1. Enter basic customer information',
      name: 'createInvoiceStep1',
      desc: '',
      args: [],
    );
  }

  /// `2. Add items and quantities`
  String get createInvoiceStep2 {
    return Intl.message(
      '2. Add items and quantities',
      name: 'createInvoiceStep2',
      desc: '',
      args: [],
    );
  }

  /// `3. Set payment method and date`
  String get createInvoiceStep3 {
    return Intl.message(
      '3. Set payment method and date',
      name: 'createInvoiceStep3',
      desc: '',
      args: [],
    );
  }

  /// `4. Review and save the invoice`
  String get createInvoiceStep4 {
    return Intl.message(
      '4. Review and save the invoice',
      name: 'createInvoiceStep4',
      desc: '',
      args: [],
    );
  }

  /// `Managing Invoices`
  String get managingInvoices {
    return Intl.message(
      'Managing Invoices',
      name: 'managingInvoices',
      desc: '',
      args: [],
    );
  }

  /// `1. Use search and filters to find invoices`
  String get manageInvoiceStep1 {
    return Intl.message(
      '1. Use search and filters to find invoices',
      name: 'manageInvoiceStep1',
      desc: '',
      args: [],
    );
  }

  /// `2. Tap on invoice to view details`
  String get manageInvoiceStep2 {
    return Intl.message(
      '2. Tap on invoice to view details',
      name: 'manageInvoiceStep2',
      desc: '',
      args: [],
    );
  }

  /// `3. Use buttons to edit or delete`
  String get manageInvoiceStep3 {
    return Intl.message(
      '3. Use buttons to edit or delete',
      name: 'manageInvoiceStep3',
      desc: '',
      args: [],
    );
  }

  /// `4. Send invoice to customer when needed`
  String get manageInvoiceStep4 {
    return Intl.message(
      '4. Send invoice to customer when needed',
      name: 'manageInvoiceStep4',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get paymentMethodCash {
    return Intl.message('Cash', name: 'paymentMethodCash', desc: '', args: []);
  }

  /// `Card`
  String get paymentMethodCard {
    return Intl.message('Card', name: 'paymentMethodCard', desc: '', args: []);
  }

  /// `Bank Transfer`
  String get paymentMethodBank {
    return Intl.message(
      'Bank Transfer',
      name: 'paymentMethodBank',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get paymentMethodCheck {
    return Intl.message(
      'Check',
      name: 'paymentMethodCheck',
      desc: '',
      args: [],
    );
  }

  /// `Tax Integration`
  String get taxIntegration {
    return Intl.message(
      'Tax Integration',
      name: 'taxIntegration',
      desc: '',
      args: [],
    );
  }

  /// `1. Enable tax integration`
  String get taxIntegrationStep1 {
    return Intl.message(
      '1. Enable tax integration',
      name: 'taxIntegrationStep1',
      desc: '',
      args: [],
    );
  }

  /// `2. Enter company tax information`
  String get taxIntegrationStep2 {
    return Intl.message(
      '2. Enter company tax information',
      name: 'taxIntegrationStep2',
      desc: '',
      args: [],
    );
  }

  /// `3. Test connection and save settings`
  String get taxIntegrationStep3 {
    return Intl.message(
      '3. Test connection and save settings',
      name: 'taxIntegrationStep3',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Details`
  String get invoiceDetails {
    return Intl.message(
      'Invoice Details',
      name: 'invoiceDetails',
      desc: '',
      args: [],
    );
  }

  /// `Customer Information`
  String get customerInformation {
    return Intl.message(
      'Customer Information',
      name: 'customerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Amount Information`
  String get amountInformation {
    return Intl.message(
      'Amount Information',
      name: 'amountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Number`
  String get invoiceNumber {
    return Intl.message(
      'Invoice Number',
      name: 'invoiceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter invoice number`
  String get enterInvoiceNumber {
    return Intl.message(
      'Enter invoice number',
      name: 'enterInvoiceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Issue Date`
  String get issueDate {
    return Intl.message('Issue Date', name: 'issueDate', desc: '', args: []);
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message('Select Date', name: 'selectDate', desc: '', args: []);
  }

  /// `Enter email`
  String get enterCustomerEmail {
    return Intl.message(
      'Enter email',
      name: 'enterCustomerEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterCustomerPhone {
    return Intl.message(
      'Enter phone number',
      name: 'enterCustomerPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter subtotal`
  String get enterSubtotal {
    return Intl.message(
      'Enter subtotal',
      name: 'enterSubtotal',
      desc: '',
      args: [],
    );
  }

  /// `Enter tax amount`
  String get enterTaxAmount {
    return Intl.message(
      'Enter tax amount',
      name: 'enterTaxAmount',
      desc: '',
      args: [],
    );
  }

  /// `Tax Integration Settings`
  String get taxIntegrationSettings {
    return Intl.message(
      'Tax Integration Settings',
      name: 'taxIntegrationSettings',
      desc: '',
      args: [],
    );
  }

  /// `Configure Tax Integration`
  String get configureTaxIntegration {
    return Intl.message(
      'Configure Tax Integration',
      name: 'configureTaxIntegration',
      desc: '',
      args: [],
    );
  }

  /// `Enable Tax Integration`
  String get enableTaxIntegration {
    return Intl.message(
      'Enable Tax Integration',
      name: 'enableTaxIntegration',
      desc: '',
      args: [],
    );
  }

  /// `Tax Type`
  String get taxType {
    return Intl.message('Tax Type', name: 'taxType', desc: '', args: []);
  }

  /// `VAT`
  String get vat {
    return Intl.message('VAT', name: 'vat', desc: '', args: []);
  }

  /// `Sales Tax`
  String get salesTax {
    return Intl.message('Sales Tax', name: 'salesTax', desc: '', args: []);
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Saudi Arabia`
  String get saudiArabia {
    return Intl.message(
      'Saudi Arabia',
      name: 'saudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `United Arab Emirates`
  String get uae {
    return Intl.message(
      'United Arab Emirates',
      name: 'uae',
      desc: '',
      args: [],
    );
  }

  /// `Kuwait`
  String get kuwait {
    return Intl.message('Kuwait', name: 'kuwait', desc: '', args: []);
  }

  /// `Test Connection`
  String get testConnection {
    return Intl.message(
      'Test Connection',
      name: 'testConnection',
      desc: '',
      args: [],
    );
  }

  /// `VAT Number`
  String get vatNumber {
    return Intl.message('VAT Number', name: 'vatNumber', desc: '', args: []);
  }

  /// `Enter VAT number`
  String get enterVatNumber {
    return Intl.message(
      'Enter VAT number',
      name: 'enterVatNumber',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Postal Code`
  String get postalCode {
    return Intl.message('Postal Code', name: 'postalCode', desc: '', args: []);
  }

  /// `Contact Information`
  String get contactInformation {
    return Intl.message(
      'Contact Information',
      name: 'contactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone`
  String get enterPhone {
    return Intl.message('Enter phone', name: 'enterPhone', desc: '', args: []);
  }

  /// `Testing connection...`
  String get testingConnection {
    return Intl.message(
      'Testing connection...',
      name: 'testingConnection',
      desc: '',
      args: [],
    );
  }

  /// `Tax Amount:`
  String get taxAmount {
    return Intl.message('Tax Amount:', name: 'taxAmount', desc: '', args: []);
  }

  /// `Enter description`
  String get enterDescription {
    return Intl.message(
      'Enter description',
      name: 'enterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search invoices...`
  String get searchInvoices {
    return Intl.message(
      'Search invoices...',
      name: 'searchInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Loading invoice details...`
  String get loadingInvoiceDetails {
    return Intl.message(
      'Loading invoice details...',
      name: 'loadingInvoiceDetails',
      desc: '',
      args: [],
    );
  }

  /// `Error loading invoice`
  String get errorLoadingInvoice {
    return Intl.message(
      'Error loading invoice',
      name: 'errorLoadingInvoice',
      desc: '',
      args: [],
    );
  }

  /// `No invoice data available`
  String get noInvoiceData {
    return Intl.message(
      'No invoice data available',
      name: 'noInvoiceData',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Number: {number}`
  String invoiceNumberLabel(String number) {
    return Intl.message(
      'Invoice Number: $number',
      name: 'invoiceNumberLabel',
      desc: '',
      args: [number],
    );
  }

  /// `Share Invoice`
  String get shareInvoice {
    return Intl.message(
      'Share Invoice',
      name: 'shareInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Print Invoice`
  String get printInvoice {
    return Intl.message(
      'Print Invoice',
      name: 'printInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate Invoice`
  String get duplicateInvoice {
    return Intl.message(
      'Duplicate Invoice',
      name: 'duplicateInvoice',
      desc: '',
      args: [],
    );
  }

  /// `View QR Code`
  String get viewQRCode {
    return Intl.message('View QR Code', name: 'viewQRCode', desc: '', args: []);
  }

  /// `View Tax UID`
  String get viewTaxUID {
    return Intl.message('View Tax UID', name: 'viewTaxUID', desc: '', args: []);
  }

  /// `Update Status`
  String get updateStatus {
    return Intl.message(
      'Update Status',
      name: 'updateStatus',
      desc: '',
      args: [],
    );
  }

  /// `Change Status`
  String get changeStatus {
    return Intl.message(
      'Change Status',
      name: 'changeStatus',
      desc: '',
      args: [],
    );
  }

  /// `More Options`
  String get moreOptions {
    return Intl.message(
      'More Options',
      name: 'moreOptions',
      desc: '',
      args: [],
    );
  }

  /// `Refresh Data`
  String get refreshData {
    return Intl.message(
      'Refresh Data',
      name: 'refreshData',
      desc: '',
      args: [],
    );
  }

  /// `Invoice details copied to clipboard`
  String get invoiceCopiedToClipboard {
    return Intl.message(
      'Invoice details copied to clipboard',
      name: 'invoiceCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Invoice details copied for printing`
  String get invoiceCopiedForPrinting {
    return Intl.message(
      'Invoice details copied for printing',
      name: 'invoiceCopiedForPrinting',
      desc: '',
      args: [],
    );
  }

  /// `Invoice sent successfully`
  String get invoiceSentSuccessfully {
    return Intl.message(
      'Invoice sent successfully',
      name: 'invoiceSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Invoice deleted successfully`
  String get invoiceDeletedSuccessfully {
    return Intl.message(
      'Invoice deleted successfully',
      name: 'invoiceDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Invoice status updated to: {status}`
  String invoiceStatusUpdated(String status) {
    return Intl.message(
      'Invoice status updated to: $status',
      name: 'invoiceStatusUpdated',
      desc: '',
      args: [status],
    );
  }

  /// `File saved to: {path}`
  String fileSavedSuccessfully(String path) {
    return Intl.message(
      'File saved to: $path',
      name: 'fileSavedSuccessfully',
      desc: '',
      args: [path],
    );
  }

  /// `No QR code available for this invoice`
  String get noQRCodeAvailable {
    return Intl.message(
      'No QR code available for this invoice',
      name: 'noQRCodeAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No tax UID available for this invoice`
  String get noTaxUIDAvailable {
    return Intl.message(
      'No tax UID available for this invoice',
      name: 'noTaxUIDAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Tax UID copied`
  String get taxUIDCopied {
    return Intl.message(
      'Tax UID copied',
      name: 'taxUIDCopied',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Number: {number}\nCustomer: {customer}\nDate: {date}\nAmount: {amount} SAR\nStatus: {status}\n\nCreated by Invotek App`
  String shareInvoiceText(
    String number,
    String customer,
    String date,
    String amount,
    String status,
  ) {
    return Intl.message(
      'Invoice Number: $number\nCustomer: $customer\nDate: $date\nAmount: $amount SAR\nStatus: $status\n\nCreated by Invotek App',
      name: 'shareInvoiceText',
      desc: '',
      args: [number, customer, date, amount, status],
    );
  }

  /// `Invoice\n{separator}\nInvoice Number: {number}\nDate: {date}\nStatus: {status}\n\nCustomer Information:\nName: {customer}\n{contact}\n\nInvoice Items:\n{items}\n\nTotals:\nSubtotal: {subtotal} SAR\n{tax}\nTotal: {total} SAR\n\n{separator}\nThank you for your business\nThis invoice was created by Invotek App\n{separator}`
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
    return Intl.message(
      'Invoice\n$separator\nInvoice Number: $number\nDate: $date\nStatus: $status\n\nCustomer Information:\nName: $customer\n$contact\n\nInvoice Items:\n$items\n\nTotals:\nSubtotal: $subtotal SAR\n$tax\nTotal: $total SAR\n\n$separator\nThank you for your business\nThis invoice was created by Invotek App\n$separator',
      name: 'printInvoiceText',
      desc: '',
      args: [
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
      ],
    );
  }

  /// `Paid`
  String get statusPaid {
    return Intl.message('Paid', name: 'statusPaid', desc: '', args: []);
  }

  /// `Pending`
  String get statusPending {
    return Intl.message('Pending', name: 'statusPending', desc: '', args: []);
  }

  /// `Overdue`
  String get statusOverdue {
    return Intl.message('Overdue', name: 'statusOverdue', desc: '', args: []);
  }

  /// `Draft`
  String get statusDraft {
    return Intl.message('Draft', name: 'statusDraft', desc: '', args: []);
  }

  /// `Sent`
  String get statusSent {
    return Intl.message('Sent', name: 'statusSent', desc: '', args: []);
  }

  /// `Item Details`
  String get itemDetails {
    return Intl.message(
      'Item Details',
      name: 'itemDetails',
      desc: '',
      args: [],
    );
  }

  /// `Change Payment Method`
  String get changePaymentMethod {
    return Intl.message(
      'Change Payment Method',
      name: 'changePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Creating file...`
  String get creatingFile {
    return Intl.message(
      'Creating file...',
      name: 'creatingFile',
      desc: '',
      args: [],
    );
  }

  /// `Sending invoice...`
  String get sendingInvoice {
    return Intl.message(
      'Sending invoice...',
      name: 'sendingInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Deleting invoice...`
  String get deletingInvoice {
    return Intl.message(
      'Deleting invoice...',
      name: 'deletingInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Updating status...`
  String get updatingStatus {
    return Intl.message(
      'Updating status...',
      name: 'updatingStatus',
      desc: '',
      args: [],
    );
  }

  /// `Failed to share invoice: {error}`
  String errorSharingInvoice(String error) {
    return Intl.message(
      'Failed to share invoice: $error',
      name: 'errorSharingInvoice',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to print invoice: {error}`
  String errorPrintingInvoice(String error) {
    return Intl.message(
      'Failed to print invoice: $error',
      name: 'errorPrintingInvoice',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to send invoice: {error}`
  String errorSendingInvoice(String error) {
    return Intl.message(
      'Failed to send invoice: $error',
      name: 'errorSendingInvoice',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to delete invoice: {error}`
  String errorDeletingInvoice(String error) {
    return Intl.message(
      'Failed to delete invoice: $error',
      name: 'errorDeletingInvoice',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to create file: {error}`
  String errorCreatingFile(String error) {
    return Intl.message(
      'Failed to create file: $error',
      name: 'errorCreatingFile',
      desc: '',
      args: [error],
    );
  }

  /// `Failed to update status: {error}`
  String errorUpdatingStatus(String error) {
    return Intl.message(
      'Failed to update status: $error',
      name: 'errorUpdatingStatus',
      desc: '',
      args: [error],
    );
  }

  /// `Duplicate invoice {number}`
  String duplicateInvoiceMessage(String number) {
    return Intl.message(
      'Duplicate invoice $number',
      name: 'duplicateInvoiceMessage',
      desc: '',
      args: [number],
    );
  }

  /// `View customer details: {name}`
  String viewCustomerDetails(String name) {
    return Intl.message(
      'View customer details: $name',
      name: 'viewCustomerDetails',
      desc: '',
      args: [name],
    );
  }

  /// `View item details: {name}`
  String viewItemDetails(String name) {
    return Intl.message(
      'View item details: $name',
      name: 'viewItemDetails',
      desc: '',
      args: [name],
    );
  }

  /// `Change payment method for invoice {number}`
  String changePaymentMethodForInvoice(String number) {
    return Intl.message(
      'Change payment method for invoice $number',
      name: 'changePaymentMethodForInvoice',
      desc: '',
      args: [number],
    );
  }

  /// `Tax UID`
  String get taxUID {
    return Intl.message('Tax UID', name: 'taxUID', desc: '', args: []);
  }

  /// `Tax UID for invoice {number}:`
  String taxUIDForInvoice(String number) {
    return Intl.message(
      'Tax UID for invoice $number:',
      name: 'taxUIDForInvoice',
      desc: '',
      args: [number],
    );
  }

  /// `Item Name`
  String get itemName {
    return Intl.message('Item Name', name: 'itemName', desc: '', args: []);
  }

  /// `Quantity`
  String get itemQuantity {
    return Intl.message('Quantity', name: 'itemQuantity', desc: '', args: []);
  }

  /// `Price`
  String get itemPrice {
    return Intl.message('Price', name: 'itemPrice', desc: '', args: []);
  }

  /// `Total`
  String get itemTotal {
    return Intl.message('Total', name: 'itemTotal', desc: '', args: []);
  }

  /// `Thank you for your business`
  String get thankYouMessage {
    return Intl.message(
      'Thank you for your business',
      name: 'thankYouMessage',
      desc: '',
      args: [],
    );
  }

  /// `This invoice was created by Invotek App`
  String get createdByInvotek {
    return Intl.message(
      'This invoice was created by Invotek App',
      name: 'createdByInvotek',
      desc: '',
      args: [],
    );
  }

  /// `=`
  String get separator {
    return Intl.message('=', name: 'separator', desc: '', args: []);
  }

  /// `-`
  String get itemSeparator {
    return Intl.message('-', name: 'itemSeparator', desc: '', args: []);
  }

  /// `Name\t\tQuantity\tPrice\tTotal`
  String get itemHeader {
    return Intl.message(
      'Name\t\tQuantity\tPrice\tTotal',
      name: 'itemHeader',
      desc: '',
      args: [],
    );
  }

  /// `{name}\t\t{quantity}\t{price}\t{total}`
  String itemRow(String name, String quantity, String price, String total) {
    return Intl.message(
      '$name\t\t$quantity\t$price\t$total',
      name: 'itemRow',
      desc: '',
      args: [name, quantity, price, total],
    );
  }

  /// `Tax: {amount} SAR`
  String taxLine(String amount) {
    return Intl.message(
      'Tax: $amount SAR',
      name: 'taxLine',
      desc: '',
      args: [amount],
    );
  }

  /// `Subtotal: {amount} SAR`
  String subtotalLine(String amount) {
    return Intl.message(
      'Subtotal: $amount SAR',
      name: 'subtotalLine',
      desc: '',
      args: [amount],
    );
  }

  /// `Total: {amount} SAR`
  String totalLine(String amount) {
    return Intl.message(
      'Total: $amount SAR',
      name: 'totalLine',
      desc: '',
      args: [amount],
    );
  }

  /// `Invoice_{number}_{timestamp}`
  String fileName(String number, String timestamp) {
    return Intl.message(
      'Invoice_${number}_$timestamp',
      name: 'fileName',
      desc: '',
      args: [number, timestamp],
    );
  }

  /// `Loading product details...`
  String loadingProductDetails(String name) {
    return Intl.message(
      'Loading product details...',
      name: 'loadingProductDetails',
      desc: '',
      args: [name],
    );
  }

  /// `Create New Invoice`
  String get createNewInvoiceStepper {
    return Intl.message(
      'Create New Invoice',
      name: 'createNewInvoiceStepper',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Information`
  String get invoiceBasicInfo {
    return Intl.message(
      'Invoice Information',
      name: 'invoiceBasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Review Calculations`
  String get reviewCalculations {
    return Intl.message(
      'Review Calculations',
      name: 'reviewCalculations',
      desc: '',
      args: [],
    );
  }

  /// `This form helps you create a new invoice step by step:\n\n1. Invoice Information: Choose action, payment method, and status\n2. Select Customer: Choose existing customer or add new one\n3. Invoice Items: Add items, quantities, and prices\n4. Review Calculations: Review final details before saving`
  String get invoiceCreationHelp {
    return Intl.message(
      'This form helps you create a new invoice step by step:\n\n1. Invoice Information: Choose action, payment method, and status\n2. Select Customer: Choose existing customer or add new one\n3. Invoice Items: Add items, quantities, and prices\n4. Review Calculations: Review final details before saving',
      name: 'invoiceCreationHelp',
      desc: '',
      args: [],
    );
  }

  /// `Invoice created successfully`
  String get invoiceCreatedSuccessfully {
    return Intl.message(
      'Invoice created successfully',
      name: 'invoiceCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String errorCreatingInvoice(String error) {
    return Intl.message(
      'Error: $error',
      name: 'errorCreatingInvoice',
      desc: '',
      args: [error],
    );
  }

  /// `Please fill all required fields in Invoice Information`
  String get fillRequiredFieldsBasicInfo {
    return Intl.message(
      'Please fill all required fields in Invoice Information',
      name: 'fillRequiredFieldsBasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Please select a customer or enter customer data`
  String get selectOrAddCustomer {
    return Intl.message(
      'Please select a customer or enter customer data',
      name: 'selectOrAddCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Please add at least one item`
  String get addAtLeastOneItem {
    return Intl.message(
      'Please add at least one item',
      name: 'addAtLeastOneItem',
      desc: '',
      args: [],
    );
  }

  /// `Action is required`
  String get actionRequired {
    return Intl.message(
      'Action is required',
      name: 'actionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Payment method is required`
  String get paymentMethodRequired {
    return Intl.message(
      'Payment method is required',
      name: 'paymentMethodRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invoice status is required`
  String get statusRequired {
    return Intl.message(
      'Invoice status is required',
      name: 'statusRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please select a customer or enter customer data`
  String get customerRequired {
    return Intl.message(
      'Please select a customer or enter customer data',
      name: 'customerRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please add at least one item`
  String get itemsRequired {
    return Intl.message(
      'Please add at least one item',
      name: 'itemsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get action {
    return Intl.message('Action', name: 'action', desc: '', args: []);
  }

  /// `Save Only`
  String get saveOnly {
    return Intl.message('Save Only', name: 'saveOnly', desc: '', args: []);
  }

  /// `Save and Send`
  String get saveAndSend {
    return Intl.message(
      'Save and Send',
      name: 'saveAndSend',
      desc: '',
      args: [],
    );
  }

  /// `Debts`
  String get debts {
    return Intl.message('Debts', name: 'debts', desc: '', args: []);
  }

  /// `Invoice Status`
  String get invoiceStatus {
    return Intl.message(
      'Invoice Status',
      name: 'invoiceStatus',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get sent {
    return Intl.message('Sent', name: 'sent', desc: '', args: []);
  }

  /// `Invoice Description`
  String get invoiceDescription {
    return Intl.message(
      'Invoice Description',
      name: 'invoiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter invoice description (optional)`
  String get enterInvoiceDescription {
    return Intl.message(
      'Enter invoice description (optional)',
      name: 'enterInvoiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Customer Type`
  String get customerType {
    return Intl.message(
      'Customer Type',
      name: 'customerType',
      desc: '',
      args: [],
    );
  }

  /// `Existing Customer`
  String get existingCustomer {
    return Intl.message(
      'Existing Customer',
      name: 'existingCustomer',
      desc: '',
      args: [],
    );
  }

  /// `New Customer`
  String get newCustomer {
    return Intl.message(
      'New Customer',
      name: 'newCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Enter address`
  String get enterCustomerAddress {
    return Intl.message(
      'Enter address',
      name: 'enterCustomerAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add Item`
  String get addItem {
    return Intl.message('Add Item', name: 'addItem', desc: '', args: []);
  }

  /// `Add First Item`
  String get addFirstItem {
    return Intl.message(
      'Add First Item',
      name: 'addFirstItem',
      desc: '',
      args: [],
    );
  }

  /// `Tax Percent (%)`
  String get taxPercent {
    return Intl.message(
      'Tax Percent (%)',
      name: 'taxPercent',
      desc: '',
      args: [],
    );
  }

  /// `Enter item name`
  String get enterItemName {
    return Intl.message(
      'Enter item name',
      name: 'enterItemName',
      desc: '',
      args: [],
    );
  }

  /// `Enter discount`
  String get enterDiscount {
    return Intl.message(
      'Enter discount',
      name: 'enterDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Enter tax percent`
  String get enterTaxPercent {
    return Intl.message(
      'Enter tax percent',
      name: 'enterTaxPercent',
      desc: '',
      args: [],
    );
  }

  /// `Enter total`
  String get enterTotal {
    return Intl.message('Enter total', name: 'enterTotal', desc: '', args: []);
  }

  /// `Remove Item`
  String get removeItem {
    return Intl.message('Remove Item', name: 'removeItem', desc: '', args: []);
  }

  /// `Edit Item`
  String get editItem {
    return Intl.message('Edit Item', name: 'editItem', desc: '', args: []);
  }

  /// `Invoice Information`
  String get invoiceInfo {
    return Intl.message(
      'Invoice Information',
      name: 'invoiceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Customer Information`
  String get customerInfo {
    return Intl.message(
      'Customer Information',
      name: 'customerInfo',
      desc: '',
      args: [],
    );
  }

  /// `Items Information`
  String get itemsInfo {
    return Intl.message(
      'Items Information',
      name: 'itemsInfo',
      desc: '',
      args: [],
    );
  }

  /// `Financial Information`
  String get financialInfo {
    return Intl.message(
      'Financial Information',
      name: 'financialInfo',
      desc: '',
      args: [],
    );
  }

  /// `Action Type`
  String get actionType {
    return Intl.message('Action Type', name: 'actionType', desc: '', args: []);
  }

  /// `Payment Method Type`
  String get paymentMethodType {
    return Intl.message(
      'Payment Method Type',
      name: 'paymentMethodType',
      desc: '',
      args: [],
    );
  }

  /// `Status Type`
  String get statusType {
    return Intl.message('Status Type', name: 'statusType', desc: '', args: []);
  }

  /// `Issue Date`
  String get issueDateValue {
    return Intl.message(
      'Issue Date',
      name: 'issueDateValue',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionValue {
    return Intl.message(
      'Description',
      name: 'descriptionValue',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get customerNameValue {
    return Intl.message(
      'Customer Name',
      name: 'customerNameValue',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get customerEmailValue {
    return Intl.message(
      'Email',
      name: 'customerEmailValue',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get customerPhoneValue {
    return Intl.message(
      'Phone',
      name: 'customerPhoneValue',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get customerAddressValue {
    return Intl.message(
      'Address',
      name: 'customerAddressValue',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get itemDiscount {
    return Intl.message('Discount', name: 'itemDiscount', desc: '', args: []);
  }

  /// `Tax`
  String get itemTax {
    return Intl.message('Tax', name: 'itemTax', desc: '', args: []);
  }

  /// `Clear Search`
  String get clearSearch {
    return Intl.message(
      'Clear Search',
      name: 'clearSearch',
      desc: '',
      args: [],
    );
  }

  /// `Load More`
  String get loadMore {
    return Intl.message('Load More', name: 'loadMore', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Statistics`
  String get statistics {
    return Intl.message('Statistics', name: 'statistics', desc: '', args: []);
  }

  /// `Total Invoices`
  String get totalInvoices {
    return Intl.message(
      'Total Invoices',
      name: 'totalInvoices',
      desc: '',
      args: [],
    );
  }

  /// `New Invoices`
  String get newInvoices {
    return Intl.message(
      'New Invoices',
      name: 'newInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Total Sales`
  String get totalSales {
    return Intl.message('Total Sales', name: 'totalSales', desc: '', args: []);
  }

  /// `Total Expenses`
  String get totalExpenses {
    return Intl.message(
      'Total Expenses',
      name: 'totalExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Expenses`
  String get monthlyExpenses {
    return Intl.message(
      'Monthly Expenses',
      name: 'monthlyExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Total Customers`
  String get totalCustomers {
    return Intl.message(
      'Total Customers',
      name: 'totalCustomers',
      desc: '',
      args: [],
    );
  }

  /// `New Customers`
  String get newCustomers {
    return Intl.message(
      'New Customers',
      name: 'newCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Total Products`
  String get totalProducts {
    return Intl.message(
      'Total Products',
      name: 'totalProducts',
      desc: '',
      args: [],
    );
  }

  /// `New Products`
  String get newProducts {
    return Intl.message(
      'New Products',
      name: 'newProducts',
      desc: '',
      args: [],
    );
  }

  /// `Net Profit`
  String get netProfit {
    return Intl.message('Net Profit', name: 'netProfit', desc: '', args: []);
  }

  /// `Sales Growth`
  String get salesGrowth {
    return Intl.message(
      'Sales Growth',
      name: 'salesGrowth',
      desc: '',
      args: [],
    );
  }

  /// `Profit Growth`
  String get profitGrowth {
    return Intl.message(
      'Profit Growth',
      name: 'profitGrowth',
      desc: '',
      args: [],
    );
  }

  /// `Top Selling Products`
  String get topSellingProducts {
    return Intl.message(
      'Top Selling Products',
      name: 'topSellingProducts',
      desc: '',
      args: [],
    );
  }

  /// `Loading dashboard data...`
  String get loadingDashboard {
    return Intl.message(
      'Loading dashboard data...',
      name: 'loadingDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Error loading dashboard`
  String get errorLoadingDashboard {
    return Intl.message(
      'Error loading dashboard',
      name: 'errorLoadingDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Error loading data`
  String get dashboardError {
    return Intl.message(
      'Error loading data',
      name: 'dashboardError',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while loading dashboard data`
  String get dashboardErrorMessage {
    return Intl.message(
      'An error occurred while loading dashboard data',
      name: 'dashboardErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get noDataAvailable {
    return Intl.message(
      'No data available',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Dinar`
  String get currency {
    return Intl.message('Dinar', name: 'currency', desc: '', args: []);
  }

  /// `Growth`
  String get growth {
    return Intl.message('Growth', name: 'growth', desc: '', args: []);
  }

  /// `Decrease`
  String get decrease {
    return Intl.message('Decrease', name: 'decrease', desc: '', args: []);
  }

  /// `Increase`
  String get increase {
    return Intl.message('Increase', name: 'increase', desc: '', args: []);
  }

  /// `New This Month`
  String get newThisMonth {
    return Intl.message(
      'New This Month',
      name: 'newThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Products in Stock`
  String get productsInStock {
    return Intl.message(
      'Products in Stock',
      name: 'productsInStock',
      desc: '',
      args: [],
    );
  }

  /// `Sales Distribution`
  String get salesDistribution {
    return Intl.message(
      'Sales Distribution',
      name: 'salesDistribution',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Statistics`
  String get invoiceStatistics {
    return Intl.message(
      'Invoice Statistics',
      name: 'invoiceStatistics',
      desc: '',
      args: [],
    );
  }

  /// `All Invoices`
  String get allInvoices {
    return Intl.message(
      'All Invoices',
      name: 'allInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Regular Invoices`
  String get regularInvoices {
    return Intl.message(
      'Regular Invoices',
      name: 'regularInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Sales Statistics`
  String get monthlySalesStatistics {
    return Intl.message(
      'Monthly Sales Statistics',
      name: 'monthlySalesStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Sales Categories`
  String get salesCategories {
    return Intl.message(
      'Sales Categories',
      name: 'salesCategories',
      desc: '',
      args: [],
    );
  }

  /// `First Category`
  String get firstCategory {
    return Intl.message(
      'First Category',
      name: 'firstCategory',
      desc: '',
      args: [],
    );
  }

  /// `Uncategorized`
  String get uncategorized {
    return Intl.message(
      'Uncategorized',
      name: 'uncategorized',
      desc: '',
      args: [],
    );
  }

  /// `Print Options`
  String get printOptions {
    return Intl.message(
      'Print Options',
      name: 'printOptions',
      desc: '',
      args: [],
    );
  }

  /// `Thermal Print`
  String get thermalPrint {
    return Intl.message(
      'Thermal Print',
      name: 'thermalPrint',
      desc: '',
      args: [],
    );
  }

  /// `For thermal printers - 80mm`
  String get thermalPrintDesc {
    return Intl.message(
      'For thermal printers - 80mm',
      name: 'thermalPrintDesc',
      desc: '',
      args: [],
    );
  }

  /// `PDF Print`
  String get pdfPrint {
    return Intl.message('PDF Print', name: 'pdfPrint', desc: '', args: []);
  }

  /// `View and save PDF`
  String get pdfPrintDesc {
    return Intl.message(
      'View and save PDF',
      name: 'pdfPrintDesc',
      desc: '',
      args: [],
    );
  }

  /// `Printer Status`
  String get printerStatus {
    return Intl.message(
      'Printer Status',
      name: 'printerStatus',
      desc: '',
      args: [],
    );
  }

  /// `Connected to printer`
  String get printerConnected {
    return Intl.message(
      'Connected to printer',
      name: 'printerConnected',
      desc: '',
      args: [],
    );
  }

  /// `Disconnected from printer`
  String get printerDisconnected {
    return Intl.message(
      'Disconnected from printer',
      name: 'printerDisconnected',
      desc: '',
      args: [],
    );
  }

  /// `Checking connection...`
  String get checkingConnection {
    return Intl.message(
      'Checking connection...',
      name: 'checkingConnection',
      desc: '',
      args: [],
    );
  }

  /// `Searching for printer...`
  String get searchingPrinter {
    return Intl.message(
      'Searching for printer...',
      name: 'searchingPrinter',
      desc: '',
      args: [],
    );
  }

  /// `Print Receipt`
  String get printReceipt {
    return Intl.message(
      'Print Receipt',
      name: 'printReceipt',
      desc: '',
      args: [],
    );
  }

  /// `Retry Connection`
  String get retryConnection {
    return Intl.message(
      'Retry Connection',
      name: 'retryConnection',
      desc: '',
      args: [],
    );
  }

  /// `PDF Preview`
  String get pdfPreview {
    return Intl.message('PDF Preview', name: 'pdfPreview', desc: '', args: []);
  }

  /// `Save PDF`
  String get savePDF {
    return Intl.message('Save PDF', name: 'savePDF', desc: '', args: []);
  }

  /// `Generating PDF...`
  String get generatingPDF {
    return Intl.message(
      'Generating PDF...',
      name: 'generatingPDF',
      desc: '',
      args: [],
    );
  }

  /// `PDF generated successfully`
  String get pdfGenerated {
    return Intl.message(
      'PDF generated successfully',
      name: 'pdfGenerated',
      desc: '',
      args: [],
    );
  }

  /// `PDF saved successfully`
  String get pdfSaved {
    return Intl.message(
      'PDF saved successfully',
      name: 'pdfSaved',
      desc: '',
      args: [],
    );
  }

  /// `Print error`
  String get printError {
    return Intl.message('Print error', name: 'printError', desc: '', args: []);
  }

  /// `Connection error`
  String get connectionError {
    return Intl.message(
      'Connection error',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Thermal Receipt`
  String get thermalReceipt {
    return Intl.message(
      'Thermal Receipt',
      name: 'thermalReceipt',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your business`
  String get thankYou {
    return Intl.message(
      'Thank you for your business',
      name: 'thankYou',
      desc: '',
      args: [],
    );
  }

  /// `Print successful`
  String get printSuccess {
    return Intl.message(
      'Print successful',
      name: 'printSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Print failed`
  String get printFailed {
    return Intl.message(
      'Print failed',
      name: 'printFailed',
      desc: '',
      args: [],
    );
  }

  /// `PDF generation error`
  String get pdfError {
    return Intl.message(
      'PDF generation error',
      name: 'pdfError',
      desc: '',
      args: [],
    );
  }

  /// `Save error`
  String get saveError {
    return Intl.message('Save error', name: 'saveError', desc: '', args: []);
  }

  /// `Print Settings`
  String get printSettings {
    return Intl.message(
      'Print Settings',
      name: 'printSettings',
      desc: '',
      args: [],
    );
  }

  /// `Paper Size`
  String get paperSize {
    return Intl.message('Paper Size', name: 'paperSize', desc: '', args: []);
  }

  /// `Printer Name`
  String get printerName {
    return Intl.message(
      'Printer Name',
      name: 'printerName',
      desc: '',
      args: [],
    );
  }

  /// `Connection Type`
  String get connectionType {
    return Intl.message(
      'Connection Type',
      name: 'connectionType',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth`
  String get bluetooth {
    return Intl.message('Bluetooth', name: 'bluetooth', desc: '', args: []);
  }

  /// `USB`
  String get usb {
    return Intl.message('USB', name: 'usb', desc: '', args: []);
  }

  /// `Network`
  String get network {
    return Intl.message('Network', name: 'network', desc: '', args: []);
  }

  /// `Select Printer`
  String get selectPrinter {
    return Intl.message(
      'Select Printer',
      name: 'selectPrinter',
      desc: '',
      args: [],
    );
  }

  /// `No printers found`
  String get noPrintersFound {
    return Intl.message(
      'No printers found',
      name: 'noPrintersFound',
      desc: '',
      args: [],
    );
  }

  /// `Refresh Printers`
  String get refreshPrinters {
    return Intl.message(
      'Refresh Printers',
      name: 'refreshPrinters',
      desc: '',
      args: [],
    );
  }

  /// `Printer Settings`
  String get printerSettings {
    return Intl.message(
      'Printer Settings',
      name: 'printerSettings',
      desc: '',
      args: [],
    );
  }

  /// `Test Print`
  String get testPrint {
    return Intl.message('Test Print', name: 'testPrint', desc: '', args: []);
  }

  /// `Print Quality`
  String get printQuality {
    return Intl.message(
      'Print Quality',
      name: 'printQuality',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get high {
    return Intl.message('High', name: 'high', desc: '', args: []);
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `Low`
  String get low {
    return Intl.message('Low', name: 'low', desc: '', args: []);
  }

  /// `.... Search expenses`
  String get searchExpenses {
    return Intl.message(
      '.... Search expenses',
      name: 'searchExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to send verification code`
  String get forgetPasswordDesc {
    return Intl.message(
      'Enter your email to send verification code',
      name: 'forgetPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `Send Verification Code`
  String get sendVerificationCode {
    return Intl.message(
      'Send Verification Code',
      name: 'sendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCodeTitle {
    return Intl.message(
      'Verify Code',
      name: 'verifyCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to {email}`
  String verifyCodeDesc(Object email) {
    return Intl.message(
      'Enter the code sent to $email',
      name: 'verifyCodeDesc',
      desc: '',
      args: [email],
    );
  }

  /// `Enter Code`
  String get enterCode {
    return Intl.message('Enter Code', name: 'enterCode', desc: '', args: []);
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message('Verify Code', name: 'verifyCode', desc: '', args: []);
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Resend in {seconds} seconds`
  String resendCodeIn(Object seconds) {
    return Intl.message(
      'Resend in $seconds seconds',
      name: 'resendCodeIn',
      desc: '',
      args: [seconds],
    );
  }

  /// `Code resent successfully`
  String get codeResent {
    return Intl.message(
      'Code resent successfully',
      name: 'codeResent',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get resetPasswordDesc {
    return Intl.message(
      'Enter your new password',
      name: 'resetPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Weak`
  String get passwordStrengthWeak {
    return Intl.message(
      'Weak',
      name: 'passwordStrengthWeak',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get passwordStrengthMedium {
    return Intl.message(
      'Medium',
      name: 'passwordStrengthMedium',
      desc: '',
      args: [],
    );
  }

  /// `Strong`
  String get passwordStrengthStrong {
    return Intl.message(
      'Strong',
      name: 'passwordStrengthStrong',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully`
  String get resetPasswordSuccess {
    return Intl.message(
      'Password reset successfully',
      name: 'resetPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Access Denied`
  String get accessDenied {
    return Intl.message(
      'Access Denied',
      name: 'accessDenied',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, you don't have permission to access {feature}`
  String noPermissionMessage(Object feature) {
    return Intl.message(
      'Sorry, you don\'t have permission to access $feature',
      name: 'noPermissionMessage',
      desc: '',
      args: [feature],
    );
  }

  /// `Please contact the system administrator for access`
  String get contactAdminForAccess {
    return Intl.message(
      'Please contact the system administrator for access',
      name: 'contactAdminForAccess',
      desc: '',
      args: [],
    );
  }

  /// `Paste Code`
  String get pasteCode {
    return Intl.message('Paste Code', name: 'pasteCode', desc: '', args: []);
  }

  /// `Invalid code`
  String get invalidCode {
    return Intl.message(
      'Invalid code',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Code must be 6 digits`
  String get codeMustBe6Digits {
    return Intl.message(
      'Code must be 6 digits',
      name: 'codeMustBe6Digits',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter verification code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get checkYourEmail {
    return Intl.message(
      'Check your email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verification code sent to your email`
  String get otpSentToEmail {
    return Intl.message(
      'Verification code sent to your email',
      name: 'otpSentToEmail',
      desc: '',
      args: [],
    );
  }

  /// `Copy the code from email and paste here`
  String get copyCodeFromEmail {
    return Intl.message(
      'Copy the code from email and paste here',
      name: 'copyCodeFromEmail',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message('Dismiss', name: 'dismiss', desc: '', args: []);
  }

  /// `Back to Login Screen`
  String get backToLoginScreen {
    return Intl.message(
      'Back to Login Screen',
      name: 'backToLoginScreen',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back, 👋`
  String get welcomeBack {
    return Intl.message(
      'Welcome back, 👋',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {name}, 👋`
  String welcomeBackWithName(String name) {
    return Intl.message(
      'Welcome $name, 👋',
      name: 'welcomeBackWithName',
      desc: '',
      args: [name],
    );
  }

  /// `Subscription Required`
  String get subscriptionRequired {
    return Intl.message(
      'Subscription Required',
      name: 'subscriptionRequired',
      desc: '',
      args: [],
    );
  }

  /// `You must choose a suitable subscription to use this feature`
  String get subscriptionRequiredMessage {
    return Intl.message(
      'You must choose a suitable subscription to use this feature',
      name: 'subscriptionRequiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Choose Subscription`
  String get chooseSubscription {
    return Intl.message(
      'Choose Subscription',
      name: 'chooseSubscription',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open subscription link`
  String get cannotOpenSubscriptionLink {
    return Intl.message(
      'Cannot open subscription link',
      name: 'cannotOpenSubscriptionLink',
      desc: '',
      args: [],
    );
  }

  /// `No products sold yet`
  String get noProductsSoldYet {
    return Intl.message(
      'No products sold yet',
      name: 'noProductsSoldYet',
      desc: '',
      args: [],
    );
  }

  /// `Start creating your first invoices to see the top selling products`
  String get noProductsSoldMessage {
    return Intl.message(
      'Start creating your first invoices to see the top selling products',
      name: 'noProductsSoldMessage',
      desc: '',
      args: [],
    );
  }

  /// `Undefined Product`
  String get undefinedProduct {
    return Intl.message(
      'Undefined Product',
      name: 'undefinedProduct',
      desc: '',
      args: [],
    );
  }

  /// `Customer Analytics`
  String get customerAnalytics {
    return Intl.message(
      'Customer Analytics',
      name: 'customerAnalytics',
      desc: '',
      args: [],
    );
  }

  /// `Last Invoices`
  String get lastInvoices {
    return Intl.message(
      'Last Invoices',
      name: 'lastInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Last 5 Invoices`
  String get lastFiveInvoices {
    return Intl.message(
      'Last 5 Invoices',
      name: 'lastFiveInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Saudi Riyal`
  String get saudiRiyal {
    return Intl.message('Saudi Riyal', name: 'saudiRiyal', desc: '', args: []);
  }

  /// `Loading Invoices...`
  String get loadingInvoices {
    return Intl.message(
      'Loading Invoices...',
      name: 'loadingInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading Invoices`
  String get errorLoadingInvoices {
    return Intl.message(
      'Error Loading Invoices',
      name: 'errorLoadingInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Amount`
  String get invoiceAmount {
    return Intl.message(
      'Invoice Amount',
      name: 'invoiceAmount',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Date`
  String get invoiceDate {
    return Intl.message(
      'Invoice Date',
      name: 'invoiceDate',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get invoicePaid {
    return Intl.message('Paid', name: 'invoicePaid', desc: '', args: []);
  }

  /// `Pending`
  String get invoicePending {
    return Intl.message('Pending', name: 'invoicePending', desc: '', args: []);
  }

  /// `Cancelled`
  String get invoiceCancelled {
    return Intl.message(
      'Cancelled',
      name: 'invoiceCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get invoiceDraft {
    return Intl.message('Draft', name: 'invoiceDraft', desc: '', args: []);
  }

  /// `Overdue`
  String get invoiceOverdue {
    return Intl.message('Overdue', name: 'invoiceOverdue', desc: '', args: []);
  }

  /// `Sent`
  String get invoiceSent {
    return Intl.message('Sent', name: 'invoiceSent', desc: '', args: []);
  }

  /// `Returned`
  String get invoiceReturned {
    return Intl.message(
      'Returned',
      name: 'invoiceReturned',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get invoiceUnknown {
    return Intl.message('Unknown', name: 'invoiceUnknown', desc: '', args: []);
  }

  /// `and {count} more invoices...`
  String andMoreInvoices(int count) {
    return Intl.message(
      'and $count more invoices...',
      name: 'andMoreInvoices',
      desc: '',
      args: [count],
    );
  }

  /// `Contact Information`
  String get customerContactInfo {
    return Intl.message(
      'Contact Information',
      name: 'customerContactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Account Status`
  String get customerAccountStatus {
    return Intl.message(
      'Account Status',
      name: 'customerAccountStatus',
      desc: '',
      args: [],
    );
  }

  /// `Quick Actions`
  String get customerQuickActions {
    return Intl.message(
      'Quick Actions',
      name: 'customerQuickActions',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get customerCompany {
    return Intl.message('Company', name: 'customerCompany', desc: '', args: []);
  }

  /// `Active`
  String get customerActive {
    return Intl.message('Active', name: 'customerActive', desc: '', args: []);
  }

  /// `Inactive`
  String get customerInactive {
    return Intl.message(
      'Inactive',
      name: 'customerInactive',
      desc: '',
      args: [],
    );
  }

  /// `Created Date`
  String get customerCreatedDate {
    return Intl.message(
      'Created Date',
      name: 'customerCreatedDate',
      desc: '',
      args: [],
    );
  }

  /// `Last Updated`
  String get customerLastUpdated {
    return Intl.message(
      'Last Updated',
      name: 'customerLastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Address Information`
  String get customerAddressInfo {
    return Intl.message(
      'Address Information',
      name: 'customerAddressInfo',
      desc: '',
      args: [],
    );
  }

  /// `Customer Form Help`
  String get customerFormHelp {
    return Intl.message(
      'Customer Form Help',
      name: 'customerFormHelp',
      desc: '',
      args: [],
    );
  }

  /// `This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information`
  String get customerFormHelpDescription {
    return Intl.message(
      'This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information',
      name: 'customerFormHelpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Error updating customer`
  String get errorUpdatingCustomer {
    return Intl.message(
      'Error updating customer',
      name: 'errorUpdatingCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting customer`
  String get errorDeletingCustomer {
    return Intl.message(
      'Error deleting customer',
      name: 'errorDeletingCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Error loading customer`
  String get errorLoadingCustomer {
    return Intl.message(
      'Error loading customer',
      name: 'errorLoadingCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get customerEmailRequired {
    return Intl.message(
      'Email is required',
      name: 'customerEmailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Address is required`
  String get customerAddressRequired {
    return Intl.message(
      'Address is required',
      name: 'customerAddressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Company name is required`
  String get customerCompanyRequired {
    return Intl.message(
      'Company name is required',
      name: 'customerCompanyRequired',
      desc: '',
      args: [],
    );
  }

  /// `Tax number is required`
  String get customerTaxNumberRequired {
    return Intl.message(
      'Tax number is required',
      name: 'customerTaxNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Commercial register is required`
  String get customerCommercialRegisterRequired {
    return Intl.message(
      'Commercial register is required',
      name: 'customerCommercialRegisterRequired',
      desc: '',
      args: [],
    );
  }

  /// `City is required`
  String get customerCityRequired {
    return Intl.message(
      'City is required',
      name: 'customerCityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Region is required`
  String get customerRegionRequired {
    return Intl.message(
      'Region is required',
      name: 'customerRegionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Postal code is required`
  String get customerPostalCodeRequired {
    return Intl.message(
      'Postal code is required',
      name: 'customerPostalCodeRequired',
      desc: '',
      args: [],
    );
  }

  /// `Detailed address is required`
  String get customerDetailedAddressRequired {
    return Intl.message(
      'Detailed address is required',
      name: 'customerDetailedAddressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Responsible person is required`
  String get customerResponsiblePersonRequired {
    return Intl.message(
      'Responsible person is required',
      name: 'customerResponsiblePersonRequired',
      desc: '',
      args: [],
    );
  }

  /// `Notes are required`
  String get customerNotesRequired {
    return Intl.message(
      'Notes are required',
      name: 'customerNotesRequired',
      desc: '',
      args: [],
    );
  }

  /// `Status is required`
  String get customerStatusRequired {
    return Intl.message(
      'Status is required',
      name: 'customerStatusRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter company name`
  String get enterCustomerCompany {
    return Intl.message(
      'Enter company name',
      name: 'enterCustomerCompany',
      desc: '',
      args: [],
    );
  }

  /// `Enter tax number`
  String get enterCustomerTaxNumber {
    return Intl.message(
      'Enter tax number',
      name: 'enterCustomerTaxNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter commercial register`
  String get enterCustomerCommercialRegister {
    return Intl.message(
      'Enter commercial register',
      name: 'enterCustomerCommercialRegister',
      desc: '',
      args: [],
    );
  }

  /// `Enter city`
  String get enterCustomerCity {
    return Intl.message(
      'Enter city',
      name: 'enterCustomerCity',
      desc: '',
      args: [],
    );
  }

  /// `Enter region`
  String get enterCustomerRegion {
    return Intl.message(
      'Enter region',
      name: 'enterCustomerRegion',
      desc: '',
      args: [],
    );
  }

  /// `Enter postal code`
  String get enterCustomerPostalCode {
    return Intl.message(
      'Enter postal code',
      name: 'enterCustomerPostalCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter detailed address`
  String get enterCustomerDetailedAddress {
    return Intl.message(
      'Enter detailed address',
      name: 'enterCustomerDetailedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter responsible person`
  String get enterCustomerResponsiblePerson {
    return Intl.message(
      'Enter responsible person',
      name: 'enterCustomerResponsiblePerson',
      desc: '',
      args: [],
    );
  }

  /// `Enter notes`
  String get enterCustomerNotes {
    return Intl.message(
      'Enter notes',
      name: 'enterCustomerNotes',
      desc: '',
      args: [],
    );
  }

  /// `Select customer status`
  String get selectCustomerStatus {
    return Intl.message(
      'Select customer status',
      name: 'selectCustomerStatus',
      desc: '',
      args: [],
    );
  }

  /// `Customer Form`
  String get customerFormTitle {
    return Intl.message(
      'Customer Form',
      name: 'customerFormTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fill out the form below to add a new customer to the system`
  String get customerFormDescription {
    return Intl.message(
      'Fill out the form below to add a new customer to the system',
      name: 'customerFormDescription',
      desc: '',
      args: [],
    );
  }

  /// `View Customer`
  String get viewCustomer {
    return Intl.message(
      'View Customer',
      name: 'viewCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Customer Options`
  String get customerOptions {
    return Intl.message(
      'Customer Options',
      name: 'customerOptions',
      desc: '',
      args: [],
    );
  }

  /// `Customer Actions`
  String get customerActions {
    return Intl.message(
      'Customer Actions',
      name: 'customerActions',
      desc: '',
      args: [],
    );
  }

  /// `Customer List`
  String get customerList {
    return Intl.message(
      'Customer List',
      name: 'customerList',
      desc: '',
      args: [],
    );
  }

  /// `Search Customers`
  String get customerSearch {
    return Intl.message(
      'Search Customers',
      name: 'customerSearch',
      desc: '',
      args: [],
    );
  }

  /// `Customer Filters`
  String get customerFilters {
    return Intl.message(
      'Customer Filters',
      name: 'customerFilters',
      desc: '',
      args: [],
    );
  }

  /// `Sort Customers`
  String get customerSort {
    return Intl.message(
      'Sort Customers',
      name: 'customerSort',
      desc: '',
      args: [],
    );
  }

  /// `Export Customers`
  String get customerExport {
    return Intl.message(
      'Export Customers',
      name: 'customerExport',
      desc: '',
      args: [],
    );
  }

  /// `Import Customers`
  String get customerImport {
    return Intl.message(
      'Import Customers',
      name: 'customerImport',
      desc: '',
      args: [],
    );
  }

  /// `Customer Reports`
  String get customerReports {
    return Intl.message(
      'Customer Reports',
      name: 'customerReports',
      desc: '',
      args: [],
    );
  }

  /// `Customer Statistics`
  String get customerStatistics {
    return Intl.message(
      'Customer Statistics',
      name: 'customerStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Customer Performance`
  String get customerPerformance {
    return Intl.message(
      'Customer Performance',
      name: 'customerPerformance',
      desc: '',
      args: [],
    );
  }

  /// `Customer Satisfaction`
  String get customerSatisfaction {
    return Intl.message(
      'Customer Satisfaction',
      name: 'customerSatisfaction',
      desc: '',
      args: [],
    );
  }

  /// `Customer Retention`
  String get customerRetention {
    return Intl.message(
      'Customer Retention',
      name: 'customerRetention',
      desc: '',
      args: [],
    );
  }

  /// `Customer Loyalty`
  String get customerLoyalty {
    return Intl.message(
      'Customer Loyalty',
      name: 'customerLoyalty',
      desc: '',
      args: [],
    );
  }

  /// `Customer Value`
  String get customerValue {
    return Intl.message(
      'Customer Value',
      name: 'customerValue',
      desc: '',
      args: [],
    );
  }

  /// `Customer Lifetime Value`
  String get customerLifetimeValue {
    return Intl.message(
      'Customer Lifetime Value',
      name: 'customerLifetimeValue',
      desc: '',
      args: [],
    );
  }

  /// `Customer Acquisition`
  String get customerAcquisition {
    return Intl.message(
      'Customer Acquisition',
      name: 'customerAcquisition',
      desc: '',
      args: [],
    );
  }

  /// `Customer Conversion`
  String get customerConversion {
    return Intl.message(
      'Customer Conversion',
      name: 'customerConversion',
      desc: '',
      args: [],
    );
  }

  /// `Customer Engagement`
  String get customerEngagement {
    return Intl.message(
      'Customer Engagement',
      name: 'customerEngagement',
      desc: '',
      args: [],
    );
  }

  /// `Customer Feedback`
  String get customerFeedback {
    return Intl.message(
      'Customer Feedback',
      name: 'customerFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Customer Support`
  String get customerSupport {
    return Intl.message(
      'Customer Support',
      name: 'customerSupport',
      desc: '',
      args: [],
    );
  }

  /// `Customer Service`
  String get customerService {
    return Intl.message(
      'Customer Service',
      name: 'customerService',
      desc: '',
      args: [],
    );
  }

  /// `Customer Success`
  String get customerSuccess {
    return Intl.message(
      'Customer Success',
      name: 'customerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Customer Onboarding`
  String get customerOnboarding {
    return Intl.message(
      'Customer Onboarding',
      name: 'customerOnboarding',
      desc: '',
      args: [],
    );
  }

  /// `Customer Training`
  String get customerTraining {
    return Intl.message(
      'Customer Training',
      name: 'customerTraining',
      desc: '',
      args: [],
    );
  }

  /// `Customer Documentation`
  String get customerDocumentation {
    return Intl.message(
      'Customer Documentation',
      name: 'customerDocumentation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Resources`
  String get customerResources {
    return Intl.message(
      'Customer Resources',
      name: 'customerResources',
      desc: '',
      args: [],
    );
  }

  /// `Customer Portal`
  String get customerPortal {
    return Intl.message(
      'Customer Portal',
      name: 'customerPortal',
      desc: '',
      args: [],
    );
  }

  /// `Customer Dashboard`
  String get customerDashboard {
    return Intl.message(
      'Customer Dashboard',
      name: 'customerDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Customer Profile`
  String get customerProfile {
    return Intl.message(
      'Customer Profile',
      name: 'customerProfile',
      desc: '',
      args: [],
    );
  }

  /// `Customer History`
  String get customerHistory {
    return Intl.message(
      'Customer History',
      name: 'customerHistory',
      desc: '',
      args: [],
    );
  }

  /// `Customer Transactions`
  String get customerTransactions {
    return Intl.message(
      'Customer Transactions',
      name: 'customerTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Customer Orders`
  String get customerOrders {
    return Intl.message(
      'Customer Orders',
      name: 'customerOrders',
      desc: '',
      args: [],
    );
  }

  /// `Customer Invoices`
  String get customerInvoices {
    return Intl.message(
      'Customer Invoices',
      name: 'customerInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Customer Payments`
  String get customerPayments {
    return Intl.message(
      'Customer Payments',
      name: 'customerPayments',
      desc: '',
      args: [],
    );
  }

  /// `Customer Credits`
  String get customerCredits {
    return Intl.message(
      'Customer Credits',
      name: 'customerCredits',
      desc: '',
      args: [],
    );
  }

  /// `Customer Debits`
  String get customerDebits {
    return Intl.message(
      'Customer Debits',
      name: 'customerDebits',
      desc: '',
      args: [],
    );
  }

  /// `Customer Balance`
  String get customerBalance {
    return Intl.message(
      'Customer Balance',
      name: 'customerBalance',
      desc: '',
      args: [],
    );
  }

  /// `Credit Limit`
  String get customerCreditLimit {
    return Intl.message(
      'Credit Limit',
      name: 'customerCreditLimit',
      desc: '',
      args: [],
    );
  }

  /// `Payment Terms`
  String get customerPaymentTerms {
    return Intl.message(
      'Payment Terms',
      name: 'customerPaymentTerms',
      desc: '',
      args: [],
    );
  }

  /// `Customer Discount`
  String get customerDiscount {
    return Intl.message(
      'Customer Discount',
      name: 'customerDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Tax Exempt`
  String get customerTaxExempt {
    return Intl.message(
      'Tax Exempt',
      name: 'customerTaxExempt',
      desc: '',
      args: [],
    );
  }

  /// `VIP Customer`
  String get customerVip {
    return Intl.message(
      'VIP Customer',
      name: 'customerVip',
      desc: '',
      args: [],
    );
  }

  /// `Customer Priority`
  String get customerPriority {
    return Intl.message(
      'Customer Priority',
      name: 'customerPriority',
      desc: '',
      args: [],
    );
  }

  /// `Customer Segment`
  String get customerSegment {
    return Intl.message(
      'Customer Segment',
      name: 'customerSegment',
      desc: '',
      args: [],
    );
  }

  /// `Customer Category`
  String get customerCategory {
    return Intl.message(
      'Customer Category',
      name: 'customerCategory',
      desc: '',
      args: [],
    );
  }

  /// `Customer Size`
  String get customerSize {
    return Intl.message(
      'Customer Size',
      name: 'customerSize',
      desc: '',
      args: [],
    );
  }

  /// `Customer Industry`
  String get customerIndustry {
    return Intl.message(
      'Customer Industry',
      name: 'customerIndustry',
      desc: '',
      args: [],
    );
  }

  /// `Customer Location`
  String get customerLocation {
    return Intl.message(
      'Customer Location',
      name: 'customerLocation',
      desc: '',
      args: [],
    );
  }

  /// `Timezone`
  String get customerTimezone {
    return Intl.message(
      'Timezone',
      name: 'customerTimezone',
      desc: '',
      args: [],
    );
  }

  /// `Customer Language`
  String get customerLanguage {
    return Intl.message(
      'Customer Language',
      name: 'customerLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Customer Currency`
  String get customerCurrency {
    return Intl.message(
      'Customer Currency',
      name: 'customerCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Customer Preferences`
  String get customerPreferences {
    return Intl.message(
      'Customer Preferences',
      name: 'customerPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Customer Settings`
  String get customerSettings {
    return Intl.message(
      'Customer Settings',
      name: 'customerSettings',
      desc: '',
      args: [],
    );
  }

  /// `Customer Notifications`
  String get customerNotifications {
    return Intl.message(
      'Customer Notifications',
      name: 'customerNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Customer Alerts`
  String get customerAlerts {
    return Intl.message(
      'Customer Alerts',
      name: 'customerAlerts',
      desc: '',
      args: [],
    );
  }

  /// `Customer Reminders`
  String get customerReminders {
    return Intl.message(
      'Customer Reminders',
      name: 'customerReminders',
      desc: '',
      args: [],
    );
  }

  /// `Customer Follow-up`
  String get customerFollowUp {
    return Intl.message(
      'Customer Follow-up',
      name: 'customerFollowUp',
      desc: '',
      args: [],
    );
  }

  /// `Customer Communication`
  String get customerCommunication {
    return Intl.message(
      'Customer Communication',
      name: 'customerCommunication',
      desc: '',
      args: [],
    );
  }

  /// `Customer Meetings`
  String get customerMeetings {
    return Intl.message(
      'Customer Meetings',
      name: 'customerMeetings',
      desc: '',
      args: [],
    );
  }

  /// `Customer Calls`
  String get customerCalls {
    return Intl.message(
      'Customer Calls',
      name: 'customerCalls',
      desc: '',
      args: [],
    );
  }

  /// `Customer Emails`
  String get customerEmails {
    return Intl.message(
      'Customer Emails',
      name: 'customerEmails',
      desc: '',
      args: [],
    );
  }

  /// `Customer Messages`
  String get customerMessages {
    return Intl.message(
      'Customer Messages',
      name: 'customerMessages',
      desc: '',
      args: [],
    );
  }

  /// `Customer Chats`
  String get customerChats {
    return Intl.message(
      'Customer Chats',
      name: 'customerChats',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tickets`
  String get customerTickets {
    return Intl.message(
      'Customer Tickets',
      name: 'customerTickets',
      desc: '',
      args: [],
    );
  }

  /// `Customer Issues`
  String get customerIssues {
    return Intl.message(
      'Customer Issues',
      name: 'customerIssues',
      desc: '',
      args: [],
    );
  }

  /// `Customer Complaints`
  String get customerComplaints {
    return Intl.message(
      'Customer Complaints',
      name: 'customerComplaints',
      desc: '',
      args: [],
    );
  }

  /// `Customer Requests`
  String get customerRequests {
    return Intl.message(
      'Customer Requests',
      name: 'customerRequests',
      desc: '',
      args: [],
    );
  }

  /// `Customer Suggestions`
  String get customerSuggestions {
    return Intl.message(
      'Customer Suggestions',
      name: 'customerSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Customer Reviews`
  String get customerReviews {
    return Intl.message(
      'Customer Reviews',
      name: 'customerReviews',
      desc: '',
      args: [],
    );
  }

  /// `Customer Ratings`
  String get customerRatings {
    return Intl.message(
      'Customer Ratings',
      name: 'customerRatings',
      desc: '',
      args: [],
    );
  }

  /// `Customer Testimonials`
  String get customerTestimonials {
    return Intl.message(
      'Customer Testimonials',
      name: 'customerTestimonials',
      desc: '',
      args: [],
    );
  }

  /// `Customer References`
  String get customerReferences {
    return Intl.message(
      'Customer References',
      name: 'customerReferences',
      desc: '',
      args: [],
    );
  }

  /// `Customer Recommendations`
  String get customerRecommendations {
    return Intl.message(
      'Customer Recommendations',
      name: 'customerRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `Customer Referrals`
  String get customerReferrals {
    return Intl.message(
      'Customer Referrals',
      name: 'customerReferrals',
      desc: '',
      args: [],
    );
  }

  /// `Customer Partnerships`
  String get customerPartnerships {
    return Intl.message(
      'Customer Partnerships',
      name: 'customerPartnerships',
      desc: '',
      args: [],
    );
  }

  /// `Customer Contracts`
  String get customerContracts {
    return Intl.message(
      'Customer Contracts',
      name: 'customerContracts',
      desc: '',
      args: [],
    );
  }

  /// `Customer Agreements`
  String get customerAgreements {
    return Intl.message(
      'Customer Agreements',
      name: 'customerAgreements',
      desc: '',
      args: [],
    );
  }

  /// `Customer Terms`
  String get customerTerms {
    return Intl.message(
      'Customer Terms',
      name: 'customerTerms',
      desc: '',
      args: [],
    );
  }

  /// `Customer Policies`
  String get customerPolicies {
    return Intl.message(
      'Customer Policies',
      name: 'customerPolicies',
      desc: '',
      args: [],
    );
  }

  /// `Customer Procedures`
  String get customerProcedures {
    return Intl.message(
      'Customer Procedures',
      name: 'customerProcedures',
      desc: '',
      args: [],
    );
  }

  /// `Customer Guidelines`
  String get customerGuidelines {
    return Intl.message(
      'Customer Guidelines',
      name: 'customerGuidelines',
      desc: '',
      args: [],
    );
  }

  /// `Customer Standards`
  String get customerStandards {
    return Intl.message(
      'Customer Standards',
      name: 'customerStandards',
      desc: '',
      args: [],
    );
  }

  /// `Customer Requirements`
  String get customerRequirements {
    return Intl.message(
      'Customer Requirements',
      name: 'customerRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Customer Specifications`
  String get customerSpecifications {
    return Intl.message(
      'Customer Specifications',
      name: 'customerSpecifications',
      desc: '',
      args: [],
    );
  }

  /// `Customer Expectations`
  String get customerExpectations {
    return Intl.message(
      'Customer Expectations',
      name: 'customerExpectations',
      desc: '',
      args: [],
    );
  }

  /// `Customer Goals`
  String get customerGoals {
    return Intl.message(
      'Customer Goals',
      name: 'customerGoals',
      desc: '',
      args: [],
    );
  }

  /// `Customer Objectives`
  String get customerObjectives {
    return Intl.message(
      'Customer Objectives',
      name: 'customerObjectives',
      desc: '',
      args: [],
    );
  }

  /// `Customer Targets`
  String get customerTargets {
    return Intl.message(
      'Customer Targets',
      name: 'customerTargets',
      desc: '',
      args: [],
    );
  }

  /// `Customer Milestones`
  String get customerMilestones {
    return Intl.message(
      'Customer Milestones',
      name: 'customerMilestones',
      desc: '',
      args: [],
    );
  }

  /// `Customer Deadlines`
  String get customerDeadlines {
    return Intl.message(
      'Customer Deadlines',
      name: 'customerDeadlines',
      desc: '',
      args: [],
    );
  }

  /// `Customer Schedules`
  String get customerSchedules {
    return Intl.message(
      'Customer Schedules',
      name: 'customerSchedules',
      desc: '',
      args: [],
    );
  }

  /// `Customer Timelines`
  String get customerTimelines {
    return Intl.message(
      'Customer Timelines',
      name: 'customerTimelines',
      desc: '',
      args: [],
    );
  }

  /// `Customer Calendars`
  String get customerCalendars {
    return Intl.message(
      'Customer Calendars',
      name: 'customerCalendars',
      desc: '',
      args: [],
    );
  }

  /// `Customer Events`
  String get customerEvents {
    return Intl.message(
      'Customer Events',
      name: 'customerEvents',
      desc: '',
      args: [],
    );
  }

  /// `Customer Activities`
  String get customerActivities {
    return Intl.message(
      'Customer Activities',
      name: 'customerActivities',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tasks`
  String get customerTasks {
    return Intl.message(
      'Customer Tasks',
      name: 'customerTasks',
      desc: '',
      args: [],
    );
  }

  /// `Customer Projects`
  String get customerProjects {
    return Intl.message(
      'Customer Projects',
      name: 'customerProjects',
      desc: '',
      args: [],
    );
  }

  /// `Customer Campaigns`
  String get customerCampaigns {
    return Intl.message(
      'Customer Campaigns',
      name: 'customerCampaigns',
      desc: '',
      args: [],
    );
  }

  /// `Customer Promotions`
  String get customerPromotions {
    return Intl.message(
      'Customer Promotions',
      name: 'customerPromotions',
      desc: '',
      args: [],
    );
  }

  /// `Customer Offers`
  String get customerOffers {
    return Intl.message(
      'Customer Offers',
      name: 'customerOffers',
      desc: '',
      args: [],
    );
  }

  /// `Customer Deals`
  String get customerDeals {
    return Intl.message(
      'Customer Deals',
      name: 'customerDeals',
      desc: '',
      args: [],
    );
  }

  /// `Customer Sales`
  String get customerSales {
    return Intl.message(
      'Customer Sales',
      name: 'customerSales',
      desc: '',
      args: [],
    );
  }

  /// `Customer Revenue`
  String get customerRevenue {
    return Intl.message(
      'Customer Revenue',
      name: 'customerRevenue',
      desc: '',
      args: [],
    );
  }

  /// `Customer Profit`
  String get customerProfit {
    return Intl.message(
      'Customer Profit',
      name: 'customerProfit',
      desc: '',
      args: [],
    );
  }

  /// `Customer Margin`
  String get customerMargin {
    return Intl.message(
      'Customer Margin',
      name: 'customerMargin',
      desc: '',
      args: [],
    );
  }

  /// `Customer Cost`
  String get customerCost {
    return Intl.message(
      'Customer Cost',
      name: 'customerCost',
      desc: '',
      args: [],
    );
  }

  /// `Customer Expense`
  String get customerExpense {
    return Intl.message(
      'Customer Expense',
      name: 'customerExpense',
      desc: '',
      args: [],
    );
  }

  /// `Customer Investment`
  String get customerInvestment {
    return Intl.message(
      'Customer Investment',
      name: 'customerInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Customer Return`
  String get customerReturn {
    return Intl.message(
      'Customer Return',
      name: 'customerReturn',
      desc: '',
      args: [],
    );
  }

  /// `Customer Risk`
  String get customerRisk {
    return Intl.message(
      'Customer Risk',
      name: 'customerRisk',
      desc: '',
      args: [],
    );
  }

  /// `Customer Opportunity`
  String get customerOpportunity {
    return Intl.message(
      'Customer Opportunity',
      name: 'customerOpportunity',
      desc: '',
      args: [],
    );
  }

  /// `Customer Threat`
  String get customerThreat {
    return Intl.message(
      'Customer Threat',
      name: 'customerThreat',
      desc: '',
      args: [],
    );
  }

  /// `Customer Strengths`
  String get customerStrengths {
    return Intl.message(
      'Customer Strengths',
      name: 'customerStrengths',
      desc: '',
      args: [],
    );
  }

  /// `Customer Weaknesses`
  String get customerWeaknesses {
    return Intl.message(
      'Customer Weaknesses',
      name: 'customerWeaknesses',
      desc: '',
      args: [],
    );
  }

  /// `Customer Opportunities`
  String get customerOpportunities {
    return Intl.message(
      'Customer Opportunities',
      name: 'customerOpportunities',
      desc: '',
      args: [],
    );
  }

  /// `Customer Threats`
  String get customerThreats {
    return Intl.message(
      'Customer Threats',
      name: 'customerThreats',
      desc: '',
      args: [],
    );
  }

  /// `Customer Analysis`
  String get customerAnalysis {
    return Intl.message(
      'Customer Analysis',
      name: 'customerAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Customer Assessment`
  String get customerAssessment {
    return Intl.message(
      'Customer Assessment',
      name: 'customerAssessment',
      desc: '',
      args: [],
    );
  }

  /// `Customer Evaluation`
  String get customerEvaluation {
    return Intl.message(
      'Customer Evaluation',
      name: 'customerEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Review`
  String get customerReview {
    return Intl.message(
      'Customer Review',
      name: 'customerReview',
      desc: '',
      args: [],
    );
  }

  /// `Customer Audit`
  String get customerAudit {
    return Intl.message(
      'Customer Audit',
      name: 'customerAudit',
      desc: '',
      args: [],
    );
  }

  /// `Customer Inspection`
  String get customerInspection {
    return Intl.message(
      'Customer Inspection',
      name: 'customerInspection',
      desc: '',
      args: [],
    );
  }

  /// `Customer Verification`
  String get customerVerification {
    return Intl.message(
      'Customer Verification',
      name: 'customerVerification',
      desc: '',
      args: [],
    );
  }

  /// `Customer Validation`
  String get customerValidation {
    return Intl.message(
      'Customer Validation',
      name: 'customerValidation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Authentication`
  String get customerAuthentication {
    return Intl.message(
      'Customer Authentication',
      name: 'customerAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Customer Authorization`
  String get customerAuthorization {
    return Intl.message(
      'Customer Authorization',
      name: 'customerAuthorization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Permission`
  String get customerPermission {
    return Intl.message(
      'Customer Permission',
      name: 'customerPermission',
      desc: '',
      args: [],
    );
  }

  /// `Customer Access`
  String get customerAccess {
    return Intl.message(
      'Customer Access',
      name: 'customerAccess',
      desc: '',
      args: [],
    );
  }

  /// `Customer Security`
  String get customerSecurity {
    return Intl.message(
      'Customer Security',
      name: 'customerSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Customer Privacy`
  String get customerPrivacy {
    return Intl.message(
      'Customer Privacy',
      name: 'customerPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Customer Confidentiality`
  String get customerConfidentiality {
    return Intl.message(
      'Customer Confidentiality',
      name: 'customerConfidentiality',
      desc: '',
      args: [],
    );
  }

  /// `Customer Data`
  String get customerData {
    return Intl.message(
      'Customer Data',
      name: 'customerData',
      desc: '',
      args: [],
    );
  }

  /// `Customer Records`
  String get customerRecords {
    return Intl.message(
      'Customer Records',
      name: 'customerRecords',
      desc: '',
      args: [],
    );
  }

  /// `Customer Files`
  String get customerFiles {
    return Intl.message(
      'Customer Files',
      name: 'customerFiles',
      desc: '',
      args: [],
    );
  }

  /// `Customer Documents`
  String get customerDocuments {
    return Intl.message(
      'Customer Documents',
      name: 'customerDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Customer Archives`
  String get customerArchives {
    return Intl.message(
      'Customer Archives',
      name: 'customerArchives',
      desc: '',
      args: [],
    );
  }

  /// `Customer Database`
  String get customerDatabase {
    return Intl.message(
      'Customer Database',
      name: 'customerDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Customer Repository`
  String get customerRepository {
    return Intl.message(
      'Customer Repository',
      name: 'customerRepository',
      desc: '',
      args: [],
    );
  }

  /// `Customer Storage`
  String get customerStorage {
    return Intl.message(
      'Customer Storage',
      name: 'customerStorage',
      desc: '',
      args: [],
    );
  }

  /// `Customer Backup`
  String get customerBackup {
    return Intl.message(
      'Customer Backup',
      name: 'customerBackup',
      desc: '',
      args: [],
    );
  }

  /// `Customer Recovery`
  String get customerRecovery {
    return Intl.message(
      'Customer Recovery',
      name: 'customerRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Customer Restore`
  String get customerRestore {
    return Intl.message(
      'Customer Restore',
      name: 'customerRestore',
      desc: '',
      args: [],
    );
  }

  /// `Customer Migration`
  String get customerMigration {
    return Intl.message(
      'Customer Migration',
      name: 'customerMigration',
      desc: '',
      args: [],
    );
  }

  /// `Customer Integration`
  String get customerIntegration {
    return Intl.message(
      'Customer Integration',
      name: 'customerIntegration',
      desc: '',
      args: [],
    );
  }

  /// `Customer Synchronization`
  String get customerSynchronization {
    return Intl.message(
      'Customer Synchronization',
      name: 'customerSynchronization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Replication`
  String get customerReplication {
    return Intl.message(
      'Customer Replication',
      name: 'customerReplication',
      desc: '',
      args: [],
    );
  }

  /// `Customer Distribution`
  String get customerDistribution {
    return Intl.message(
      'Customer Distribution',
      name: 'customerDistribution',
      desc: '',
      args: [],
    );
  }

  /// `Customer Deployment`
  String get customerDeployment {
    return Intl.message(
      'Customer Deployment',
      name: 'customerDeployment',
      desc: '',
      args: [],
    );
  }

  /// `Customer Implementation`
  String get customerImplementation {
    return Intl.message(
      'Customer Implementation',
      name: 'customerImplementation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Installation`
  String get customerInstallation {
    return Intl.message(
      'Customer Installation',
      name: 'customerInstallation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Configuration`
  String get customerConfiguration {
    return Intl.message(
      'Customer Configuration',
      name: 'customerConfiguration',
      desc: '',
      args: [],
    );
  }

  /// `Customer Customization`
  String get customerCustomization {
    return Intl.message(
      'Customer Customization',
      name: 'customerCustomization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Personalization`
  String get customerPersonalization {
    return Intl.message(
      'Customer Personalization',
      name: 'customerPersonalization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Localization`
  String get customerLocalization {
    return Intl.message(
      'Customer Localization',
      name: 'customerLocalization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Internationalization`
  String get customerInternationalization {
    return Intl.message(
      'Customer Internationalization',
      name: 'customerInternationalization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Translation`
  String get customerTranslation {
    return Intl.message(
      'Customer Translation',
      name: 'customerTranslation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Regionalization`
  String get customerRegionalization {
    return Intl.message(
      'Customer Regionalization',
      name: 'customerRegionalization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Globalization`
  String get customerGlobalization {
    return Intl.message(
      'Customer Globalization',
      name: 'customerGlobalization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Multilingual`
  String get customerMultilingual {
    return Intl.message(
      'Customer Multilingual',
      name: 'customerMultilingual',
      desc: '',
      args: [],
    );
  }

  /// `Customer Multicultural`
  String get customerMulticultural {
    return Intl.message(
      'Customer Multicultural',
      name: 'customerMulticultural',
      desc: '',
      args: [],
    );
  }

  /// `Customer Diversity`
  String get customerDiversity {
    return Intl.message(
      'Customer Diversity',
      name: 'customerDiversity',
      desc: '',
      args: [],
    );
  }

  /// `Customer Inclusion`
  String get customerInclusion {
    return Intl.message(
      'Customer Inclusion',
      name: 'customerInclusion',
      desc: '',
      args: [],
    );
  }

  /// `Customer Equity`
  String get customerEquity {
    return Intl.message(
      'Customer Equity',
      name: 'customerEquity',
      desc: '',
      args: [],
    );
  }

  /// `Customer Fairness`
  String get customerFairness {
    return Intl.message(
      'Customer Fairness',
      name: 'customerFairness',
      desc: '',
      args: [],
    );
  }

  /// `Customer Transparency`
  String get customerTransparency {
    return Intl.message(
      'Customer Transparency',
      name: 'customerTransparency',
      desc: '',
      args: [],
    );
  }

  /// `Customer Accountability`
  String get customerAccountability {
    return Intl.message(
      'Customer Accountability',
      name: 'customerAccountability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Responsibility`
  String get customerResponsibility {
    return Intl.message(
      'Customer Responsibility',
      name: 'customerResponsibility',
      desc: '',
      args: [],
    );
  }

  /// `Customer Liability`
  String get customerLiability {
    return Intl.message(
      'Customer Liability',
      name: 'customerLiability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Obligation`
  String get customerObligation {
    return Intl.message(
      'Customer Obligation',
      name: 'customerObligation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Duty`
  String get customerDuty {
    return Intl.message(
      'Customer Duty',
      name: 'customerDuty',
      desc: '',
      args: [],
    );
  }

  /// `Customer Commitment`
  String get customerCommitment {
    return Intl.message(
      'Customer Commitment',
      name: 'customerCommitment',
      desc: '',
      args: [],
    );
  }

  /// `Customer Promise`
  String get customerPromise {
    return Intl.message(
      'Customer Promise',
      name: 'customerPromise',
      desc: '',
      args: [],
    );
  }

  /// `Customer Guarantee`
  String get customerGuarantee {
    return Intl.message(
      'Customer Guarantee',
      name: 'customerGuarantee',
      desc: '',
      args: [],
    );
  }

  /// `Customer Warranty`
  String get customerWarranty {
    return Intl.message(
      'Customer Warranty',
      name: 'customerWarranty',
      desc: '',
      args: [],
    );
  }

  /// `Customer Assurance`
  String get customerAssurance {
    return Intl.message(
      'Customer Assurance',
      name: 'customerAssurance',
      desc: '',
      args: [],
    );
  }

  /// `Customer Confidence`
  String get customerConfidence {
    return Intl.message(
      'Customer Confidence',
      name: 'customerConfidence',
      desc: '',
      args: [],
    );
  }

  /// `Customer Trust`
  String get customerTrust {
    return Intl.message(
      'Customer Trust',
      name: 'customerTrust',
      desc: '',
      args: [],
    );
  }

  /// `Customer Reliability`
  String get customerReliability {
    return Intl.message(
      'Customer Reliability',
      name: 'customerReliability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Dependability`
  String get customerDependability {
    return Intl.message(
      'Customer Dependability',
      name: 'customerDependability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Consistency`
  String get customerConsistency {
    return Intl.message(
      'Customer Consistency',
      name: 'customerConsistency',
      desc: '',
      args: [],
    );
  }

  /// `Customer Stability`
  String get customerStability {
    return Intl.message(
      'Customer Stability',
      name: 'customerStability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Predictability`
  String get customerPredictability {
    return Intl.message(
      'Customer Predictability',
      name: 'customerPredictability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Flexibility`
  String get customerFlexibility {
    return Intl.message(
      'Customer Flexibility',
      name: 'customerFlexibility',
      desc: '',
      args: [],
    );
  }

  /// `Customer Adaptability`
  String get customerAdaptability {
    return Intl.message(
      'Customer Adaptability',
      name: 'customerAdaptability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Scalability`
  String get customerScalability {
    return Intl.message(
      'Customer Scalability',
      name: 'customerScalability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Sustainability`
  String get customerSustainability {
    return Intl.message(
      'Customer Sustainability',
      name: 'customerSustainability',
      desc: '',
      args: [],
    );
  }

  /// `Customer Growth`
  String get customerGrowth {
    return Intl.message(
      'Customer Growth',
      name: 'customerGrowth',
      desc: '',
      args: [],
    );
  }

  /// `Customer Development`
  String get customerDevelopment {
    return Intl.message(
      'Customer Development',
      name: 'customerDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Customer Improvement`
  String get customerImprovement {
    return Intl.message(
      'Customer Improvement',
      name: 'customerImprovement',
      desc: '',
      args: [],
    );
  }

  /// `Customer Enhancement`
  String get customerEnhancement {
    return Intl.message(
      'Customer Enhancement',
      name: 'customerEnhancement',
      desc: '',
      args: [],
    );
  }

  /// `Customer Optimization`
  String get customerOptimization {
    return Intl.message(
      'Customer Optimization',
      name: 'customerOptimization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Efficiency`
  String get customerEfficiency {
    return Intl.message(
      'Customer Efficiency',
      name: 'customerEfficiency',
      desc: '',
      args: [],
    );
  }

  /// `Customer Effectiveness`
  String get customerEffectiveness {
    return Intl.message(
      'Customer Effectiveness',
      name: 'customerEffectiveness',
      desc: '',
      args: [],
    );
  }

  /// `Customer Productivity`
  String get customerProductivity {
    return Intl.message(
      'Customer Productivity',
      name: 'customerProductivity',
      desc: '',
      args: [],
    );
  }

  /// `Customer Quality`
  String get customerQuality {
    return Intl.message(
      'Customer Quality',
      name: 'customerQuality',
      desc: '',
      args: [],
    );
  }

  /// `Customer Excellence`
  String get customerExcellence {
    return Intl.message(
      'Customer Excellence',
      name: 'customerExcellence',
      desc: '',
      args: [],
    );
  }

  /// `Customer Innovation`
  String get customerInnovation {
    return Intl.message(
      'Customer Innovation',
      name: 'customerInnovation',
      desc: '',
      args: [],
    );
  }

  /// `Customer Creativity`
  String get customerCreativity {
    return Intl.message(
      'Customer Creativity',
      name: 'customerCreativity',
      desc: '',
      args: [],
    );
  }

  /// `Customer Originality`
  String get customerOriginality {
    return Intl.message(
      'Customer Originality',
      name: 'customerOriginality',
      desc: '',
      args: [],
    );
  }

  /// `Customer Uniqueness`
  String get customerUniqueness {
    return Intl.message(
      'Customer Uniqueness',
      name: 'customerUniqueness',
      desc: '',
      args: [],
    );
  }

  /// `Customer Distinctiveness`
  String get customerDistinctiveness {
    return Intl.message(
      'Customer Distinctiveness',
      name: 'customerDistinctiveness',
      desc: '',
      args: [],
    );
  }

  /// `Customer Specialization`
  String get customerSpecialization {
    return Intl.message(
      'Customer Specialization',
      name: 'customerSpecialization',
      desc: '',
      args: [],
    );
  }

  /// `Customer Expertise`
  String get customerExpertise {
    return Intl.message(
      'Customer Expertise',
      name: 'customerExpertise',
      desc: '',
      args: [],
    );
  }

  /// `Customer Knowledge`
  String get customerKnowledge {
    return Intl.message(
      'Customer Knowledge',
      name: 'customerKnowledge',
      desc: '',
      args: [],
    );
  }

  /// `Customer Skills`
  String get customerSkills {
    return Intl.message(
      'Customer Skills',
      name: 'customerSkills',
      desc: '',
      args: [],
    );
  }

  /// `Customer Abilities`
  String get customerAbilities {
    return Intl.message(
      'Customer Abilities',
      name: 'customerAbilities',
      desc: '',
      args: [],
    );
  }

  /// `Customer Capabilities`
  String get customerCapabilities {
    return Intl.message(
      'Customer Capabilities',
      name: 'customerCapabilities',
      desc: '',
      args: [],
    );
  }

  /// `Customer Competencies`
  String get customerCompetencies {
    return Intl.message(
      'Customer Competencies',
      name: 'customerCompetencies',
      desc: '',
      args: [],
    );
  }

  /// `Customer Qualifications`
  String get customerQualifications {
    return Intl.message(
      'Customer Qualifications',
      name: 'customerQualifications',
      desc: '',
      args: [],
    );
  }

  /// `Customer Credentials`
  String get customerCredentials {
    return Intl.message(
      'Customer Credentials',
      name: 'customerCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Customer Certifications`
  String get customerCertifications {
    return Intl.message(
      'Customer Certifications',
      name: 'customerCertifications',
      desc: '',
      args: [],
    );
  }

  /// `Customer Licenses`
  String get customerLicenses {
    return Intl.message(
      'Customer Licenses',
      name: 'customerLicenses',
      desc: '',
      args: [],
    );
  }

  /// `Customer Permits`
  String get customerPermits {
    return Intl.message(
      'Customer Permits',
      name: 'customerPermits',
      desc: '',
      args: [],
    );
  }

  /// `Customer Approvals`
  String get customerApprovals {
    return Intl.message(
      'Customer Approvals',
      name: 'customerApprovals',
      desc: '',
      args: [],
    );
  }

  /// `Customer Authorizations`
  String get customerAuthorizations {
    return Intl.message(
      'Customer Authorizations',
      name: 'customerAuthorizations',
      desc: '',
      args: [],
    );
  }

  /// `Customer Endorsements`
  String get customerEndorsements {
    return Intl.message(
      'Customer Endorsements',
      name: 'customerEndorsements',
      desc: '',
      args: [],
    );
  }

  /// `Customer Comments`
  String get customerComments {
    return Intl.message(
      'Customer Comments',
      name: 'customerComments',
      desc: '',
      args: [],
    );
  }

  /// `Customer Ideas`
  String get customerIdeas {
    return Intl.message(
      'Customer Ideas',
      name: 'customerIdeas',
      desc: '',
      args: [],
    );
  }

  /// `Customer Proposals`
  String get customerProposals {
    return Intl.message(
      'Customer Proposals',
      name: 'customerProposals',
      desc: '',
      args: [],
    );
  }

  /// `Customer Plans`
  String get customerPlans {
    return Intl.message(
      'Customer Plans',
      name: 'customerPlans',
      desc: '',
      args: [],
    );
  }

  /// `Customer Strategies`
  String get customerStrategies {
    return Intl.message(
      'Customer Strategies',
      name: 'customerStrategies',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tactics`
  String get customerTactics {
    return Intl.message(
      'Customer Tactics',
      name: 'customerTactics',
      desc: '',
      args: [],
    );
  }

  /// `Customer Methods`
  String get customerMethods {
    return Intl.message(
      'Customer Methods',
      name: 'customerMethods',
      desc: '',
      args: [],
    );
  }

  /// `Customer Approaches`
  String get customerApproaches {
    return Intl.message(
      'Customer Approaches',
      name: 'customerApproaches',
      desc: '',
      args: [],
    );
  }

  /// `Customer Techniques`
  String get customerTechniques {
    return Intl.message(
      'Customer Techniques',
      name: 'customerTechniques',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tools`
  String get customerTools {
    return Intl.message(
      'Customer Tools',
      name: 'customerTools',
      desc: '',
      args: [],
    );
  }

  /// `Customer Assets`
  String get customerAssets {
    return Intl.message(
      'Customer Assets',
      name: 'customerAssets',
      desc: '',
      args: [],
    );
  }

  /// `Customer Capital`
  String get customerCapital {
    return Intl.message(
      'Customer Capital',
      name: 'customerCapital',
      desc: '',
      args: [],
    );
  }

  /// `Customer Funding`
  String get customerFunding {
    return Intl.message(
      'Customer Funding',
      name: 'customerFunding',
      desc: '',
      args: [],
    );
  }

  /// `Customer Financing`
  String get customerFinancing {
    return Intl.message(
      'Customer Financing',
      name: 'customerFinancing',
      desc: '',
      args: [],
    );
  }

  /// `Customer Budget`
  String get customerBudget {
    return Intl.message(
      'Customer Budget',
      name: 'customerBudget',
      desc: '',
      args: [],
    );
  }

  /// `Customer Price`
  String get customerPrice {
    return Intl.message(
      'Customer Price',
      name: 'customerPrice',
      desc: '',
      args: [],
    );
  }

  /// `Customer Worth`
  String get customerWorth {
    return Intl.message(
      'Customer Worth',
      name: 'customerWorth',
      desc: '',
      args: [],
    );
  }

  /// `Customer Benefit`
  String get customerBenefit {
    return Intl.message(
      'Customer Benefit',
      name: 'customerBenefit',
      desc: '',
      args: [],
    );
  }

  /// `Customer Advantage`
  String get customerAdvantage {
    return Intl.message(
      'Customer Advantage',
      name: 'customerAdvantage',
      desc: '',
      args: [],
    );
  }

  /// `Customer Gain`
  String get customerGain {
    return Intl.message(
      'Customer Gain',
      name: 'customerGain',
      desc: '',
      args: [],
    );
  }

  /// `Customer Income`
  String get customerIncome {
    return Intl.message(
      'Customer Income',
      name: 'customerIncome',
      desc: '',
      args: [],
    );
  }

  /// `Customer Earnings`
  String get customerEarnings {
    return Intl.message(
      'Customer Earnings',
      name: 'customerEarnings',
      desc: '',
      args: [],
    );
  }

  /// `Customer Savings`
  String get customerSavings {
    return Intl.message(
      'Customer Savings',
      name: 'customerSavings',
      desc: '',
      args: [],
    );
  }

  /// `Customer Wealth`
  String get customerWealth {
    return Intl.message(
      'Customer Wealth',
      name: 'customerWealth',
      desc: '',
      args: [],
    );
  }

  /// `Customer Fortune`
  String get customerFortune {
    return Intl.message(
      'Customer Fortune',
      name: 'customerFortune',
      desc: '',
      args: [],
    );
  }

  /// `Customer Achievement`
  String get customerAchievement {
    return Intl.message(
      'Customer Achievement',
      name: 'customerAchievement',
      desc: '',
      args: [],
    );
  }

  /// `Customer Accomplishment`
  String get customerAccomplishment {
    return Intl.message(
      'Customer Accomplishment',
      name: 'customerAccomplishment',
      desc: '',
      args: [],
    );
  }

  /// `Customer Victory`
  String get customerVictory {
    return Intl.message(
      'Customer Victory',
      name: 'customerVictory',
      desc: '',
      args: [],
    );
  }

  /// `Customer Triumph`
  String get customerTriumph {
    return Intl.message(
      'Customer Triumph',
      name: 'customerTriumph',
      desc: '',
      args: [],
    );
  }

  /// `Customer Win`
  String get customerWin {
    return Intl.message(
      'Customer Win',
      name: 'customerWin',
      desc: '',
      args: [],
    );
  }

  /// `Customer Edge`
  String get customerEdge {
    return Intl.message(
      'Customer Edge',
      name: 'customerEdge',
      desc: '',
      args: [],
    );
  }

  /// `Customer Superiority`
  String get customerSuperiority {
    return Intl.message(
      'Customer Superiority',
      name: 'customerSuperiority',
      desc: '',
      args: [],
    );
  }

  /// `Customer Perfection`
  String get customerPerfection {
    return Intl.message(
      'Customer Perfection',
      name: 'customerPerfection',
      desc: '',
      args: [],
    );
  }

  /// `Customer Flawlessness`
  String get customerFlawlessness {
    return Intl.message(
      'Customer Flawlessness',
      name: 'customerFlawlessness',
      desc: '',
      args: [],
    );
  }

  /// `Customer Ideal`
  String get customerIdeal {
    return Intl.message(
      'Customer Ideal',
      name: 'customerIdeal',
      desc: '',
      args: [],
    );
  }

  /// `Customer Optimal`
  String get customerOptimal {
    return Intl.message(
      'Customer Optimal',
      name: 'customerOptimal',
      desc: '',
      args: [],
    );
  }

  /// `Customer Best`
  String get customerBest {
    return Intl.message(
      'Customer Best',
      name: 'customerBest',
      desc: '',
      args: [],
    );
  }

  /// `Customer Top`
  String get customerTop {
    return Intl.message(
      'Customer Top',
      name: 'customerTop',
      desc: '',
      args: [],
    );
  }

  /// `Customer Highest`
  String get customerHighest {
    return Intl.message(
      'Customer Highest',
      name: 'customerHighest',
      desc: '',
      args: [],
    );
  }

  /// `Customer Maximum`
  String get customerMaximum {
    return Intl.message(
      'Customer Maximum',
      name: 'customerMaximum',
      desc: '',
      args: [],
    );
  }

  /// `Customer Peak`
  String get customerPeak {
    return Intl.message(
      'Customer Peak',
      name: 'customerPeak',
      desc: '',
      args: [],
    );
  }

  /// `Customer Summit`
  String get customerSummit {
    return Intl.message(
      'Customer Summit',
      name: 'customerSummit',
      desc: '',
      args: [],
    );
  }

  /// `Customer Pinnacle`
  String get customerPinnacle {
    return Intl.message(
      'Customer Pinnacle',
      name: 'customerPinnacle',
      desc: '',
      args: [],
    );
  }

  /// `Customer Crown`
  String get customerCrown {
    return Intl.message(
      'Customer Crown',
      name: 'customerCrown',
      desc: '',
      args: [],
    );
  }

  /// `Customer Jewel`
  String get customerJewel {
    return Intl.message(
      'Customer Jewel',
      name: 'customerJewel',
      desc: '',
      args: [],
    );
  }

  /// `Customer Gem`
  String get customerGem {
    return Intl.message(
      'Customer Gem',
      name: 'customerGem',
      desc: '',
      args: [],
    );
  }

  /// `Customer Treasure`
  String get customerTreasure {
    return Intl.message(
      'Customer Treasure',
      name: 'customerTreasure',
      desc: '',
      args: [],
    );
  }

  /// `Customer Gold`
  String get customerGold {
    return Intl.message(
      'Customer Gold',
      name: 'customerGold',
      desc: '',
      args: [],
    );
  }

  /// `Customer Diamond`
  String get customerDiamond {
    return Intl.message(
      'Customer Diamond',
      name: 'customerDiamond',
      desc: '',
      args: [],
    );
  }

  /// `Customer Pearl`
  String get customerPearl {
    return Intl.message(
      'Customer Pearl',
      name: 'customerPearl',
      desc: '',
      args: [],
    );
  }

  /// `Customer Ruby`
  String get customerRuby {
    return Intl.message(
      'Customer Ruby',
      name: 'customerRuby',
      desc: '',
      args: [],
    );
  }

  /// `Customer Emerald`
  String get customerEmerald {
    return Intl.message(
      'Customer Emerald',
      name: 'customerEmerald',
      desc: '',
      args: [],
    );
  }

  /// `Customer Sapphire`
  String get customerSapphire {
    return Intl.message(
      'Customer Sapphire',
      name: 'customerSapphire',
      desc: '',
      args: [],
    );
  }

  /// `Customer Amethyst`
  String get customerAmethyst {
    return Intl.message(
      'Customer Amethyst',
      name: 'customerAmethyst',
      desc: '',
      args: [],
    );
  }

  /// `Customer Topaz`
  String get customerTopaz {
    return Intl.message(
      'Customer Topaz',
      name: 'customerTopaz',
      desc: '',
      args: [],
    );
  }

  /// `Customer Garnet`
  String get customerGarnet {
    return Intl.message(
      'Customer Garnet',
      name: 'customerGarnet',
      desc: '',
      args: [],
    );
  }

  /// `Customer Opal`
  String get customerOpal {
    return Intl.message(
      'Customer Opal',
      name: 'customerOpal',
      desc: '',
      args: [],
    );
  }

  /// `Customer Turquoise`
  String get customerTurquoise {
    return Intl.message(
      'Customer Turquoise',
      name: 'customerTurquoise',
      desc: '',
      args: [],
    );
  }

  /// `Customer Coral`
  String get customerCoral {
    return Intl.message(
      'Customer Coral',
      name: 'customerCoral',
      desc: '',
      args: [],
    );
  }

  /// `Customer Jade`
  String get customerJade {
    return Intl.message(
      'Customer Jade',
      name: 'customerJade',
      desc: '',
      args: [],
    );
  }

  /// `Customer Agate`
  String get customerAgate {
    return Intl.message(
      'Customer Agate',
      name: 'customerAgate',
      desc: '',
      args: [],
    );
  }

  /// `Customer Onyx`
  String get customerOnyx {
    return Intl.message(
      'Customer Onyx',
      name: 'customerOnyx',
      desc: '',
      args: [],
    );
  }

  /// `Customer Quartz`
  String get customerQuartz {
    return Intl.message(
      'Customer Quartz',
      name: 'customerQuartz',
      desc: '',
      args: [],
    );
  }

  /// `Customer Crystal`
  String get customerCrystal {
    return Intl.message(
      'Customer Crystal',
      name: 'customerCrystal',
      desc: '',
      args: [],
    );
  }

  /// `Customer Amber`
  String get customerAmber {
    return Intl.message(
      'Customer Amber',
      name: 'customerAmber',
      desc: '',
      args: [],
    );
  }

  /// `Customer Jet`
  String get customerJet {
    return Intl.message(
      'Customer Jet',
      name: 'customerJet',
      desc: '',
      args: [],
    );
  }

  /// `Customer Ivory`
  String get customerIvory {
    return Intl.message(
      'Customer Ivory',
      name: 'customerIvory',
      desc: '',
      args: [],
    );
  }

  /// `Customer Bone`
  String get customerBone {
    return Intl.message(
      'Customer Bone',
      name: 'customerBone',
      desc: '',
      args: [],
    );
  }

  /// `Customer Wood`
  String get customerWood {
    return Intl.message(
      'Customer Wood',
      name: 'customerWood',
      desc: '',
      args: [],
    );
  }

  /// `Customer Stone`
  String get customerStone {
    return Intl.message(
      'Customer Stone',
      name: 'customerStone',
      desc: '',
      args: [],
    );
  }

  /// `Customer Rock`
  String get customerRock {
    return Intl.message(
      'Customer Rock',
      name: 'customerRock',
      desc: '',
      args: [],
    );
  }

  /// `Customer Metal`
  String get customerMetal {
    return Intl.message(
      'Customer Metal',
      name: 'customerMetal',
      desc: '',
      args: [],
    );
  }

  /// `Customer Iron`
  String get customerIron {
    return Intl.message(
      'Customer Iron',
      name: 'customerIron',
      desc: '',
      args: [],
    );
  }

  /// `Customer Steel`
  String get customerSteel {
    return Intl.message(
      'Customer Steel',
      name: 'customerSteel',
      desc: '',
      args: [],
    );
  }

  /// `Customer Copper`
  String get customerCopper {
    return Intl.message(
      'Customer Copper',
      name: 'customerCopper',
      desc: '',
      args: [],
    );
  }

  /// `Customer Bronze`
  String get customerBronze {
    return Intl.message(
      'Customer Bronze',
      name: 'customerBronze',
      desc: '',
      args: [],
    );
  }

  /// `Customer Silver`
  String get customerSilver {
    return Intl.message(
      'Customer Silver',
      name: 'customerSilver',
      desc: '',
      args: [],
    );
  }

  /// `Customer Platinum`
  String get customerPlatinum {
    return Intl.message(
      'Customer Platinum',
      name: 'customerPlatinum',
      desc: '',
      args: [],
    );
  }

  /// `Customer Titanium`
  String get customerTitanium {
    return Intl.message(
      'Customer Titanium',
      name: 'customerTitanium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Aluminum`
  String get customerAluminum {
    return Intl.message(
      'Customer Aluminum',
      name: 'customerAluminum',
      desc: '',
      args: [],
    );
  }

  /// `Customer Zinc`
  String get customerZinc {
    return Intl.message(
      'Customer Zinc',
      name: 'customerZinc',
      desc: '',
      args: [],
    );
  }

  /// `Customer Lead`
  String get customerLead {
    return Intl.message(
      'Customer Lead',
      name: 'customerLead',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tin`
  String get customerTin {
    return Intl.message(
      'Customer Tin',
      name: 'customerTin',
      desc: '',
      args: [],
    );
  }

  /// `Customer Nickel`
  String get customerNickel {
    return Intl.message(
      'Customer Nickel',
      name: 'customerNickel',
      desc: '',
      args: [],
    );
  }

  /// `Customer Chromium`
  String get customerChromium {
    return Intl.message(
      'Customer Chromium',
      name: 'customerChromium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Manganese`
  String get customerManganese {
    return Intl.message(
      'Customer Manganese',
      name: 'customerManganese',
      desc: '',
      args: [],
    );
  }

  /// `Customer Cobalt`
  String get customerCobalt {
    return Intl.message(
      'Customer Cobalt',
      name: 'customerCobalt',
      desc: '',
      args: [],
    );
  }

  /// `Customer Vanadium`
  String get customerVanadium {
    return Intl.message(
      'Customer Vanadium',
      name: 'customerVanadium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tungsten`
  String get customerTungsten {
    return Intl.message(
      'Customer Tungsten',
      name: 'customerTungsten',
      desc: '',
      args: [],
    );
  }

  /// `Customer Molybdenum`
  String get customerMolybdenum {
    return Intl.message(
      'Customer Molybdenum',
      name: 'customerMolybdenum',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tantalum`
  String get customerTantalum {
    return Intl.message(
      'Customer Tantalum',
      name: 'customerTantalum',
      desc: '',
      args: [],
    );
  }

  /// `Customer Niobium`
  String get customerNiobium {
    return Intl.message(
      'Customer Niobium',
      name: 'customerNiobium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Hafnium`
  String get customerHafnium {
    return Intl.message(
      'Customer Hafnium',
      name: 'customerHafnium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Zirconium`
  String get customerZirconium {
    return Intl.message(
      'Customer Zirconium',
      name: 'customerZirconium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Ruthenium`
  String get customerRuthenium {
    return Intl.message(
      'Customer Ruthenium',
      name: 'customerRuthenium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Rhodium`
  String get customerRhodium {
    return Intl.message(
      'Customer Rhodium',
      name: 'customerRhodium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Palladium`
  String get customerPalladium {
    return Intl.message(
      'Customer Palladium',
      name: 'customerPalladium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Osmium`
  String get customerOsmium {
    return Intl.message(
      'Customer Osmium',
      name: 'customerOsmium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Iridium`
  String get customerIridium {
    return Intl.message(
      'Customer Iridium',
      name: 'customerIridium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Rhenium`
  String get customerRhenium {
    return Intl.message(
      'Customer Rhenium',
      name: 'customerRhenium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Technetium`
  String get customerTechnetium {
    return Intl.message(
      'Customer Technetium',
      name: 'customerTechnetium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Promethium`
  String get customerPromethium {
    return Intl.message(
      'Customer Promethium',
      name: 'customerPromethium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Polonium`
  String get customerPolonium {
    return Intl.message(
      'Customer Polonium',
      name: 'customerPolonium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Astatine`
  String get customerAstatine {
    return Intl.message(
      'Customer Astatine',
      name: 'customerAstatine',
      desc: '',
      args: [],
    );
  }

  /// `Customer Radon`
  String get customerRadon {
    return Intl.message(
      'Customer Radon',
      name: 'customerRadon',
      desc: '',
      args: [],
    );
  }

  /// `Customer Francium`
  String get customerFrancium {
    return Intl.message(
      'Customer Francium',
      name: 'customerFrancium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Radium`
  String get customerRadium {
    return Intl.message(
      'Customer Radium',
      name: 'customerRadium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Actinium`
  String get customerActinium {
    return Intl.message(
      'Customer Actinium',
      name: 'customerActinium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Thorium`
  String get customerThorium {
    return Intl.message(
      'Customer Thorium',
      name: 'customerThorium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Protactinium`
  String get customerProtactinium {
    return Intl.message(
      'Customer Protactinium',
      name: 'customerProtactinium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Uranium`
  String get customerUranium {
    return Intl.message(
      'Customer Uranium',
      name: 'customerUranium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Neptunium`
  String get customerNeptunium {
    return Intl.message(
      'Customer Neptunium',
      name: 'customerNeptunium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Plutonium`
  String get customerPlutonium {
    return Intl.message(
      'Customer Plutonium',
      name: 'customerPlutonium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Americium`
  String get customerAmericium {
    return Intl.message(
      'Customer Americium',
      name: 'customerAmericium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Curium`
  String get customerCurium {
    return Intl.message(
      'Customer Curium',
      name: 'customerCurium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Berkelium`
  String get customerBerkelium {
    return Intl.message(
      'Customer Berkelium',
      name: 'customerBerkelium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Californium`
  String get customerCalifornium {
    return Intl.message(
      'Customer Californium',
      name: 'customerCalifornium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Einsteinium`
  String get customerEinsteinium {
    return Intl.message(
      'Customer Einsteinium',
      name: 'customerEinsteinium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Fermium`
  String get customerFermium {
    return Intl.message(
      'Customer Fermium',
      name: 'customerFermium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Mendelevium`
  String get customerMendelevium {
    return Intl.message(
      'Customer Mendelevium',
      name: 'customerMendelevium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Nobelium`
  String get customerNobelium {
    return Intl.message(
      'Customer Nobelium',
      name: 'customerNobelium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Lawrencium`
  String get customerLawrencium {
    return Intl.message(
      'Customer Lawrencium',
      name: 'customerLawrencium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Rutherfordium`
  String get customerRutherfordium {
    return Intl.message(
      'Customer Rutherfordium',
      name: 'customerRutherfordium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Dubnium`
  String get customerDubnium {
    return Intl.message(
      'Customer Dubnium',
      name: 'customerDubnium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Seaborgium`
  String get customerSeaborgium {
    return Intl.message(
      'Customer Seaborgium',
      name: 'customerSeaborgium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Bohrium`
  String get customerBohrium {
    return Intl.message(
      'Customer Bohrium',
      name: 'customerBohrium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Hassium`
  String get customerHassium {
    return Intl.message(
      'Customer Hassium',
      name: 'customerHassium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Meitnerium`
  String get customerMeitnerium {
    return Intl.message(
      'Customer Meitnerium',
      name: 'customerMeitnerium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Darmstadtium`
  String get customerDarmstadtium {
    return Intl.message(
      'Customer Darmstadtium',
      name: 'customerDarmstadtium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Roentgenium`
  String get customerRoentgenium {
    return Intl.message(
      'Customer Roentgenium',
      name: 'customerRoentgenium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Copernicium`
  String get customerCopernicium {
    return Intl.message(
      'Customer Copernicium',
      name: 'customerCopernicium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Nihonium`
  String get customerNihonium {
    return Intl.message(
      'Customer Nihonium',
      name: 'customerNihonium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Flerovium`
  String get customerFlerovium {
    return Intl.message(
      'Customer Flerovium',
      name: 'customerFlerovium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Moscovium`
  String get customerMoscovium {
    return Intl.message(
      'Customer Moscovium',
      name: 'customerMoscovium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Livermorium`
  String get customerLivermorium {
    return Intl.message(
      'Customer Livermorium',
      name: 'customerLivermorium',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tennessine`
  String get customerTennessine {
    return Intl.message(
      'Customer Tennessine',
      name: 'customerTennessine',
      desc: '',
      args: [],
    );
  }

  /// `Customer Oganesson`
  String get customerOganesson {
    return Intl.message(
      'Customer Oganesson',
      name: 'customerOganesson',
      desc: '',
      args: [],
    );
  }

  /// `Filter Customers`
  String get filterCustomers {
    return Intl.message(
      'Filter Customers',
      name: 'filterCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message('Filters', name: 'filters', desc: '', args: []);
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message('Sort By', name: 'sortBy', desc: '', args: []);
  }

  /// `Sort Order`
  String get sortOrder {
    return Intl.message('Sort Order', name: 'sortOrder', desc: '', args: []);
  }

  /// `Name`
  String get sortByName {
    return Intl.message('Name', name: 'sortByName', desc: '', args: []);
  }

  /// `Email`
  String get sortByEmail {
    return Intl.message('Email', name: 'sortByEmail', desc: '', args: []);
  }

  /// `Created Date`
  String get sortByCreatedAt {
    return Intl.message(
      'Created Date',
      name: 'sortByCreatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Updated Date`
  String get sortByUpdatedAt {
    return Intl.message(
      'Updated Date',
      name: 'sortByUpdatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Ascending`
  String get ascending {
    return Intl.message('Ascending', name: 'ascending', desc: '', args: []);
  }

  /// `Descending`
  String get descending {
    return Intl.message('Descending', name: 'descending', desc: '', args: []);
  }

  /// `Apply Filters`
  String get applyFilters {
    return Intl.message(
      'Apply Filters',
      name: 'applyFilters',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get resetFilters {
    return Intl.message('Reset', name: 'resetFilters', desc: '', args: []);
  }

  /// `Active`
  String get activeStatus {
    return Intl.message('Active', name: 'activeStatus', desc: '', args: []);
  }

  /// `Inactive`
  String get inactiveStatus {
    return Intl.message('Inactive', name: 'inactiveStatus', desc: '', args: []);
  }

  /// `Updated Successfully`
  String get updatedSuccessfully {
    return Intl.message(
      'Updated Successfully',
      name: 'updatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Photo Updated Successfully`
  String get photoUpdatedSuccessfully {
    return Intl.message(
      'Photo Updated Successfully',
      name: 'photoUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error Occurred: {message}`
  String errorOccurredWithMessage(Object message) {
    return Intl.message(
      'Error Occurred: $message',
      name: 'errorOccurredWithMessage',
      desc: '',
      args: [message],
    );
  }

  /// `Update Photo`
  String get updatePhoto {
    return Intl.message(
      'Update Photo',
      name: 'updatePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Position`
  String get position {
    return Intl.message('Position', name: 'position', desc: '', args: []);
  }

  /// `{field} is required`
  String fieldIsRequired(String field) {
    return Intl.message(
      '$field is required',
      name: 'fieldIsRequired',
      desc: '',
      args: [field],
    );
  }

  /// `Activate`
  String get activate {
    return Intl.message('Activate', name: 'activate', desc: '', args: []);
  }

  /// `Deactivate`
  String get deactivate {
    return Intl.message('Deactivate', name: 'deactivate', desc: '', args: []);
  }

  /// `Tax Merchant Code`
  String get taxMerchantCode {
    return Intl.message(
      'Tax Merchant Code',
      name: 'taxMerchantCode',
      desc: '',
      args: [],
    );
  }

  /// `Tax Invoice Type`
  String get taxInvoiceType {
    return Intl.message(
      'Tax Invoice Type',
      name: 'taxInvoiceType',
      desc: '',
      args: [],
    );
  }

  /// `Not allowed`
  String get noPermission {
    return Intl.message(
      'Not allowed',
      name: 'noPermission',
      desc: '',
      args: [],
    );
  }

  /// `Loading dashboard data...`
  String get authLoadingDashboard {
    return Intl.message(
      'Loading dashboard data...',
      name: 'authLoadingDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Loading complete!`
  String get authLoadingComplete {
    return Intl.message(
      'Loading complete!',
      name: 'authLoadingComplete',
      desc: '',
      args: [],
    );
  }

  /// `Loading error`
  String get authLoadingError {
    return Intl.message(
      'Loading error',
      name: 'authLoadingError',
      desc: '',
      args: [],
    );
  }

  /// `Subscription required`
  String get authSubscriptionRequired {
    return Intl.message(
      'Subscription required',
      name: 'authSubscriptionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Loading statistics...`
  String get authLoadingStatistics {
    return Intl.message(
      'Loading statistics...',
      name: 'authLoadingStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Preparing home screen...`
  String get authPreparingHome {
    return Intl.message(
      'Preparing home screen...',
      name: 'authPreparingHome',
      desc: '',
      args: [],
    );
  }

  /// `Copy the code from email and paste it here`
  String get authCopyCodeFromEmail {
    return Intl.message(
      'Copy the code from email and paste it here',
      name: 'authCopyCodeFromEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter password confirmation`
  String get authConfirmPasswordHint {
    return Intl.message(
      'Enter password confirmation',
      name: 'authConfirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get authSignInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'authSignInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Add New Client`
  String get clientsAddNew {
    return Intl.message(
      'Add New Client',
      name: 'clientsAddNew',
      desc: '',
      args: [],
    );
  }

  /// `Fill the form below to add a new client to the system`
  String get clientsAddNewDesc {
    return Intl.message(
      'Fill the form below to add a new client to the system',
      name: 'clientsAddNewDesc',
      desc: '',
      args: [],
    );
  }

  /// `Edit Client`
  String get clientsEdit {
    return Intl.message('Edit Client', name: 'clientsEdit', desc: '', args: []);
  }

  /// `Edit client data "{clientName}"`
  String clientsEditDesc(String clientName) {
    return Intl.message(
      'Edit client data "$clientName"',
      name: 'clientsEditDesc',
      desc: '',
      args: [clientName],
    );
  }

  /// `Client Details`
  String get clientsDetails {
    return Intl.message(
      'Client Details',
      name: 'clientsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get clientsBasicInfo {
    return Intl.message(
      'Basic Information',
      name: 'clientsBasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Company Information`
  String get clientsCompanyInfo {
    return Intl.message(
      'Company Information',
      name: 'clientsCompanyInfo',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Information`
  String get clientsContactPersonInfo {
    return Intl.message(
      'Contact Person Information',
      name: 'clientsContactPersonInfo',
      desc: '',
      args: [],
    );
  }

  /// `Additional Information`
  String get clientsAdditionalInfo {
    return Intl.message(
      'Additional Information',
      name: 'clientsAdditionalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get clientsClientName {
    return Intl.message(
      'Client Name',
      name: 'clientsClientName',
      desc: '',
      args: [],
    );
  }

  /// `Enter client name`
  String get clientsEnterClientName {
    return Intl.message(
      'Enter client name',
      name: 'clientsEnterClientName',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get clientsEnterEmail {
    return Intl.message(
      'Enter email',
      name: 'clientsEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get clientsEnterPhone {
    return Intl.message(
      'Enter phone number',
      name: 'clientsEnterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter client address`
  String get clientsEnterAddress {
    return Intl.message(
      'Enter client address',
      name: 'clientsEnterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get clientsCompanyName {
    return Intl.message(
      'Company Name',
      name: 'clientsCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Enter company name`
  String get clientsEnterCompanyName {
    return Intl.message(
      'Enter company name',
      name: 'clientsEnterCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Tax Number`
  String get clientsTaxNumber {
    return Intl.message(
      'Tax Number',
      name: 'clientsTaxNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter tax number`
  String get clientsEnterTaxNumber {
    return Intl.message(
      'Enter tax number',
      name: 'clientsEnterTaxNumber',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get clientsWebsite {
    return Intl.message('Website', name: 'clientsWebsite', desc: '', args: []);
  }

  /// `Enter website`
  String get clientsEnterWebsite {
    return Intl.message(
      'Enter website',
      name: 'clientsEnterWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Name`
  String get clientsContactPersonName {
    return Intl.message(
      'Contact Person Name',
      name: 'clientsContactPersonName',
      desc: '',
      args: [],
    );
  }

  /// `Enter contact person name`
  String get clientsEnterContactPersonName {
    return Intl.message(
      'Enter contact person name',
      name: 'clientsEnterContactPersonName',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Phone`
  String get clientsContactPersonPhone {
    return Intl.message(
      'Contact Person Phone',
      name: 'clientsContactPersonPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter contact person phone`
  String get clientsEnterContactPersonPhone {
    return Intl.message(
      'Enter contact person phone',
      name: 'clientsEnterContactPersonPhone',
      desc: '',
      args: [],
    );
  }

  /// `Contact Person Email`
  String get clientsContactPersonEmail {
    return Intl.message(
      'Contact Person Email',
      name: 'clientsContactPersonEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter contact person email`
  String get clientsEnterContactPersonEmail {
    return Intl.message(
      'Enter contact person email',
      name: 'clientsEnterContactPersonEmail',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get clientsStatus {
    return Intl.message('Status', name: 'clientsStatus', desc: '', args: []);
  }

  /// `Notes`
  String get clientsNotes {
    return Intl.message('Notes', name: 'clientsNotes', desc: '', args: []);
  }

  /// `Enter additional notes`
  String get clientsEnterNotes {
    return Intl.message(
      'Enter additional notes',
      name: 'clientsEnterNotes',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get clientsActive {
    return Intl.message('Active', name: 'clientsActive', desc: '', args: []);
  }

  /// `Inactive`
  String get clientsInactive {
    return Intl.message(
      'Inactive',
      name: 'clientsInactive',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get clientsAll {
    return Intl.message('All', name: 'clientsAll', desc: '', args: []);
  }

  /// `Add Client`
  String get clientsAddClient {
    return Intl.message(
      'Add Client',
      name: 'clientsAddClient',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get clientsSaveChanges {
    return Intl.message(
      'Save Changes',
      name: 'clientsSaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get clientsCancel {
    return Intl.message('Cancel', name: 'clientsCancel', desc: '', args: []);
  }

  /// `Edit`
  String get clientsEditAction {
    return Intl.message('Edit', name: 'clientsEditAction', desc: '', args: []);
  }

  /// `Delete`
  String get clientsDelete {
    return Intl.message('Delete', name: 'clientsDelete', desc: '', args: []);
  }

  /// `View`
  String get clientsView {
    return Intl.message('View', name: 'clientsView', desc: '', args: []);
  }

  /// `Confirm Delete`
  String get clientsDeleteConfirmation {
    return Intl.message(
      'Confirm Delete',
      name: 'clientsDeleteConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete client "{clientName}"?`
  String clientsDeleteConfirmationMessage(String clientName) {
    return Intl.message(
      'Are you sure you want to delete client "$clientName"?',
      name: 'clientsDeleteConfirmationMessage',
      desc: '',
      args: [clientName],
    );
  }

  /// `Client added successfully`
  String get clientsClientAddedSuccess {
    return Intl.message(
      'Client added successfully',
      name: 'clientsClientAddedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Client updated successfully`
  String get clientsClientUpdatedSuccess {
    return Intl.message(
      'Client updated successfully',
      name: 'clientsClientUpdatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred while creating client: {error}`
  String clientsErrorCreatingClient(String error) {
    return Intl.message(
      'Error occurred while creating client: $error',
      name: 'clientsErrorCreatingClient',
      desc: '',
      args: [error],
    );
  }

  /// `Error occurred while updating client: {error}`
  String clientsErrorUpdatingClient(String error) {
    return Intl.message(
      'Error occurred while updating client: $error',
      name: 'clientsErrorUpdatingClient',
      desc: '',
      args: [error],
    );
  }

  /// `Name`
  String get clientsName {
    return Intl.message('Name', name: 'clientsName', desc: '', args: []);
  }

  /// `Email`
  String get clientsEmail {
    return Intl.message('Email', name: 'clientsEmail', desc: '', args: []);
  }

  /// `Phone`
  String get clientsPhone {
    return Intl.message('Phone', name: 'clientsPhone', desc: '', args: []);
  }

  /// `Address`
  String get clientsAddress {
    return Intl.message('Address', name: 'clientsAddress', desc: '', args: []);
  }

  /// `Created At`
  String get clientsCreatedAt {
    return Intl.message(
      'Created At',
      name: 'clientsCreatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Last Updated`
  String get clientsUpdatedAt {
    return Intl.message(
      'Last Updated',
      name: 'clientsUpdatedAt',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to view this content`
  String get clientsNoPermissionToView {
    return Intl.message(
      'You don\'t have permission to view this content',
      name: 'clientsNoPermissionToView',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this action`
  String get clientsNoPermissionToAct {
    return Intl.message(
      'You don\'t have permission to perform this action',
      name: 'clientsNoPermissionToAct',
      desc: '',
      args: [],
    );
  }

  /// `Locked Action`
  String get clientsLockedAction {
    return Intl.message(
      'Locked Action',
      name: 'clientsLockedAction',
      desc: '',
      args: [],
    );
  }

  /// `Search clients...`
  String get clientsSearchClients {
    return Intl.message(
      'Search clients...',
      name: 'clientsSearchClients',
      desc: '',
      args: [],
    );
  }

  /// `No clients found`
  String get clientsNoClientsFound {
    return Intl.message(
      'No clients found',
      name: 'clientsNoClientsFound',
      desc: '',
      args: [],
    );
  }

  /// `Start by adding your first client to the system`
  String get clientsStartByAddingFirst {
    return Intl.message(
      'Start by adding your first client to the system',
      name: 'clientsStartByAddingFirst',
      desc: '',
      args: [],
    );
  }

  /// `Add First Client`
  String get clientsAddFirstClient {
    return Intl.message(
      'Add First Client',
      name: 'clientsAddFirstClient',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get clientsTotal {
    return Intl.message('Total', name: 'clientsTotal', desc: '', args: []);
  }

  /// `Clients ({count})`
  String clientsCount(int count) {
    return Intl.message(
      'Clients ($count)',
      name: 'clientsCount',
      desc: '',
      args: [count],
    );
  }

  /// `You don't have permission to view this content`
  String get customersNoPermissionToView {
    return Intl.message(
      'You don\'t have permission to view this content',
      name: 'customersNoPermissionToView',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this action`
  String get customersNoPermissionToAct {
    return Intl.message(
      'You don\'t have permission to perform this action',
      name: 'customersNoPermissionToAct',
      desc: '',
      args: [],
    );
  }

  /// `Locked Action`
  String get customersLockedAction {
    return Intl.message(
      'Locked Action',
      name: 'customersLockedAction',
      desc: '',
      args: [],
    );
  }

  /// `Cannot make call`
  String get customersCannotMakeCall {
    return Intl.message(
      'Cannot make call',
      name: 'customersCannotMakeCall',
      desc: '',
      args: [],
    );
  }

  /// `Call permission denied`
  String get customersCallPermissionDenied {
    return Intl.message(
      'Call permission denied',
      name: 'customersCallPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Call Permission Required`
  String get customersCallPermissionRequired {
    return Intl.message(
      'Call Permission Required',
      name: 'customersCallPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `You must allow call permission to use this feature. Please go to app settings and allow call permission.`
  String get customersCallPermissionRequiredMessage {
    return Intl.message(
      'You must allow call permission to use this feature. Please go to app settings and allow call permission.',
      name: 'customersCallPermissionRequiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cannot send email`
  String get customersCannotSendEmail {
    return Intl.message(
      'Cannot send email',
      name: 'customersCannotSendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Message from Invotek App`
  String get customersEmailSubject {
    return Intl.message(
      'Message from Invotek App',
      name: 'customersEmailSubject',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open map`
  String get customersCannotOpenMap {
    return Intl.message(
      'Cannot open map',
      name: 'customersCannotOpenMap',
      desc: '',
      args: [],
    );
  }

  /// `Location permission denied`
  String get customersLocationPermissionDenied {
    return Intl.message(
      'Location permission denied',
      name: 'customersLocationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location Permission Required`
  String get customersLocationPermissionRequired {
    return Intl.message(
      'Location Permission Required',
      name: 'customersLocationPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `You must allow location permission to use this feature. Please go to app settings and allow location permission.`
  String get customersLocationPermissionRequiredMessage {
    return Intl.message(
      'You must allow location permission to use this feature. Please go to app settings and allow location permission.',
      name: 'customersLocationPermissionRequiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get customersAppSettings {
    return Intl.message(
      'App Settings',
      name: 'customersAppSettings',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number format`
  String get customersInvalidPhoneFormat {
    return Intl.message(
      'Invalid phone number format',
      name: 'customersInvalidPhoneFormat',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get customersDeleteAction {
    return Intl.message(
      'Delete',
      name: 'customersDeleteAction',
      desc: '',
      args: [],
    );
  }

  /// `Edit Customer`
  String get customersEditCustomerAction {
    return Intl.message(
      'Edit Customer',
      name: 'customersEditCustomerAction',
      desc: '',
      args: [],
    );
  }

  /// `This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information`
  String get customersCustomerFormHelpDescription {
    return Intl.message(
      'This form is divided into three steps:\n\n1. Basic Information\n2. Address Information\n3. Additional Information',
      name: 'customersCustomerFormHelpDescription',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to view this content`
  String get expensesNoPermissionToView {
    return Intl.message(
      'You don\'t have permission to view this content',
      name: 'expensesNoPermissionToView',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this action`
  String get expensesNoPermissionToAct {
    return Intl.message(
      'You don\'t have permission to perform this action',
      name: 'expensesNoPermissionToAct',
      desc: '',
      args: [],
    );
  }

  /// `Locked Action`
  String get expensesLockedAction {
    return Intl.message(
      'Locked Action',
      name: 'expensesLockedAction',
      desc: '',
      args: [],
    );
  }

  /// `Delete Expense`
  String get expensesDeleteExpense {
    return Intl.message(
      'Delete Expense',
      name: 'expensesDeleteExpense',
      desc: '',
      args: [],
    );
  }

  /// `Edit Expense`
  String get expensesEditExpense {
    return Intl.message(
      'Edit Expense',
      name: 'expensesEditExpense',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get expensesViewDetails {
    return Intl.message(
      'View Details',
      name: 'expensesViewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete expense "{expenseTitle}"? This action cannot be undone.`
  String expensesDeleteExpenseConfirmation(String expenseTitle) {
    return Intl.message(
      'Are you sure you want to delete expense "$expenseTitle"? This action cannot be undone.',
      name: 'expensesDeleteExpenseConfirmation',
      desc: '',
      args: [expenseTitle],
    );
  }

  /// `Are you sure you want to delete this expense?`
  String get expensesAreYouSureDeleteExpense {
    return Intl.message(
      'Are you sure you want to delete this expense?',
      name: 'expensesAreYouSureDeleteExpense',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone.`
  String get expensesThisActionCannotBeUndone {
    return Intl.message(
      'This action cannot be undone.',
      name: 'expensesThisActionCannotBeUndone',
      desc: '',
      args: [],
    );
  }

  /// `No description`
  String get expensesNoDescription {
    return Intl.message(
      'No description',
      name: 'expensesNoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Category`
  String get expensesUnknownCategory {
    return Intl.message(
      'Unknown Category',
      name: 'expensesUnknownCategory',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get expensesLoading {
    return Intl.message(
      'Loading...',
      name: 'expensesLoading',
      desc: '',
      args: [],
    );
  }

  /// `Delete Category`
  String get expensesDeleteCategory {
    return Intl.message(
      'Delete Category',
      name: 'expensesDeleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this expense category?`
  String get expensesAreYouSureDeleteCategory {
    return Intl.message(
      'Are you sure you want to delete this expense category?',
      name: 'expensesAreYouSureDeleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Status: {status}`
  String expensesStatus(String status) {
    return Intl.message(
      'Status: $status',
      name: 'expensesStatus',
      desc: '',
      args: [status],
    );
  }

  /// `Copied to clipboard`
  String get expensesCopiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'expensesCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String expensesErrorOccurred(String error) {
    return Intl.message(
      'Error: $error',
      name: 'expensesErrorOccurred',
      desc: '',
      args: [error],
    );
  }

  /// `This screen shows detailed information about the expense including financial details, payment information, and metadata.`
  String get expensesExpenseDetailsHelpDescription {
    return Intl.message(
      'This screen shows detailed information about the expense including financial details, payment information, and metadata.',
      name: 'expensesExpenseDetailsHelpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get expensesExpenseDetailsHelpTitle {
    return Intl.message(
      'Help',
      name: 'expensesExpenseDetailsHelpTitle',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to view this content`
  String get homeNoPermissionToView {
    return Intl.message(
      'You don\'t have permission to view this content',
      name: 'homeNoPermissionToView',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this action`
  String get homeNoPermissionToAct {
    return Intl.message(
      'You don\'t have permission to perform this action',
      name: 'homeNoPermissionToAct',
      desc: '',
      args: [],
    );
  }

  /// `Locked Action`
  String get homeLockedAction {
    return Intl.message(
      'Locked Action',
      name: 'homeLockedAction',
      desc: '',
      args: [],
    );
  }

  /// `Loading dashboard data`
  String get homeLoadingDashboard {
    return Intl.message(
      'Loading dashboard data',
      name: 'homeLoadingDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Add notifications feature here`
  String get homeAddNotificationsFeature {
    return Intl.message(
      'Add notifications feature here',
      name: 'homeAddNotificationsFeature',
      desc: '',
      args: [],
    );
  }

  /// `Access Denied`
  String get homeAccessDenied {
    return Intl.message(
      'Access Denied',
      name: 'homeAccessDenied',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to access {featureName}`
  String homeNoPermissionToAccess(String featureName) {
    return Intl.message(
      'You don\'t have permission to access $featureName',
      name: 'homeNoPermissionToAccess',
      desc: '',
      args: [featureName],
    );
  }

  /// `Are you sure you want to logout?`
  String get homeAreYouSureLogout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'homeAreYouSureLogout',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String homeVersion(String version) {
    return Intl.message(
      'Version $version',
      name: 'homeVersion',
      desc: '',
      args: [version],
    );
  }

  /// `Add New Customer`
  String get homeAddNewCustomer {
    return Intl.message(
      'Add New Customer',
      name: 'homeAddNewCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Create New Invoice`
  String get homeCreateNewInvoice {
    return Intl.message(
      'Create New Invoice',
      name: 'homeCreateNewInvoice',
      desc: '',
      args: [],
    );
  }

  /// `View All Invoices`
  String get homeViewAllInvoices {
    return Intl.message(
      'View All Invoices',
      name: 'homeViewAllInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Device Information`
  String get homeDeviceInfo {
    return Intl.message(
      'Device Information',
      name: 'homeDeviceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Width: {width}px`
  String homeWidth(String width) {
    return Intl.message(
      'Width: ${width}px',
      name: 'homeWidth',
      desc: '',
      args: [width],
    );
  }

  /// `Height: {height}px`
  String homeHeight(String height) {
    return Intl.message(
      'Height: ${height}px',
      name: 'homeHeight',
      desc: '',
      args: [height],
    );
  }

  /// `Device Type: {deviceType}`
  String homeDeviceType(String deviceType) {
    return Intl.message(
      'Device Type: $deviceType',
      name: 'homeDeviceType',
      desc: '',
      args: [deviceType],
    );
  }

  /// `Pixel Ratio: {ratio}`
  String homePixelRatio(String ratio) {
    return Intl.message(
      'Pixel Ratio: $ratio',
      name: 'homePixelRatio',
      desc: '',
      args: [ratio],
    );
  }

  /// `Tablet`
  String get homeTablet {
    return Intl.message('Tablet', name: 'homeTablet', desc: '', args: []);
  }

  /// `Phone`
  String get homePhone {
    return Intl.message('Phone', name: 'homePhone', desc: '', args: []);
  }

  /// `You don't have permission to view this content`
  String get invoicesNoPermissionToView {
    return Intl.message(
      'You don\'t have permission to view this content',
      name: 'invoicesNoPermissionToView',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this action`
  String get invoicesNoPermissionToAct {
    return Intl.message(
      'You don\'t have permission to perform this action',
      name: 'invoicesNoPermissionToAct',
      desc: '',
      args: [],
    );
  }

  /// `Locked Action`
  String get invoicesLockedAction {
    return Intl.message(
      'Locked Action',
      name: 'invoicesLockedAction',
      desc: '',
      args: [],
    );
  }

  /// `Cannot delete this invoice because it is not a draft`
  String get invoicesCannotDeleteNonDraft {
    return Intl.message(
      'Cannot delete this invoice because it is not a draft',
      name: 'invoicesCannotDeleteNonDraft',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Number`
  String get invoicesInvoiceNumber {
    return Intl.message(
      'Invoice Number',
      name: 'invoicesInvoiceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get invoicesCustomerName {
    return Intl.message(
      'Customer Name',
      name: 'invoicesCustomerName',
      desc: '',
      args: [],
    );
  }

  /// `Customer Email`
  String get invoicesCustomerEmail {
    return Intl.message(
      'Customer Email',
      name: 'invoicesCustomerEmail',
      desc: '',
      args: [],
    );
  }

  /// `Customer Phone`
  String get invoicesCustomerPhone {
    return Intl.message(
      'Customer Phone',
      name: 'invoicesCustomerPhone',
      desc: '',
      args: [],
    );
  }

  /// `Customer Address`
  String get invoicesCustomerAddress {
    return Intl.message(
      'Customer Address',
      name: 'invoicesCustomerAddress',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get invoicesCustomerNotes {
    return Intl.message(
      'Notes',
      name: 'invoicesCustomerNotes',
      desc: '',
      args: [],
    );
  }

  /// `No product ID available`
  String get invoicesNoProductIdAvailable {
    return Intl.message(
      'No product ID available',
      name: 'invoicesNoProductIdAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate Invoice`
  String get invoicesDuplicateInvoice {
    return Intl.message(
      'Duplicate Invoice',
      name: 'invoicesDuplicateInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Download PDF`
  String get invoicesDownloadPDF {
    return Intl.message(
      'Download PDF',
      name: 'invoicesDownloadPDF',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get invoicesEmail {
    return Intl.message('Email', name: 'invoicesEmail', desc: '', args: []);
  }

  /// `Invoice {number}`
  String invoicesInvoiceNumberPlaceholder(String number) {
    return Intl.message(
      'Invoice $number',
      name: 'invoicesInvoiceNumberPlaceholder',
      desc: '',
      args: [number],
    );
  }

  /// `Please find attached your invoice.`
  String get invoicesPleaseFindAttachedInvoice {
    return Intl.message(
      'Please find attached your invoice.',
      name: 'invoicesPleaseFindAttachedInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get invoicesDiscount {
    return Intl.message(
      'Discount',
      name: 'invoicesDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Tax Percentage`
  String get invoicesTaxPercentage {
    return Intl.message(
      'Tax Percentage',
      name: 'invoicesTaxPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Item details copied to clipboard`
  String get invoicesItemDetailsCopied {
    return Intl.message(
      'Item details copied to clipboard',
      name: 'invoicesItemDetailsCopied',
      desc: '',
      args: [],
    );
  }

  /// `Item Details:`
  String get invoicesItemDetails {
    return Intl.message(
      'Item Details:',
      name: 'invoicesItemDetails',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get invoicesItemNameLabel {
    return Intl.message(
      'Name:',
      name: 'invoicesItemNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get invoicesItemDescriptionLabel {
    return Intl.message(
      'Description:',
      name: 'invoicesItemDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Quantity:`
  String get invoicesItemQuantityLabel {
    return Intl.message(
      'Quantity:',
      name: 'invoicesItemQuantityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Price:`
  String get invoicesItemPriceLabel {
    return Intl.message(
      'Price:',
      name: 'invoicesItemPriceLabel',
      desc: '',
      args: [],
    );
  }

  /// `Discount:`
  String get invoicesItemDiscountLabel {
    return Intl.message(
      'Discount:',
      name: 'invoicesItemDiscountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tax Percentage:`
  String get invoicesItemTaxPercentageLabel {
    return Intl.message(
      'Tax Percentage:',
      name: 'invoicesItemTaxPercentageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tax Amount:`
  String get invoicesItemTaxAmountLabel {
    return Intl.message(
      'Tax Amount:',
      name: 'invoicesItemTaxAmountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total:`
  String get invoicesItemTotalLabel {
    return Intl.message(
      'Total:',
      name: 'invoicesItemTotalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Product Information:`
  String get invoicesProductInfo {
    return Intl.message(
      'Product Information:',
      name: 'invoicesProductInfo',
      desc: '',
      args: [],
    );
  }

  /// `Product Name:`
  String get invoicesProductNameLabel {
    return Intl.message(
      'Product Name:',
      name: 'invoicesProductNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `QR Code`
  String get invoicesQRCode {
    return Intl.message('QR Code', name: 'invoicesQRCode', desc: '', args: []);
  }

  /// `You can scan this code to access invoice details`
  String get invoicesScanQRCodeMessage {
    return Intl.message(
      'You can scan this code to access invoice details',
      name: 'invoicesScanQRCodeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Product Information`
  String get invoicesProductInformation {
    return Intl.message(
      'Product Information',
      name: 'invoicesProductInformation',
      desc: '',
      args: [],
    );
  }

  /// `Filter Invoices`
  String get invoicesFilterInvoices {
    return Intl.message(
      'Filter Invoices',
      name: 'invoicesFilterInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get invoicesStatus {
    return Intl.message('Status', name: 'invoicesStatus', desc: '', args: []);
  }

  /// `Sort Order`
  String get invoicesSortOrder {
    return Intl.message(
      'Sort Order',
      name: 'invoicesSortOrder',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get invoicesApply {
    return Intl.message('Apply', name: 'invoicesApply', desc: '', args: []);
  }

  /// `All`
  String get invoicesAll {
    return Intl.message('All', name: 'invoicesAll', desc: '', args: []);
  }

  /// `Pending`
  String get invoicesPending {
    return Intl.message('Pending', name: 'invoicesPending', desc: '', args: []);
  }

  /// `Sent`
  String get invoicesSent {
    return Intl.message('Sent', name: 'invoicesSent', desc: '', args: []);
  }

  /// `Descending`
  String get invoicesDescending {
    return Intl.message(
      'Descending',
      name: 'invoicesDescending',
      desc: '',
      args: [],
    );
  }

  /// `Ascending`
  String get invoicesAscending {
    return Intl.message(
      'Ascending',
      name: 'invoicesAscending',
      desc: '',
      args: [],
    );
  }

  /// `Loading more...`
  String get invoicesLoadingMore {
    return Intl.message(
      'Loading more...',
      name: 'invoicesLoadingMore',
      desc: '',
      args: [],
    );
  }

  /// `Loading invoices...`
  String get invoicesLoadingInvoices {
    return Intl.message(
      'Loading invoices...',
      name: 'invoicesLoadingInvoices',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to view this content`
  String get productsNoPermissionToView {
    return Intl.message(
      'You don\'t have permission to view this content',
      name: 'productsNoPermissionToView',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this action`
  String get productsNoPermissionToAct {
    return Intl.message(
      'You don\'t have permission to perform this action',
      name: 'productsNoPermissionToAct',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get productsSettings {
    return Intl.message(
      'Settings',
      name: 'productsSettings',
      desc: '',
      args: [],
    );
  }

  /// `Enter product name`
  String get productsEnterProductName {
    return Intl.message(
      'Enter product name',
      name: 'productsEnterProductName',
      desc: '',
      args: [],
    );
  }

  /// `Enter product description`
  String get productsEnterProductDescription {
    return Intl.message(
      'Enter product description',
      name: 'productsEnterProductDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter selling price`
  String get productsEnterSellingPrice {
    return Intl.message(
      'Enter selling price',
      name: 'productsEnterSellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Enter cost price`
  String get productsEnterCostPrice {
    return Intl.message(
      'Enter cost price',
      name: 'productsEnterCostPrice',
      desc: '',
      args: [],
    );
  }

  /// `Enter tax rate percentage`
  String get productsEnterTaxRatePercentage {
    return Intl.message(
      'Enter tax rate percentage',
      name: 'productsEnterTaxRatePercentage',
      desc: '',
      args: [],
    );
  }

  /// `Enter quantity`
  String get productsEnterQuantity {
    return Intl.message(
      'Enter quantity',
      name: 'productsEnterQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Enter unit (e.g., piece)`
  String get productsEnterUnit {
    return Intl.message(
      'Enter unit (e.g., piece)',
      name: 'productsEnterUnit',
      desc: '',
      args: [],
    );
  }

  /// `Enter SKU`
  String get productsEnterSKU {
    return Intl.message(
      'Enter SKU',
      name: 'productsEnterSKU',
      desc: '',
      args: [],
    );
  }

  /// `Enter barcode`
  String get productsEnterBarcode {
    return Intl.message(
      'Enter barcode',
      name: 'productsEnterBarcode',
      desc: '',
      args: [],
    );
  }

  /// `Product name is required`
  String get productsProductNameRequired {
    return Intl.message(
      'Product name is required',
      name: 'productsProductNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Product status is required`
  String get productsProductStatusRequired {
    return Intl.message(
      'Product status is required',
      name: 'productsProductStatusRequired',
      desc: '',
      args: [],
    );
  }

  /// `Selling price is required`
  String get productsSellingPriceRequired {
    return Intl.message(
      'Selling price is required',
      name: 'productsSellingPriceRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid price`
  String get productsPleaseEnterValidPrice {
    return Intl.message(
      'Please enter a valid price',
      name: 'productsPleaseEnterValidPrice',
      desc: '',
      args: [],
    );
  }

  /// `Quantity is required`
  String get productsQuantityRequired {
    return Intl.message(
      'Quantity is required',
      name: 'productsQuantityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid quantity`
  String get productsPleaseEnterValidQuantity {
    return Intl.message(
      'Please enter a valid quantity',
      name: 'productsPleaseEnterValidQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Unnamed Product`
  String get productsUnnamedProduct {
    return Intl.message(
      'Unnamed Product',
      name: 'productsUnnamedProduct',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone.`
  String get productsThisActionCannotBeUndone {
    return Intl.message(
      'This action cannot be undone.',
      name: 'productsThisActionCannotBeUndone',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get productsCopiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'productsCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `No categories found`
  String get productsNoCategoriesFound {
    return Intl.message(
      'No categories found',
      name: 'productsNoCategoriesFound',
      desc: '',
      args: [],
    );
  }

  /// `Delete Category`
  String get productsDeleteCategory {
    return Intl.message(
      'Delete Category',
      name: 'productsDeleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category State`
  String get productsCategoryState {
    return Intl.message(
      'Category State',
      name: 'productsCategoryState',
      desc: '',
      args: [],
    );
  }

  /// `check if the category is active or inactive`
  String get productsCheckIfCategoryIsActiveOrInactive {
    return Intl.message(
      'check if the category is active or inactive',
      name: 'productsCheckIfCategoryIsActiveOrInactive',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get productsAdd {
    return Intl.message('Add', name: 'productsAdd', desc: '', args: []);
  }

  /// `Update`
  String get productsUpdate {
    return Intl.message('Update', name: 'productsUpdate', desc: '', args: []);
  }

  /// `Are you sure you want to delete category "{name}"?`
  String productsDeleteCategoryConfirmation(String name) {
    return Intl.message(
      'Are you sure you want to delete category "$name"?',
      name: 'productsDeleteCategoryConfirmation',
      desc: '',
      args: [name],
    );
  }

  /// `Are you sure you want to delete this product?`
  String get productsAreYouSureYouWantToDeleteThisProduct {
    return Intl.message(
      'Are you sure you want to delete this product?',
      name: 'productsAreYouSureYouWantToDeleteThisProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product is Taxable`
  String get productsProductIsTaxable {
    return Intl.message(
      'Product is Taxable',
      name: 'productsProductIsTaxable',
      desc: '',
      args: [],
    );
  }

  /// `Apply tax to product`
  String get productsApplyTaxToProduct {
    return Intl.message(
      'Apply tax to product',
      name: 'productsApplyTaxToProduct',
      desc: '',
      args: [],
    );
  }

  /// `Track available product quantity`
  String get productsTrackAvailableProductQuantity {
    return Intl.message(
      'Track available product quantity',
      name: 'productsTrackAvailableProductQuantity',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to view settings`
  String get settingsNoPermissionToView {
    return Intl.message(
      'You don\'t have permission to view settings',
      name: 'settingsNoPermissionToView',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this action`
  String get settingsNoPermissionToAct {
    return Intl.message(
      'You don\'t have permission to perform this action',
      name: 'settingsNoPermissionToAct',
      desc: '',
      args: [],
    );
  }

  /// `Tax Integration`
  String get settingsTaxIntegration {
    return Intl.message(
      'Tax Integration',
      name: 'settingsTaxIntegration',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get settingsRetry {
    return Intl.message('Retry', name: 'settingsRetry', desc: '', args: []);
  }

  /// `Update Status`
  String get settingsUpdateStatus {
    return Intl.message(
      'Update Status',
      name: 'settingsUpdateStatus',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get settingsStatus {
    return Intl.message('Status', name: 'settingsStatus', desc: '', args: []);
  }

  /// `Active`
  String get settingsActive {
    return Intl.message('Active', name: 'settingsActive', desc: '', args: []);
  }

  /// `Inactive`
  String get settingsInactive {
    return Intl.message(
      'Inactive',
      name: 'settingsInactive',
      desc: '',
      args: [],
    );
  }

  /// `Tax Invoice Type`
  String get settingsTaxInvoiceType {
    return Intl.message(
      'Tax Invoice Type',
      name: 'settingsTaxInvoiceType',
      desc: '',
      args: [],
    );
  }

  /// `Tax Merchant Code`
  String get settingsTaxMerchantCode {
    return Intl.message(
      'Tax Merchant Code',
      name: 'settingsTaxMerchantCode',
      desc: '',
      args: [],
    );
  }

  /// `Activate Integration`
  String get settingsActivateIntegration {
    return Intl.message(
      'Activate Integration',
      name: 'settingsActivateIntegration',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Type`
  String get settingsInvoiceType {
    return Intl.message(
      'Invoice Type',
      name: 'settingsInvoiceType',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get settingsIncome {
    return Intl.message('Income', name: 'settingsIncome', desc: '', args: []);
  }

  /// `General`
  String get settingsGeneral {
    return Intl.message('General', name: 'settingsGeneral', desc: '', args: []);
  }

  /// `VAT`
  String get settingsVAT {
    return Intl.message('VAT', name: 'settingsVAT', desc: '', args: []);
  }

  /// `Activate`
  String get settingsActivate {
    return Intl.message(
      'Activate',
      name: 'settingsActivate',
      desc: '',
      args: [],
    );
  }

  /// `Deactivate`
  String get settingsDeactivate {
    return Intl.message(
      'Deactivate',
      name: 'settingsDeactivate',
      desc: '',
      args: [],
    );
  }

  /// `Technical Support - Invotek App`
  String get settingsSupportEmailSubject {
    return Intl.message(
      'Technical Support - Invotek App',
      name: 'settingsSupportEmailSubject',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to view this content`
  String get usersNoPermissionToView {
    return Intl.message(
      'You don\'t have permission to view this content',
      name: 'usersNoPermissionToView',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this action`
  String get usersNoPermissionToAct {
    return Intl.message(
      'You don\'t have permission to perform this action',
      name: 'usersNoPermissionToAct',
      desc: '',
      args: [],
    );
  }

  /// `Delete User`
  String get usersDeleteUser {
    return Intl.message(
      'Delete User',
      name: 'usersDeleteUser',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete user`
  String get usersAreYouSureYouWantToDeleteUser {
    return Intl.message(
      'Are you sure you want to delete user',
      name: 'usersAreYouSureYouWantToDeleteUser',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone.`
  String get usersThisActionCannotBeUndone {
    return Intl.message(
      'This action cannot be undone.',
      name: 'usersThisActionCannotBeUndone',
      desc: '',
      args: [],
    );
  }

  /// `Unknown User`
  String get usersUnknownUser {
    return Intl.message(
      'Unknown User',
      name: 'usersUnknownUser',
      desc: '',
      args: [],
    );
  }

  /// `No email`
  String get usersNoEmail {
    return Intl.message('No email', name: 'usersNoEmail', desc: '', args: []);
  }

  /// `View Details`
  String get usersViewDetails {
    return Intl.message(
      'View Details',
      name: 'usersViewDetails',
      desc: '',
      args: [],
    );
  }

  /// `View user details`
  String get usersViewUserDetails {
    return Intl.message(
      'View user details',
      name: 'usersViewUserDetails',
      desc: '',
      args: [],
    );
  }

  /// `Edit User`
  String get usersEditUser {
    return Intl.message('Edit User', name: 'usersEditUser', desc: '', args: []);
  }

  /// `Edit user information`
  String get usersEditUserInformation {
    return Intl.message(
      'Edit user information',
      name: 'usersEditUserInformation',
      desc: '',
      args: [],
    );
  }

  /// `Delete user permanently`
  String get usersDeleteUserPermanently {
    return Intl.message(
      'Delete user permanently',
      name: 'usersDeleteUserPermanently',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get usersCopiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'usersCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get usersNameRequired {
    return Intl.message(
      'Name is required',
      name: 'usersNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get usersEmailRequired {
    return Intl.message(
      'Email is required',
      name: 'usersEmailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get usersPleaseEnterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'usersPleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get usersPasswordRequired {
    return Intl.message(
      'Password is required',
      name: 'usersPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get usersPasswordMustBeAtLeast6Characters {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'usersPasswordMustBeAtLeast6Characters',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get usersPleaseConfirmYourPassword {
    return Intl.message(
      'Please confirm your password',
      name: 'usersPleaseConfirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get usersPasswordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'usersPasswordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Manage Permissions`
  String get usersManagePermissions {
    return Intl.message(
      'Manage Permissions',
      name: 'usersManagePermissions',
      desc: '',
      args: [],
    );
  }

  /// `Manage roles and permissions`
  String get usersManageRolesAndPermissions {
    return Intl.message(
      'Manage roles and permissions',
      name: 'usersManageRolesAndPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Roles`
  String get usersRoles {
    return Intl.message('Roles', name: 'usersRoles', desc: '', args: []);
  }

  /// `Select Module`
  String get usersSelectModule {
    return Intl.message(
      'Select Module',
      name: 'usersSelectModule',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get usersModulePermissions {
    return Intl.message(
      'Permissions',
      name: 'usersModulePermissions',
      desc: '',
      args: [],
    );
  }

  /// `No permissions for this module`
  String get usersNoPermissionsForThisModule {
    return Intl.message(
      'No permissions for this module',
      name: 'usersNoPermissionsForThisModule',
      desc: '',
      args: [],
    );
  }

  /// `Total Permissions`
  String get usersTotalPermissions {
    return Intl.message(
      'Total Permissions',
      name: 'usersTotalPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Add New Role`
  String get usersAddNewRole {
    return Intl.message(
      'Add New Role',
      name: 'usersAddNewRole',
      desc: '',
      args: [],
    );
  }

  /// `Role Name`
  String get usersRoleName {
    return Intl.message('Role Name', name: 'usersRoleName', desc: '', args: []);
  }

  /// `Role Description`
  String get usersRoleDescription {
    return Intl.message(
      'Role Description',
      name: 'usersRoleDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get usersAdd {
    return Intl.message('Add', name: 'usersAdd', desc: '', args: []);
  }

  /// `Edit Role`
  String get usersEditRole {
    return Intl.message('Edit Role', name: 'usersEditRole', desc: '', args: []);
  }

  /// `Confirm Delete`
  String get usersConfirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'usersConfirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the role "{name}"?`
  String usersAreYouSureYouWantToDeleteRole(String name) {
    return Intl.message(
      'Are you sure you want to delete the role "$name"?',
      name: 'usersAreYouSureYouWantToDeleteRole',
      desc: '',
      args: [name],
    );
  }

  /// `Active`
  String get usersActive {
    return Intl.message('Active', name: 'usersActive', desc: '', args: []);
  }

  /// `Inactive`
  String get usersInactive {
    return Intl.message('Inactive', name: 'usersInactive', desc: '', args: []);
  }

  /// `Module`
  String get usersModule {
    return Intl.message('Module', name: 'usersModule', desc: '', args: []);
  }

  /// `Users`
  String get usersUsers {
    return Intl.message('Users', name: 'usersUsers', desc: '', args: []);
  }

  /// `Clients`
  String get usersClients {
    return Intl.message('Clients', name: 'usersClients', desc: '', args: []);
  }

  /// `Products`
  String get usersProducts {
    return Intl.message('Products', name: 'usersProducts', desc: '', args: []);
  }

  /// `Invoices`
  String get usersInvoices {
    return Intl.message('Invoices', name: 'usersInvoices', desc: '', args: []);
  }

  /// `Expenses`
  String get usersExpenses {
    return Intl.message('Expenses', name: 'usersExpenses', desc: '', args: []);
  }

  /// `Reports`
  String get usersReports {
    return Intl.message('Reports', name: 'usersReports', desc: '', args: []);
  }

  /// `Settings`
  String get usersSettings {
    return Intl.message('Settings', name: 'usersSettings', desc: '', args: []);
  }

  /// `Returned Invoices`
  String get creditInvoicesTitle {
    return Intl.message(
      'Returned Invoices',
      name: 'creditInvoicesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dinar`
  String get dinar {
    return Intl.message('Dinar', name: 'dinar', desc: '', args: []);
  }

  /// `Manage expenses and budgets`
  String get manageExpensesAndBudgets {
    return Intl.message(
      'Manage expenses and budgets',
      name: 'manageExpensesAndBudgets',
      desc: '',
      args: [],
    );
  }

  /// `Enter position`
  String get enterPosition {
    return Intl.message(
      'Enter position',
      name: 'enterPosition',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPasswordPlaceholder {
    return Intl.message(
      'Confirm password',
      name: 'confirmPasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Select Role`
  String get selectRole {
    return Intl.message('Select Role', name: 'selectRole', desc: '', args: []);
  }

  /// `Select Status`
  String get selectStatus {
    return Intl.message(
      'Select Status',
      name: 'selectStatus',
      desc: '',
      args: [],
    );
  }

  /// `Search users`
  String get searchUsers {
    return Intl.message(
      'Search users',
      name: 'searchUsers',
      desc: '',
      args: [],
    );
  }

  /// `Users Management`
  String get usersManagementTitle {
    return Intl.message(
      'Users Management',
      name: 'usersManagementTitle',
      desc: '',
      args: [],
    );
  }

  /// `Manage users and permissions`
  String get manageUsersAndPermissions {
    return Intl.message(
      'Manage users and permissions',
      name: 'manageUsersAndPermissions',
      desc: '',
      args: [],
    );
  }

  /// `User Details`
  String get userDetails {
    return Intl.message(
      'User Details',
      name: 'userDetails',
      desc: '',
      args: [],
    );
  }

  /// `Unknown User`
  String get unknownUser {
    return Intl.message(
      'Unknown User',
      name: 'unknownUser',
      desc: '',
      args: [],
    );
  }

  /// `Not provided`
  String get notProvided {
    return Intl.message(
      'Not provided',
      name: 'notProvided',
      desc: '',
      args: [],
    );
  }

  /// `Not available`
  String get notAvailable {
    return Intl.message(
      'Not available',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Not assigned`
  String get notAssigned {
    return Intl.message(
      'Not assigned',
      name: 'notAssigned',
      desc: '',
      args: [],
    );
  }

  /// `No notes available`
  String get noNotesAvailable {
    return Intl.message(
      'No notes available',
      name: 'noNotesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get userInformation {
    return Intl.message(
      'User Information',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `User Summary`
  String get userSummary {
    return Intl.message(
      'User Summary',
      name: 'userSummary',
      desc: '',
      args: [],
    );
  }

  /// `Last Login`
  String get lastLogin {
    return Intl.message('Last Login', name: 'lastLogin', desc: '', args: []);
  }

  /// `Never`
  String get never {
    return Intl.message('Never', name: 'never', desc: '', args: []);
  }

  /// `(Unknown)`
  String get unknown {
    return Intl.message('(Unknown)', name: 'unknown', desc: '', args: []);
  }

  /// `All Roles`
  String get allRoles {
    return Intl.message('All Roles', name: 'allRoles', desc: '', args: []);
  }

  /// `Employee`
  String get employee {
    return Intl.message('Employee', name: 'employee', desc: '', args: []);
  }

  /// `Viewer`
  String get viewer {
    return Intl.message('Viewer', name: 'viewer', desc: '', args: []);
  }

  /// `Suspended`
  String get suspended {
    return Intl.message('Suspended', name: 'suspended', desc: '', args: []);
  }

  /// `Start by adding your first user to the system`
  String get startByAddingFirstUser {
    return Intl.message(
      'Start by adding your first user to the system',
      name: 'startByAddingFirstUser',
      desc: '',
      args: [],
    );
  }

  /// `Add First User`
  String get addFirstUser {
    return Intl.message(
      'Add First User',
      name: 'addFirstUser',
      desc: '',
      args: [],
    );
  }

  /// `User Permissions`
  String get userPermissions {
    return Intl.message(
      'User Permissions',
      name: 'userPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Create Users`
  String get createUsers {
    return Intl.message(
      'Create Users',
      name: 'createUsers',
      desc: '',
      args: [],
    );
  }

  /// `Edit Users`
  String get editUsers {
    return Intl.message('Edit Users', name: 'editUsers', desc: '', args: []);
  }

  /// `Delete Users`
  String get deleteUsers {
    return Intl.message(
      'Delete Users',
      name: 'deleteUsers',
      desc: '',
      args: [],
    );
  }

  /// `Create Products`
  String get createProducts {
    return Intl.message(
      'Create Products',
      name: 'createProducts',
      desc: '',
      args: [],
    );
  }

  /// `Edit Products`
  String get editProducts {
    return Intl.message(
      'Edit Products',
      name: 'editProducts',
      desc: '',
      args: [],
    );
  }

  /// `Delete Products`
  String get deleteProducts {
    return Intl.message(
      'Delete Products',
      name: 'deleteProducts',
      desc: '',
      args: [],
    );
  }

  /// `View Customers`
  String get viewCustomers {
    return Intl.message(
      'View Customers',
      name: 'viewCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Create Customers`
  String get createCustomers {
    return Intl.message(
      'Create Customers',
      name: 'createCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Edit Customers`
  String get editCustomers {
    return Intl.message(
      'Edit Customers',
      name: 'editCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Delete Customers`
  String get deleteCustomers {
    return Intl.message(
      'Delete Customers',
      name: 'deleteCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Create Expenses`
  String get createExpenses {
    return Intl.message(
      'Create Expenses',
      name: 'createExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Edit Expenses`
  String get editExpenses {
    return Intl.message(
      'Edit Expenses',
      name: 'editExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Delete Expenses`
  String get deleteExpenses {
    return Intl.message(
      'Delete Expenses',
      name: 'deleteExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Manage Settings`
  String get manageSettings {
    return Intl.message(
      'Manage Settings',
      name: 'manageSettings',
      desc: '',
      args: [],
    );
  }

  /// `Profile Information`
  String get profileInformation {
    return Intl.message(
      'Profile Information',
      name: 'profileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Enter department`
  String get enterDepartment {
    return Intl.message(
      'Enter department',
      name: 'enterDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Account Status`
  String get accountStatus {
    return Intl.message(
      'Account Status',
      name: 'accountStatus',
      desc: '',
      args: [],
    );
  }

  /// `Enable or disable user account`
  String get enableOrDisableUserAccount {
    return Intl.message(
      'Enable or disable user account',
      name: 'enableOrDisableUserAccount',
      desc: '',
      args: [],
    );
  }

  /// `User created successfully`
  String get userCreatedSuccessfullyMessage {
    return Intl.message(
      'User created successfully',
      name: 'userCreatedSuccessfullyMessage',
      desc: '',
      args: [],
    );
  }

  /// `User updated successfully`
  String get userUpdatedSuccessfullyMessage {
    return Intl.message(
      'User updated successfully',
      name: 'userUpdatedSuccessfullyMessage',
      desc: '',
      args: [],
    );
  }

  /// `User deleted successfully`
  String get userDeletedSuccessfullyMessage {
    return Intl.message(
      'User deleted successfully',
      name: 'userDeletedSuccessfullyMessage',
      desc: '',
      args: [],
    );
  }

  /// `completed successfully`
  String get completedSuccessfully {
    return Intl.message(
      'completed successfully',
      name: 'completedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No name`
  String get usersNoName {
    return Intl.message('No name', name: 'usersNoName', desc: '', args: []);
  }

  /// `No role`
  String get usersNoRole {
    return Intl.message('No role', name: 'usersNoRole', desc: '', args: []);
  }

  /// `Undefined`
  String get usersUndefined {
    return Intl.message(
      'Undefined',
      name: 'usersUndefined',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get usersUnknownStatus {
    return Intl.message(
      'Unknown',
      name: 'usersUnknownStatus',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get usersRoleAdmin {
    return Intl.message('Admin', name: 'usersRoleAdmin', desc: '', args: []);
  }

  /// `Accountant`
  String get usersRoleAccountant {
    return Intl.message(
      'Accountant',
      name: 'usersRoleAccountant',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get usersRoleUser {
    return Intl.message('User', name: 'usersRoleUser', desc: '', args: []);
  }

  /// `Supervisor`
  String get usersRoleSupervisor {
    return Intl.message(
      'Supervisor',
      name: 'usersRoleSupervisor',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get usersStatusActive {
    return Intl.message(
      'Active',
      name: 'usersStatusActive',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get usersStatusInactive {
    return Intl.message(
      'Inactive',
      name: 'usersStatusInactive',
      desc: '',
      args: [],
    );
  }

  /// `No Status`
  String get noStatus {
    return Intl.message('No Status', name: 'noStatus', desc: '', args: []);
  }

  /// `No Phone`
  String get noPhone {
    return Intl.message('No Phone', name: 'noPhone', desc: '', args: []);
  }

  /// `Tax integration is not active`
  String get taxIntegrationNotActive {
    return Intl.message(
      'Tax integration is not active',
      name: 'taxIntegrationNotActive',
      desc: '',
      args: [],
    );
  }

  /// `You have not activated tax integration. Please activate it from settings if you have permission to do so`
  String get taxIntegrationNotActiveMessage {
    return Intl.message(
      'You have not activated tax integration. Please activate it from settings if you have permission to do so',
      name: 'taxIntegrationNotActiveMessage',
      desc: '',
      args: [],
    );
  }

  /// `Go to Settings`
  String get goToSettings {
    return Intl.message(
      'Go to Settings',
      name: 'goToSettings',
      desc: '',
      args: [],
    );
  }

  /// `Unnamed Customer`
  String get customersUnnamedCustomer {
    return Intl.message(
      'Unnamed Customer',
      name: 'customersUnnamedCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get customersInactive {
    return Intl.message(
      'Inactive',
      name: 'customersInactive',
      desc: '',
      args: [],
    );
  }

  /// `Advanced Technology Company`
  String get customersCompanyTech {
    return Intl.message(
      'Advanced Technology Company',
      name: 'customersCompanyTech',
      desc: '',
      args: [],
    );
  }

  /// `Financial Services Institution`
  String get customersCompanyFinance {
    return Intl.message(
      'Financial Services Institution',
      name: 'customersCompanyFinance',
      desc: '',
      args: [],
    );
  }

  /// `Construction & Development Company`
  String get customersCompanyConstruction {
    return Intl.message(
      'Construction & Development Company',
      name: 'customersCompanyConstruction',
      desc: '',
      args: [],
    );
  }

  /// `Modern Education Institution`
  String get customersCompanyEducation {
    return Intl.message(
      'Modern Education Institution',
      name: 'customersCompanyEducation',
      desc: '',
      args: [],
    );
  }

  /// `Tourism & Entertainment Company`
  String get customersCompanyTourism {
    return Intl.message(
      'Tourism & Entertainment Company',
      name: 'customersCompanyTourism',
      desc: '',
      args: [],
    );
  }

  /// `Healthcare Institution`
  String get customersCompanyHealthcare {
    return Intl.message(
      'Healthcare Institution',
      name: 'customersCompanyHealthcare',
      desc: '',
      args: [],
    );
  }

  /// `Transport & Logistics Company`
  String get customersCompanyTransport {
    return Intl.message(
      'Transport & Logistics Company',
      name: 'customersCompanyTransport',
      desc: '',
      args: [],
    );
  }

  /// `E-commerce Institution`
  String get customersCompanyEcommerce {
    return Intl.message(
      'E-commerce Institution',
      name: 'customersCompanyEcommerce',
      desc: '',
      args: [],
    );
  }

  /// `The last 5 invoices`
  String get customersLastFiveInvoices {
    return Intl.message(
      'The last 5 invoices',
      name: 'customersLastFiveInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get customersContactInformation {
    return Intl.message(
      'Contact Information',
      name: 'customersContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Not provided`
  String get customersNotProvided {
    return Intl.message(
      'Not provided',
      name: 'customersNotProvided',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get customersCall {
    return Intl.message('Call', name: 'customersCall', desc: '', args: []);
  }

  /// `Map`
  String get customersMap {
    return Intl.message('Map', name: 'customersMap', desc: '', args: []);
  }

  /// `Account Status`
  String get customersAccountStatus {
    return Intl.message(
      'Account Status',
      name: 'customersAccountStatus',
      desc: '',
      args: [],
    );
  }

  /// `Created`
  String get customersCreated {
    return Intl.message(
      'Created',
      name: 'customersCreated',
      desc: '',
      args: [],
    );
  }

  /// `Last Updated`
  String get customersLastUpdated {
    return Intl.message(
      'Last Updated',
      name: 'customersLastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Loading more...`
  String get customersLoadingMore {
    return Intl.message(
      'Loading more...',
      name: 'customersLoadingMore',
      desc: '',
      args: [],
    );
  }

  /// `No invoices for this customer`
  String get customersNoInvoicesForCustomer {
    return Intl.message(
      'No invoices for this customer',
      name: 'customersNoInvoicesForCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Cannot delete admin user`
  String get usersCannotDeleteAdmin {
    return Intl.message(
      'Cannot delete admin user',
      name: 'usersCannotDeleteAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Cannot delete your own account`
  String get usersCannotDeleteYourself {
    return Intl.message(
      'Cannot delete your own account',
      name: 'usersCannotDeleteYourself',
      desc: '',
      args: [],
    );
  }

  /// `Admin users cannot be deleted`
  String get usersCannotDeleteAdminMessage {
    return Intl.message(
      'Admin users cannot be deleted',
      name: 'usersCannotDeleteAdminMessage',
      desc: '',
      args: [],
    );
  }

  /// `You cannot delete your own account`
  String get usersCannotDeleteYourselfMessage {
    return Intl.message(
      'You cannot delete your own account',
      name: 'usersCannotDeleteYourselfMessage',
      desc: '',
      args: [],
    );
  }

  /// `Product Help`
  String get productsHelp {
    return Intl.message(
      'Product Help',
      name: 'productsHelp',
      desc: '',
      args: [],
    );
  }

  /// `This screen helps you add new products to your inventory. Here's what you need to know:`
  String get productsHelpDescription {
    return Intl.message(
      'This screen helps you add new products to your inventory. Here\'s what you need to know:',
      name: 'productsHelpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get productsBasicInformation {
    return Intl.message(
      'Basic Information',
      name: 'productsBasicInformation',
      desc: '',
      args: [],
    );
  }

  /// `Enter product name, description, category, and status.`
  String get productsBasicInformationDescription {
    return Intl.message(
      'Enter product name, description, category, and status.',
      name: 'productsBasicInformationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Pricing`
  String get productsPricing {
    return Intl.message('Pricing', name: 'productsPricing', desc: '', args: []);
  }

  /// `Set selling price, cost price, and tax rate.`
  String get productsPricingDescription {
    return Intl.message(
      'Set selling price, cost price, and tax rate.',
      name: 'productsPricingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Inventory`
  String get productsInventory {
    return Intl.message(
      'Inventory',
      name: 'productsInventory',
      desc: '',
      args: [],
    );
  }

  /// `Manage quantity, units, and stock levels.`
  String get productsInventoryDescription {
    return Intl.message(
      'Manage quantity, units, and stock levels.',
      name: 'productsInventoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productsProductDetails {
    return Intl.message(
      'Product Details',
      name: 'productsProductDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add SKU, barcode, brand, model, and other details.`
  String get productsProductDetailsDescription {
    return Intl.message(
      'Add SKU, barcode, brand, model, and other details.',
      name: 'productsProductDetailsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Subscription Required`
  String get subscriptionRequiredTitle {
    return Intl.message(
      'Subscription Required',
      name: 'subscriptionRequiredTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose Package`
  String get subscriptionRequiredAction {
    return Intl.message(
      'Choose Package',
      name: 'subscriptionRequiredAction',
      desc: '',
      args: [],
    );
  }

  /// `Product Information`
  String get productsProductInformation {
    return Intl.message(
      'Product Information',
      name: 'productsProductInformation',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get productsDescription {
    return Intl.message(
      'Description',
      name: 'productsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cost Price`
  String get productsCostPrice {
    return Intl.message(
      'Cost Price',
      name: 'productsCostPrice',
      desc: '',
      args: [],
    );
  }

  /// `Not set`
  String get productsNotSet {
    return Intl.message('Not set', name: 'productsNotSet', desc: '', args: []);
  }

  /// `Tax Rate`
  String get productsTaxRate {
    return Intl.message(
      'Tax Rate',
      name: 'productsTaxRate',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get productsUnit {
    return Intl.message('Unit', name: 'productsUnit', desc: '', args: []);
  }

  /// `Not specified`
  String get productsNotSpecified {
    return Intl.message(
      'Not specified',
      name: 'productsNotSpecified',
      desc: '',
      args: [],
    );
  }

  /// `Taxable`
  String get productsTaxable {
    return Intl.message('Taxable', name: 'productsTaxable', desc: '', args: []);
  }

  /// `Yes`
  String get productsYes {
    return Intl.message('Yes', name: 'productsYes', desc: '', args: []);
  }

  /// `No`
  String get productsNo {
    return Intl.message('No', name: 'productsNo', desc: '', args: []);
  }

  /// `Track Inventory`
  String get productsTrackInventory {
    return Intl.message(
      'Track Inventory',
      name: 'productsTrackInventory',
      desc: '',
      args: [],
    );
  }

  /// `Barcode`
  String get productsBarcode {
    return Intl.message('Barcode', name: 'productsBarcode', desc: '', args: []);
  }

  /// `Tap to copy`
  String get productsTapToCopy {
    return Intl.message(
      'Tap to copy',
      name: 'productsTapToCopy',
      desc: '',
      args: [],
    );
  }

  /// `SKU`
  String get productsSku {
    return Intl.message('SKU', name: 'productsSku', desc: '', args: []);
  }

  /// `Quantity`
  String get productsQuantity {
    return Intl.message(
      'Quantity',
      name: 'productsQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Qty`
  String get productsQty {
    return Intl.message('Qty', name: 'productsQty', desc: '', args: []);
  }

  /// `Edit`
  String get productsEdit {
    return Intl.message('Edit', name: 'productsEdit', desc: '', args: []);
  }

  /// `Delete`
  String get productsDelete {
    return Intl.message('Delete', name: 'productsDelete', desc: '', args: []);
  }

  /// `Create your first product to get started`
  String get productsCreateFirstProduct {
    return Intl.message(
      'Create your first product to get started',
      name: 'productsCreateFirstProduct',
      desc: '',
      args: [],
    );
  }

  /// `Error Occurred`
  String get productsErrorOccurred {
    return Intl.message(
      'Error Occurred',
      name: 'productsErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `piece, kg, meter...`
  String get productsUnitHint {
    return Intl.message(
      'piece, kg, meter...',
      name: 'productsUnitHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter product SKU`
  String get productsEnterProductSku {
    return Intl.message(
      'Enter product SKU',
      name: 'productsEnterProductSku',
      desc: '',
      args: [],
    );
  }

  /// `Manage products and inventory`
  String get productsManageProductsAndInventory {
    return Intl.message(
      'Manage products and inventory',
      name: 'productsManageProductsAndInventory',
      desc: '',
      args: [],
    );
  }

  /// `View and manage product information`
  String get productsViewAndManageProductInformation {
    return Intl.message(
      'View and manage product information',
      name: 'productsViewAndManageProductInformation',
      desc: '',
      args: [],
    );
  }

  /// `Edit Product`
  String get productsEditProduct {
    return Intl.message(
      'Edit Product',
      name: 'productsEditProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product Insights`
  String get productsProductInsights {
    return Intl.message(
      'Product Insights',
      name: 'productsProductInsights',
      desc: '',
      args: [],
    );
  }

  /// `Invoices`
  String get productsInvoices {
    return Intl.message(
      'Invoices',
      name: 'productsInvoices',
      desc: '',
      args: [],
    );
  }

  /// `This Month`
  String get productsThisMonth {
    return Intl.message(
      'This Month',
      name: 'productsThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get productsCustomers {
    return Intl.message(
      'Customers',
      name: 'productsCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Bought This`
  String get productsBoughtThis {
    return Intl.message(
      'Bought This',
      name: 'productsBoughtThis',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get productsSales {
    return Intl.message('Sales', name: 'productsSales', desc: '', args: []);
  }

  /// `Stock`
  String get productsStock {
    return Intl.message('Stock', name: 'productsStock', desc: '', args: []);
  }

  /// `Available`
  String get productsAvailable {
    return Intl.message(
      'Available',
      name: 'productsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get expensesPaymentMethodCash {
    return Intl.message(
      'Cash',
      name: 'expensesPaymentMethodCash',
      desc: '',
      args: [],
    );
  }

  /// `Credit/Debit Card`
  String get expensesPaymentMethodCard {
    return Intl.message(
      'Credit/Debit Card',
      name: 'expensesPaymentMethodCard',
      desc: '',
      args: [],
    );
  }

  /// `Bank Transfer`
  String get expensesPaymentMethodBankTransfer {
    return Intl.message(
      'Bank Transfer',
      name: 'expensesPaymentMethodBankTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get expensesPaymentMethodCheck {
    return Intl.message(
      'Check',
      name: 'expensesPaymentMethodCheck',
      desc: '',
      args: [],
    );
  }

  /// `No categories to delete`
  String get expensesNoCategoriesToDelete {
    return Intl.message(
      'No categories to delete',
      name: 'expensesNoCategoriesToDelete',
      desc: '',
      args: [],
    );
  }

  /// `All categories deleted successfully`
  String get expensesAllCategoriesDeletedSuccessfully {
    return Intl.message(
      'All categories deleted successfully',
      name: 'expensesAllCategoriesDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Delete All Categories`
  String get expensesDeleteAllCategories {
    return Intl.message(
      'Delete All Categories',
      name: 'expensesDeleteAllCategories',
      desc: '',
      args: [],
    );
  }

  /// `Current Categories`
  String get expensesCurrentCategories {
    return Intl.message(
      'Current Categories',
      name: 'expensesCurrentCategories',
      desc: '',
      args: [],
    );
  }

  /// `No categories found. You can now start creating new ones!`
  String get expensesNoCategoriesFoundMessage {
    return Intl.message(
      'No categories found. You can now start creating new ones!',
      name: 'expensesNoCategoriesFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get expensesStatusLabel {
    return Intl.message(
      'Status',
      name: 'expensesStatusLabel',
      desc: '',
      args: [],
    );
  }

  /// `Deleting...`
  String get expensesDeleting {
    return Intl.message(
      'Deleting...',
      name: 'expensesDeleting',
      desc: '',
      args: [],
    );
  }

  /// `Delete All Categories`
  String get expensesDeleteAllCategoriesCount {
    return Intl.message(
      'Delete All Categories',
      name: 'expensesDeleteAllCategoriesCount',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get expensesSortByTitle {
    return Intl.message(
      'Title',
      name: 'expensesSortByTitle',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get expensesSortByAmount {
    return Intl.message(
      'Amount',
      name: 'expensesSortByAmount',
      desc: '',
      args: [],
    );
  }

  /// `Created At`
  String get expensesSortByCreatedAt {
    return Intl.message(
      'Created At',
      name: 'expensesSortByCreatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Updated At`
  String get expensesSortByUpdatedAt {
    return Intl.message(
      'Updated At',
      name: 'expensesSortByUpdatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get expensesSortByDate {
    return Intl.message('Date', name: 'expensesSortByDate', desc: '', args: []);
  }

  /// `ASC`
  String get expensesSortOrderAsc {
    return Intl.message(
      'ASC',
      name: 'expensesSortOrderAsc',
      desc: '',
      args: [],
    );
  }

  /// `DESC`
  String get expensesSortOrderDesc {
    return Intl.message(
      'DESC',
      name: 'expensesSortOrderDesc',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get expensesAllCategories {
    return Intl.message(
      'All Categories',
      name: 'expensesAllCategories',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get expensesSortBy {
    return Intl.message('Sort by', name: 'expensesSortBy', desc: '', args: []);
  }

  /// `Order`
  String get expensesOrder {
    return Intl.message('Order', name: 'expensesOrder', desc: '', args: []);
  }

  /// `All Status`
  String get expensesAllStatus {
    return Intl.message(
      'All Status',
      name: 'expensesAllStatus',
      desc: '',
      args: [],
    );
  }

  /// `Search categories...`
  String get expensesSearchCategories {
    return Intl.message(
      'Search categories...',
      name: 'expensesSearchCategories',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get expensesErrorPrefix {
    return Intl.message(
      'Error',
      name: 'expensesErrorPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Edit Category`
  String get expensesEditCategory {
    return Intl.message(
      'Edit Category',
      name: 'expensesEditCategory',
      desc: '',
      args: [],
    );
  }

  /// `No expenses yet`
  String get expensesNoExpensesYet {
    return Intl.message(
      'No expenses yet',
      name: 'expensesNoExpensesYet',
      desc: '',
      args: [],
    );
  }

  /// `Start tracking your business expenses by adding your first expense`
  String get expensesStartTrackingExpenses {
    return Intl.message(
      'Start tracking your business expenses by adding your first expense',
      name: 'expensesStartTrackingExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Add First Expense`
  String get expensesAddFirstExpense {
    return Intl.message(
      'Add First Expense',
      name: 'expensesAddFirstExpense',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get expensesSomethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'expensesSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get expensesTryAgain {
    return Intl.message(
      'Try Again',
      name: 'expensesTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `No categories yet`
  String get expensesNoCategoriesYet {
    return Intl.message(
      'No categories yet',
      name: 'expensesNoCategoriesYet',
      desc: '',
      args: [],
    );
  }

  /// `Create expense categories to organize your business expenses`
  String get expensesCreateExpenseCategories {
    return Intl.message(
      'Create expense categories to organize your business expenses',
      name: 'expensesCreateExpenseCategories',
      desc: '',
      args: [],
    );
  }

  /// `Add First Category`
  String get expensesAddFirstCategory {
    return Intl.message(
      'Add First Category',
      name: 'expensesAddFirstCategory',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get notificationsAll {
    return Intl.message('All', name: 'notificationsAll', desc: '', args: []);
  }

  /// `Read`
  String get notificationsRead {
    return Intl.message('Read', name: 'notificationsRead', desc: '', args: []);
  }

  /// `Unread`
  String get notificationsUnread {
    return Intl.message(
      'Unread',
      name: 'notificationsUnread',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get notificationsTotal {
    return Intl.message(
      'Total',
      name: 'notificationsTotal',
      desc: '',
      args: [],
    );
  }

  /// `Search notifications...`
  String get notificationsSearchHint {
    return Intl.message(
      'Search notifications...',
      name: 'notificationsSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Notification Details`
  String get notificationsDetails {
    return Intl.message(
      'Notification Details',
      name: 'notificationsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Mark as Read`
  String get notificationsMarkAsRead {
    return Intl.message(
      'Mark as Read',
      name: 'notificationsMarkAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Mark All as Read`
  String get notificationsMarkAllAsRead {
    return Intl.message(
      'Mark All as Read',
      name: 'notificationsMarkAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Clear Read`
  String get notificationsClearRead {
    return Intl.message(
      'Clear Read',
      name: 'notificationsClearRead',
      desc: '',
      args: [],
    );
  }

  /// `Delete Notification`
  String get notificationsDeleteNotification {
    return Intl.message(
      'Delete Notification',
      name: 'notificationsDeleteNotification',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this notification?`
  String get notificationsDeleteConfirmation {
    return Intl.message(
      'Are you sure you want to delete this notification?',
      name: 'notificationsDeleteConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all read notifications?`
  String get notificationsClearReadConfirmation {
    return Intl.message(
      'Are you sure you want to delete all read notifications?',
      name: 'notificationsClearReadConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Notification marked as read successfully`
  String get notificationsMarkAsReadSuccess {
    return Intl.message(
      'Notification marked as read successfully',
      name: 'notificationsMarkAsReadSuccess',
      desc: '',
      args: [],
    );
  }

  /// `All notifications marked as read successfully`
  String get notificationsMarkAllAsReadSuccess {
    return Intl.message(
      'All notifications marked as read successfully',
      name: 'notificationsMarkAllAsReadSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Notification deleted successfully`
  String get notificationsDeleteSuccess {
    return Intl.message(
      'Notification deleted successfully',
      name: 'notificationsDeleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `All read notifications cleared successfully`
  String get notificationsClearReadSuccess {
    return Intl.message(
      'All read notifications cleared successfully',
      name: 'notificationsClearReadSuccess',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get notificationsNoNotifications {
    return Intl.message(
      'No notifications',
      name: 'notificationsNoNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get notificationsTypeInvoice {
    return Intl.message(
      'Invoice',
      name: 'notificationsTypeInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get notificationsTypePayment {
    return Intl.message(
      'Payment',
      name: 'notificationsTypePayment',
      desc: '',
      args: [],
    );
  }

  /// `User Created`
  String get notificationsTypeUserCreated {
    return Intl.message(
      'User Created',
      name: 'notificationsTypeUserCreated',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get notificationsTypeSystem {
    return Intl.message(
      'System',
      name: 'notificationsTypeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Additional Data`
  String get notificationsAdditionalData {
    return Intl.message(
      'Additional Data',
      name: 'notificationsAdditionalData',
      desc: '',
      args: [],
    );
  }

  /// `Print Invoice`
  String get printInvoiceTitle {
    return Intl.message(
      'Print Invoice',
      name: 'printInvoiceTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Preview`
  String get noPreview {
    return Intl.message('No Preview', name: 'noPreview', desc: '', args: []);
  }

  /// `Print`
  String get print {
    return Intl.message('Print', name: 'print', desc: '', args: []);
  }

  /// `Preview`
  String get preview {
    return Intl.message('Preview', name: 'preview', desc: '', args: []);
  }

  /// `Print Cancelled`
  String get printCancelled {
    return Intl.message(
      'Print Cancelled',
      name: 'printCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Preview Error: {error}`
  String previewError(String error) {
    return Intl.message(
      'Preview Error: $error',
      name: 'previewError',
      desc: '',
      args: [error],
    );
  }

  /// `Printer Not Connected`
  String get printerNotConnected {
    return Intl.message(
      'Printer Not Connected',
      name: 'printerNotConnected',
      desc: '',
      args: [],
    );
  }

  /// `Please connect printer from settings`
  String get connectPrinterFromSettings {
    return Intl.message(
      'Please connect printer from settings',
      name: 'connectPrinterFromSettings',
      desc: '',
      args: [],
    );
  }

  /// `Please connect printer first`
  String get pleaseConnectPrinterFirst {
    return Intl.message(
      'Please connect printer first',
      name: 'pleaseConnectPrinterFirst',
      desc: '',
      args: [],
    );
  }

  /// `Print Error: {error}`
  String printErrorWithMessage(String error) {
    return Intl.message(
      'Print Error: $error',
      name: 'printErrorWithMessage',
      desc: '',
      args: [error],
    );
  }

  /// `Subscription Packages Page`
  String get subscriptionPackageSelectionPage {
    return Intl.message(
      'Subscription Packages Page',
      name: 'subscriptionPackageSelectionPage',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get comingSoon {
    return Intl.message('Coming Soon', name: 'comingSoon', desc: '', args: []);
  }

  /// `Cannot open package link`
  String get cannotOpenPackageLink {
    return Intl.message(
      'Cannot open package link',
      name: 'cannotOpenPackageLink',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get deleteItemConfirmation {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'deleteItemConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get stop {
    return Intl.message('Stop', name: 'stop', desc: '', args: []);
  }

  /// `Connect`
  String get connect {
    return Intl.message('Connect', name: 'connect', desc: '', args: []);
  }

  /// `Disconnect`
  String get disconnect {
    return Intl.message('Disconnect', name: 'disconnect', desc: '', args: []);
  }

  /// `Slice Height (pixels)`
  String get sliceHeight {
    return Intl.message(
      'Slice Height (pixels)',
      name: 'sliceHeight',
      desc: '',
      args: [],
    );
  }

  /// `Checking Bluetooth status...`
  String get checkingBluetoothStatus {
    return Intl.message(
      'Checking Bluetooth status...',
      name: 'checkingBluetoothStatus',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth is off. Please enable it.`
  String get bluetoothOff {
    return Intl.message(
      'Bluetooth is off. Please enable it.',
      name: 'bluetoothOff',
      desc: '',
      args: [],
    );
  }

  /// `Checking printer connection...`
  String get checkingPrinterConnection {
    return Intl.message(
      'Checking printer connection...',
      name: 'checkingPrinterConnection',
      desc: '',
      args: [],
    );
  }

  /// `Not connected to printer`
  String get printerNotConnectedStatus {
    return Intl.message(
      'Not connected to printer',
      name: 'printerNotConnectedStatus',
      desc: '',
      args: [],
    );
  }

  /// `Printing in progress...`
  String get printingInProgress {
    return Intl.message(
      'Printing in progress...',
      name: 'printingInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Status Code: {code}`
  String statusCode(String code) {
    return Intl.message(
      'Status Code: $code',
      name: 'statusCode',
      desc: '',
      args: [code],
    );
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Verify token is required`
  String get verifyTokenIsRequired {
    return Intl.message(
      'Verify token is required',
      name: 'verifyTokenIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `New Notifications`
  String get newNotifications {
    return Intl.message(
      'New Notifications',
      name: 'newNotifications',
      desc: '',
      args: [],
    );
  }

  /// `You have {count} new notification`
  String youHaveNewNotification(int count) {
    return Intl.message(
      'You have $count new notification',
      name: 'youHaveNewNotification',
      desc: '',
      args: [count],
    );
  }

  /// `Searching for printers...`
  String get searchingForPrinters {
    return Intl.message(
      'Searching for printers...',
      name: 'searchingForPrinters',
      desc: '',
      args: [],
    );
  }

  /// `Connected printer is shown at the top`
  String get connectedPrinterShownAtTop {
    return Intl.message(
      'Connected printer is shown at the top',
      name: 'connectedPrinterShownAtTop',
      desc: '',
      args: [],
    );
  }

  /// `No printers found. Press "Search" to search`
  String get noPrintersPressSearch {
    return Intl.message(
      'No printers found. Press "Search" to search',
      name: 'noPrintersPressSearch',
      desc: '',
      args: [],
    );
  }

  /// `Preview and Test Print`
  String get previewAndTestPrint {
    return Intl.message(
      'Preview and Test Print',
      name: 'previewAndTestPrint',
      desc: '',
      args: [],
    );
  }

  /// `Connecting to printer...`
  String get connectingToPrinter {
    return Intl.message(
      'Connecting to printer...',
      name: 'connectingToPrinter',
      desc: '',
      args: [],
    );
  }

  /// `No printer device saved`
  String get noPrinterDeviceSaved {
    return Intl.message(
      'No printer device saved',
      name: 'noPrinterDeviceSaved',
      desc: '',
      args: [],
    );
  }

  /// `No saved printer device found. Please go to settings and add a printer device.`
  String get printerDeviceNotFound {
    return Intl.message(
      'No saved printer device found. Please go to settings and add a printer device.',
      name: 'printerDeviceNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Connection Failed`
  String get connectionFailed {
    return Intl.message(
      'Connection Failed',
      name: 'connectionFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to connect to printer. Please check printer settings and try again.`
  String get connectionFailedMessage {
    return Intl.message(
      'Failed to connect to printer. Please check printer settings and try again.',
      name: 'connectionFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth is Off`
  String get bluetoothIsOff {
    return Intl.message(
      'Bluetooth is Off',
      name: 'bluetoothIsOff',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth is off. Please enable Bluetooth to connect to printer.`
  String get bluetoothIsOffMessage {
    return Intl.message(
      'Bluetooth is off. Please enable Bluetooth to connect to printer.',
      name: 'bluetoothIsOffMessage',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get connected {
    return Intl.message('Connected', name: 'connected', desc: '', args: []);
  }

  /// `Disconnected`
  String get disconnected {
    return Intl.message(
      'Disconnected',
      name: 'disconnected',
      desc: '',
      args: [],
    );
  }

  /// `Connected Printer`
  String get connectedPrinter {
    return Intl.message(
      'Connected Printer',
      name: 'connectedPrinter',
      desc: '',
      args: [],
    );
  }

  /// `Printers`
  String get printers {
    return Intl.message('Printers', name: 'printers', desc: '', args: []);
  }

  /// `Preview:`
  String get previewLabel {
    return Intl.message('Preview:', name: 'previewLabel', desc: '', args: []);
  }

  /// `Invoice Language`
  String get invoiceLanguage {
    return Intl.message(
      'Invoice Language',
      name: 'invoiceLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Please Enable Bluetooth`
  String get pleaseEnableBluetooth {
    return Intl.message(
      'Please Enable Bluetooth',
      name: 'pleaseEnableBluetooth',
      desc: '',
      args: [],
    );
  }

  /// `Test Customer`
  String get testCustomer {
    return Intl.message(
      'Test Customer',
      name: 'testCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Test Product 1`
  String get testProduct1 {
    return Intl.message(
      'Test Product 1',
      name: 'testProduct1',
      desc: '',
      args: [],
    );
  }

  /// `Test Product 2`
  String get testProduct2 {
    return Intl.message(
      'Test Product 2',
      name: 'testProduct2',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Update your profile information`
  String get updateYourProfileInformation {
    return Intl.message(
      'Update your profile information',
      name: 'updateYourProfileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get operationDelete {
    return Intl.message('Delete', name: 'operationDelete', desc: '', args: []);
  }

  /// `Status Update`
  String get operationStatusUpdate {
    return Intl.message(
      'Status Update',
      name: 'operationStatusUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Bulk Delete`
  String get operationBulkDelete {
    return Intl.message(
      'Bulk Delete',
      name: 'operationBulkDelete',
      desc: '',
      args: [],
    );
  }

  /// `Bulk Status Update`
  String get operationBulkStatusUpdate {
    return Intl.message(
      'Bulk Status Update',
      name: 'operationBulkStatusUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Additional Invoice Details`
  String get additionalInvoiceDetails {
    return Intl.message(
      'Additional Invoice Details',
      name: 'additionalInvoiceDetails',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Type`
  String get invoiceType {
    return Intl.message(
      'Invoice Type',
      name: 'invoiceType',
      desc: '',
      args: [],
    );
  }

  /// `Sent Date`
  String get sentDate {
    return Intl.message('Sent Date', name: 'sentDate', desc: '', args: []);
  }

  /// `QR- Code`
  String get qrCode {
    return Intl.message('QR- Code', name: 'qrCode', desc: '', args: []);
  }

  /// `QR Code`
  String get qrCodeLabel {
    return Intl.message('QR Code', name: 'qrCodeLabel', desc: '', args: []);
  }

  /// `Error Message`
  String get errorMessageLabel {
    return Intl.message(
      'Error Message',
      name: 'errorMessageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Standard Invoice`
  String get invoiceTypeStandard {
    return Intl.message(
      'Standard Invoice',
      name: 'invoiceTypeStandard',
      desc: '',
      args: [],
    );
  }

  /// `Credit Note`
  String get invoiceTypeCreditNote {
    return Intl.message(
      'Credit Note',
      name: 'invoiceTypeCreditNote',
      desc: '',
      args: [],
    );
  }

  /// `Debit Note`
  String get invoiceTypeDebitNote {
    return Intl.message(
      'Debit Note',
      name: 'invoiceTypeDebitNote',
      desc: '',
      args: [],
    );
  }

  /// `Proforma Invoice`
  String get invoiceTypeProforma {
    return Intl.message(
      'Proforma Invoice',
      name: 'invoiceTypeProforma',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get customerNamePlaceholder {
    return Intl.message(
      'Customer Name',
      name: 'customerNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Customer Email`
  String get customerEmailPlaceholder {
    return Intl.message(
      'Customer Email',
      name: 'customerEmailPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Customer Phone`
  String get customerPhonePlaceholder {
    return Intl.message(
      'Customer Phone',
      name: 'customerPhonePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Customer Address`
  String get customerAddressPlaceholder {
    return Intl.message(
      'Customer Address',
      name: 'customerAddressPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Customer Tax Number`
  String get customerTaxNumberPlaceholder {
    return Intl.message(
      'Customer Tax Number',
      name: 'customerTaxNumberPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Add New Item`
  String get addNewItem {
    return Intl.message('Add New Item', name: 'addNewItem', desc: '', args: []);
  }

  /// `Item name is required`
  String get itemNameRequired {
    return Intl.message(
      'Item name is required',
      name: 'itemNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Quantity must be greater than zero`
  String get quantityMustBeGreaterThanZero {
    return Intl.message(
      'Quantity must be greater than zero',
      name: 'quantityMustBeGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Quantity exceeds available stock ({count})`
  String quantityExceedsAvailableStock(int count) {
    return Intl.message(
      'Quantity exceeds available stock ($count)',
      name: 'quantityExceedsAvailableStock',
      desc: '',
      args: [count],
    );
  }

  /// `Price must be greater than or equal to zero`
  String get priceMustBeGreaterThanOrEqualZero {
    return Intl.message(
      'Price must be greater than or equal to zero',
      name: 'priceMustBeGreaterThanOrEqualZero',
      desc: '',
      args: [],
    );
  }

  /// `Price must be greater than zero`
  String get priceMustBeGreaterThanZero {
    return Intl.message(
      'Price must be greater than zero',
      name: 'priceMustBeGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Discount (%)`
  String get discountPercent {
    return Intl.message(
      'Discount (%)',
      name: 'discountPercent',
      desc: '',
      args: [],
    );
  }

  /// `Discount is required`
  String get discountRequired {
    return Intl.message(
      'Discount is required',
      name: 'discountRequired',
      desc: '',
      args: [],
    );
  }

  /// `Discount must be greater than or equal to zero`
  String get discountMustBeGreaterThanOrEqualZero {
    return Intl.message(
      'Discount must be greater than or equal to zero',
      name: 'discountMustBeGreaterThanOrEqualZero',
      desc: '',
      args: [],
    );
  }

  /// `Tax percent is required`
  String get taxPercentRequired {
    return Intl.message(
      'Tax percent is required',
      name: 'taxPercentRequired',
      desc: '',
      args: [],
    );
  }

  /// `Tax percent must be greater than or equal to zero`
  String get taxPercentMustBeGreaterThanOrEqualZero {
    return Intl.message(
      'Tax percent must be greater than or equal to zero',
      name: 'taxPercentMustBeGreaterThanOrEqualZero',
      desc: '',
      args: [],
    );
  }

  /// `Save Edit`
  String get saveEdit {
    return Intl.message('Save Edit', name: 'saveEdit', desc: '', args: []);
  }

  /// `Tax Amount`
  String get itemTaxAmount {
    return Intl.message(
      'Tax Amount',
      name: 'itemTaxAmount',
      desc: '',
      args: [],
    );
  }

  /// `Items Count:`
  String get itemsCount {
    return Intl.message('Items Count:', name: 'itemsCount', desc: '', args: []);
  }

  /// `Product`
  String get product {
    return Intl.message('Product', name: 'product', desc: '', args: []);
  }

  /// `Bank Transfer`
  String get paymentMethodBankTransfer {
    return Intl.message(
      'Bank Transfer',
      name: 'paymentMethodBankTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load company logo`
  String get logoLoadError {
    return Intl.message(
      'Failed to load company logo',
      name: 'logoLoadError',
      desc: '',
      args: [],
    );
  }

  /// `Using default logo`
  String get usingDefaultLogo {
    return Intl.message(
      'Using default logo',
      name: 'usingDefaultLogo',
      desc: '',
      args: [],
    );
  }

  /// `Preparing invoice...`
  String get preparingInvoice {
    return Intl.message(
      'Preparing invoice...',
      name: 'preparingInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Rendering invoice...`
  String get renderingInvoice {
    return Intl.message(
      'Rendering invoice...',
      name: 'renderingInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Loading company logo...`
  String get loadingCompanyLogo {
    return Intl.message(
      'Loading company logo...',
      name: 'loadingCompanyLogo',
      desc: '',
      args: [],
    );
  }

  /// `Company logo loaded successfully`
  String get companyLogoLoaded {
    return Intl.message(
      'Company logo loaded successfully',
      name: 'companyLogoLoaded',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load company logo`
  String get companyLogoFailed {
    return Intl.message(
      'Failed to load company logo',
      name: 'companyLogoFailed',
      desc: '',
      args: [],
    );
  }

  /// `Loading default logo`
  String get loadingDefaultLogo {
    return Intl.message(
      'Loading default logo',
      name: 'loadingDefaultLogo',
      desc: '',
      args: [],
    );
  }

  /// `Logo loaded from cache`
  String get logoLoadedFromCache {
    return Intl.message(
      'Logo loaded from cache',
      name: 'logoLoadedFromCache',
      desc: '',
      args: [],
    );
  }

  /// `Retrying logo load...`
  String get retryingLogoLoad {
    return Intl.message(
      'Retrying logo load...',
      name: 'retryingLogoLoad',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load company logo, using default logo`
  String get failedToLoadCompanyLogoUsingDefault {
    return Intl.message(
      'Failed to load company logo, using default logo',
      name: 'failedToLoadCompanyLogoUsingDefault',
      desc: '',
      args: [],
    );
  }

  /// `Regional Settings`
  String get settingsRegionalSettings {
    return Intl.message(
      'Regional Settings',
      name: 'settingsRegionalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Notifications enabled`
  String get settingsNotificationsEnabled {
    return Intl.message(
      'Notifications enabled',
      name: 'settingsNotificationsEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Notifications disabled`
  String get settingsNotificationsDisabled {
    return Intl.message(
      'Notifications disabled',
      name: 'settingsNotificationsDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Enter current password`
  String get enterCurrentPassword {
    return Intl.message(
      'Enter current password',
      name: 'enterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get settingsPasswordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'settingsPasswordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Password Requirements`
  String get settingsPasswordRequirements {
    return Intl.message(
      'Password Requirements',
      name: 'settingsPasswordRequirements',
      desc: '',
      args: [],
    );
  }

  /// `At least one uppercase letter`
  String get settingsPasswordUppercase {
    return Intl.message(
      'At least one uppercase letter',
      name: 'settingsPasswordUppercase',
      desc: '',
      args: [],
    );
  }

  /// `At least one number`
  String get settingsPasswordNumber {
    return Intl.message(
      'At least one number',
      name: 'settingsPasswordNumber',
      desc: '',
      args: [],
    );
  }

  /// `At least one special character`
  String get settingsPasswordSpecial {
    return Intl.message(
      'At least one special character',
      name: 'settingsPasswordSpecial',
      desc: '',
      args: [],
    );
  }

  /// `Weak`
  String get settingsPasswordWeak {
    return Intl.message(
      'Weak',
      name: 'settingsPasswordWeak',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get settingsPasswordMedium {
    return Intl.message(
      'Medium',
      name: 'settingsPasswordMedium',
      desc: '',
      args: [],
    );
  }

  /// `Strong`
  String get settingsPasswordStrong {
    return Intl.message(
      'Strong',
      name: 'settingsPasswordStrong',
      desc: '',
      args: [],
    );
  }

  /// `Changes saved successfully`
  String get settingsSaveChanges {
    return Intl.message(
      'Changes saved successfully',
      name: 'settingsSaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get settingsBasicInfo {
    return Intl.message(
      'Basic Information',
      name: 'settingsBasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get settingsCompanyName {
    return Intl.message(
      'Company Name',
      name: 'settingsCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter company name`
  String get pleaseEnterCompanyName {
    return Intl.message(
      'Please enter company name',
      name: 'pleaseEnterCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get settingsPhone {
    return Intl.message('Phone', name: 'settingsPhone', desc: '', args: []);
  }

  /// `Address`
  String get settingsAddress {
    return Intl.message('Address', name: 'settingsAddress', desc: '', args: []);
  }

  /// `Active`
  String get settingsUserActive {
    return Intl.message(
      'Active',
      name: 'settingsUserActive',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get settingsUserInactive {
    return Intl.message(
      'Inactive',
      name: 'settingsUserInactive',
      desc: '',
      args: [],
    );
  }

  /// `Merchant Code`
  String get settingsMerchantCode {
    return Intl.message(
      'Merchant Code',
      name: 'settingsMerchantCode',
      desc: '',
      args: [],
    );
  }

  /// `Standard`
  String get settingsInvoiceTypeStandard {
    return Intl.message(
      'Standard',
      name: 'settingsInvoiceTypeStandard',
      desc: '',
      args: [],
    );
  }

  /// `Simplified`
  String get settingsInvoiceTypeSimplified {
    return Intl.message(
      'Simplified',
      name: 'settingsInvoiceTypeSimplified',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get settingsCancel {
    return Intl.message('Cancel', name: 'settingsCancel', desc: '', args: []);
  }

  /// `Account Security`
  String get settingsAccountSecurity {
    return Intl.message(
      'Account Security',
      name: 'settingsAccountSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get settingsAccount {
    return Intl.message(
      'Account Settings',
      name: 'settingsAccount',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get settingsProfile {
    return Intl.message('Profile', name: 'settingsProfile', desc: '', args: []);
  }

  /// `Change Password`
  String get settingsChangePassword {
    return Intl.message(
      'Change Password',
      name: 'settingsChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Update your password to keep your account secure`
  String get settingsChangePasswordDesc {
    return Intl.message(
      'Update your password to keep your account secure',
      name: 'settingsChangePasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `Users Management`
  String get settingsUsersManagement {
    return Intl.message(
      'Users Management',
      name: 'settingsUsersManagement',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get settingsPersonalInfo {
    return Intl.message(
      'Personal Information',
      name: 'settingsPersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `What happens when you delete your account?`
  String get settingsWhatHappens {
    return Intl.message(
      'What happens when you delete your account?',
      name: 'settingsWhatHappens',
      desc: '',
      args: [],
    );
  }

  /// `Your account will be permanently deleted`
  String get settingsAccountDeleted {
    return Intl.message(
      'Your account will be permanently deleted',
      name: 'settingsAccountDeleted',
      desc: '',
      args: [],
    );
  }

  /// `All your data will be permanently deleted`
  String get settingsDataDeleted {
    return Intl.message(
      'All your data will be permanently deleted',
      name: 'settingsDataDeleted',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone`
  String get settingsCannotUndo {
    return Intl.message(
      'This action cannot be undone',
      name: 'settingsCannotUndo',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get settingsTakePhoto {
    return Intl.message(
      'Take Photo',
      name: 'settingsTakePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get settingsChooseFromGallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'settingsChooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Remove Photo`
  String get settingsRemovePhoto {
    return Intl.message(
      'Remove Photo',
      name: 'settingsRemovePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Company Logo`
  String get companyLogo {
    return Intl.message(
      'Company Logo',
      name: 'companyLogo',
      desc: '',
      args: [],
    );
  }

  /// `Hardware`
  String get settingsHardware {
    return Intl.message(
      'Hardware',
      name: 'settingsHardware',
      desc: '',
      args: [],
    );
  }

  /// `Printer`
  String get settingsPrinter {
    return Intl.message('Printer', name: 'settingsPrinter', desc: '', args: []);
  }

  /// `Manage`
  String get settingsManage {
    return Intl.message('Manage', name: 'settingsManage', desc: '', args: []);
  }

  /// `Not specified`
  String get notSpecified {
    return Intl.message(
      'Not specified',
      name: 'notSpecified',
      desc: '',
      args: [],
    );
  }

  /// `Unsaved Changes`
  String get settingsUnsavedChanges {
    return Intl.message(
      'Unsaved Changes',
      name: 'settingsUnsavedChanges',
      desc: '',
      args: [],
    );
  }

  /// `You have unsaved changes. Are you sure you want to discard them?`
  String get settingsDiscardChanges {
    return Intl.message(
      'You have unsaved changes. Are you sure you want to discard them?',
      name: 'settingsDiscardChanges',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get settingsDiscard {
    return Intl.message('Discard', name: 'settingsDiscard', desc: '', args: []);
  }

  /// `Please enter merchant code`
  String get pleaseEnterMerchantCode {
    return Intl.message(
      'Please enter merchant code',
      name: 'pleaseEnterMerchantCode',
      desc: '',
      args: [],
    );
  }

  /// `Please select invoice type`
  String get pleaseSelectInvoiceType {
    return Intl.message(
      'Please select invoice type',
      name: 'pleaseSelectInvoiceType',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Invotek is a comprehensive invoice management system designed to help businesses manage their invoicing needs efficiently.`
  String get aboutUsDescription {
    return Intl.message(
      'Invotek is a comprehensive invoice management system designed to help businesses manage their invoicing needs efficiently.',
      name: 'aboutUsDescription',
      desc: '',
      args: [],
    );
  }

  /// `App Information`
  String get appInformation {
    return Intl.message(
      'App Information',
      name: 'appInformation',
      desc: '',
      args: [],
    );
  }

  /// `App Name`
  String get appName {
    return Intl.message('App Name', name: 'appName', desc: '', args: []);
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Build Number`
  String get buildNumber {
    return Intl.message(
      'Build Number',
      name: 'buildNumber',
      desc: '',
      args: [],
    );
  }

  /// `Package Name`
  String get packageName {
    return Intl.message(
      'Package Name',
      name: 'packageName',
      desc: '',
      args: [],
    );
  }

  /// `Copyright`
  String get copyright {
    return Intl.message('Copyright', name: 'copyright', desc: '', args: []);
  }

  /// `Share App`
  String get shareApp {
    return Intl.message('Share App', name: 'shareApp', desc: '', args: []);
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Contact Form`
  String get contactForm {
    return Intl.message(
      'Contact Form',
      name: 'contactForm',
      desc: '',
      args: [],
    );
  }

  /// `Subject is required`
  String get subjectRequired {
    return Intl.message(
      'Subject is required',
      name: 'subjectRequired',
      desc: '',
      args: [],
    );
  }

  /// `Message is required`
  String get messageRequired {
    return Intl.message(
      'Message is required',
      name: 'messageRequired',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get sendMessage {
    return Intl.message(
      'Send Message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Quick Contact`
  String get quickContact {
    return Intl.message(
      'Quick Contact',
      name: 'quickContact',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message('WhatsApp', name: 'whatsapp', desc: '', args: []);
  }

  /// `Contact us via WhatsApp`
  String get contactViaWhatsApp {
    return Intl.message(
      'Contact us via WhatsApp',
      name: 'contactViaWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Email app opened`
  String get emailOpened {
    return Intl.message(
      'Email app opened',
      name: 'emailOpened',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open email app`
  String get cannotOpenEmail {
    return Intl.message(
      'Cannot open email app',
      name: 'cannotOpenEmail',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open phone app`
  String get cannotOpenPhone {
    return Intl.message(
      'Cannot open phone app',
      name: 'cannotOpenPhone',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open WhatsApp`
  String get cannotOpenWhatsApp {
    return Intl.message(
      'Cannot open WhatsApp',
      name: 'cannotOpenWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicyTitle {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Last updated: {date}`
  String privacyPolicyLastUpdated(Object date) {
    return Intl.message(
      'Last updated: $date',
      name: 'privacyPolicyLastUpdated',
      desc: '',
      args: [date],
    );
  }

  /// `Last updated: January 2024`
  String get privacyPolicyLastUpdatedPlaceholder {
    return Intl.message(
      'Last updated: January 2024',
      name: 'privacyPolicyLastUpdatedPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get privacyPolicyIntroductionTitle {
    return Intl.message(
      'Introduction',
      name: 'privacyPolicyIntroductionTitle',
      desc: '',
      args: [],
    );
  }

  /// `This Privacy Policy describes how Invotek collects, uses, and protects your personal information when you use our application.`
  String get privacyPolicyIntroductionContent {
    return Intl.message(
      'This Privacy Policy describes how Invotek collects, uses, and protects your personal information when you use our application.',
      name: 'privacyPolicyIntroductionContent',
      desc: '',
      args: [],
    );
  }

  /// `Data Collection`
  String get privacyPolicyDataCollectionTitle {
    return Intl.message(
      'Data Collection',
      name: 'privacyPolicyDataCollectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `We collect information that you provide directly to us, such as when you create an account, make a purchase, or contact us for support.`
  String get privacyPolicyDataCollectionContent {
    return Intl.message(
      'We collect information that you provide directly to us, such as when you create an account, make a purchase, or contact us for support.',
      name: 'privacyPolicyDataCollectionContent',
      desc: '',
      args: [],
    );
  }

  /// `Data Usage`
  String get privacyPolicyDataUsageTitle {
    return Intl.message(
      'Data Usage',
      name: 'privacyPolicyDataUsageTitle',
      desc: '',
      args: [],
    );
  }

  /// `We use the information we collect to provide, maintain, and improve our services, process transactions, and communicate with you.`
  String get privacyPolicyDataUsageContent {
    return Intl.message(
      'We use the information we collect to provide, maintain, and improve our services, process transactions, and communicate with you.',
      name: 'privacyPolicyDataUsageContent',
      desc: '',
      args: [],
    );
  }

  /// `Data Security`
  String get privacyPolicyDataSecurityTitle {
    return Intl.message(
      'Data Security',
      name: 'privacyPolicyDataSecurityTitle',
      desc: '',
      args: [],
    );
  }

  /// `We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.`
  String get privacyPolicyDataSecurityContent {
    return Intl.message(
      'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.',
      name: 'privacyPolicyDataSecurityContent',
      desc: '',
      args: [],
    );
  }

  /// `Your Rights`
  String get privacyPolicyUserRightsTitle {
    return Intl.message(
      'Your Rights',
      name: 'privacyPolicyUserRightsTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have the right to access, update, or delete your personal information at any time through your account settings.`
  String get privacyPolicyUserRightsContent {
    return Intl.message(
      'You have the right to access, update, or delete your personal information at any time through your account settings.',
      name: 'privacyPolicyUserRightsContent',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get privacyPolicyContactTitle {
    return Intl.message(
      'Contact Us',
      name: 'privacyPolicyContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions about this Privacy Policy, please contact us at support@invotik.com.`
  String get privacyPolicyContactContent {
    return Intl.message(
      'If you have any questions about this Privacy Policy, please contact us at support@invotik.com.',
      name: 'privacyPolicyContactContent',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message('FAQ', name: 'faq', desc: '', args: []);
  }

  /// `Search FAQs`
  String get searchFAQs {
    return Intl.message('Search FAQs', name: 'searchFAQs', desc: '', args: []);
  }

  /// `No FAQs found`
  String get noFAQsFound {
    return Intl.message(
      'No FAQs found',
      name: 'noFAQsFound',
      desc: '',
      args: [],
    );
  }

  /// `Try a different search term`
  String get tryDifferentSearchTerm {
    return Intl.message(
      'Try a different search term',
      name: 'tryDifferentSearchTerm',
      desc: '',
      args: [],
    );
  }

  /// `How do I create an invoice?`
  String get faqQuestion1 {
    return Intl.message(
      'How do I create an invoice?',
      name: 'faqQuestion1',
      desc: '',
      args: [],
    );
  }

  /// `To create an invoice, go to the Invoices section and tap the '+' button. Fill in the required information and save.`
  String get faqAnswer1 {
    return Intl.message(
      'To create an invoice, go to the Invoices section and tap the \'+\' button. Fill in the required information and save.',
      name: 'faqAnswer1',
      desc: '',
      args: [],
    );
  }

  /// `How do I change my password?`
  String get faqQuestion2 {
    return Intl.message(
      'How do I change my password?',
      name: 'faqQuestion2',
      desc: '',
      args: [],
    );
  }

  /// `Go to Settings > Account Settings > Change Password. Enter your current password and new password.`
  String get faqAnswer2 {
    return Intl.message(
      'Go to Settings > Account Settings > Change Password. Enter your current password and new password.',
      name: 'faqAnswer2',
      desc: '',
      args: [],
    );
  }

  /// `How do I add a customer?`
  String get faqQuestion3 {
    return Intl.message(
      'How do I add a customer?',
      name: 'faqQuestion3',
      desc: '',
      args: [],
    );
  }

  /// `Go to the Customers section and tap the '+' button. Fill in the customer information and save.`
  String get faqAnswer3 {
    return Intl.message(
      'Go to the Customers section and tap the \'+\' button. Fill in the customer information and save.',
      name: 'faqAnswer3',
      desc: '',
      args: [],
    );
  }

  /// `How do I print an invoice?`
  String get faqQuestion4 {
    return Intl.message(
      'How do I print an invoice?',
      name: 'faqQuestion4',
      desc: '',
      args: [],
    );
  }

  /// `Open the invoice details and tap the print button. Select your printer and print.`
  String get faqAnswer4 {
    return Intl.message(
      'Open the invoice details and tap the print button. Select your printer and print.',
      name: 'faqAnswer4',
      desc: '',
      args: [],
    );
  }

  /// `How do I contact support?`
  String get faqQuestion5 {
    return Intl.message(
      'How do I contact support?',
      name: 'faqQuestion5',
      desc: '',
      args: [],
    );
  }

  /// `You can contact support through the Contact Us screen in Settings or email us at support@invotik.com.`
  String get faqAnswer5 {
    return Intl.message(
      'You can contact support through the Contact Us screen in Settings or email us at support@invotik.com.',
      name: 'faqAnswer5',
      desc: '',
      args: [],
    );
  }

  /// `Language Settings`
  String get languageSettings {
    return Intl.message(
      'Language Settings',
      name: 'languageSettings',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get arabicDescription {
    return Intl.message(
      'العربية',
      name: 'arabicDescription',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishDescription {
    return Intl.message(
      'English',
      name: 'englishDescription',
      desc: '',
      args: [],
    );
  }

  /// `Changing the language will restart the app to apply the changes.`
  String get languageChangeNote {
    return Intl.message(
      'Changing the language will restart the app to apply the changes.',
      name: 'languageChangeNote',
      desc: '',
      args: [],
    );
  }

  /// `Notifications Settings`
  String get notificationsSettings {
    return Intl.message(
      'Notifications Settings',
      name: 'notificationsSettings',
      desc: '',
      args: [],
    );
  }

  /// `Notification Types`
  String get notificationTypes {
    return Intl.message(
      'Notification Types',
      name: 'notificationTypes',
      desc: '',
      args: [],
    );
  }

  /// `General Notifications`
  String get generalNotifications {
    return Intl.message(
      'General Notifications',
      name: 'generalNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Receive general app notifications`
  String get generalNotificationsDescription {
    return Intl.message(
      'Receive general app notifications',
      name: 'generalNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Notifications`
  String get invoiceNotifications {
    return Intl.message(
      'Invoice Notifications',
      name: 'invoiceNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Receive notifications about invoices`
  String get invoiceNotificationsDescription {
    return Intl.message(
      'Receive notifications about invoices',
      name: 'invoiceNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Payment Notifications`
  String get paymentNotifications {
    return Intl.message(
      'Payment Notifications',
      name: 'paymentNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Receive notifications about payments`
  String get paymentNotificationsDescription {
    return Intl.message(
      'Receive notifications about payments',
      name: 'paymentNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `System Notifications`
  String get systemNotifications {
    return Intl.message(
      'System Notifications',
      name: 'systemNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Receive system and update notifications`
  String get systemNotificationsDescription {
    return Intl.message(
      'Receive system and update notifications',
      name: 'systemNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `You can close and open the general notifications.`
  String get notificationsSettingsNote {
    return Intl.message(
      'You can close and open the general notifications.',
      name: 'notificationsSettingsNote',
      desc: '',
      args: [],
    );
  }

  /// `Data & Storage`
  String get dataStorage {
    return Intl.message(
      'Data & Storage',
      name: 'dataStorage',
      desc: '',
      args: [],
    );
  }

  /// `Storage Information`
  String get storageInformation {
    return Intl.message(
      'Storage Information',
      name: 'storageInformation',
      desc: '',
      args: [],
    );
  }

  /// `Cache Size`
  String get cacheSize {
    return Intl.message('Cache Size', name: 'cacheSize', desc: '', args: []);
  }

  /// `Data Size`
  String get dataSize {
    return Intl.message('Data Size', name: 'dataSize', desc: '', args: []);
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Clear Cache`
  String get clearCache {
    return Intl.message('Clear Cache', name: 'clearCache', desc: '', args: []);
  }

  /// `Clear temporary files and cached data to free up storage space.`
  String get clearCacheDescription {
    return Intl.message(
      'Clear temporary files and cached data to free up storage space.',
      name: 'clearCacheDescription',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear the cache? This will remove temporary files but not your personal data.`
  String get clearCacheConfirmation {
    return Intl.message(
      'Are you sure you want to clear the cache? This will remove temporary files but not your personal data.',
      name: 'clearCacheConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Cache cleared successfully`
  String get cacheClearedSuccessfully {
    return Intl.message(
      'Cache cleared successfully',
      name: 'cacheClearedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error clearing cache`
  String get errorClearingCache {
    return Intl.message(
      'Error clearing cache',
      name: 'errorClearingCache',
      desc: '',
      args: [],
    );
  }

  /// `Clear All Data`
  String get clearAllData {
    return Intl.message(
      'Clear All Data',
      name: 'clearAllData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear all data? This will remove all cached files and preferences. This action cannot be undone.`
  String get clearAllDataConfirmation {
    return Intl.message(
      'Are you sure you want to clear all data? This will remove all cached files and preferences. This action cannot be undone.',
      name: 'clearAllDataConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Warning: This will delete all cached data and preferences. Your account data will remain safe.`
  String get clearAllDataDescription {
    return Intl.message(
      'Warning: This will delete all cached data and preferences. Your account data will remain safe.',
      name: 'clearAllDataDescription',
      desc: '',
      args: [],
    );
  }

  /// `All data cleared successfully`
  String get allDataClearedSuccessfully {
    return Intl.message(
      'All data cleared successfully',
      name: 'allDataClearedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error clearing data`
  String get errorClearingData {
    return Intl.message(
      'Error clearing data',
      name: 'errorClearingData',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpSupport {
    return Intl.message(
      'Help & Support',
      name: 'helpSupport',
      desc: '',
      args: [],
    );
  }

  /// `Legal`
  String get legal {
    return Intl.message('Legal', name: 'legal', desc: '', args: []);
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Return Invoice`
  String get returnInvoice {
    return Intl.message(
      'Return Invoice',
      name: 'returnInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Returned Invoice`
  String get creditInvoice {
    return Intl.message(
      'Returned Invoice',
      name: 'creditInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reason {
    return Intl.message('Reason', name: 'reason', desc: '', args: []);
  }

  /// `Create Returned Invoice`
  String get createCreditInvoice {
    return Intl.message(
      'Create Returned Invoice',
      name: 'createCreditInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Basic Info`
  String get basicInfo {
    return Intl.message('Basic Info', name: 'basicInfo', desc: '', args: []);
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Return Reason`
  String get returnReason {
    return Intl.message(
      'Return Reason',
      name: 'returnReason',
      desc: '',
      args: [],
    );
  }

  /// `Enter reason for return`
  String get enterReasonForReturn {
    return Intl.message(
      'Enter reason for return',
      name: 'enterReasonForReturn',
      desc: '',
      args: [],
    );
  }

  /// `Returned Invoice`
  String get returnedInvoice {
    return Intl.message(
      'Returned Invoice',
      name: 'returnedInvoice',
      desc: '',
      args: [],
    );
  }

  /// `This invoice already has a returned invoice associated with it`
  String get invoiceAlreadyHasCreditInvoice {
    return Intl.message(
      'This invoice already has a returned invoice associated with it',
      name: 'invoiceAlreadyHasCreditInvoice',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
