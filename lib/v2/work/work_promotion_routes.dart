import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/work/work_promotion.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 宣伝のシートの見本（デバッグビルドだけ）。/tmp/aipictors-debug の 2 行目で状態を選ぶ:
/// available（既定）/ short（コイン不足）/ this（この作品が宣伝中）/ other（別の作品が枠を使用中）
final List<RouteBase> workPromotionRoutes = [
  if (kDebugMode) GoRoute(path: '/debug/promotion', builder: (context, state) => const _PromotionPreview()),
];

class _PromotionPreview extends StatefulWidget {
  const _PromotionPreview();

  @override
  State<_PromotionPreview> createState() => _PromotionPreviewState();
}

class _PromotionPreviewState extends State<_PromotionPreview> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _open());
  }

  void _open() {
    final endsAt = workPromotionEndsAt(DateTime.now(), 3);
    final kind = DebugBoot.screenTab ?? 'available';
    final active = switch (kind) {
      'this' => [ActiveWorkPromotion(slot: WorkPromotionSlot.general, workId: '1', endsAt: endsAt)],
      'other' => [ActiveWorkPromotion(slot: WorkPromotionSlot.general, workId: '2', endsAt: endsAt)],
      _ => <ActiveWorkPromotion>[],
    };
    showWorkPromotionSheet(
      context,
      workId: '1',
      title: '夕焼けの丘',
      userName: 'あいぴく',
      sample: WorkPromotionSample(
        status: WorkPromotionStatus(plan: const WorkPromotionPlan(), active: active),
        balance: CoinSummary(free: 120, premium: kind == 'short' ? 200 : 1200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('宣伝のシート')), body: Center(child: FilledButton(onPressed: _open, child: const Text('開く'))));
}
