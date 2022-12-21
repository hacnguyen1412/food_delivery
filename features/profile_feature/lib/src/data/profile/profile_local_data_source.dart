import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/common/model.dart';
import 'package:core_package/core_package.dart';
import 'package:profile_feature/src/data/profile/model.dart';
import 'package:profile_feature/src/data/profile/profile_model_converter.dart';

@singleton
class ProfileLocalDataSource {
  final ProfileModelConverter modelConverter;
  final AppDatabase database;
  final CacheKeyGenerator keyGenerator;
  ProfileLocalDataSource(
    this.modelConverter,
    this.database,
    this.keyGenerator,
  );

  String get cacheKey => keyGenerator.genKey<ProfileModel>();

  Future<Result<ProfileModel, AppError>> getProfileCached() async {
    final result = await database.get<ProfileModel>(
      key: cacheKey,
      converter: modelConverter,
    );
    return result;
  }

  Future<Result<bool, AppError>> cacheProfile(ProfileModel model) async {
    final result = await database.cache(
      key: cacheKey,
      model: model,
    );
    return result;
  }
}
