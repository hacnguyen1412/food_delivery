import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/core_package.dart';
import 'package:home_feature/src/domain/repository/home_repository.dart';

import '../model/home.dart';

@singleton
class FetchHomesUseCase {
  final HomeRepository _repository;

  FetchHomesUseCase(this._repository);

  Future<Result<List<Home>, AppError>> execute() async {
    try {
      final homes = await _repository.fetchHomes();
      final result = homes.map((homeDto) => Home.fromHomeDto(homeDto)).toList();
      return Success(result);
    } catch (e, s) {
      return Error(NetworkError.fromError(e, s));
    }
  }
}
