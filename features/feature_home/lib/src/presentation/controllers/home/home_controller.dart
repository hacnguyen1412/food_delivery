import 'package:core_package/core_package.dart';
import 'package:feature_home/src/data/home/home_repository.dart';

abstract class HomeController {}

@Injectable(as: HomeController)
class HomeControllerImpl extends HomeController {
  final HomeRepository repository;

  HomeControllerImpl(this.repository) {
    doSomething();
  }
  Future<void> doSomething() async {
    await repository.cache();
    repository.get();
  }
}
