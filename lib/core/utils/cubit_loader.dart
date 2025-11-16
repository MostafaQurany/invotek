import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Helper class لتوحيد طريقة تحميل البيانات من Cubits
/// يمنع الاستدعاءات المكررة ويوفر checks للأمان
class CubitLoader {
  /// تحميل البيانات من Cubit مع فحص mounted
  /// 
  /// Example:
  /// ```dart
  /// CubitLoader.loadData(
  ///   context: context,
  ///   cubit: ProductsCubit.get(context),
  ///   loadFunction: (cubit) => cubit.loadFirstPage(refresh: true),
  /// );
  /// ```
  static void loadData<T extends StateStreamableSource<Object?>>({
    required BuildContext context,
    required T cubit,
    required void Function(T) loadFunction,
  }) {
    if (!context.mounted) return;
    if (cubit.isClosed) return;
    
    try {
      loadFunction(cubit);
    } catch (e) {
      // Silently handle errors to prevent crashes
      debugPrint('Error loading data from cubit: $e');
    }
  }

  /// تحميل البيانات من Cubit مع فحص حالة التحميل
  /// 
  /// Example:
  /// ```dart
  /// CubitLoader.loadDataIfNotLoading(
  ///   context: context,
  ///   cubit: ProductsCubit.get(context),
  ///   isLoading: cubit.isLoadingPage,
  ///   loadFunction: (cubit) => cubit.loadFirstPage(refresh: true),
  /// );
  /// ```
  static void loadDataIfNotLoading<T extends StateStreamableSource<Object?>>({
    required BuildContext context,
    required T cubit,
    required bool isLoading,
    required void Function(T) loadFunction,
  }) {
    if (!context.mounted) return;
    if (cubit.isClosed) return;
    if (isLoading) return;
    
    try {
      loadFunction(cubit);
    } catch (e) {
      debugPrint('Error loading data from cubit: $e');
    }
  }

  /// تحميل البيانات من عدة Cubits بشكل متزامن
  /// 
  /// Example:
  /// ```dart
  /// CubitLoader.loadMultipleData(
  ///   context: context,
  ///   loaders: [
  ///     () => ProductsCubit.get(context).loadFirstPage(refresh: true),
  ///     () => CategoriesCubit.get(context).loadFirstPage(refresh: true),
  ///   ],
  /// );
  /// ```
  static void loadMultipleData({
    required BuildContext context,
    required List<void Function()> loaders,
  }) {
    if (!context.mounted) return;
    
    for (final loader in loaders) {
      try {
        loader();
      } catch (e) {
        debugPrint('Error in multiple data loader: $e');
      }
    }
  }

  /// تحميل البيانات بشكل آمن مع retry mechanism
  /// 
  /// Example:
  /// ```dart
  /// await CubitLoader.loadDataWithRetry(
  ///   context: context,
  ///   cubit: ProductsCubit.get(context),
  ///   loadFunction: (cubit) => cubit.loadFirstPage(refresh: true),
  ///   maxRetries: 3,
  /// );
  /// ```
  static Future<void> loadDataWithRetry<T extends StateStreamableSource<Object?>>({
    required BuildContext context,
    required T cubit,
    required Future<void> Function(T) loadFunction,
    int maxRetries = 3,
  }) async {
    if (!context.mounted) return;
    if (cubit.isClosed) return;
    
    int retries = 0;
    while (retries < maxRetries) {
      try {
        await loadFunction(cubit);
        return;
      } catch (e) {
        retries++;
        if (retries >= maxRetries) {
          debugPrint('Failed to load data after $maxRetries retries: $e');
          return;
        }
        await Future.delayed(Duration(milliseconds: 500 * retries));
      }
    }
  }
}

