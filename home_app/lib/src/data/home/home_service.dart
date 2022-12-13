import 'package:core_data_source/core_data_source.dart';
import 'package:core_package/core_package.dart';

@singleton
class HomeService extends ApiService {
  HomeService(super.dio);

  @override
  String get baseUrl => "home";
}
