import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:profile_feature/core/router/router.dart';
import 'core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const ProfileApp());
}

class ProfileApp extends StatefulWidget {
  const ProfileApp({
    super.key,
  });

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  final appRouter = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: appRouter.router.defaultRouteParser(),
      routerDelegate: appRouter.router.delegate(
        initialRoutes: [const ProfileRoute()],
      ),
    );
  }
}
