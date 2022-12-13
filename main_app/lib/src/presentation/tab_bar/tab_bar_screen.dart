import 'package:flutter/material.dart';
import 'package:home_app/main.dart';
import 'package:main_app/app/di/di.dart';
import 'package:main_app/app/route/app_router.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final appRouter = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return HomeApp(appRouter: appRouter);
  }
}
