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
  String get emailInvalid => 'Invalid email format';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordShort => 'Password must be at least 6 characters';

  @override
  String get passwordWeak =>
      'Password must contain uppercase, lowercase and number';

  @override
  String get confirmPasswordRequired => 'Confirm password is required';

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
  String get networkError =>
      'Network connection error. Please check your connection and try again.';

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
  String get taxInvoices => 'Tax invoices';

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
  String get arabic => 'العربية';

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
}
