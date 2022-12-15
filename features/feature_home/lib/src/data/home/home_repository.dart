import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
import 'package:core_package/core_package.dart';

import 'home_model_converter.dart';
import 'remote_data_source.dart';

@singleton
class HomeRepository {
  final LocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;
  final HomeModelConverter modelConverter;

  HomeRepository(
    this.remoteDataSource,
    this.localDataSource,
    this.modelConverter,
  );

  Future<void> get() async {
    final a = await localDataSource.get<HomeModel>(
      key: "key",
      converter: modelConverter,
    );
    print(a.toJson());
  }

  Future<void> cache() async {
    final model = HomeModel(name: "Hac");
    await localDataSource.cache(key: "key", model: model);
  }
}

class HomeModel extends Model {
  final String name;
  @override
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(name: json['name']);
  }

  HomeModel({required this.name});

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}