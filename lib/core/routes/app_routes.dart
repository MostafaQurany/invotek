import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/auth/ui/forget_password_screen.dart';
import 'package:invotek/features/auth/ui/verify_otp_screen.dart';
import 'package:invotek/features/auth/ui/reset_password_screen.dart';
import 'package:invotek/features/expenses/demo/entit/expense_model.dart';
import 'package:invotek/features/expenses/ui/screens/add_expense_screen.dart';
import 'package:invotek/features/expenses/ui/screens/edit_expense_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expense_details_screen.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/ui/screens/add_invoice_screen_with_provider.dart';
import 'package:invotek/features/invoices/ui/screens/edit_invoice_screen_with_provider.dart';
import 'package:invotek/features/invoices/ui/screens/invoice_details_screen_with_provider.dart';
import 'package:invotek/features/invoices/ui/screens/enhanced_invoice_details_screen_with_provider.dart';
import 'package:invotek/features/invoices/ui/screens/invoices_list_screen.dart';
import 'package:invotek/features/invoices/ui/screens/invoice_creation_stepper_screen.dart';
import 'package:invotek/features/printing/ui/screens/print_options_screen.dart';
import 'package:invotek/features/printing/ui/screens/thermal_print_screen.dart';
import 'package:invotek/features/printing/ui/screens/pdf_preview_screen.dart';
import 'package:invotek/features/printing/ui/screens/printer_settings_screen.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/auth/ui/auth_screen.dart';
import 'package:invotek/features/clients/ui/screens/add_client_screen.dart';
import 'package:invotek/features/clients/ui/screens/client_details_screen.dart';
import 'package:invotek/features/clients/ui/screens/clients_list_screen.dart';
import 'package:invotek/features/clients/ui/screens/edit_client_screen.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/screens/add_customer_screen.dart';
import 'package:invotek/features/customers/ui/screens/customer_details_screen.dart';
import 'package:invotek/features/customers/ui/screens/customers_list_screen.dart';
import 'package:invotek/features/customers/ui/screens/edit_customer_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expenses_list_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expense_categories_list_screen_with_provider.dart';
import 'package:invotek/features/home/ui/home_screen_with_drawer.dart';
import 'package:invotek/features/onboarding/ui/onboarding_screen.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/screens/add_product_screen.dart';
import 'package:invotek/features/products/ui/screens/edit_product_screen.dart';
import 'package:invotek/features/products/ui/screens/product_details_screen.dart';
import 'package:invotek/features/products/ui/screens/products_list_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/add_user_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/edit_user_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/manage_permissions_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/user_details_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_list_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_permissions_screen.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/products/ui/screens/categories_list_screen.dart';
import 'package:invotek/features/settings/ui/screens/settings_screen.dart';
import 'package:invotek/features/settings/ui/screens/change_password_screen.dart';
import 'package:invotek/features/settings/ui/screens/delete_account_screen.dart';

class AppRoutes {
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';
  static const String onboardingRoute = '/onboarding';
  static const String usersListRoute = '/users/list';
  static const String addUserRoute = '/users/add';
  static const String managePermissionsRoute = '/users/permissions';
  static const String clientsListRoute = '/clients/list';
  static const String addClientRoute = '/clients/add';
  static const String editClientRoute = '/clients/edit';
  static const String clientDetailsRoute = '/clients/details';
  // auth
  static const String forgetPassword = '/forgetPassword';
  static const String verifyOtp = '/verifyOtp';
  static const String resetPassword = '/resetPassword';
  // Users & Permissions routes
  static const String usersPermissionsRoute = '/users-permissions';
  static const String userDetailsRoute = '/users/details';
  static const String editUserRoute = '/users/edit';

  // Products routes
  static const String productsListRoute = '/products/list';
  static const String addProductRoute = '/products/add';
  static const String editProductRoute = '/products/edit';
  static const String productDetailsRoute = '/products/details';

  // Categories routes
  static const String categoriesListRoute = '/products/categories';
  static const String addCategoryRoute = '/products/categories/add';
  static const String editCategoryRoute = '/products/categories/edit';

