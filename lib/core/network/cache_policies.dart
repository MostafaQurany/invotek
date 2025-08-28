import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class CachePolicies {
  CachePolicies(this.base);
  final CacheOptions base;

  /// Request, fallback to cache on network error. Good for lists.
  Options request() => base.copyWith(policy: CachePolicy.request).toOptions();

  /// Force refresh from network, then update cache.
  Options refresh() => base.copyWith(policy: CachePolicy.refresh).toOptions();

  /// Return from cache only (no network). Useful for offline-only screens.
  Options forceCache() =>
      base.copyWith(policy: CachePolicy.forceCache).toOptions();

  /// Bypass cache completely.
  Options noCache() => base.copyWith(policy: CachePolicy.noCache).toOptions();
}
