import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_controller.dart';
import 'package:aipictors/v2/generation/result_viewer.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// 生成履歴（生成中のカード＋結果の一覧）
class GenerationHistory extends StatefulWidget {
  const GenerationHistory({super.key, required this.controller, required this.onReuse, this.bottomPadding = 24});

  final GenController controller;

  /// 「この設定で再生成」
  final ValueChanged<GenResult> onReuse;
  final double bottomPadding;

  @override
  State<GenerationHistory> createState() => _GenerationHistoryState();
}

class _GenerationHistoryState extends State<GenerationHistory> {
  final _scroll = ScrollController();

  GenController get c => widget.controller;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.extentAfter < 800) c.loadMoreHistory();
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ListenableBuilder(
        listenable: c,
        builder: (context, _) {
          final width = constraints.maxWidth;
          final columns = width >= 1000
              ? 5
              : width >= 700
              ? 4
              : width >= 480
              ? 3
              : 2;
          final busy = [if (c.sendingCount > 0) null, ...c.running];
          final isEmpty = busy.isEmpty && c.results.isEmpty;
          return RefreshIndicator.adaptive(
            onRefresh: c.refreshAll,
            child: CustomScrollView(
              controller: _scroll,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                if (c.historyLoading && isEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.all(12),
                    sliver: SliverMasonryGrid.count(
                      crossAxisCount: columns,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childCount: 8,
                      itemBuilder: (_, i) => Skeleton(height: i.isEven ? 220 : 170, radius: 16),
                    ),
                  )
                else if (c.historyError != null && isEmpty)
                  SliverFillRemaining(hasScrollBody: false, child: StateView.error(c.historyError!, onRetry: c.refreshHistory))
                else if (isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: StateView(icon: Icons.photo_library_outlined, title: 'まだ生成した画像はありません', message: '「つくる」からプロンプトを書いて、最初の 1 枚を生成してみましょう'),
                  )
                else ...[
                  if (busy.isNotEmpty)
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      sliver: SliverMasonryGrid.count(
                        crossAxisCount: columns,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childCount: busy.length,
                        itemBuilder: (context, i) {
                          final t = busy[i];
                          if (t == null) return const GeneratingCard(task: null, progress: null);
                          if (t.isError) return _ErrorCard(task: t, onReuse: () => widget.onReuse(t));
                          return GeneratingCard(task: t, progress: t.nanoid == null ? null : c.progress[t.nanoid]);
                        },
                      ),
                    ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    sliver: SliverMasonryGrid.count(
                      crossAxisCount: columns,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childCount: c.results.length,
                      itemBuilder: (context, i) {
                        final r = c.results[i];
                        return ResultTile(
                          result: r,
                          onTap: () => openResultViewer(context, controller: c, initialIndex: i, onReuse: widget.onReuse),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: widget.bottomPadding),
                      child: Center(
                        child: c.historyLoadingMore
                            ? const CircularProgressIndicator.adaptive()
                            : c.historyError != null
                            ? TextButton.icon(onPressed: c.loadMoreHistory, icon: const Icon(Icons.refresh_rounded), label: const Text('続きを読み込む'))
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

/// 生成済みの画像のタイル
class ResultTile extends StatelessWidget {
  const ResultTile({super.key, required this.result, required this.onTap, this.height});

  final GenResult result;
  final VoidCallback onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final r = result;
    final image = Stack(
      fit: StackFit.expand,
      children: [
        Hero(tag: 'gen-${r.id}', child: AppImage(r.thumbnailUrl ?? r.imageUrl, memCacheWidth: 500)),
        Positioned(
          left: 6,
          top: 6,
          child: Wrap(
            spacing: 4,
            children: [
              if (r.isHighRes) const Badge2('高解像度', color: Color(0xCCE2A21B)),
              if (r.isProtected) const Badge2('保護', icon: Icons.shield_rounded),
            ],
          ),
        ),
        if (r.rating > 0) Positioned(right: 6, bottom: 6, child: Badge2('${r.rating}', icon: Icons.star_rounded)),
      ],
    );
    return Pressable(
      onTap: onTap,
      scale: 0.97,
      child: ClipRRect(
        borderRadius: Ds.br(16),
        child: height != null ? SizedBox(height: height, child: image) : AspectRatio(aspectRatio: r.aspect.clamp(0.4, 2.5), child: image),
      ),
    );
  }
}

/// 生成中のカード（虹色の枠・途中経過の画像・進み具合）
class GeneratingCard extends StatefulWidget {
  const GeneratingCard({super.key, required this.task, required this.progress, this.height});

  /// null は送信中
  final GenResult? task;
  final GenProgress? progress;
  final double? height;

  @override
  State<GeneratingCard> createState() => _GeneratingCardState();
}

class _GeneratingCardState extends State<GeneratingCard> with SingleTickerProviderStateMixin {
  late final AnimationController _spin = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
  final DateTime _started = DateTime.now();
  String? _previewSrc;
  Uint8List? _previewBytes;

  @override
  void dispose() {
    _spin.dispose();
    super.dispose();
  }

  Uint8List? _decodePreview(String? src) {
    if (src == null) return _previewBytes;
    if (src == _previewSrc) return _previewBytes;
    final comma = src.indexOf(',');
    if (comma < 0) return _previewBytes;
    try {
      _previewBytes = base64Decode(src.substring(comma + 1));
      _previewSrc = src;
    } catch (_) {}
    return _previewBytes;
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.task;
    final p = widget.progress;
    final aspect = (t?.aspect ?? 2 / 3).clamp(0.4, 2.5);
    final preview = _decodePreview(p?.preview);

    // 途中経過が取れないときは予想秒数から目安を出す
    double? value;
    String label;
    if (t == null) {
      value = 0.04;
      label = '送信中…';
    } else if (t.status == 'RESERVED') {
      value = 0.02;
      label = '予約済み・順番を待っています';
    } else if (p != null && p.state == 'active') {
      value = math.max(0.05, p.progress);
      label = '生成中 ${(value * 100).round()}%';
    } else if (p != null && p.state == 'completed') {
      value = 1;
      label = '仕上げ中…';
    } else if (p != null && p.state == 'queued') {
      value = 0.03;
      label = p.queuePosition != null ? '順番待ち（${p.queuePosition}番目）' : '順番待ち';
    } else if (t.status == 'PENDING') {
      // まだ GPU に届いていない（混み具合の待ち）
      value = null;
      label = '順番を待っています';
    } else {
      final est = (t.estimatedSeconds ?? 0) > 0 ? t.estimatedSeconds! : 25;
      final elapsed = DateTime.now().difference(_started).inSeconds;
      value = (elapsed / est).clamp(0.03, 0.9);
      label = '生成を準備しています';
    }
    final count = t?.count ?? 1;

    final card = AnimatedBuilder(
      animation: _spin,
      builder: (context, child) => Container(
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          borderRadius: Ds.br(18),
          gradient: SweepGradient(
            transform: GradientRotation(_spin.value * 2 * math.pi),
            colors: const [Color(0xFF0170C8), Color(0xFF6D5DF6), Color(0xFFFF5C8A), Color(0xFFE2A21B), Color(0xFF3BA7F5), Color(0xFF0170C8)],
          ),
        ),
        child: child,
      ),
      child: ClipRRect(
        borderRadius: Ds.br(15.5),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: context.skeleton),
            if (preview != null) Image.memory(preview, fit: BoxFit.cover, gaplessPlayback: true) else const Skeleton(radius: 0),
            // 下に向かって暗く
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.transparent, Color(0x99000000)],
                ),
              ),
            ),
            Center(
              child: preview == null
                  ? ShaderMask(
                      shaderCallback: (r) => Ds.brandGradient.createShader(r),
                      child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 36),
                    )
                  : const SizedBox.shrink(),
            ),
            if (count > 1) Positioned(right: 8, top: 8, child: Badge2('×$count', icon: Icons.burst_mode_rounded)),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 12.5,
                      shadows: [Shadow(blurRadius: 6, color: Colors.black54)],
                    ),
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: Ds.br(4),
                    child: value == null
                        ? LinearProgressIndicator(
                            minHeight: 5,
                            backgroundColor: Colors.white.withValues(alpha: 0.25),
                            valueColor: const AlwaysStoppedAnimation(Colors.white),
                          )
                        : TweenAnimationBuilder<double>(
                            tween: Tween(end: value),
                            duration: const Duration(milliseconds: 900),
                            curve: Curves.easeOut,
                            builder: (context, v, _) => LinearProgressIndicator(
                              value: v,
                              minHeight: 5,
                              backgroundColor: Colors.white.withValues(alpha: 0.25),
                              valueColor: const AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    if (widget.height != null) return SizedBox(height: widget.height, child: card);
    return AspectRatio(aspectRatio: aspect, child: card);
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.task, required this.onReuse});

  final GenResult task;
  final VoidCallback onReuse;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: task.aspect.clamp(0.6, 1.6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.cs.error.withValues(alpha: 0.08),
          borderRadius: Ds.br(16),
          border: Border.all(color: context.cs.error.withValues(alpha: 0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded, color: context.cs.error),
            const SizedBox(height: 6),
            Text(
              task.status == 'CANCELED' ? 'キャンセルされました' : '生成に失敗しました',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
            const SizedBox(height: 8),
            TextButton(onPressed: onReuse, child: const Text('設定を使う')),
          ],
        ),
      ),
    );
  }
}
