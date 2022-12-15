import 'package:flutter/material.dart';
import 'core/di/di.dart';
import 'core/route/app_router.dart';

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
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      routerDelegate: getIt<AppRouter>().delegate(),
    );
  }
}
