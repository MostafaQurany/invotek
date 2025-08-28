import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/features/auth/demo/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/demo/repo/auth_repo.dart';
import 'package:invotek/features/auth/data/data_source/auth_data_source.dart';
import 'package:invotek/features/onboarding/demo/cubit/onboarding_cubit.dart';
import 'package:invotek/features/home/demo/cubit/menu_cubit.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/network/cache_module.dart';
import 'package:invotek/core/network/cache_policies.dart';
import 'package:invotek/core/server/api_factory.dart';

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

  // Register repositories
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt<AuthDataSource>()),
  );

  // Register cubits
  getIt.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());
  getIt.registerLazySingleton<MenuCubit>(() => MenuCubit());

  // Add more dependencies here as needed
}
