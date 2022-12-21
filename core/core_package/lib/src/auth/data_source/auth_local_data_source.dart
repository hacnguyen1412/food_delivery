import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/src/database/database.dart';
import 'package:core_package/src/model/auth.dart';

import '../../../common/model.dart';

@singleton
class AuthLocalDataSource {
  final AuthModelConverter converter;
  final AppDatabase database;
  final CacheKeyGenerator keyGenerator;

  AuthLocalDataSource(this.converter, this.database, this.keyGenerator);

  String get cacheKey => keyGenerator.genKey<AuthModel>();

  void cacheAuth(AuthModel model) {
    database.cache(
      key: cacheKey,
      model: model,
    );
  }

  Future<Result<AuthModel, AppError>> getAuth() async {
    final result = await database.get<AuthModel>(
      key: cacheKey,
      converter: converter,
    );
    return result;
  }
}
