import 'package:core_package/core_package.dart';
import 'data_source.dart';

class RemoteDataSource<Service extends ApiService> extends DataSource {
  final Service service;
  RemoteDataSource(this.service);
}
