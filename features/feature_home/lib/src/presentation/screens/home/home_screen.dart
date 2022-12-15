import 'package:flutter/material.dart';
import 'package:feature_home/core/route/app_router.dart';
import 'package:feature_home/core/di/di.dart';
import 'package:feature_home/src/presentation/controllers/home/home_controller.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: const Center(
        child: Text("Home screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getIt<AppRouter>().push(
            const BannerRoute(),
          );
        },
      ),
    );
  }
}
