import 'package:aipictors/v2/stickers/my_stickers_screen.dart';
import 'package:aipictors/v2/stickers/sticker_create_screen.dart';
import 'package:aipictors/v2/stickers/stickers_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> stickerRoutes = [
  GoRoute(path: '/stickers', builder: (context, state) => const StickersScreen()),
  GoRoute(path: '/stickers/:sticker', builder: (context, state) => StickerDetailScreen(id: state.pathParameters['sticker']!)),
  GoRoute(path: '/my/stickers', builder: (context, state) => const MyStickersScreen()),
  GoRoute(path: '/my/stickers/create', builder: (context, state) => const StickerCreateScreen()),
];
