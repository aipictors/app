import 'package:aipictors/v2/my/my_api.dart';
import 'package:aipictors/v2/my/my_screens.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> myRoutes = [
  GoRoute(
    path: '/my/likes',
    builder: (_, __) => const MyCollectionScreen(kind: MyCollectionKind.likes),
  ),
  GoRoute(
    path: '/my/bookmarks',
    builder: (_, __) => const MyCollectionScreen(kind: MyCollectionKind.bookmarks),
  ),
  GoRoute(
    path: '/my/views',
    builder: (_, __) => const MyCollectionScreen(kind: MyCollectionKind.views),
  ),
  GoRoute(path: '/my/recommended', builder: (_, __) => const MyCollectionScreen(kind: MyCollectionKind.recommended)),
  GoRoute(path: '/my/histories', builder: (_, __) => const MyHistoriesScreen()),
  GoRoute(path: '/my/reports', builder: (_, __) => const MyReportsScreen()),
  // 旧画面の置き換え
  GoRoute(
    path: '/viewer/likes',
    builder: (_, __) => const MyCollectionScreen(kind: MyCollectionKind.likes),
  ),
];
