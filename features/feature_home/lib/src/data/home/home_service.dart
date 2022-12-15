import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';

@singleton
class HomeService extends ApiService {
  HomeService(super.dio);

  @override
  String get baseUrl => "home";
}
