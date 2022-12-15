import 'error.dart';

enum CacheErrorType {
  cacheFail,
  getCacheFail,
  removeCacheFail,
}

class CacheError extends AppError {
  CacheError({
    required super.error,
    required super.message,
    required super.type,
    required super.stackTrace,
  });
}
