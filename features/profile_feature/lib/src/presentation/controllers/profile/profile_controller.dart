import 'package:core_dependency/core_dependency.dart';
import 'package:profile_feature/src/data/profile/profile_repository.dart';

abstract class ProfileController {}

@Injectable(as: ProfileController)
class ProfileControllerImpl extends ProfileController {
  final ProfileRepository repository;

  ProfileControllerImpl(this.repository) {
    doSomething();
  }
  Future<void> doSomething() async {
    await repository.cache();
    repository.getProfileCached();
  }
}
