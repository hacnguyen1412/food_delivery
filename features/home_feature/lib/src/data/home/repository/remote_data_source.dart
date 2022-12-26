import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/src/data/home/model/home_dto.dart';

import 'rest_client.dart';

@singleton
class HomeRemoteDataSource {
  final HomeRestClient _restClient;

  HomeRemoteDataSource(this._restClient);

  Future<List<HomeDto>> getHomes() {
    return _restClient.getHomes();
  }
}
