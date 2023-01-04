import 'package:app/core/router/router.dart';
import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final appRouter = getIt<AppRouter>();
  final initialBrightness = getIt<Brightness>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      builder: (light, dark) => MaterialApp.router(
        title: 'Food delivery',
        theme: light,
        darkTheme: dark,
        routeInformationParser: appRouter.router.defaultRouteParser(),
        routerDelegate: appRouter.router.delegate(
          initialRoutes: [const TabBarScreenRoute()],
        ),
      ),
      brightness: initialBrightness,
    );
  }
}
