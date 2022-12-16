import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';

@singleton
class ProfileService extends ApiService {
  ProfileService(super.dio);

  @override
  String get baseUrl => "home";
}
