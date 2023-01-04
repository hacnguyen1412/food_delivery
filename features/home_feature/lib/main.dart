import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home_feature/core/router/router.dart';
import 'core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const HomeApp());
}

class HomeApp extends StatefulWidget {
  const HomeApp({
    super.key,
  });

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final appRouter = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      builder: (light, dark) => MaterialApp.router(
        title: 'Home Feature',
        theme: light,
        darkTheme: dark,
        routeInformationParser: appRouter.router.defaultRouteParser(),
        routerDelegate: appRouter.router.delegate(
          initialRoutes: [const HomeRoute()],
        ),
      ),
      brightness: Brightness.dark,
    );
  }
}
