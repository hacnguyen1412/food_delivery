import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/core/realm/realm.dart';
import 'package:home_feature/src/data/home/model/task_dao.dart';

@singleton
class HomeLocalDataSource {
  final HomeFeatureRealm _realm;

  HomeLocalDataSource(this._realm);

  List<TaskDao> getHomeCached() {
    final result = _realm.getList<TaskDao>();
    final tasks = result?.toList() ?? [];
    return tasks;
  }

  void cacheTasks(List<TaskDao> tasks) {
    _realm.addAll(tasks);
  }
}
