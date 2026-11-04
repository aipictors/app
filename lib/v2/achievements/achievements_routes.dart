import 'package:aipictors/v2/achievements/achievements_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> achievementsRoutes = [
  GoRoute(
    path: '/achievements',
    builder: (context, state) => AchievementsScreen(userId: state.uri.queryParameters['user']),
  ),
];
