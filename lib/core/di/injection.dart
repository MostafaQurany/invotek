import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/network/cache_module.dart';
import 'package:invotek/core/network/cache_policies.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_factory.dart';
import 'package:invotek/core/theme/theme_provider.dart';
import 'package:invotek/features/auth/data/data_source/auth_data_source.dart';
import 'package:invotek/features/auth/demo/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/demo/repo/auth_repo.dart';
// Removed: old ClientsDataSource (now centralized in ApiClient)
import 'package:invotek/features/clients/data/repository/clients_repository.dart';
import 'package:invotek/features/clients/demo/cubit/clients_cubit.dart';
import 'package:invotek/features/onboarding/demo/cubit/onboarding_cubit.dart';
// Removed: old ProductsDataSource (now centralized in ApiClient)
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/expenses/data/repository/expenses_repository.dart';
import 'package:invotek/features/expenses/data/repository/expense_categories_repository.dart';
import 'package:invotek/features/expenses/demo/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/demo/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/users_and_permissions/data/data_source/users_permissions_data_source.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Register CacheModule (must be initialized first)
  getIt.registerSingletonAsync<CacheModule>(
    () => CacheModule.init(persistent: true),
  );

  // Wait for CacheModule to be ready
  await getIt.isReady<CacheModule>();

  // Register CachePolicies
  getIt.registerLazySingleton<CachePolicies>(
    () => CachePolicies(getIt<CacheModule>().options),
  );

  // Register Dio using DioFactory with cache
  getIt.registerLazySingleton<Dio>(
    () => DioFactory.create(getIt<CacheModule>()),
  );

  // Register API client
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));

  // Register data sources
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<UsersPermissionsDataSource>(
    () => UsersPermissionsDataSource(getIt<Dio>()),
  );

  // Register repositories
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt<AuthDataSource>()),
  );
  getIt.registerLazySingleton<UsersRepository>(
    () => UsersRepository(getIt<UsersPermissionsDataSource>()),
  );
  getIt.registerLazySingleton<ClientsRepository>(
    () => ClientsRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<CustomersRepository>(
    () => CustomersRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ExpensesRepository>(
    () => ExpensesRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ExpenseCategoriesRepository>(
    () => ExpenseCategoriesRepository(getIt<ApiClient>()),
  );

  // Register cubits (use factory so each screen gets a fresh instance)
  getIt.registerFactory<LocalizationCubit>(() => LocalizationCubit());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  // MenuCubit removed from DI to prevent closing issues - created locally in screens
  getIt.registerFactory<UsersCubit>(() => UsersCubit(getIt<UsersRepository>()));
  getIt.registerFactory<PermissionsCubit>(() => PermissionsCubit());
  getIt.registerFactory<ClientsCubit>(
    () => ClientsCubit(getIt<ClientsRepository>()),
  );
  getIt.registerLazySingleton<ProductsCubit>(
    () => ProductsCubit(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<CustomersCubit>(
    () => CustomersCubit(getIt<CustomersRepository>()),
  );
  getIt.registerLazySingleton<CategoriesCubit>(
    () => CategoriesCubit(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<ExpensesCubit>(
    () => ExpensesCubit(getIt<ExpensesRepository>()),
  );
  getIt.registerLazySingleton<ExpenseCategoriesCubit>(
    () => ExpenseCategoriesCubit(getIt<ExpenseCategoriesRepository>()),
  );

  // Register theme provider
  getIt.registerLazySingleton<ThemeProvider>(() => ThemeProvider());

  // Add more dependencies here as needed
}
