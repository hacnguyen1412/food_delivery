import 'package:core_data_source/common/model.dart';
import 'package:core_data_source/core_data_source.dart';
import 'package:core_package/core_package.dart';

import 'home_model_converter.dart';
import 'remote_data_source.dart';

@singleton
class HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final HomeModelConverter modelConverter;

  HomeRepository(
      this.remoteDataSource, this.localDataSource, this.modelConverter);

  void get() {
    final a = localDataSource.get<HomeModel>(
      key: "key",
      converter: modelConverter,
    );
    print(a);
  }

  void cache() {
    final model = HomeModel(name: "Hac");
    localDataSource.cache(key: "key", model: model);
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
