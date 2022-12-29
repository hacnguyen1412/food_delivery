import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:core_package/src/directory/app_directory.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<AppDirectory> get appDirectory => AppDirectory.getInstance();

  @lazySingleton
  EventBus get eventBus => EventBus();
}
