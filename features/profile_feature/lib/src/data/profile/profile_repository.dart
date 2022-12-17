import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
import 'model.dart';
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

  Future<void> getProfileCached() async {
    final profileModel = await localDataSource.getProfileCached();
    debugPrint(profileModel.toJson().toString());
  }

  Future<void> cache() async {
    final model = ProfileModel(name: "Hac Profile");
    await localDataSource.cache(key: "key", model: model);
  }
}
