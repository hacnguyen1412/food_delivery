import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:home_feature/core/di/di.dart';
import 'package:home_feature/objectbox.g.dart';
import 'package:home_feature/src/data/home/model/task_dao.dart';

@module
abstract class HubModule {
  @lazySingleton
  HomeHubFactory get hubFactory => HomeHubFactory.getInstance();

  @lazySingleton
  ObjectBox<TaskDao> get taskBox => hubFactory.createObjectBox<TaskDao>();
}

class HomeHubFactory {
  final ObjectBoxFactory _objectBoxFactory;

  HomeHubFactory._(this._objectBoxFactory);

  static HomeHubFactory getInstance() {
    final appDir = getIt<AppDirectory>();
    final objectBoxFactory =
        ObjectBoxFactory.getInstance(openStore, appDir.dir.path);
    return HomeHubFactory._(objectBoxFactory);
  }

  ObjectBox<T> createObjectBox<T>() {
    return _objectBoxFactory.createObjectBox<T>();
  }
}
