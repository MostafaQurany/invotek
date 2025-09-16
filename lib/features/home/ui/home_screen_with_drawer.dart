import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/providers/app_providers.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/features/auth/demo/cubit/auth_cubit.dart';
import 'package:invotek/features/clients/ui/screens/add_client_screen.dart';
import 'package:invotek/features/clients/ui/screens/clients_list_screen.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/screens/add_customer_screen.dart';
import 'package:invotek/features/customers/ui/screens/customers_list_screen.dart';
import 'package:invotek/features/customers/ui/screens/edit_customer_screen.dart';
import 'package:invotek/features/customers/ui/screens/customer_details_screen.dart';
import 'package:invotek/features/expenses/demo/entit/expense_model.dart';
import 'package:invotek/features/home/data/models/navigation_state.dart';
import 'package:invotek/features/home/ui/home_screen.dart';
import 'package:invotek/features/home/ui/widgets/menu_screen.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/screens/add_product_screen.dart';
import 'package:invotek/features/products/ui/screens/categories_list_screen.dart';
import 'package:invotek/features/products/ui/screens/edit_product_screen.dart';
import 'package:invotek/features/products/ui/screens/product_details_screen.dart';
import 'package:invotek/features/products/ui/screens/products_list_screen.dart';
import 'package:invotek/features/settings/ui/screens/settings_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/add_user_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/manage_permissions_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_list_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_permissions_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expenses_list_screen_with_provider.dart';
import 'package:invotek/features/expenses/ui/screens/expense_categories_list_screen_with_provider.dart';
import 'package:invotek/features/expenses/ui/screens/expense_details_screen.dart';
import 'package:invotek/features/expenses/ui/screens/edit_expense_screen.dart';
import 'package:invotek/features/expenses/ui/screens/edit_expense_category_screen.dart';
import 'package:invotek/features/expenses/ui/screens/delete_all_categories_screen.dart';
import 'package:invotek/features/expenses/demo/entit/expense_category_model.dart';

class HomeScreenWithDrawer extends StatelessWidget {
  const HomeScreenWithDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Initialize data for cubits that need initial loading
    AppProviders.initializeData(context);

    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        return ZoomDrawer(
          controller: ZoomDrawerController(),
          menuScreen: const MenuScreen(),
          mainScreen: const HomeScreenWithAppBar(),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0,
          slideWidth: MediaQuery.of(context).size.width * 0.85,
          menuBackgroundColor: colorScheme.primary,
          duration: const Duration(milliseconds: 275),
          mainScreenScale: 0.3,
          mainScreenTapClose: true,
          isRtl: state.locale.languageCode == 'ar' ? true : false,
        );
      },
    );
  }
}

class HomeScreenWithAppBar extends StatefulWidget {
  const HomeScreenWithAppBar({super.key});

  @override
  State<HomeScreenWithAppBar> createState() => _HomeScreenWithAppBarState();
}

class _HomeScreenWithAppBarState extends State<HomeScreenWithAppBar> {
  final NavigationController _navigationController = NavigationController();
  NavigationState _currentState = NavigationState();

  @override
  void initState() {
    super.initState();
    _navigationController.addListener(_onNavigationChanged);
  }

  @override
  void dispose() {
    _navigationController.removeListener(_onNavigationChanged);
    super.dispose();
  }

  void _onNavigationChanged(NavigationState state) {
    setState(() {
      _currentState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            successLogout: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.authRoute,
                (route) => false,
              );
            },
          );
        },
        child: _buildScreenForRoute(
          _currentState.currentRoute,
          _currentState.routeArguments,
        ),
      ),
    );
  }

  Widget _buildScreenForRoute(String route, dynamic arguments) {
    switch (route) {
      case AppRoutes.usersPermissionsRoute:
        return const UsersPermissionsScreenWithProvider();
      case AppRoutes.usersListRoute:
        return const UsersListScreenWithProvider();
      case AppRoutes.addUserRoute:
        return const AddUserScreenWithProvider();
      case AppRoutes.managePermissionsRoute:
        return const ManagePermissionsScreenWithProvider();
      case '/clients/list':
        return const ClientsListScreenWithProvider();
      case '/clients/add':
        return const AddClientScreenWithProvider();
      case '/customers':
        return const CustomersListScreenWithProvider();
      case '/customers/list':
        return const CustomersListScreenWithProvider();
      case '/customers/add':
        return const AddCustomerScreenWithProvider();
      case '/customers/edit':
        if (arguments is CustomerModel) {
          return EditCustomerScreenWithProvider(customer: arguments);
        }
        return const HomeScreen();
      case '/customers/details':
        if (arguments is CustomerModel) {
          return CustomerDetailsScreen(customer: arguments);
        }
        return const HomeScreen();
      case '/products':
        return const ProductsListScreenWithProvider();
      case '/products/list':
        return const ProductsListScreenWithProvider();
      case '/products/categories':
        return const CategoriesListScreenWithProvider();
      case '/products/add':
        return const AddProductScreenWithProvider();
      case '/products/edit':
        if (arguments is ProductModel) {
          return EditProductScreenWithProvider(product: arguments);
        }
        return const HomeScreen();
      case '/products/details':
        if (arguments is ProductModel) {
          return ProductDetailsScreen(product: arguments);
        }
        return const HomeScreen();
      case '/expenses':
        return const ExpensesListScreenWithProvider();
      case '/expenses/list':
        return const ExpensesListScreenWithProvider();
      case '/expenses/categories':
        return const ExpenseCategoriesListScreenWithProvider();
      case '/expense-details':
        if (arguments is ExpenseModel) {
          return ExpenseDetailsScreenWithProvider(expense: arguments);
        }
        return const HomeScreen();
      case '/edit-expense':
        if (arguments is ExpenseModel) {
          return EditExpenseScreenWithProvider(expense: arguments);
        }
        return const HomeScreen();
      case '/expense-categories/edit':
        if (arguments is ExpenseCategoryModel) {
          return EditExpenseCategoryScreenWithProvider(category: arguments);
        }
        return const HomeScreen();
      case '/expense-categories/delete-all':
        return const DeleteAllCategoriesScreenWithProvider();
      case AppRoutes.settingsRoute:
        return const SettingsScreen();
      case '/home':
      default:
        return const HomeScreen();
    }
  }
}
