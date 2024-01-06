import 'package:auto_route/auto_route.dart';
import 'package:movies_app/app/screens/charging/charging_screen.dart';
import 'package:movies_app/app/screens/movie_list/movie_list_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ChargingRoute.page, initial: true),
        AutoRoute(page: MovieListRoute.page),
      ];
}

final appRouter = AppRouter();
