import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/core_package.dart';
import 'package:home_feature/src/domain/repository/home_repository.dart';

import '../model/home.dart';

@singleton
class CacheHomesUseCase {
  final HomeRepository _repository;

  CacheHomesUseCase(this._repository);
  Result<bool, AppError> execute(List<Home> homes) {
    try {
      final homesDao = homes.map((e) => e.toDao()).toList();
      _repository.cacheHomes(homesDao);
      return const Success(true);
    } catch (e, s) {
      return Error(
        CacheError(
          error: e,
          type: CacheErrorType.cacheFail,
          stackTrace: s,
        ),
      );
    }
  }
}
