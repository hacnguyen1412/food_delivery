import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:home_feature/src/data/home/model/task_dao.dart';

@singleton
class HomeLocalDataSource {
  final ObjectBox<TaskDao> _objectBox;
  // late final ObjectBox<TaskDao> _objectBox =
  //     _factory.createObjectBox<TaskDao>();
  HomeLocalDataSource(this._objectBox);

  List<TaskDao> getHomeCached() {
    return [];
    final list = _objectBox.getAll();
    return list;
  }

  void cacheTasks(List<TaskDao> tasks) {
    //_objectBox.putMany(tasks);
  }
}
