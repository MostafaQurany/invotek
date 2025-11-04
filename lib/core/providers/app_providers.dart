import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart'
    as CorePermissionsCubit;
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/clients/demo/cubit/clients_cubit.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/cubit/expenses_cubit.dart';
import 'package:invotek/features/home/cubit/dashboard_cubit.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/home/data/repository/dashboard_repository.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/onboarding/demo/cubit/onboarding_cubit.dart';
import 'package:invotek/features/products/domain/cubit/categories_cubit.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/settings/cubit/settings_cubit.dart';
import 'package:invotek/features/settings/data/data_source/settings_data_source.dart';
import 'package:invotek/features/settings/data/repository/settings_repository.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';

/// Centralized provider for all cubits in the app
class AppProviders {
  static List<BlocProvider> get providers => [
    // Core cubits
    BlocProvider<LocalizationCubit>(
      create: (context) => getIt<LocalizationCubit>()..initializeLanguage(),
    ),
    BlocProvider<OnboardingCubit>(
      create: (context) => getIt<OnboardingCubit>(),
    ),
    BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
    BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),

    // Users and permissions
    BlocProvider<UsersCubit>(create: (context) => getIt<UsersCubit>()),
    BlocProvider<PermissionsCubit>(
      create: (context) => getIt<PermissionsCubit>(),
    ),
    // Core permissions cubit
    BlocProvider<CorePermissionsCubit.PermissionsCubit>(
      create: (context) => getIt<CorePermissionsCubit.PermissionsCubit>(),
    ),

    // Clients
    BlocProvider<ClientsCubit>(create: (context) => getIt<ClientsCubit>()),

    // Products and categories
    BlocProvider<ProductsCubit>(create: (context) => getIt<ProductsCubit>()),
    BlocProvider<CategoriesCubit>(
      create: (context) => getIt<CategoriesCubit>(),
    ),

    // Customers
    BlocProvider<CustomersCubit>(create: (context) => getIt<CustomersCubit>()),

    // Expenses and expense categories
    BlocProvider<ExpensesCubit>(create: (context) => getIt<ExpensesCubit>()),
    BlocProvider<ExpenseCategoriesCubit>(
      create: (context) => getIt<ExpenseCategoriesCubit>(),
    ),

    // Invoices
    BlocProvider<InvoicesCubit>(create: (context) => getIt<InvoicesCubit>()),

    // Dashboard
    BlocProvider<DashboardCubit>(
      create: (context) =>
          DashboardCubit(DashboardRepository(ApiClient(getIt()))),
    ),

    // Settings
    BlocProvider<SettingsCubit>(
      create: (context) => SettingsCubit(
        repository: SettingsRepository(SettingsDataSource(ApiClient(getIt()))),
      ),
    ),
  ];

  /// Initialize data for cubits that need initial loading
  static void initializeData(BuildContext context) {
    // Load initial data for cubits that need it
    context.read<ProductsCubit>().loadFirstPage();
    context.read<CategoriesCubit>().loadFirstPage();
    context.read<CustomersCubit>().loadFirstPage();
    context.read<ExpensesCubit>().loadFirstPage();
    context.read<ExpenseCategoriesCubit>().loadFirstPage();
    context.read<InvoicesCubit>().loadFirstPage();
    context.read<DashboardCubit>().loadDashboard();

    // Load cached permissions
    context
        .read<CorePermissionsCubit.PermissionsCubit>()
        .loadCachedPermissions();
  }
}
