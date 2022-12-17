import 'package:core_package/common/model.dart';

class HomeModel extends Model {
  final String name;
  @override
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(name: json['name']);
  }

  HomeModel({required this.name});

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
