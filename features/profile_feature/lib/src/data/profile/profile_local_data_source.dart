import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:profile_feature/src/data/profile/model.dart';
import 'package:profile_feature/src/data/profile/profile_model_converter.dart';

@singleton
class ProfileLocalDataSource extends LocalDataSource {
  final ProfileModelConverter modelConverter;
  ProfileLocalDataSource(super.prefs, this.modelConverter);

  Future<ProfileModel> getProfileCached() async {
    final model = await get<ProfileModel>(
      key: "key",
      converter: modelConverter,
    );
    return model;
  }
}
