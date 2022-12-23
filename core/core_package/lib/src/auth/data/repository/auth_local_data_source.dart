import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/auth/data/model/auth_dao.dart';
import 'package:core_package/src/object_box/object_box.dart';

@singleton
class AuthLocalDataSource {
  final ObjectBoxFactory _factory;
  late final ObjectBox<AuthDao> _objectBox =
      _factory.createObjectBox<AuthDao>();

  AuthLocalDataSource(this._factory);

  void cacheAuth(AuthDao auth) {
    _objectBox.put(auth, mode: IPutMode.put);
  }

  AuthDao getAuth() {
    final list = _objectBox.getAll();
    return list.first;
  }
}
