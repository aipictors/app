import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/daily_theme_screen.dart';
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
      path: '/daily_themes/:theme_id',
      name: 'daily_theme',
      builder: (context, state) {
        final themeId = state.params['theme_id'];
        return DailyThemeScreen(themeId: themeId!);
      },
    ),
    GoRoute(
      path: '/works/:work_id',
      name: 'work',
      builder: (context, state) {
        final workId = state.params['work_id'];
        return WorkScreen(workId: workId!);
      },
    ),
    GoRoute(
      path: '/users/:user_id',
      name: 'user',
      builder: (context, state) {
        final userId = state.params['user_id'];
        return UserScreen(userId: userId!);
      },
    ),
  ],
);
