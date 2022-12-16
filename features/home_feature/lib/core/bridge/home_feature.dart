import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:home_feature/home_feature.dart';

@singleton
class HomeFeature {
  final Widget root = const HomeScreen();
  final AppRouter appRouter;

  HomeFeature(this.appRouter);
}
