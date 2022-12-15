import 'package:core_dependency/core_dependency.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
