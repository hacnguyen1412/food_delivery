import 'package:core_package/core_package.dart';
import 'package:app/src/presentation/tab_bar/tab_bar_screen.dart';
part 'app_router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route,App',
  routes: <AutoRoute>[
    AutoRoute(
      page: TabBarScreen,
      initial: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
