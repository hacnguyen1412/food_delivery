import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/di/di.dart';
import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import '/src/presentation/controllers/shipping_address/shipping_address_controller.dart';

class ShippingAddressScreen extends StatefulWidget {
  final String id;

  const ShippingAddressScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final controller = getIt<ShippingAddressController>();
  @override
  void initState() {
    controller.getAddress(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shipping address screen"),
          actions: [
            IconButton(
                onPressed: () {
                  UIManager.of(context).changeLocale(LocaleType.chinese);
                },
                icon: const Icon(
                  Icons.remove,
                ))
          ],
        ),
        body: Obx(() {
          final state = controller.rxState.value;
          switch (state) {
            case ShippingAddressUIState.idle:
            case ShippingAddressUIState.gettingCache:
              return const Center(child: CircularProgressIndicator());
            case ShippingAddressUIState.getCacheSuccess:
              final address = controller.rxAddress.value;
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.localizations.welcome,
                      style: TextStyle(
                        color: context.appTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SvgView.asset(
                      Assets.images.imgAvatar,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(height: 12),
                    Text(address.id),
                    const SizedBox(height: 4),
                    Text(address.address),
                  ],
                ),
              );
            case ShippingAddressUIState.getCacheFail:
              return const Center(
                child: Text("ShippingAddressUIState.getCacheFail"),
              );
            default:
              throw UnimplementedError();
          }
        }));
  }
}
