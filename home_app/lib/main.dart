import 'package:flutter/material.dart';
import 'package:home_app/app/route/app_router.dart';
import 'package:home_app/app/di/di.dart';

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
  //final appRouter = getIt<HomeAppRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: getIt<HomeAppRouter>().defaultRouteParser(),
      routerDelegate: getIt<HomeAppRouter>().delegate(),
    );
  }
}
