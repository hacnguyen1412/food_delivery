import 'package:core_dependency/core_dependency.dart';
import 'package:feature_home/feature_home.dart';
part 'app_router.gr.dart';

@CupertinoAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(page: HomeScreen, initial: true),
  AutoRoute(page: BannerScreen),
])
class AppRouter extends _$AppRouter {}
