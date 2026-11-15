import 'package:aipictors/v2/user/user_list_screen.dart';
import 'package:go_router/go_router.dart';

/// フォロー中・フォロワーの一覧（旧画面は名前だけを並べていた）
final List<RouteBase> userRoutes = [
  GoRoute(
    path: '/users/:user/followees',
    builder: (context, state) => UserListScreen(userId: state.pathParameters['user'] ?? ''),
  ),
  GoRoute(
    path: '/users/:user/followers',
    builder: (context, state) => UserListScreen(userId: state.pathParameters['user'] ?? '', initialIndex: 1),
  ),
];
