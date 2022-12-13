// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$HomeAppRouter extends RootStackRouter {
  _$HomeAppRouter([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: HomeScreen(
          key: args.key,
          delegate: args.delegate,
        ),
      );
    },
    BannerRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const BannerScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          BannerRoute.name,
          path: '/banner-screen',
        ),
      ];
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    HomeAppDelegate? delegate,
  }) : super(
          HomeRoute.name,
          path: '/',
          args: HomeRouteArgs(
            key: key,
            delegate: delegate,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.delegate,
  });

  final Key? key;

  final HomeAppDelegate? delegate;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, delegate: $delegate}';
  }
}

/// generated route for
/// [BannerScreen]
class BannerRoute extends PageRouteInfo<void> {
  const BannerRoute()
      : super(
          BannerRoute.name,
          path: '/banner-screen',
        );

  static const String name = 'BannerRoute';
}
