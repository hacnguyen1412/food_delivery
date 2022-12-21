import 'package:core_dependency/core_dependency.dart';
import 'home_service.dart';

@singleton
class HomeRemoteDataSource {
  final HomeService service;

  HomeRemoteDataSource(this.service);
}
