class AppException implements Exception {
  final String message;

  AppException(this.message);
}

class CacheException implements Exception {}
