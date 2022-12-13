enum CacheErrorType {
  cacheFail,
  getCacheFail,
  removeCacheFail,
}

class CacheError {
  final String message;
  final CacheErrorType type;

  CacheError({required this.message, required this.type});
}
