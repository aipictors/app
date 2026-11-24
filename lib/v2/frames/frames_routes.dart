import 'package:aipictors/v2/frames/frame_studio_screen.dart';
import 'package:aipictors/v2/frames/gacha_rates_screen.dart';
import 'package:aipictors/v2/frames/gacha_screen.dart';
import 'package:go_router/go_router.dart';

/// 枠のガチャ（Web の /gacha・/gacha/rates）と枠を選ぶ画面
final List<RouteBase> framesRoutes = [
  GoRoute(path: '/gacha', builder: (_, __) => const GachaScreen()),
  GoRoute(path: '/gacha/rates', builder: (_, __) => const GachaRatesScreen()),
  GoRoute(path: '/settings/frames', builder: (_, state) => FrameStudioScreen(initialTab: state.uri.queryParameters['tab'] == 'header' ? 1 : 0)),
];
