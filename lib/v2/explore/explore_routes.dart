import 'package:aipictors/v2/explore/explore_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> exploreRoutes = [
  GoRoute(path: '/search', builder: (context, state) => const ExploreScreen()),
  GoRoute(
    path: '/search/:text',
    builder: (context, state) => SearchResultScreen(text: state.pathParameters['text']!),
  ),
  // 旧「見つける」（タイトル・作者の無い画像だけのグリッド）の置き換え
  GoRoute(path: '/explorer', builder: (context, state) => const ExploreScreen()),
  GoRoute(path: '/rankings', builder: (context, state) => const RankingScreen()),
];
