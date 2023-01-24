import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_view_model_example/modules/counter/counter_screen.dart';
import 'package:riverpod_view_model_example/modules/preferences/preferences_screen.dart';

class AppRouter {
  void go(String route) {
    goRouter.go(route);
  }

  GoRouter goRouter = GoRouter(
    initialLocation: "/counter",
    routes: [
      GoRoute(
        path: "/counter",
        pageBuilder: _counter,
      ),
      GoRoute(
        path: "/preferences",
        pageBuilder: _preferences,
      ),
    ],
  );
  static Page<void> _counter(context, GoRouterState state) {
    return NoTransitionPage<void>(
      key: state.pageKey,
      child: CounterScreen(),
    );
  }

  static Page<void> _preferences(context, GoRouterState state) {
    return NoTransitionPage<void>(
      key: state.pageKey,
      child: PreferencesScreen(),
    );
  }
}