  // Customers routes
  static const String customersListRoute = '/customers/list';
  static const String addCustomerRoute = '/customers/add';
  static const String editCustomerRoute = '/customers/edit';
  static const String customerDetailsRoute = '/customers/details';

  // Expenses routes
  static const String expensesListRoute = '/expenses/list';
  static const String addExpenseRoute = '/expenses/add';
  static const String editExpenseRoute = '/expenses/edit';
  static const String expenseDetailsRoute = '/expenses/details';

  // Expense Categories routes
  static const String expenseCategoriesListRoute = '/expense-categories/list';
  static const String addExpenseCategoryRoute = '/expense-categories/add';
  static const String editExpenseCategoryRoute = '/expense-categories/edit';
  static const String expenseCategoryDetailsRoute =
      '/expense-categories/details';

  // Invoices routes
  static const String invoicesListRoute = '/invoices/list';
  static const String addInvoiceRoute = '/invoices/add';
  static const String invoiceCreationStepperRoute = '/invoices/create-stepper';
  static const String editInvoiceRoute = '/invoices/edit';
  static const String invoiceDetailsRoute = '/invoices/details';
  static const String enhancedInvoiceDetailsRoute =
      '/invoices/details/enhanced';
  static const String postedInvoicesRoute = '/invoices/posted';
  static const String returnedInvoicesRoute = '/invoices/returned';

  // Printing routes
  static const String printOptionsRoute = '/invoices/print/options';
  static const String thermalPrintRoute = '/invoices/print/thermal';
  static const String pdfPreviewRoute = '/invoices/print/pdf';
  static const String printerSettingsRoute = '/invoices/print/settings';

  // Settings routes
  static const String settingsRoute = '/settings';
  static const String changePasswordRoute = '/change-password';
  static const String deleteAccountRoute = '/delete-account';
  static const String subscriptionPackagesRoute = '/subscription-packages';

