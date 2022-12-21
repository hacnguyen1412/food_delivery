import 'package:core_dependency/core_dependency.dart';
import 'profile_service.dart';

@singleton
class ProfileRemoteDataSource {
  final ProfileService service;

  ProfileRemoteDataSource(this.service);
}
