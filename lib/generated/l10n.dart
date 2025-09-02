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

  /// `Invalid email format`
  String get emailInvalid {
    return Intl.message(
      'Invalid email format',
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

  /// `Confirm password is required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm password is required',
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

  /// `Network connection error. Please check your connection and try again.`
  String get networkError {
    return Intl.message(
      'Network connection error. Please check your connection and try again.',
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

  /// `Unknown error occurred`
  String get unknownError {
    return Intl.message(
      'Unknown error occurred',
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

  /// `Tax invoices`
  String get taxInvoices {
    return Intl.message(
      'Tax invoices',
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

  /// `العربية`
  String get arabic {
    return Intl.message(
      'العربية',
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

  /// `Add New User`
  String get addUser {
    return Intl.message(
      'Add New User',
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

  /// `Add New Client`
  String get addClient {
    return Intl.message(
      'Add New Client',
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

  /// `Add New Expense`
  String get addExpense {
    return Intl.message(
      'Add New Expense',
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

  /// `Create New Invoice`
  String get createInvoice {
    return Intl.message(
      'Create New Invoice',
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
  String deleteUserConfirmation(Object name) {
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

  /// `Manage Products And Categories`
  String get productsCategories {
    return Intl.message(
      'Manage Products And Categories',
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
  String deleteProductConfirmation(Object name) {
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

  /// `No Name`
  String get noName {
    return Intl.message(
      'No Name',
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

  /// `Basic Information`
  String get basicInformation {
    return Intl.message(
      'Basic Information',
      name: 'basicInformation',
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

  /// `Add New Product`
  String get addProduct {
    return Intl.message(
      'Add New Product',
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

  /// `Additional Information`
  String get additionalInformation {
    return Intl.message(
      'Additional Information',
      name: 'additionalInformation',
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
