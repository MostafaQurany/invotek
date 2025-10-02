import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/providers/app_providers.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/demo/cubit/auth_cubit.dart';
import 'package:invotek/features/clients/ui/screens/clients_list_screen.dart';
import 'package:invotek/features/customers/ui/screens/customers_list_screen.dart';
import 'package:invotek/features/home/data/models/navigation_state.dart';
import 'package:invotek/features/home/ui/home_screen.dart';
import 'package:invotek/features/home/ui/widgets/menu_screen.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/home/ui/widgets/keep_alive_screen_wrapper.dart';
import 'package:invotek/features/invoices/ui/screens/invoices_list_screen.dart';
import 'package:invotek/features/products/ui/screens/categories_list_screen.dart';
import 'package:invotek/features/products/ui/screens/products_list_screen.dart';
import 'package:invotek/features/settings/ui/screens/settings_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/manage_permissions_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_list_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_permissions_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expenses_list_screen_with_provider.dart';
import 'package:invotek/features/expenses/ui/screens/expense_categories_list_screen_with_provider.dart';

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
  State<HomeScreenWithAppBar> createState() => HomeScreenWithAppBarState();
}

class HomeScreenWithAppBarState extends State<HomeScreenWithAppBar> {
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
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return Column(
              children: [
                // // Unified AppBar
                // _buildUnifiedAppBar(context, state),
                // Screen Content
                Expanded(
                  child: _buildScreenForRoute(
                    state.currentRoute,
                    state.routeArguments,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildUnifiedAppBar(BuildContext context, NavigationState state) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Menu Button
          IconButton(
            onPressed: () {
              ZoomDrawer.of(context)?.toggle();
            },
            icon: const Icon(Icons.menu, color: AppColors.white, size: 24),
          ),
          // Title
          Expanded(
            child: Text(
              _getScreenTitle(state.currentRoute),
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Spacer for symmetry
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  String _getScreenTitle(String route) {
    switch (route) {
      case '/home':
        return 'الرئيسية';
      case AppRoutes.usersPermissionsRoute:
        return 'إدارة المستخدمين والصلاحيات';
      case AppRoutes.usersListRoute:
        return 'قائمة المستخدمين';
      case AppRoutes.managePermissionsRoute:
        return 'إدارة الصلاحيات';
      case '/customers':
      case '/customers/list':
        return 'إدارة العملاء';
      case '/products/list':
        return 'قائمة المنتجات';
      case '/products/categories':
        return 'فئات المنتجات';
      case '/expenses':
      case '/expenses/list':
        return 'قائمة المصروفات';
      case '/expenses/categories':
        return 'فئات المصروفات';
      case AppRoutes.invoicesListRoute:
        return 'قائمة الفواتير';
      case AppRoutes.settingsRoute:
        return 'الإعدادات';
      default:
        return 'Invotek';
    }
  }

  Widget _buildScreenForRoute(String route, dynamic arguments) {
    switch (route) {
      case AppRoutes.usersPermissionsRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const UsersPermissionsScreenWithProvider(),
        );
      case AppRoutes.usersListRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const UsersListScreenWithProvider(),
        );
      case AppRoutes.managePermissionsRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const ManagePermissionsScreenWithProvider(),
        );
      case '/clients/list':
        return KeepAliveScreenWrapper(
          route: route,
          child: const ClientsListScreenWithProvider(),
        );
      case '/customers':
      case '/customers/list':
        return KeepAliveScreenWrapper(
          route: route,
          child: const CustomersListScreenWithProvider(),
        );
      case '/products/list':
        return KeepAliveScreenWrapper(
          route: route,
          child: const ProductsListScreenWithProvider(),
        );
      case '/products/categories':
        return KeepAliveScreenWrapper(
          route: route,
          child: const CategoriesListScreenWithProvider(),
        );
      case '/expenses':
      case '/expenses/list':
        return KeepAliveScreenWrapper(
          route: route,
          child: const ExpensesListScreenWithProvider(),
        );
      case '/expenses/categories':
        return KeepAliveScreenWrapper(
          route: route,
          child: const ExpenseCategoriesListScreenWithProvider(),
        );
      case AppRoutes.settingsRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const SettingsScreen(),
        );
      case AppRoutes.invoicesListRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const InvoicesListScreenWithProvider(),
        );
      case '/home':
      default:
        return KeepAliveScreenWrapper(route: route, child: const HomeScreen());
    }
  }
}
