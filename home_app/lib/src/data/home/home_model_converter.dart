import 'package:core_data_source/common/model.dart';
import 'package:core_package/core_package.dart';
import 'package:home_app/src/data/home/home_repository.dart';

@singleton
class HomeModelConverter extends ModelConverter<HomeModel> {
  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return HomeModel.fromJson(json);
  }
}
