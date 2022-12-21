import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel extends DatabaseModel {
  final String name;
  final String patternThumb;

  UserModel({
    required String id,
    required this.name,
    required this.patternThumb,
  }) : super(id);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
