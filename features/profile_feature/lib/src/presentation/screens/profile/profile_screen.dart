import 'package:flutter/material.dart';
import 'package:profile_feature/core/di/di.dart';
import 'package:profile_feature/src/presentation/controllers/profile/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = getIt<ProfileController>();
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
          title: const Text("Profile screen"),
        ),
        body: const Center(
          child: Text("Profile screen"),
        ),
      ),
    );
  }
}
