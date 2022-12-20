import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:profile_feature/core/di/di.dart';

class ShippingAddressScreen extends StatefulWidget {
  final String id;
  final Function() callBack;

  const ShippingAddressScreen({
    super.key,
    @PathParam('id') required this.id,
    required this.callBack,
  });

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;
    return Material(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Shipping address screen"),
          ),
          body: const Center(
            child: Text("Shipping address screen"),
          ),
        ),
      ),
    );
  }
}
