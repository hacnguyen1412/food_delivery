import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
import 'package:core_package/core_package.dart';

import 'profile_model_converter.dart';
import 'remote_data_source.dart';

@singleton
class ProfileRepository {
  final LocalDataSource localDataSource;
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileModelConverter modelConverter;

  ProfileRepository(
    this.remoteDataSource,
    this.localDataSource,
    this.modelConverter,
  );

  Future<void> get() async {
    final a = await localDataSource.get<ProfileModel>(
      key: "key",
      converter: modelConverter,
    );
    print(a.toJson());
  }

  Future<void> cache() async {
    final model = ProfileModel(name: "Hac Profile");
    await localDataSource.cache(key: "key", model: model);
  }
}

class ProfileModel extends Model {
  final String name;
  @override
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(name: json['name']);
  }

  ProfileModel({required this.name});

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
