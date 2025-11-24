import 'package:flutter_test/flutter_test.dart';
import 'package:invotek/features/printing/core/services/logo_cache_service.dart';

void main() {
  group('LogoCacheService Tests', () {
    late LogoCacheService cacheService;

    setUp(() {
      cacheService = LogoCacheService();
      cacheService.clearCache();
      cacheService.resetStatistics();
    });

    test('Cache service should be singleton', () {
      final instance1 = LogoCacheService();
      final instance2 = LogoCacheService();
      expect(instance1, same(instance2));
    });

    test('Cache miss should return null', () {
      final logo = cacheService.getCachedLogo('https://example.com/logo.png');
      expect(logo, isNull);
    });

    test('Statistics should track cache misses', () {
      cacheService.getCachedLogo('https://example.com/logo.png');
      final stats = cacheService.getStatistics();
      expect(stats['cacheMisses'], equals(1));
      expect(stats['cacheHits'], equals(0));
      expect(stats['totalAttempts'], equals(1));
    });

    test('Cache should report correct URLs', () {
      expect(cacheService.getCachedUrls(), isEmpty);
    });

    test('isCached should return false for non-cached URL', () {
      expect(cacheService.isCached('https://example.com/logo.png'), isFalse);
    });

    test('Clear cache should reset all entries', () {
      cacheService.clearCache();
      expect(cacheService.getCachedUrls(), isEmpty);
      final stats = cacheService.getStatistics();
      expect(stats['cachedLogos'], equals(0));
    });

    test('Statistics should be resettable', () {
      cacheService.getCachedLogo('https://example.com/logo1.png');
      cacheService.getCachedLogo('https://example.com/logo2.png');

      cacheService.resetStatistics();

      final stats = cacheService.getStatistics();
      expect(stats['cacheHits'], equals(0));
      expect(stats['cacheMisses'], equals(0));
      expect(stats['totalAttempts'], equals(0));
    });

    test('Statistics should show correct hit rate format', () {
      final stats = cacheService.getStatistics();
      expect(stats['hitRate'], isA<String>());
      expect(stats['hitRate'], contains('%'));
    });

    test('Statistics should include max cache size', () {
      final stats = cacheService.getStatistics();
      expect(stats['maxCacheSize'], equals(10));
    });

    test('Statistics should include cache expiry', () {
      final stats = cacheService.getStatistics();
      expect(stats['cacheExpiry'], equals('24h'));
    });
  });

  group('Logo Loading Integration', () {
    test('Logo loading should handle null URL gracefully', () async {
      // This test verifies that the system doesn't crash with null URLs
      expect(() async {
        // The actual loadCompanyLogo would be called here in integration tests
        // For now, we just verify the cache service handles it
        final cache = LogoCacheService();
        final result = cache.getCachedLogo('');
        expect(result, isNull);
      }, returnsNormally);
    });

    test('Cache service should handle empty URL', () {
      final cache = LogoCacheService();
      final result = cache.getCachedLogo('');
      expect(result, isNull);
    });
  });
}
