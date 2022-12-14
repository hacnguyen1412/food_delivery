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
    TabBarScreenRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const TabBarScreen(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          TabBarScreenRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [TabBarScreen]
class TabBarScreenRoute extends PageRouteInfo<void> {
  const TabBarScreenRoute()
      : super(
          TabBarScreenRoute.name,
          path: '/',
        );

  static const String name = 'TabBarScreenRoute';
}
