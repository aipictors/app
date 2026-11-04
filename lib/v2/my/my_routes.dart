import 'package:aipictors/v2/my/my_api.dart';
import 'package:aipictors/v2/my/my_screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> myRoutes = [
  GoRoute(
    path: '/my/likes',
    builder: (_, __) => const MyWorksScreen(title: 'いいねした作品', fetch: MyApi.likes, emptyTitle: 'いいねした作品はありません', emptyIcon: Icons.favorite_border_rounded),
  ),
  GoRoute(
    path: '/my/bookmarks',
    builder: (_, __) => const MyWorksScreen(title: 'ブックマーク', fetch: MyApi.bookmarks, emptyTitle: 'ブックマークした作品はありません', emptyIcon: Icons.bookmark_border_rounded),
  ),
  GoRoute(
    path: '/my/views',
    builder: (_, __) => const MyWorksScreen(title: '閲覧履歴', fetch: MyApi.views, emptyTitle: '閲覧した作品はありません', emptyIcon: Icons.history_rounded),
  ),
  GoRoute(path: '/my/folders', builder: (_, __) => const MyFoldersScreen()),
  GoRoute(path: '/my/histories', builder: (_, __) => const MyHistoriesScreen()),
  GoRoute(path: '/my/reports', builder: (_, __) => const MyReportsScreen()),
  GoRoute(path: '/folders/:folder', builder: (_, state) => FolderWorksScreen(folderId: state.pathParameters['folder']!)),
  // 旧画面の置き換え
  GoRoute(
    path: '/viewer/likes',
    builder: (_, __) => const MyWorksScreen(title: 'いいねした作品', fetch: MyApi.likes, emptyTitle: 'いいねした作品はありません', emptyIcon: Icons.favorite_border_rounded),
  ),
  GoRoute(path: '/viewer/folders', builder: (_, __) => const MyFoldersScreen()),
];
