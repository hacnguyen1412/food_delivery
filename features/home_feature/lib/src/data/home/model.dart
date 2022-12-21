import 'package:core_package/common/model.dart';

class HomeModel extends DatabaseModel {
  final String name;
  @override
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(name: json['name']);
  }

  HomeModel({required this.name}) : super(null);

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
