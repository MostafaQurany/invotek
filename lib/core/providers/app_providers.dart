import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/auth/demo/cubit/auth_cubit.dart';
import 'package:invotek/features/clients/demo/cubit/clients_cubit.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/expenses/demo/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/demo/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_cubit.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/features/onboarding/demo/cubit/onboarding_cubit.dart';

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

    // Users and permissions
    BlocProvider<UsersCubit>(create: (context) => getIt<UsersCubit>()),
    BlocProvider<PermissionsCubit>(
      create: (context) => getIt<PermissionsCubit>(),
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
  ];

  /// Initialize data for cubits that need initial loading
  static void initializeData(BuildContext context) {
    // Load initial data for cubits that need it
    context.read<ProductsCubit>().loadFirstPage();
    context.read<CategoriesCubit>().loadFirstPage();
    context.read<CustomersCubit>().loadFirstPage();
    context.read<ExpensesCubit>().loadFirstPage();
    context.read<ExpenseCategoriesCubit>().loadFirstPage();
  }
}
