import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
import 'local_data_source.dart';
import 'model.dart';
import 'remote_data_source.dart';

@singleton
class HomeRepository {
  final HomeModelDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepository(
    this.remoteDataSource,
    this.localDataSource,
  );

  Future<void> getHomeCached() async {
    final homeModel = await localDataSource.getHomeCached();
    debugPrint(homeModel.toJson().toString());
  }

  Future<void> cache() async {
    final model = HomeModel(name: "Hac");
    await localDataSource.cache(key: "key", model: model);
  }
}
