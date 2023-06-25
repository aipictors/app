import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/user_screen.dart';
import 'screens/work_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: '/works/:workId',
      name: 'work',
      builder: (context, state) {
        final workId = state.params['workId'];
        return WorkScreen(workId: workId!);
      },
    ),
    GoRoute(
      path: '/users/:userId',
      name: 'user',
      builder: (context, state) {
        final userId = state.params['userId'];
        return UserScreen(userId: userId!);
      },
    ),
  ],
);
