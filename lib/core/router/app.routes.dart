// core/router/app.routes.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/features/weather/presentation/views/weather.view.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.initialView,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.initialView,
        redirect: (_, __) => "/${Routes.weatherView}",
        routes: [
          GoRoute(
            name: Routes.weatherView,
            path: Routes.weatherView,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WeatherView(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Error')),
    ),
  );

  static GoRouter get router => _router;
}
