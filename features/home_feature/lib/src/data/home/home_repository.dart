import 'package:core_dependency/core_dependency.dart';
import 'local_data_source.dart';
import 'model.dart';
import 'remote_data_source.dart';

@singleton
class HomeRepository {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepository(
    this.remoteDataSource,
    this.localDataSource,
  );

  Future<void> getHomeCached() async {
    Result;
    final result = await localDataSource.getHomeCached();
    result.when((homeModel) {
      debugPrint(homeModel.toJson().toString());
    }, (error) {
      //do nothing
    });
  }

  Future<void> cache() async {
    final model = HomeModel(name: "Hac");
    await localDataSource.cacheHome(model);
  }
}
