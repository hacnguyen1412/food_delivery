import 'dart:convert';
import 'package:core_data_source/common/cache_error.dart';
import 'package:core_data_source/src/data_source.dart';
import 'package:core_package/core_package.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/model.dart';

@singleton
class LocalDataSource extends DataSource {
  final SharedPreferences prefs;

  LocalDataSource(this.prefs);

  Future<bool> cache({required String key, required Model model}) async {
    try {
      final json = await compute(jsonEncode, model.toJson());
      final result = await prefs.setString(key, json);
      return result;
    } catch (error, stackTrace) {
      throw CacheError(
        message: error.toString(),
        stackTrace: stackTrace,
        type: CacheErrorType.cacheFail,
        error: error,
      );
    }
  }

  Future<Model> get<Model>({
    required String key,
    required ModelConverter<Model> converter,
  }) async {
    try {
      final jsonString = prefs.getString(key) ?? "";
      final json = jsonDecode(jsonString);
      final model = await converter.fromJson(json);
      return model;
    } catch (error, stackTrace) {
      throw CacheError(
        message: error.toString(),
        stackTrace: stackTrace,
        type: CacheErrorType.getCacheFail,
        error: error,
      );
    }
  }
}
