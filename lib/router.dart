import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'shells/shell_route.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return RootShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: HomeScreen());
          },
        ),
      ],
    ),
  ],
);
