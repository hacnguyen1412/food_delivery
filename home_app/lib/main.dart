import 'package:core_package/core_package.dart';
import 'package:flutter/material.dart';
import 'package:home_app/app/route/app_router.dart';
import 'package:home_app/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    HomeApp(
      appRouter: getIt<HomeAppRouter>(),
    ),
  );
}

class HomeApp extends StatefulWidget {
  final RootStackRouter appRouter;
  const HomeApp({super.key, required this.appRouter});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: widget.appRouter.defaultRouteParser(),
      routerDelegate: widget.appRouter.delegate(),
    );
  }
}
