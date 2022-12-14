import 'package:core_data_source/common/logger.dart';

class AppError {
  final String message;
  final Enum type;
  final StackTrace stackTrace;
  final Object error;

  AppError({
    required this.error,
    required this.message,
    required this.type,
    required this.stackTrace,
  }) {
    logger.i("type: $type\n$message");
  }
}
