import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'home_model_converter.dart';
import 'model.dart';

@singleton
class HomeModelDataSource extends LocalDataSource {
  final HomeModelConverter modelConverter;
  HomeModelDataSource(super.prefs, this.modelConverter);

  Future<HomeModel> getHomeCached() async {
    final model = await get<HomeModel>(
      key: "key",
      converter: modelConverter,
    );
    return model;
  }
}
