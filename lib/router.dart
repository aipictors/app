import 'package:aipictors/screens/account/account_create_screen.dart';
import 'package:aipictors/screens/account/account_delete_screen.dart';
import 'package:aipictors/screens/award/novel_awards_screen.dart';
import 'package:aipictors/screens/award/work_awards_screen.dart';
import 'package:aipictors/screens/config/config_code_screen.dart';
import 'package:aipictors/screens/config/config_language_screen.dart';
import 'package:aipictors/screens/config/config_muted_tags_screen.dart';
import 'package:aipictors/screens/config/config_muted_users_screen.dart';
import 'package:aipictors/screens/config/config_theme_screen.dart';
import 'package:aipictors/screens/daily_theme/daily_theme_screen.dart';
import 'package:aipictors/screens/home_screen.dart';
import 'package:aipictors/screens/privacy_screen.dart';
import 'package:aipictors/screens/surveys_screen.dart';
import 'package:aipictors/screens/terms_screen%20.dart';
import 'package:aipictors/screens/user/user_screen.dart';
import 'package:aipictors/screens/work/work_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: '/daily_themes/:theme_id',
      builder: (context, state) {
        final themeId = state.pathParameters['theme_id'];
        return DailyThemeScreen(themeId: themeId!);
      },
    ),
    GoRoute(
      path: '/works/:work_id',
      builder: (context, state) {
        final workId = state.pathParameters['work_id'];
        return WorkScreen(workId: workId!);
      },
    ),
    GoRoute(
      path: '/users/:user_id',
      builder: (context, state) {
        final userId = state.pathParameters['user_id'];
        return UserScreen(userId: userId!);
      },
    ),
    GoRoute(
      path: '/config/theme',
      builder: (context, state) {
        return const ConfigThemeScreen();
      },
    ),
    GoRoute(
      path: '/config/code',
      builder: (context, state) {
        return const ConfigCodeScreen();
      },
    ),
    GoRoute(
      path: '/config/code',
      builder: (context, state) {
        return const ConfigCodeScreen();
      },
    ),
    GoRoute(
      path: '/config/language',
      builder: (context, state) {
        return const ConfigLanguageScreen();
      },
    ),
    GoRoute(
      path: '/config/muted_tags',
      builder: (context, state) {
        return const ConfigMutedTagsScreen();
      },
    ),
    GoRoute(
      path: '/config/muted_users',
      builder: (context, state) {
        return const ConfigMutedUsersScreen();
      },
    ),
    GoRoute(
      path: '/surveys',
      builder: (context, state) {
        return const SurveysScreen();
      },
    ),
    GoRoute(
      path: '/awards/novels',
      builder: (context, state) {
        return const NovelAwardsScreen();
      },
    ),
    GoRoute(
      path: '/awards/works',
      builder: (context, state) {
        return const WorkAwardsScreen();
      },
    ),
    GoRoute(
      path: '/account/create',
      builder: (context, state) {
        return const AccountCreateScreen();
      },
    ),
    GoRoute(
      path: '/account/delete',
      builder: (context, state) {
        return const AccountDeleteScreen();
      },
    ),
    GoRoute(
      path: '/terms',
      builder: (context, state) {
        return const TermsScreen();
      },
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) {
        return const PrivacyScreen();
      },
    ),
  ],
);
