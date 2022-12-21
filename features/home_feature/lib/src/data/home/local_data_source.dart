import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/common/model.dart';
import 'package:core_package/core_package.dart';
import 'home_model_converter.dart';
import 'model.dart';

@singleton
class HomeLocalDataSource {
  final HomeModelConverter modelConverter;
  final AppDatabase database;
  final CacheKeyGenerator keyGenerator;
  HomeLocalDataSource(
    this.modelConverter,
    this.database,
    this.keyGenerator,
  );

  String get cacheKey => keyGenerator.genKey<HomeModel>();

  Future<Result<HomeModel, AppError>> getHomeCached() async {
    final result = await database.get<HomeModel>(
      key: cacheKey,
      converter: modelConverter,
    );
    return result;
  }

  Future<Result<bool, AppError>> cacheHome(HomeModel model) async {
    final result = await database.cache(
      key: cacheKey,
      model: model,
    );
    return result;
  }
}
