import 'package:core_package/core_package.dart';
import 'package:home_app/home_app.dart';
part 'app_router.gr.dart';

@CupertinoAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(page: HomeScreen, initial: true),
  AutoRoute(page: BannerScreen),
])
class HomeAppRouter extends _$HomeAppRouter {}
