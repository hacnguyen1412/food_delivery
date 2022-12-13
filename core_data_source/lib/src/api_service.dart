import 'dart:async';
import 'package:core_data_source/common/error.dart';
import 'package:dio/dio.dart';

abstract class ApiService {
  final Dio dio;
  String get baseUrl => "";

  ApiService(this.dio);

  Future<Response<T>> getData<T>({
    required String endPoint,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    try {
      Response<T> response = await dio.get<T>(
        baseUrl + endPoint,
        queryParameters: query,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      throw AppError(e);
    }
  }

  Future<Response<T>> postData<T>({
    required String endPoint,
    dynamic body,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response<T> response = await dio.post<T>(
        baseUrl + endPoint,
        queryParameters: query,
        data: body,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      throw AppError(e);
    }
  }

  Future<Response<T>> putData<T>({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    try {
      Response<T> response = await dio.put<T>(
        baseUrl + endPoint,
        queryParameters: query,
        data: body,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      throw AppError(e);
    }
  }

  Future<Response<T>> patchData<T>({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    try {
      Response<T> response = await dio.patch<T>(
        baseUrl + endPoint,
        queryParameters: query,
        data: body,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      throw AppError(e);
    }
  }

  Future<Response<T>> delete<T>({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    try {
      BaseOptions baseOption = dio.options.copyWith();
      final options = Options(
        sendTimeout: baseOption.connectTimeout,
        receiveTimeout: baseOption.receiveTimeout,
        receiveDataWhenStatusError: baseOption.receiveDataWhenStatusError,
      );
      if (body != null) {
        options.contentType = "application/json";
      } else {
        options.contentType = "application/x-www-form-urlencoded";
      }
      Response<T> response = await dio.delete<T>(
        baseUrl + endPoint,
        queryParameters: query,
        data: body,
        cancelToken: cancelToken,
        options: options,
      );
      return response;
    } catch (e) {
      throw AppError(e);
    }
  }
}
