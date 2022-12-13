import 'package:core_data_source/core_data_source.dart';
import 'package:core_package/core_package.dart';

import 'home_service.dart';

@Singleton(as: RemoteDataSource)
class HomeRemoteDataSource extends RemoteDataSource<HomeService> {
  HomeRemoteDataSource(super.service);
}
