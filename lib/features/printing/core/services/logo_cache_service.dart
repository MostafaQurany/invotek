import 'dart:ui' as ui;

/// Service for caching loaded company logos to improve performance
/// and reduce network requests
class LogoCacheService {
  // Private constructor for singleton pattern
  LogoCacheService._();
  static final LogoCacheService _instance = LogoCacheService._();
  factory LogoCacheService() => _instance;

  // Cache storage
  final Map<String, ui.Image> _cache = {};
  final Map<String, DateTime> _cacheTimestamps = {};

  // Cache configuration
  static const Duration _cacheExpiry = Duration(hours: 24);
  static const int _maxCacheSize = 10; // Maximum number of cached logos

  // Statistics
  int _cacheHits = 0;
  int _cacheMisses = 0;
  int _totalAttempts = 0;

  /// Get a cached logo or return null if not cached or expired
  ui.Image? getCachedLogo(String logoUrl) {
    _totalAttempts++;

    if (!_cache.containsKey(logoUrl)) {
      _cacheMisses++;
      print('LogoCache: Cache miss for $logoUrl');
      return null;
    }

    final timestamp = _cacheTimestamps[logoUrl];
    if (timestamp == null) {
      _cacheMisses++;
      return null;
    }

    // Check if cache entry has expired
    final age = DateTime.now().difference(timestamp);
    if (age > _cacheExpiry) {
      print('LogoCache: Cache expired for $logoUrl (age: ${age.inHours}h)');
      _cache.remove(logoUrl);
      _cacheTimestamps.remove(logoUrl);
      _cacheMisses++;
      return null;
    }

    _cacheHits++;
    print('LogoCache: Cache hit for $logoUrl (age: ${age.inMinutes}m)');
    return _cache[logoUrl];
  }

  /// Cache a logo image
  void cacheLogo(String logoUrl, ui.Image image) {
    // Enforce cache size limit
    if (_cache.length >= _maxCacheSize) {
      _evictOldestEntry();
    }

    _cache[logoUrl] = image;
    _cacheTimestamps[logoUrl] = DateTime.now();
    print(
      'LogoCache: Cached logo for $logoUrl (total cached: ${_cache.length})',
    );
  }

  /// Remove a specific logo from cache
  void invalidateLogo(String logoUrl) {
    final removed = _cache.remove(logoUrl) != null;
    _cacheTimestamps.remove(logoUrl);
    if (removed) {
      print('LogoCache: Invalidated cache for $logoUrl');
    }
  }

  /// Clear all cached logos
  void clearCache() {
    final count = _cache.length;
    _cache.clear();
    _cacheTimestamps.clear();
    print('LogoCache: Cleared all cache ($count entries removed)');
  }

  /// Evict the oldest cache entry to make room for new ones
  void _evictOldestEntry() {
    if (_cacheTimestamps.isEmpty) return;

    // Find the oldest entry
    String? oldestKey;
    DateTime? oldestTime;

    _cacheTimestamps.forEach((key, timestamp) {
      if (oldestTime == null || timestamp.isBefore(oldestTime!)) {
        oldestKey = key;
        oldestTime = timestamp;
      }
    });

    if (oldestKey != null) {
      print('LogoCache: Evicting oldest entry: $oldestKey');
      _cache.remove(oldestKey);
      _cacheTimestamps.remove(oldestKey);
    }
  }

  /// Get cache statistics
  Map<String, dynamic> getStatistics() {
    final hitRate = _totalAttempts > 0
        ? (_cacheHits / _totalAttempts * 100).toStringAsFixed(1)
        : '0.0';

    return {
      'totalAttempts': _totalAttempts,
      'cacheHits': _cacheHits,
      'cacheMisses': _cacheMisses,
      'hitRate': '$hitRate%',
      'cachedLogos': _cache.length,
      'maxCacheSize': _maxCacheSize,
      'cacheExpiry': '${_cacheExpiry.inHours}h',
    };
  }

  /// Reset statistics (useful for testing)
  void resetStatistics() {
    _cacheHits = 0;
    _cacheMisses = 0;
    _totalAttempts = 0;
    print('LogoCache: Statistics reset');
  }

  /// Get all cached logo URLs
  List<String> getCachedUrls() {
    return _cache.keys.toList();
  }

  /// Check if a specific URL is cached and valid
  bool isCached(String logoUrl) {
    if (!_cache.containsKey(logoUrl)) return false;

    final timestamp = _cacheTimestamps[logoUrl];
    if (timestamp == null) return false;

    final age = DateTime.now().difference(timestamp);
    return age <= _cacheExpiry;
  }
}
