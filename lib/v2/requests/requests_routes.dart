import 'package:aipictors/v2/requests/requests_screens.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> requestsRoutes = [
  GoRoute(path: '/requests', builder: (_, __) => const RequestsScreen()),
  GoRoute(path: '/requests/plans', builder: (_, __) => const RequestPlansScreen()),
  GoRoute(
    path: '/requests/plans/:id',
    builder: (_, state) => RequestPlanScreen(id: state.pathParameters['id']!),
  ),
  GoRoute(
    path: '/requests/showcase',
    builder: (_, state) => RequestShowcaseScreen(planId: state.uri.queryParameters['planId'], userId: state.uri.queryParameters['userId']),
  ),
  GoRoute(
    path: '/requests/new',
    builder: (_, state) => RequestNewScreen(planId: state.uri.queryParameters['plan'], creatorId: state.uri.queryParameters['creator']),
  ),
  GoRoute(
    path: '/requests/:id',
    builder: (_, state) => RequestDetailScreen(id: state.pathParameters['id']!, created: state.uri.queryParameters['created'] == '1'),
  ),
  GoRoute(path: '/settings/requests', builder: (_, __) => const RequestSettingsScreen()),
];
