import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:home_feature/core/router/router.dart';
import 'package:home_feature/core/di/di.dart';
import 'package:home_feature/src/presentation/controllers/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = getIt<HomeController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home screen"),
        ),
        body: const Center(
          child: Text("Home screen"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getIt<AppRouter>().router.push(
                  const BannerRoute(),
                );
          },
        ),
      ),
    );
  }
}
