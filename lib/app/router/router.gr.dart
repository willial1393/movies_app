// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChargingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChargingScreen(),
      );
    },
    MovieListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieListScreen(),
      );
    },
  };
}

/// generated route for
/// [ChargingScreen]
class ChargingRoute extends PageRouteInfo<void> {
  const ChargingRoute({List<PageRouteInfo>? children})
      : super(
          ChargingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChargingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieListScreen]
class MovieListRoute extends PageRouteInfo<void> {
  const MovieListRoute({List<PageRouteInfo>? children})
      : super(
          MovieListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
