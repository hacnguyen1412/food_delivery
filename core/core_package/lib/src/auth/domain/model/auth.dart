import 'package:core_package/src/auth/data/model/auth_dao.dart';

class Auth {
  final String? token;
  final String? refreshToken;

  Auth({
    this.token,
    this.refreshToken,
  });

  factory Auth.fromAdo(AuthDao authDao) {
    return Auth(
      token: authDao.token,
      refreshToken: authDao.refreshToken,
    );
  }
  AuthDao toDao() {
    return AuthDao(
      token: token,
      refreshToken: refreshToken,
    );
  }
}
