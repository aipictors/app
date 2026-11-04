import 'package:aipictors/v2/explore/explore_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> exploreRoutes = [
  GoRoute(path: '/search', builder: (context, state) => const ExploreScreen()),
  GoRoute(
    path: '/search/:text',
    builder: (context, state) => SearchResultScreen(text: Uri.decodeComponent(state.pathParameters['text']!)),
  ),
  GoRoute(path: '/rankings', builder: (context, state) => const RankingScreen()),
];
