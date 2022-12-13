import 'package:core_data_source/core_data_source.dart';
import 'package:core_package/core_package.dart';

@singleton
class HomeRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  HomeRepository(this.remoteDataSource, this.localDataSource);
}
