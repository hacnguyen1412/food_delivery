import 'package:core_package/core_package.dart';

class RemoteDataSource<Service extends ApiService> extends DataSource {
  final Service service;
  RemoteDataSource(this.service);
}
