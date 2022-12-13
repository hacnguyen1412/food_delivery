import 'dart:convert';
import 'package:core_data_source/common/cache_error.dart';
import 'package:core_data_source/src/data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/model.dart';

abstract class LocalDataSource extends DataSource {
  final SharedPreferences prefs;

  LocalDataSource(this.prefs);

  Future<bool> cache({required String key, required Model model}) async {
    try {
      final result = await prefs.setString(key, model.toJson().toString());
      return result;
    } catch (e) {
      throw CacheError(
        message: e.toString(),
        type: CacheErrorType.cacheFail,
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
      final model = converter.fromJson(json);
      return model;
    } catch (e) {
      throw CacheError(
        message: e.toString(),
        type: CacheErrorType.getCacheFail,
      );
    }
  }
}
