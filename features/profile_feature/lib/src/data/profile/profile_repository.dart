import 'package:core_dependency/core_dependency.dart';
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
    final result = await localDataSource.getProfileCached();
    result.when((profileModel) {
      debugPrint(profileModel.toJson().toString());
    }, (error) {
      //do nothing
    });
  }

  Future<void> cache() async {
    final model = ProfileModel(name: "Hac Profile");
    await localDataSource.cacheProfile(model);
  }
}
