import 'package:flutter/material.dart';
import 'package:home_app/di/di.dart';
import 'package:home_app/home_app.dart';

class HomeScreen extends StatefulWidget {
  final HomeAppDelegate? delegate;
  const HomeScreen({super.key, this.delegate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          getIt<HomeAppRouter>().push(
            const BannerRoute(),
          );
        },
      ),
    );
  }
}
