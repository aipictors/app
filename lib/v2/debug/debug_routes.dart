import 'package:aipictors/v2/debug/widget_gallery_screen.dart';
import 'package:aipictors/v2/plans/coin_shop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// デバッグビルドだけの画面（--dart-define=debugRoute=/debug/widgets で開ける）
final List<RouteBase> debugRoutes = [
  if (kDebugMode) GoRoute(path: '/debug/widgets', builder: (context, state) => const WidgetGalleryScreen()),
  // コインを買うシートの見た目を確かめる（審査用の画面の撮影にも使う）
  if (kDebugMode) GoRoute(path: '/debug/coins', builder: (context, state) => const _CoinShopPreview()),
];

class _CoinShopPreview extends StatefulWidget {
  const _CoinShopPreview();

  @override
  State<_CoinShopPreview> createState() => _CoinShopPreviewState();
}

class _CoinShopPreviewState extends State<_CoinShopPreview> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showCoinShopSheet(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('コインを買う')), body: const SizedBox.shrink());
  }
}
