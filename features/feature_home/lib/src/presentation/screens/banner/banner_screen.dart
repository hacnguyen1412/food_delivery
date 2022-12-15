import 'package:feature_home/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:feature_home/src/presentation/controllers/banner/banner_controller.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final controller = getIt<BannerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banner screen"),
      ),
      body: const Center(
        child: Text("Banner screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
