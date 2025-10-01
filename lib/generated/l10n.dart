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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `WELCOME!`
  String get welcome {
    return Intl.message(
      'WELCOME!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `TekPart`
  String get tekpart {
    return Intl.message(
      'TekPart',
      name: 'tekpart',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
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

  /// `Please check the entered data`
  String get validationError {
    return Intl.message(
      'Please check the entered data',
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

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get loggingIn {
    return Intl.message(
      'Logging in...',
      name: 'loggingIn',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
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

  /// `Users and Permissions`
  String get usersPermissions {
    return Intl.message(
      'Users and Permissions',
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
    return Intl.message(
      'Expenses',
      name: 'expenses',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Login',
      name: 'rejester',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Expenses',
      name: 'expensesTitle',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Users List`
  String get usersList {
    return Intl.message(
      'Users List',
      name: 'usersList',
      desc: '',
      args: [],
    );
  }

  /// `Add User`
  String get addUser {
    return Intl.message(
      'Add User',
      name: 'addUser',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Add Client',
      name: 'addClient',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Add Expense',
      name: 'addExpense',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'New Expense',
      name: 'newExpense',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `0.00`
  String get amountHint {
    return Intl.message(
      '0.00',
      name: 'amountHint',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Backup',
      name: 'backup',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get role {
    return Intl.message(
      'Role',
      name: 'role',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive {
    return Intl.message(
      'Inactive',
      name: 'inactive',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Manager`
  String get manager {
    return Intl.message(
      'Manager',
      name: 'manager',
      desc: '',
      args: [],
    );
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

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
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
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Status',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get rule {
    return Intl.message(
      'Role',
      name: 'rule',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Enter email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
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

  /// `Search products...`
  String get searchProducts {
    return Intl.message(
      'Search products...',
      name: 'searchProducts',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Out of Stock',
      name: 'outOfStock',
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

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `No name`
  String get noName {
    return Intl.message(
      'No name',
      name: 'noName',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get undefined {
    return Intl.message(
      'Undefined',
      name: 'undefined',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
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

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `SKU`
  String get sku {
    return Intl.message(
      'SKU',
      name: 'sku',
      desc: '',
      args: [],
    );
  }

  /// `Barcode`
  String get barcode {
    return Intl.message(
      'Barcode',
      name: 'barcode',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Dimensions`
  String get dimensions {
    return Intl.message(
      'Dimensions',
      name: 'dimensions',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Has Tax',
      name: 'hasTax',
      desc: '',
      args: [],
    );
  }

  /// `Tax Rate`
  String get taxRate {
    return Intl.message(
      'Tax Rate',
      name: 'taxRate',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Is Active',
      name: 'isActive',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Pricing`
  String get pricing {
    return Intl.message(
      'Pricing',
      name: 'pricing',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Cost Price',
      name: 'costPrice',
      desc: '',
      args: [],
    );
  }

  /// `Inventory`
  String get inventory {
    return Intl.message(
      'Inventory',
      name: 'inventory',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `Piece`
  String get piece {
    return Intl.message(
      'Piece',
      name: 'piece',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get kilogram {
    return Intl.message(
      'kg',
      name: 'kilogram',
      desc: '',
      args: [],
    );
  }

  /// `m`
  String get meter {
    return Intl.message(
      'm',
      name: 'meter',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Product SKU',
      name: 'productSku',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get model {
    return Intl.message(
      'Model',
      name: 'model',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Material`
  String get material {
    return Intl.message(
      'Material',
      name: 'material',
      desc: '',
      args: [],
    );
  }

  /// `cm`
  String get centimeters {
    return Intl.message(
      'cm',
      name: 'centimeters',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
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
    return Intl.message(
      'Email',
      name: 'customerEmail',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Address',
      name: 'customerAddress',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Notes',
      name: 'customerNotes',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get customerStatus {
    return Intl.message(
      'Status',
      name: 'customerStatus',
      desc: '',
      args: [],
    );
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

  /// `Customer Information`
  String get customerBasicInfo {
    return Intl.message(
      'Customer Information',
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

  /// `Commercial Register Number`
  String get customerCommercialRegister {
    return Intl.message(
      'Commercial Register Number',
      name: 'customerCommercialRegister',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get customerCity {
    return Intl.message(
      'City',
      name: 'customerCity',
      desc: '',
      args: [],
    );
  }

  /// `Region/Province`
  String get customerRegion {
    return Intl.message(
      'Region/Province',
      name: 'customerRegion',
      desc: '',
      args: [],
    );
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
  String customerCreatedSuccessfully(Object name) {
    return Intl.message(
      'Customer "$name" created successfully',
      name: 'customerCreatedSuccessfully',
      desc: '',
      args: [name],
    );
  }

  /// `Customer "{name}" updated successfully`
  String customerUpdatedSuccessfully(Object name) {
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

  /// `Confirm Delete`
  String get confirmDeleteCustomer {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDeleteCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete customer "{name}"?`
  String confirmDeleteCustomerMessage(Object name) {
    return Intl.message(
      'Are you sure you want to delete customer "$name"?',
      name: 'confirmDeleteCustomerMessage',
      desc: '',
      args: [name],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
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

  /// `An error occurred: {error}`
  String errorOccurred(Object error) {
    return Intl.message(
      'An error occurred: $error',
      name: 'errorOccurred',
      desc: '',
      args: [error],
    );
  }

  /// `Search customers...`
  String get searchCustomers {
    return Intl.message(
      'Search customers...',
      name: 'searchCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get company {
    return Intl.message(
      'Company',
      name: 'company',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Customers',
      name: 'customers',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Status Info',
      name: 'statusInfo',
      desc: '',
      args: [],
    );
  }

  /// `Created`
  String get createdDate {
    return Intl.message(
      'Created',
      name: 'createdDate',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Got it!',
      name: 'gotIt',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message(
      'Credit Card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `Debit Card`
  String get debitCard {
    return Intl.message(
      'Debit Card',
      name: 'debitCard',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Check',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Metadata',
      name: 'metadata',
      desc: '',
      args: [],
    );
  }

  /// `Created By`
  String get createdBy {
    return Intl.message(
      'Created By',
      name: 'createdBy',
      desc: '',
      args: [],
    );
  }

  /// `Created At`
  String get createdAt {
    return Intl.message(
      'Created At',
      name: 'createdAt',
      desc: '',
      args: [],
    );
  }

  /// `Updated At`
  String get updatedAt {
    return Intl.message(
      'Updated At',
      name: 'updatedAt',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Icon',
      name: 'icon',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Saving...',
      name: 'saving',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Settings',
      name: 'settings',
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
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'App Information',
      name: 'appInfo',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Terms of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
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

  /// `Enter company name`
  String get enterCompanyName {
    return Intl.message(
      'Enter company name',
      name: 'enterCompanyName',
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

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Device Type',
      name: 'deviceType',
      desc: '',
      args: [],
    );
  }

  /// `Tablet`
  String get tablet {
    return Intl.message(
      'Tablet',
      name: 'tablet',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Theme Demo`
  String get themeDemo {
    return Intl.message(
      'Theme Demo',
      name: 'themeDemo',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Text Styles',
      name: 'textStyles',
      desc: '',
      args: [],
    );
  }

  /// `Main Title`
  String get mainTitle {
    return Intl.message(
      'Main Title',
      name: 'mainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sub Title`
  String get subTitle {
    return Intl.message(
      'Sub Title',
      name: 'subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Normal Text`
  String get normalText {
    return Intl.message(
      'Normal Text',
      name: 'normalText',
      desc: '',
      args: [],
    );
  }

  /// `Small Text`
  String get smallText {
    return Intl.message(
      'Small Text',
      name: 'smallText',
      desc: '',
      args: [],
    );
  }

  /// `Link`
  String get link {
    return Intl.message(
      'Link',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `Error Text`
  String get errorText {
    return Intl.message(
      'Error Text',
      name: 'errorText',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Buttons',
      name: 'buttons',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Cards',
      name: 'cards',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Opening map',
      name: 'openingMap',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
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

  /// `Error loading products`
  String get errorLoadingProducts {
    return Intl.message(
      'Error loading products',
      name: 'errorLoadingProducts',
      desc: '',
      args: [],
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

  /// `Error creating product`
  String get errorCreatingProduct {
    return Intl.message(
      'Error creating product',
      name: 'errorCreatingProduct',
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
    return Intl.message(
      'All Status',
      name: 'allStatus',
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
    return Intl.message(
      'Edit User',
      name: 'editUser',
      desc: '',
      args: [],
    );
  }

  /// `Add New Role`
  String get addNewRole {
    return Intl.message(
      'Add New Role',
      name: 'addNewRole',
      desc: '',
      args: [],
    );
  }

  /// `Edit Role`
  String get editRole {
    return Intl.message(
      'Edit Role',
      name: 'editRole',
      desc: '',
      args: [],
    );
  }

  /// `No email`
  String get noEmail {
    return Intl.message(
      'No email',
      name: 'noEmail',
      desc: '',
      args: [],
    );
  }

  /// `No role`
  String get noRole {
    return Intl.message(
      'No role',
      name: 'noRole',
      desc: '',
      args: [],
    );
  }

  /// `Accountant`
  String get accountant {
    return Intl.message(
      'Accountant',
      name: 'accountant',
      desc: '',
      args: [],
    );
  }

  /// `Supervisor`
  String get supervisor {
    return Intl.message(
      'Supervisor',
      name: 'supervisor',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'View Users',
      name: 'viewUsers',
      desc: '',
      args: [],
    );
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

  /// `Enter product name`
  String get enterProductName {
    return Intl.message(
      'Enter product name',
      name: 'enterProductName',
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

  /// `Enter quantity`
  String get enterQuantity {
    return Intl.message(
      'Enter quantity',
      name: 'enterQuantity',
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
    return Intl.message(
      'Enter notes',
      name: 'enterNotes',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      '0500000000',
      name: 'examplePhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter city`
  String get enterCity {
    return Intl.message(
      'Enter city',
      name: 'enterCity',
      desc: '',
      args: [],
    );
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

  /// `Enter address`
  String get enterAddress {
    return Intl.message(
      'Enter address',
      name: 'enterAddress',
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
    return Intl.message(
      'Edit Client',
      name: 'editClient',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Department',
      name: 'department',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'User ID',
      name: 'userId',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      '8 Paid',
      name: 'paidInvoices',
      desc: '',
      args: [],
    );
  }

  /// `SAR 15,420`
  String get totalAmount {
    return Intl.message(
      'SAR 15,420',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `This Month`
  String get thisMonth {
    return Intl.message(
      'This Month',
      name: 'thisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Bought This`
  String get boughtThis {
    return Intl.message(
      'Bought This',
      name: 'boughtThis',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
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
    return Intl.message(
      'Delete User',
      name: 'deleteUser',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'No clients',
      name: 'noClients',
      desc: '',
      args: [],
    );
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

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
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

  /// `Tax Number`
  String get taxNumber {
    return Intl.message(
      'Tax Number',
      name: 'taxNumber',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Client Name',
      name: 'clientName',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'This field',
      name: 'thisField',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Login error',
      name: 'loginError',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Add Invoice',
      name: 'addInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Invoices`
  String get invoices {
    return Intl.message(
      'Invoices',
      name: 'invoices',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Customer',
      name: 'customer',
      desc: '',
      args: [],
    );
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

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Overdue`
  String get overdue {
    return Intl.message(
      'Overdue',
      name: 'overdue',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get draft {
    return Intl.message(
      'Draft',
      name: 'draft',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get card {
    return Intl.message(
      'Card',
      name: 'card',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message(
      'Tax',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `No items`
  String get noItems {
    return Intl.message(
      'No items',
      name: 'noItems',
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

  /// `Qty`
  String get qty {
    return Intl.message(
      'Qty',
      name: 'qty',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Mark as Paid',
      name: 'markAsPaid',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate`
  String get duplicate {
    return Intl.message(
      'Duplicate',
      name: 'duplicate',
      desc: '',
      args: [],
    );
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

  /// `No invoices`
  String get noInvoices {
    return Intl.message(
      'No invoices',
      name: 'noInvoices',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Send Method',
      name: 'sendMethod',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get sms {
    return Intl.message(
      'SMS',
      name: 'sms',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Include PDF',
      name: 'includePDF',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Add Notes',
      name: 'addNotes',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Cash',
      name: 'paymentMethodCash',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get paymentMethodCard {
    return Intl.message(
      'Credit Card',
      name: 'paymentMethodCard',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Issue Date',
      name: 'issueDate',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Enter customer email`
  String get enterCustomerEmail {
    return Intl.message(
      'Enter customer email',
      name: 'enterCustomerEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter customer phone`
  String get enterCustomerPhone {
    return Intl.message(
      'Enter customer phone',
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
    return Intl.message(
      'Tax Type',
      name: 'taxType',
      desc: '',
      args: [],
    );
  }

  /// `VAT`
  String get vat {
    return Intl.message(
      'VAT',
      name: 'vat',
      desc: '',
      args: [],
    );
  }

  /// `Sales Tax`
  String get salesTax {
    return Intl.message(
      'Sales Tax',
      name: 'salesTax',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Kuwait',
      name: 'kuwait',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'VAT Number',
      name: 'vatNumber',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postalCode {
    return Intl.message(
      'Postal Code',
      name: 'postalCode',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Enter phone',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
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

  /// `Tax Amount`
  String get taxAmount {
    return Intl.message(
      'Tax Amount',
      name: 'taxAmount',
      desc: '',
      args: [],
    );
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
