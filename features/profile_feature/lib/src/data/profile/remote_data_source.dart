import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'profile_service.dart';

@singleton
class ProfileRemoteDataSource extends RemoteDataSource<ProfileService> {
  ProfileRemoteDataSource(super.service);
}
