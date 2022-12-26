import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:home_feature/src/data/home/model/home_dao.dart';

@singleton
class HomeLocalDataSource {
  final ObjectBoxFactory _factory;
  late final ObjectBox<HomeDao> _objectBox =
      _factory.createObjectBox<HomeDao>();
  HomeLocalDataSource(this._factory);

  List<HomeDao> getHomeCached() {
    final list = _objectBox.getAll();
    return list;
  }

  void cacheHomes(List<HomeDao> homes) {
    _objectBox.put(homes.first);
    // try {
    //   _objectBox.putMany(homes);
    // } catch (e) {
    //   print(e);
    //   //
    // }
  }
}
