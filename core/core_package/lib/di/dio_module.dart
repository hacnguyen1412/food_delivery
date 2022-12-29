import 'package:core_dependency/core_dependency.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../common/logger.dart';

@module
abstract class DIOModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 6000,
        receiveTimeout: 6000,
        contentType: 'application/json',
        receiveDataWhenStatusError: true,
      ),
    )..interceptors.add(PrettyDioLogger());
    final retryInterceptor = RetryInterceptor(
      dio: dio,
      retries: 3,
      logPrint: (message) {
        logger.i(message);
      },
      retryDelays: const [Duration.zero],
    );
    dio.interceptors.add(retryInterceptor);
    return dio;
  }
}
