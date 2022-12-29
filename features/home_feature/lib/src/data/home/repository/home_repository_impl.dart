import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/src/data/home/model/task_dao.dart';
import 'package:home_feature/src/domain/repository/home_repository.dart';
import '../model/task_dto.dart';
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
  Future<List<TaskDao>> getTasksCached() async {
    return localDataSource.getHomeCached();
  }

  @override
  void cacheTasks(List<TaskDao> tasks) {
    localDataSource.cacheTasks(tasks);
  }

  @override
  Future<List<TaskDto>> fetchTasks() {
    return remoteDataSource.fetchTasks();
  }
}
