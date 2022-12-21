import 'package:core_package/common/model.dart';

class ProfileModel extends DatabaseModel {
  final String name;
  @override
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(name: json['name']);
  }

  ProfileModel({required this.name}) : super(null);

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
