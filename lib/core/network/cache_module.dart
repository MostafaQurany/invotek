import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

class CacheModule {
  late final CacheStore store;
  late final CacheOptions options;

  /// Call once on app start.
  static Future<CacheModule> init({bool persistent = true}) async {
    final module = CacheModule();

    // Persistent file store (recommended for production)
    if (persistent) {
      final dir = await getTemporaryDirectory();
      module.store = HiveCacheStore(dir.path);
    } else {
      module.store = MemCacheStore(
        maxSize: 10 * 1024 * 1024, // 10MB
        maxEntrySize: 1024 * 1024, // 1MB per entry
      );
    }

    module.options = CacheOptions(
      store: module.store,
      policy: CachePolicy.request, // default behavior
      hitCacheOnErrorExcept: [401, 403], // offline fallback
      priority: CachePriority.normal,
      maxStale: const Duration(days: 7), // serve slightly stale data
      allowPostMethod: false,
    );

    return module;
  }

  Future<void> clear() => store.clean();
}
