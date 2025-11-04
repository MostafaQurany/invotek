import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/clients/ui/screens/clients_list_screen.dart';
import 'package:invotek/features/customers/ui/screens/customers_list_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expense_categories_list_screen_with_provider.dart';
import 'package:invotek/features/expenses/ui/screens/expenses_list_screen_with_provider.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/home/data/models/navigation_state.dart';
import 'package:invotek/features/home/ui/home_screen.dart';
import 'package:invotek/features/home/ui/widgets/keep_alive_screen_wrapper.dart';
import 'package:invotek/features/home/ui/widgets/menu_screen.dart';
import 'package:invotek/features/invoices/ui/screens/invoices_list_screen.dart';
import 'package:invotek/features/products/ui/screens/categories_list_screen.dart';
import 'package:invotek/features/products/ui/screens/products_list_screen.dart';
import 'package:invotek/features/settings/ui/screens/settings_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/manage_permissions_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_list_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_permissions_screen.dart';

class HomeScreenWithDrawer extends StatelessWidget {
  const HomeScreenWithDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
      // case AppRoutes.clientsListRoute:
      //   return KeepAliveScreenWrapper(
      //     route: route,
      //     child: const ClientsListScreenWithProvider(),
      //   );
      case AppRoutes.customersListRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const CustomersListScreenWithProvider(),
        );
      case AppRoutes.productsListRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const ProductsListScreenWithProvider(),
        );
      case AppRoutes.categoriesListRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const CategoriesListScreenWithProvider(),
        );
      case AppRoutes.expensesListRoute:
        return KeepAliveScreenWrapper(
          route: route,
          child: const ExpensesListScreenWithProvider(),
        );
      case AppRoutes.expenseCategoriesListRoute:
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
      case AppRoutes.homeRoute:
      default:
        return KeepAliveScreenWrapper(route: route, child: const HomeScreen());
    }
  }
}
