import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<Brightness> get brightness => UIManager.getBrightness();
}
