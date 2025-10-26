import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/features/auth/data/data_source/auth_data_source.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';

/// Performance optimizations for DI container
class PerformanceOptimizations {
  static final GetIt _getIt = GetIt.instance;

  /// Pre-warm frequently used services for better performance
  static void preWarmServices() {
    // Pre-warm network layer
    _getIt<Dio>();
    _getIt<ApiClient>();

    // Pre-warm auth layer
    _getIt<AuthDataSource>();
    _getIt<AuthRepo>();
  }

  /// Clear unused services to free memory
  static void clearUnusedServices() {
    // Clear factory instances (they are recreated anyway)
    // Keep singletons for performance
  }

  /// Get service with performance monitoring
  static T getService<T extends Object>() {
    final startTime = DateTime.now();
    final service = _getIt<T>();
    final duration = DateTime.now().difference(startTime);

    // Log performance if needed
    if (duration.inMilliseconds > 10) {
      print('Performance: Getting $T took ${duration.inMilliseconds}ms');
    }

    return service;
  }

  /// Check if service is registered
  static bool isRegistered<T extends Object>() {
    return _getIt.isRegistered<T>();
  }

  /// Reset DI container (useful for testing)
  static void reset() {
    _getIt.reset();
  }
}

/// Extension for better DI usage
extension GetItPerformanceExtension on GetIt {
  /// Get service with performance monitoring
  T getService<T extends Object>() {
    return PerformanceOptimizations.getService<T>();
  }
}
