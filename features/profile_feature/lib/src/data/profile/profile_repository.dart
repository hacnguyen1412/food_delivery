import 'package:core_dependency/core_dependency.dart';
import 'profile_local_data_source.dart';
import 'profile_remote_data_source.dart';

@singleton
class ProfileRepository {
  final ProfileLocalDataSource localDataSource;
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepository(
    this.remoteDataSource,
    this.localDataSource,
  );

  Future<void> getProfileCached() async {}

  Future<void> cache() async {}
}
