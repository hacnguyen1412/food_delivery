import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
import 'package:flutter/foundation.dart';
part 'auth.g.dart';

@JsonSerializable()
class AuthModel extends DatabaseModel {
  final String token;
  final String refreshToken;

  AuthModel({
    required this.token,
    required this.refreshToken,
  }) : super(null);

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

@singleton
class AuthModelConverter extends ModelConverter<AuthModel> {
  @override
  Future<AuthModel> fromJson(Map<String, dynamic> json) async {
    return await compute(AuthModel.fromJson, json);
  }
}
