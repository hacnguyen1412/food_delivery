import 'package:core_package/common/model.dart';

class ProfileModel extends Model {
  final String name;
  @override
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(name: json['name']);
  }

  ProfileModel({required this.name});

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
