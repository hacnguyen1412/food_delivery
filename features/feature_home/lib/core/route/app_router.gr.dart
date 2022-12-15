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

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
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
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
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
