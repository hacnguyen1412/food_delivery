import 'package:core_package/core_package.dart';
import 'package:home_feature/src/data/home/model/home_dto.dart';

class Home {
  final String id;
  final String name;
  final String avatar;
  final String createdAt;

  Home({
    required this.id,
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  factory Home.fromHomeDto(HomeDto homeDto) {
    return Home(
      id: homeDto.id ?? "",
      name: homeDto.name ?? "",
      avatar: homeDto.avatar ?? "",
      createdAt: homeDto.createdAt ?? "",
    );
  }

  factory Home.fromHomeDao(HomeDao homeDao) {
    return Home(
      id: homeDao.id.toString(),
      name: homeDao.name ?? "",
      avatar: homeDao.avatar ?? "",
      createdAt: homeDao.createdAt ?? "",
    );
  }

  HomeDao toDao() {
    return HomeDao(
      id: int.tryParse(id),
      name: name,
      avatar: avatar,
      createdAt: createdAt,
    );
  }
}
