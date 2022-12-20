import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:profile_feature/core/di/di.dart';
import 'package:profile_feature/profile_feature.dart';
import 'package:profile_feature/src/presentation/controllers/profile/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = getIt<ProfileController>();
  final router = getIt<AppRouter>().router;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Profile screen"),
          ),
          body: const Center(
            child: Text("Profile screen"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await router.push(
                ShippingAddressRoute(
                  id: "123",
                  callBack: () {},
                ),
              );
              print("DEBUGG");
            },
          ),
        ),
      ),
    );
  }
}
