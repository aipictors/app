import 'package:aipictors/v2/debug/widget_gallery_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

/// デバッグビルドだけの画面（--dart-define=debugRoute=/debug/widgets で開ける）
final List<RouteBase> debugRoutes = [
  if (kDebugMode) GoRoute(path: '/debug/widgets', builder: (context, state) => const WidgetGalleryScreen()),
];
