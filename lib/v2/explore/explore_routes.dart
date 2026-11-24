import 'package:aipictors/v2/explore/explore_screen.dart';
import 'package:aipictors/v2/explore/ranking_more_screens.dart';
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
  // Web の /rankings/rookie?date= と /popular?date=
  GoRoute(path: '/rankings/rookie', builder: (context, state) => RookieRankingScreen(date: _date(state.uri.queryParameters['date']))),
  GoRoute(path: '/popular', builder: (context, state) => PopularWorksScreen(date: _date(state.uri.queryParameters['date']))),
];

String? _date(String? v) => v != null && RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(v) ? v : null;
