import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/data_source/local_data_source.dart';

@singleton
class AuthLocalDataSource extends LocalDataSource {
  AuthLocalDataSource(super.prefs);
}
