import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
import 'package:flutter/foundation.dart';
import 'package:home_feature/src/data/home/home_repository.dart';

@singleton
class HomeModelConverter extends ModelConverter<HomeModel> {
  @override
  Future<HomeModel> fromJson(Map<String, dynamic> json) async {
    return await compute(HomeModel.fromJson, json);
  }
}
