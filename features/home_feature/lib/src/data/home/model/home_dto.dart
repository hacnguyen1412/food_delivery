import 'dart:async';

import 'package:core_dependency/core_dependency.dart';
part 'home_dto.g.dart';

@JsonSerializable()
class HomeDto {
  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  HomeDto({this.id, this.name, this.avatar, this.createdAt});

  factory HomeDto.fromJson(Map<String, dynamic> json) =>
      _$HomeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDtoToJson(this);
}

FutureOr<HomeDto> deserializeHomeDto(Map<String, dynamic> json) =>
    HomeDto.fromJson(json);
FutureOr<List<HomeDto>> deserializeHomeDtoList(
        List<Map<String, dynamic>> json) =>
    json.map((e) => HomeDto.fromJson(e)).toList();
