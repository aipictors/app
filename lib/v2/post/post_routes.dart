import 'package:aipictors/v2/post/my_posts_screen.dart';
import 'package:aipictors/v2/post/post_debug.dart';
import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> postRoutes = [
  GoRoute(path: '/works/create', builder: (context, state) => PostFormScreen(generationNanoid: state.uri.queryParameters['generation'])),
  GoRoute(path: '/works/create/text', builder: (context, state) => const PostFormScreen(workType: 'NOVEL')),
  GoRoute(path: '/works/:work/update', builder: (context, state) => PostFormScreen(workId: state.pathParameters['work'])),
  GoRoute(path: '/viewer/works', builder: (context, state) => const MyPostsScreen()),
  if (kDebugMode) ...postDebugRoutes,
];
