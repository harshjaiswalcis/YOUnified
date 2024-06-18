class CacheService {
  final int cacheLimit;
  final Map<String, dynamic> _cache = {};

  CacheService({this.cacheLimit = 100});

  void add(String key, dynamic value) {
    if (_cache.length == cacheLimit) {
      _cache.remove(_cache.keys.first);
    }
    _cache[key] = value;
  }

  Object? get(String key) => contains(key) ? _cache[key] : null;

  bool contains(String key) => _cache.containsKey(key);

  void clear() => _cache.clear();
}