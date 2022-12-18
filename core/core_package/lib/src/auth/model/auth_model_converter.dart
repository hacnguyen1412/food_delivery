import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
import 'package:core_package/src/auth/model/auth_model.dart';
import 'package:flutter/foundation.dart';

@singleton
class AuthModelConverter extends ModelConverter<AuthModel> {
  @override
  Future<AuthModel> fromJson(Map<String, dynamic> json) async {
    return await compute(AuthModel.fromJson, json);
  }
}
