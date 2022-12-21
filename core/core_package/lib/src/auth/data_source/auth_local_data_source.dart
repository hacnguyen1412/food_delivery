import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/auth/model/auth_model_converter.dart';
import 'package:core_package/src/data_source/local_data_source.dart';
import 'package:core_package/src/model/auth.dart';

@singleton
class AuthLocalDataSource extends LocalDataSource {
  final AuthModelConverter converter;
  AuthLocalDataSource(super.prefs, this.converter);

  void cacheAuth(AuthModel model) {}
}
