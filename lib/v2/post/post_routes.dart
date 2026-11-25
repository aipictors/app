import 'package:aipictors/v2/post/my_posts_screen.dart';
import 'package:aipictors/v2/post/post_debug.dart';
import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:aipictors/v2/work/book_reader_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> postRoutes = [
  GoRoute(
    path: '/works/create',
    builder: (context, state) => PostFormScreen(
      generationNanoid: state.uri.queryParameters['generation'],
      eventSlug: state.uri.queryParameters['event'],
      initialTag: state.uri.queryParameters['tag'],
    ),
  ),
  GoRoute(path: '/works/create/text', builder: (context, state) => const PostFormScreen(workType: 'NOVEL')),
  GoRoute(path: '/works/create/video', builder: (context, state) => const PostFormScreen(workType: 'VIDEO')),
  GoRoute(path: '/works/:work/update', builder: (context, state) => PostFormScreen(workId: state.pathParameters['work'])),
  GoRoute(
    path: '/works/:work/reader',
    builder: (context, state) => BookReaderScreen(
      workId: state.pathParameters['work']!,
      title: state.uri.queryParameters['title'],
      args: state.extra is BookReaderArgs ? state.extra as BookReaderArgs : null,
    ),
  ),
  GoRoute(path: '/viewer/works', builder: (context, state) => const MyPostsScreen()),
  if (kDebugMode) ...postDebugRoutes,
];