  static Map<String, WidgetBuilder> get routes => {
    authRoute: (context) => const AuthScreen(),
    forgetPassword: (context) => const ForgetPasswordScreen(),
    verifyOtp: (context) {
      final email = ModalRoute.of(context)?.settings.arguments as String?;
      if (email == null) {
        return const Scaffold(body: Center(child: Text('Email is required')));
      }
      return VerifyOtpScreen(email: email);
    },
    resetPassword: (context) {
      final verifyToken = ModalRoute.of(context)?.settings.arguments as String?;
      if (verifyToken == null) {
        return const Scaffold(
          body: Center(child: Text('Verify token is required')),
        );
      }
      return ResetPasswordScreen(verifyToken: verifyToken);
    },
    homeRoute: (context) => const HomeScreenWithDrawer(),
    onboardingRoute: (context) => const OnboardingScreen(),
    usersPermissionsRoute: (context) =>
        const UsersPermissionsScreenWithProvider(),
    usersListRoute: (context) => const UsersListScreenWithProvider(),
    addUserRoute: (context) => const AddUserScreenWithProvider(),
    managePermissionsRoute: (context) =>
        const ManagePermissionsScreenWithProvider(),
    clientsListRoute: (context) => const ClientsListScreenWithProvider(),
    addClientRoute: (context) => const AddClientScreenWithProvider(),
    productsListRoute: (context) => const ProductsListScreenWithProvider(),
    addProductRoute: (context) => const AddProductScreenWithProvider(),
    categoriesListRoute: (context) => const CategoriesListScreenWithProvider(),
    customersListRoute: (context) => const CustomersListScreenWithProvider(),
    addCustomerRoute: (context) => const AddCustomerScreenWithProvider(),
    expensesListRoute: (context) => const ExpensesListScreenWithProvider(),
    expenseCategoriesListRoute: (context) =>
        const ExpenseCategoriesListScreenWithProvider(),
    invoicesListRoute: (context) => const InvoicesListScreenWithProvider(),
    addInvoiceRoute: (context) => const AddInvoiceScreenWithProvider(),
    invoiceCreationStepperRoute: (context) =>
        const InvoiceCreationStepperScreen(),
    settingsRoute: (context) => const SettingsScreen(),
    changePasswordRoute: (context) => const ChangePasswordScreen(),
    deleteAccountRoute: (context) => const DeleteAccountScreen(),

    // expenses routes
    addExpenseRoute: (context) => const AddExpenseScreenWithProvider(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case editClientRoute:
        final client = settings.arguments as dynamic;
        return MaterialPageRoute(
          builder: (context) => EditClientScreenWithProvider(client: client),
        );
      case clientDetailsRoute:
        final client = settings.arguments as dynamic;
        return MaterialPageRoute(
          builder: (context) => ClientDetailsScreen(client: client),
        );

      // Products routes
      case editProductRoute:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => EditProductScreenWithProvider(product: product),
        );
      case productDetailsRoute:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product: product),
        );

      // Customers routes
      case addCustomerRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CustomersCubit>.value(
            value: getIt<CustomersCubit>(),
            child: const AddCustomerScreenWithProvider(),
          ),
        );
      case editCustomerRoute:
        final customer = settings.arguments as CustomerModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CustomersCubit>.value(
            value: getIt<CustomersCubit>(),
            child: EditCustomerScreenWithProvider(customer: customer),
          ),
        );
      case customerDetailsRoute:
        final customer = settings.arguments as CustomerModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CustomersCubit>.value(
            value: getIt<CustomersCubit>(),
            child: CustomerDetailsScreen(customer: customer),
          ),
        );

      // Users routes
      case userDetailsRoute:
        final user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (context) => UserDetailsScreen(user: user),
        );
      case editUserRoute:
        final user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (context) => EditUserScreenWithProvider(user: user),
        );

      // Invoices routes
      case editInvoiceRoute:
        final invoice = settings.arguments as InvoiceModel;
        return MaterialPageRoute(
          builder: (context) => EditInvoiceScreenWithProvider(invoice: invoice),
        );
      case invoiceDetailsRoute:
        final invoice = settings.arguments as InvoiceModel;
        return MaterialPageRoute(
          builder: (context) =>
              InvoiceDetailsScreenWithProvider(invoice: invoice),
        );
      case enhancedInvoiceDetailsRoute:
        final invoiceId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) =>
              EnhancedInvoiceDetailsScreenWithProvider(invoiceId: invoiceId),
        );

      // Printing routes
      case printOptionsRoute:
        final invoice = settings.arguments as InvoiceModel;
        return MaterialPageRoute(
          builder: (context) => PrintOptionsScreen(invoice: invoice),
        );
      case thermalPrintRoute:
        final invoice = settings.arguments as InvoiceModel;
        return MaterialPageRoute(
          builder: (context) => ThermalPrintScreen(invoice: invoice),
        );
      case pdfPreviewRoute:
        final invoice = settings.arguments as InvoiceModel;
        return MaterialPageRoute(
          builder: (context) => PDFPreviewScreen(invoice: invoice),
        );
      case printerSettingsRoute:
        return MaterialPageRoute(
          builder: (context) => const PrinterSettingsScreen(),
        );
      // expenses routes
      case expensesListRoute:
        return MaterialPageRoute(
          builder: (context) => const ExpensesListScreenWithProvider(),
        );
      case addExpenseRoute:
        return MaterialPageRoute(
          builder: (context) => const AddExpenseScreenWithProvider(),
        );
      case editExpenseRoute:
        final expense = settings.arguments as ExpenseModel;
        return MaterialPageRoute(
          builder: (context) => EditExpenseScreenWithProvider(expense: expense),
        );
      case expenseDetailsRoute:
        final expense = settings.arguments as ExpenseModel;
        return MaterialPageRoute(
          builder: (context) =>
              ExpenseDetailsScreenWithProvider(expense: expense),
        );

      // Subscription packages route
      case subscriptionPackagesRoute:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text('اختيار الباقة')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_membership,
                    size: 64,
                    color: Colors.orange[800],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'صفحة اختيار الباقات',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'سيتم تطوير هذه الصفحة قريباً',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        );

      default:
        return null;
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text(S.of(context).pageNotFound)),
        body: Center(child: Text(S.of(context).requestedPageNotFound)),
      ),
    );
  }
}
