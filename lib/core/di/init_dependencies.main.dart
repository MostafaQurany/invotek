part of 'init_dependencies_map.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Core Services
  _coreServices();

  // Network Layer
  _networkLayer();

  // Auth Layer
  _authLayer();

  // UI Layer
  _uiLayer();
}

_coreServices() {
  // Core services initialization
  // CacheManager is static, no need for DI registration
}

_networkLayer() {
  // Dio - Singleton for better performance
  getIt.registerSingletonAsync<CacheModule>(
    () => CacheModule.init(persistent: true),
  );

  getIt.registerLazySingleton<Dio>(() {
    // Wait for CacheModule to be ready
    final cacheModule = getIt<CacheModule>();
    return DioFactory.create(cacheModule);
  });

  // ApiClient - Singleton for better performance
  getIt.registerLazySingleton<ApiClient>(() {
    return ApiClient(getIt<Dio>());
  });
}

_authLayer() {
  // AuthDataSource - Singleton for better performance
  getIt.registerLazySingleton<AuthDataSource>(() {
    return AuthDataSource(getIt<ApiClient>());
  });

  // AuthRepo - Singleton for better performance
  getIt.registerLazySingleton<AuthRepo>(() {
    return AuthRepo(getIt<AuthDataSource>());
  });

  // AuthCubit - Factory for state management
  getIt.registerFactory<AuthCubit>(() {
    return AuthCubit(getIt<AuthRepo>());
  });
}

_uiLayer() {
  // UI layer services
  // LanguageBloc is created in UI, no need for DI registration
}
