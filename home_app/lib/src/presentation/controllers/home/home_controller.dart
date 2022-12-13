import 'package:core_package/core_package.dart';
import 'package:home_app/src/data/home/home_repository.dart';

abstract class HomeController {}

@Injectable(as: HomeController)
class HomeControllerImpl extends HomeController {
  final HomeRepository repository;

  HomeControllerImpl(this.repository);
}
