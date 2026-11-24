import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/v2/generation/generation_reference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// /generation（?work=<id> は参照生成）。生成はタブなので、タブを切り替えてホームへ戻す
final List<RouteBase> generationRoutes = [
  GoRoute(
    path: '/generation',
    redirect: (context, state) {
      GenReference.request(state.uri.queryParameters['work'] ?? '');
      final container = ProviderScope.containerOf(context, listen: false);
      Future.microtask(() => container.read(homeTabIndexProvider.notifier).update(2));
      return '/';
    },
  ),
];
