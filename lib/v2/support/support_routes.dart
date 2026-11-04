import 'package:aipictors/v2/support/support_ranking_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> supportRoutes = [
  GoRoute(path: '/support-rankings', builder: (context, state) => const SupportRankingScreen()),
];
