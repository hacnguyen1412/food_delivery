import 'package:core_router/core_router.dart';
import 'package:home_feature/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:home_feature/src/presentation/controllers/banner/banner_controller.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({
    super.key,
  });

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final controller = getIt<BannerController>();
  final router = getIt<AppRouter>().router;
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
        onPressed: () {
          router.push(
            PageRouteInfo<aRouteArgs>(
              'ShippingAddressRoute',
              path: '',
              args: aRouteArgs(
                id: '123',
                key: null,
                callBack: () {
                  return true;
                },
              ),
              // rawPathParams: {
              //   'id': '123',
              // },
            ),
          );
        },
      ),
    );
  }
}

class aRouteArgs {
  const aRouteArgs({
    this.key,
    required this.id,
    required this.callBack,
  });

  final Key? key;

  final String id;

  final dynamic Function() callBack;

  @override
  String toString() {
    return 'ShippingAddressRouteArgs{key: $key, id: $id, callBack: $callBack}';
  }
}
