import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';
part 'auth.g.dart';

@JsonSerializable()
class AuthModel extends Model {
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
