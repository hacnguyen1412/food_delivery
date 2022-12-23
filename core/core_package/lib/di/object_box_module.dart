import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/object_box/object_box.dart';

@module
abstract class ObjectBoxModule {
  @preResolve
  @lazySingleton
  Future<ObjectBoxFactory> get objectBoxFactory => ObjectBoxFactory.init();
}
