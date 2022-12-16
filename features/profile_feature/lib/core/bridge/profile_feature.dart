import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:profile_feature/profile_feature.dart';

@singleton
class ProfileFeature {
  final Widget root = const ProfileScreen();
  final AppRouter appRouter;

  ProfileFeature(this.appRouter);
}
