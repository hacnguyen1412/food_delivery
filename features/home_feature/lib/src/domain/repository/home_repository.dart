import 'package:core_package/core_package.dart';
import 'package:home_feature/src/data/home/model/home_dto.dart';

abstract class HomeRepository {
  Future<List<HomeDto>> fetchHomes();

  Future<List<HomeDao>> getHomesCached();

  void cacheHomes(List<HomeDao> homes);
}
