import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
import 'package:flutter/foundation.dart';
import 'package:profile_feature/src/data/profile/profile_repository.dart';

@singleton
class ProfileModelConverter extends ModelConverter<ProfileModel> {
  @override
  Future<ProfileModel> fromJson(Map<String, dynamic> json) async {
    return await compute(ProfileModel.fromJson, json);
  }
}
