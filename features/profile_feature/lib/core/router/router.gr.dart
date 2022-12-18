// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$ProfileFeatureRouter extends RootStackRouter {
  _$ProfileFeatureRouter([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ProfileRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ShippingAddressRoute.name: (routeData) {
      final args = routeData.argsAs<ShippingAddressRouteArgs>();
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: ShippingAddressScreen(
          key: args.key,
          id: args.id,
          callBack: args.callBack,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          ProfileRoute.name,
          path: '/profile-screen',
        ),
        RouteConfig(
          ShippingAddressRoute.name,
          path: 'shipping_address/:id/detail',
        ),
      ];
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-screen',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [ShippingAddressScreen]
class ShippingAddressRoute extends PageRouteInfo<ShippingAddressRouteArgs> {
  ShippingAddressRoute({
    Key? key,
    required String id,
    required dynamic Function() callBack,
  }) : super(
          ShippingAddressRoute.name,
          path: 'shipping_address/:id/detail',
          args: ShippingAddressRouteArgs(
            key: key,
            id: id,
            callBack: callBack,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'ShippingAddressRoute';
}

class ShippingAddressRouteArgs {
  const ShippingAddressRouteArgs({
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
