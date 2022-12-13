import 'package:core_data_source/core_data_source.dart';
import 'package:core_package/core_package.dart';

@Singleton(as: LocalDataSource)
class HomeLocalDataSource extends LocalDataSource {
  HomeLocalDataSource(super.prefs);
  void fetch() {}
}
