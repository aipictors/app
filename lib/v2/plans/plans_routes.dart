import 'package:aipictors/v2/plans/plans_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> plansRoutes = [
  GoRoute(path: '/plans', builder: (context, state) => const PlansScreen()),
];
