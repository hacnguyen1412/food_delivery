import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/src/data/home/model/home_dao.dart';
import 'package:home_feature/src/domain/repository/home_repository.dart';
import '../model/home_dto.dart';
import 'local_data_source.dart';
import 'remote_data_source.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );
  @override
  Future<List<HomeDto>> fetchHomes() async {
    return await remoteDataSource.getHomes();
  }

  @override
  Future<List<HomeDao>> getHomesCached() async {
    return localDataSource.getHomeCached();
  }

  @override
  void cacheHomes(List<HomeDao> homes) {
    localDataSource.cacheHomes(homes);
  }
}
