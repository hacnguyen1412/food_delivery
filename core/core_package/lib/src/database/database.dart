import 'dart:convert';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/common/model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppDatabase {
  Future<Result<bool, AppError>> cache({
    required String key,
    required DatabaseModel model,
  });

  Future<Result<T, AppError>> get<T extends DatabaseModel>({
    required String key,
    required ModelConverter<T> converter,
  });
}

@Singleton(as: AppDatabase)
class AppDatabaseImpl implements AppDatabase {
  final SharedPreferences prefs;

  AppDatabaseImpl(this.prefs);

  @override
  Future<Result<bool, AppError>> cache(
      {required String key, required DatabaseModel model}) async {
    try {
      final json = await compute(jsonEncode, model.toJson());
      final result = await prefs.setString(key, json);
      return Success(
        result,
      );
    } catch (error, stackTrace) {
      return Error(
        CacheError(
          message: error.toString(),
          stackTrace: stackTrace,
          type: CacheErrorType.cacheFail,
          error: error,
        ),
      );
    }
  }

  @override
  Future<Result<T, AppError>> get<T extends DatabaseModel>({
    required String key,
    required ModelConverter<T> converter,
  }) async {
    try {
      final jsonString = prefs.getString(key) ?? "";
      final json = jsonDecode(jsonString);
      final model = await converter.fromJson(json);
      return Success(model);
    } catch (error, stackTrace) {
      return Error(
        CacheError(
          message: error.toString(),
          stackTrace: stackTrace,
          type: CacheErrorType.getCacheFail,
          error: error,
        ),
      );
    }
  }
}
