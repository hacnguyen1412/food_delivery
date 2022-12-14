import 'package:core_data_source/src/data_source.dart';

import 'api_service.dart';

class RemoteDataSource<Service extends ApiService> extends DataSource {
  final Service service;
  RemoteDataSource(this.service);
}
