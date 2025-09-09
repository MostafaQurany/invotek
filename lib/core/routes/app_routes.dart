import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/auth/ui/auth_screen.dart';
import 'package:invotek/features/clients/ui/screens/add_client_screen.dart';
import 'package:invotek/features/clients/ui/screens/client_details_screen.dart';
import 'package:invotek/features/clients/ui/screens/clients_list_screen.dart';
import 'package:invotek/features/clients/ui/screens/edit_client_screen.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/screens/add_customer_screen.dart';
import 'package:invotek/features/customers/ui/screens/customer_details_screen.dart';
import 'package:invotek/features/customers/ui/screens/customers_list_screen.dart';
import 'package:invotek/features/customers/ui/screens/edit_customer_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expenses_list_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expense_categories_list_screen.dart';
import 'package:invotek/features/home/ui/home_screen_with_drawer.dart';
import 'package:invotek/features/onboarding/ui/onboarding_screen.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/screens/add_product_screen.dart';
import 'package:invotek/features/products/ui/screens/edit_product_screen.dart';
import 'package:invotek/features/products/ui/screens/product_details_screen.dart';
import 'package:invotek/features/products/ui/screens/products_list_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/add_user_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/manage_permissions_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_permissions_screen.dart';
import 'package:invotek/features/products/ui/screens/categories_list_screen.dart';

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

  // Users & Permissions routes
  static const String usersPermissionsRoute = '/users-permissions';
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

  static Map<String, WidgetBuilder> get routes => {
    authRoute: (context) => const AuthScreen(),
    homeRoute: (context) => const HomeScreenWithDrawer(),
    onboardingRoute: (context) => const OnboardingScreen(),
    usersListRoute: (context) => const UsersPermissionsScreenWithProvider(),
    addUserRoute: (context) => const AddUserScreenWithProvider(),
    managePermissionsRoute: (context) =>
        const ManagePermissionsScreenWithProvider(),
    clientsListRoute: (context) => const ClientsListScreenWithProvider(),
    addClientRoute: (context) => const AddClientScreenWithProvider(),
    productsListRoute: (context) => const ProductsListScreenWithProvider(),
    addProductRoute: (context) {
      return const AddProductScreenWithProvider();
    },
    usersPermissionsRoute: (context) =>
        const UsersPermissionsScreenWithProvider(),
    categoriesListRoute: (context) => const CategoriesListScreenWithProvider(),
    // Customers routes
    customersListRoute: (context) => const CustomersListScreenWithProvider(),
    // Expenses routes
    expensesListRoute: (context) => const ExpensesListScreenWithProvider(),
    // Expense Categories routes
    expenseCategoriesListRoute: (context) =>
        const ExpenseCategoriesListScreenWithProvider(),
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

      // Expenses routes - TODO: Add screens when created
      // case addExpenseRoute:
      // case editExpenseRoute:
      // case expenseDetailsRoute:

      // Expense Categories routes - TODO: Add screens when created
      // case addExpenseCategoryRoute:
      // case editExpenseCategoryRoute:
      // case expenseCategoryDetailsRoute:

      default:
        return null;
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('صفحة غير موجودة')),
        body: const Center(child: Text('الصفحة المطلوبة غير موجودة')),
      ),
    );
  }
}
