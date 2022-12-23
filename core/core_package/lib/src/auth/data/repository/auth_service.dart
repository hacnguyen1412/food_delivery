import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/service/api_service.dart';

@singleton
class AuthService extends ApiService {
  AuthService(super.dio);
}
