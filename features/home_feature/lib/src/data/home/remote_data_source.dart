import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'home_service.dart';

@singleton
class HomeRemoteDataSource extends RemoteDataSource<HomeService> {
  HomeRemoteDataSource(super.service);
}
