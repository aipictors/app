import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_controller.dart';
import 'package:aipictors/v2/generation/generation_sheets.dart';
import 'package:aipictors/v2/generation/model_picker.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:share_plus/share_plus.dart';

/// 生成結果を全画面で見る（ピンチで拡大・左右で切り替え）
Future<void> openResultViewer(BuildContext context, {required GenController controller, required int initialIndex, required ValueChanged<GenResult> onReuse}) {
  return Navigator.of(context, rootNavigator: true).push(
    PageRouteBuilder(
      opaque: false,
      barrierColor: Colors.black,
      transitionDuration: Ds.normal,
      reverseTransitionDuration: Ds.fast,
      pageBuilder: (_, __, ___) => ResultViewer(controller: controller, initialIndex: initialIndex, onReuse: onReuse),
      transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
    ),
  );
}

class ResultViewer extends StatefulWidget {
  const ResultViewer({super.key, required this.controller, required this.initialIndex, required this.onReuse});

  final GenController controller;
  final int initialIndex;
  final ValueChanged<GenResult> onReuse;

  @override
  State<ResultViewer> createState() => _ResultViewerState();
}

class _ResultViewerState extends State<ResultViewer> {
  late final PageController _pages = PageController(initialPage: widget.initialIndex);
  late int _index = widget.initialIndex;
  bool _chrome = true;
  bool _zoomed = false;
  bool _saving = false;

  GenController get c => widget.controller;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  GenResult? get _current => (_index >= 0 && _index < c.results.length) ? c.results[_index] : null;

  Future<void> _share(GenResult r) async {
    final url = r.imageUrl ?? r.thumbnailUrl;
    if (url == null) return;
    setState(() => _saving = true);
    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      if (!mounted) return;
      final box = context.findRenderObject() as RenderBox?;
      await Share.shareXFiles([
        XFile(file.path, mimeType: 'image/png', name: '${r.nanoid ?? r.id}.png'),
      ], sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size);
    } catch (_) {
      if (mounted) context.toast('画像を読み込めませんでした。もう一度お試しください', error: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _delete(GenResult r) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('この画像を削除しますか？'),
        content: const Text('削除した画像は元に戻せません'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialog).pop(false), child: const Text('やめる')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(dialog).colorScheme.error),
            onPressed: () => Navigator.of(dialog).pop(true),
            child: const Text('削除'),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final error = await c.delete(r);
    if (!mounted) return;
    if (error != null) {
      context.toast(error, error: true);
      return;
    }
    Ds.success();
    if (c.results.isEmpty) {
      Navigator.of(context).pop();
      return;
    }
    setState(() => _index = _index.clamp(0, c.results.length - 1));
    context.toast('削除しました');
  }

  Future<void> _rate(GenResult r, int value) async {
    Ds.tap();
    final error = await c.setRating(r, r.rating == value ? 0 : value);
    if (error != null && mounted) context.toast(error, error: true);
  }

  Future<void> _protect(GenResult r) async {
    Ds.impact();
    final next = !r.isProtected;
    final error = await c.setProtected(r, next);
    if (!mounted) return;
    if (error != null) {
      context.toast(error, error: true);
    } else {
      context.toast(next ? '保護しました' : '保護を外しました', icon: Icons.shield_rounded);
    }
  }

  void _copyPrompt(GenResult r) {
    Clipboard.setData(ClipboardData(text: r.prompt));
    Ds.success();
    context.toast('プロンプトをコピーしました', icon: Icons.copy_rounded);
  }

  void _reuse(GenResult r) {
    Ds.success();
    Navigator.of(context).pop();
    widget.onReuse(r);
  }

  void _showInfo(GenResult r) {
    showGenSheet(
      context,
      expand: true,
      initialSize: 0.6,
      builder: (sheet) => _InfoSheet(
        result: r,
        onCopy: () => _copyPrompt(r),
        onReuse: () {
          Navigator.of(sheet).pop();
          _reuse(r);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        final r = _current;
        return Theme(
          data: ThemeData.dark(useMaterial3: true).copyWith(colorScheme: Theme.of(context).colorScheme.copyWith(brightness: Brightness.dark)),
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                PageView.builder(
                  controller: _pages,
                  physics: _zoomed ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(),
                  itemCount: c.results.length,
                  onPageChanged: (i) {
                    Ds.tap();
                    setState(() => _index = i);
                    if (i >= c.results.length - 3) c.loadMoreHistory();
                  },
                  itemBuilder: (context, i) => _ZoomImage(
                    result: c.results[i],
                    onTap: () => setState(() => _chrome = !_chrome),
                    onZoomChanged: (z) {
                      if (z != _zoomed) setState(() => _zoomed = z);
                    },
                  ),
                ),
                // 上のバー
                AnimatedPositioned(
                  duration: Ds.normal,
                  curve: Ds.curve,
                  left: 0,
                  right: 0,
                  top: _chrome ? 0 : -120,
                  child: _TopBar(
                    title: c.results.isEmpty ? '' : '${_index + 1} / ${c.results.length}',
                    subtitle: r == null ? '' : relativeTime(r.completedAt),
                    onClose: () => Navigator.of(context).pop(),
                    onInfo: r == null ? null : () => _showInfo(r),
                  ),
                ),
                // 下の操作
                if (r != null)
                  AnimatedPositioned(
                    duration: Ds.normal,
                    curve: Ds.curve,
                    left: 0,
                    right: 0,
                    bottom: _chrome ? 0 : -260,
                    child: _BottomBar(
                      result: r,
                      saving: _saving,
                      onRate: (v) => _rate(r, v),
                      onShare: () => _share(r),
                      onProtect: () => _protect(r),
                      onCopy: () => _copyPrompt(r),
                      onReuse: () => _reuse(r),
                      onDelete: () => _delete(r),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ZoomImage extends StatefulWidget {
  const _ZoomImage({required this.result, required this.onTap, required this.onZoomChanged});

  final GenResult result;
  final VoidCallback onTap;
  final ValueChanged<bool> onZoomChanged;

  @override
  State<_ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<_ZoomImage> with SingleTickerProviderStateMixin {
  final _transform = TransformationController();
  late final AnimationController _anim = AnimationController(vsync: this, duration: Ds.normal);
  Animation<Matrix4>? _tween;
  TapDownDetails? _doubleTap;

  @override
  void initState() {
    super.initState();
    _anim.addListener(() {
      if (_tween != null) _transform.value = _tween!.value;
    });
    _transform.addListener(() => widget.onZoomChanged(_transform.value.getMaxScaleOnAxis() > 1.01));
  }

  @override
  void dispose() {
    _transform.dispose();
    _anim.dispose();
    super.dispose();
  }

  void _toggleZoom() {
    final zoomed = _transform.value.getMaxScaleOnAxis() > 1.01;
    final pos = _doubleTap?.localPosition ?? Offset.zero;
    final end = zoomed
        ? Matrix4.identity()
        : (Matrix4.identity()
            ..translateByDouble(-pos.dx * 1.5, -pos.dy * 1.5, 0, 1)
            ..scaleByDouble(2.5, 2.5, 1, 1));
    _tween = Matrix4Tween(begin: _transform.value, end: end).animate(CurvedAnimation(parent: _anim, curve: Ds.curve));
    _anim.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.result;
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTapDown: (d) => _doubleTap = d,
      onDoubleTap: _toggleZoom,
      child: InteractiveViewer(
        transformationController: _transform,
        minScale: 1,
        maxScale: 6,
        child: SizedBox.expand(
          child: Hero(
            tag: 'gen-${r.id}',
            child: Stack(
              fit: StackFit.expand,
              children: [
                // まずサムネイル、あとから元画像
                AppImage(r.thumbnailUrl, fit: BoxFit.contain),
                if (r.imageUrl != null) AppImage(r.imageUrl, fit: BoxFit.contain),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.title, required this.subtitle, required this.onClose, required this.onInfo});

  final String title;
  final String subtitle;
  final VoidCallback onClose;
  final VoidCallback? onInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xCC000000), Colors.transparent]),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 20),
          child: Row(
            children: [
              IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close_rounded, color: Colors.white),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                    if (subtitle.isNotEmpty) Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 11)),
                  ],
                ),
              ),
              IconButton(
                onPressed: onInfo,
                icon: const Icon(Icons.info_outline_rounded, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.result,
    required this.saving,
    required this.onRate,
    required this.onShare,
    required this.onProtect,
    required this.onCopy,
    required this.onReuse,
    required this.onDelete,
  });

  final GenResult result;
  final bool saving;
  final ValueChanged<int> onRate;
  final VoidCallback onShare;
  final VoidCallback onProtect;
  final VoidCallback onCopy;
  final VoidCallback onReuse;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final r = result;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xE6000000), Color(0x99000000), Colors.transparent]),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 36, 16, 8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // お気に入り度
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 1; i <= 5; i++)
                      GestureDetector(
                        onTap: () => onRate(i),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: AnimatedScale(
                            scale: r.rating >= i ? 1.1 : 1,
                            duration: Ds.fast,
                            child: Icon(
                              r.rating >= i ? Icons.star_rounded : Icons.star_outline_rounded,
                              size: 30,
                              color: r.rating >= i ? Ds.gold : Colors.white70,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Action(icon: Icons.ios_share_rounded, label: '保存・共有', loading: saving, onTap: onShare),
                    _Action(
                      icon: r.isProtected ? Icons.shield_rounded : Icons.shield_outlined,
                      label: r.isProtected ? '保護中' : '保護',
                      active: r.isProtected,
                      onTap: onProtect,
                    ),
                    _Action(icon: Icons.copy_rounded, label: 'プロンプト', onTap: onCopy),
                    _Action(icon: Icons.delete_outline_rounded, label: '削除', onTap: onDelete),
                  ],
                ),
                const SizedBox(height: 12),
                GradientButton(label: 'この設定で再生成', icon: Icons.replay_rounded, height: 48, onPressed: onReuse),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({required this.icon, required this.label, required this.onTap, this.active = false, this.loading = false});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool active;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: loading ? null : onTap,
      child: SizedBox(
        width: 72,
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(shape: BoxShape.circle, color: active ? Ds.blue : Colors.white.withValues(alpha: 0.14)),
              child: loading
                  ? const Padding(
                      padding: EdgeInsets.all(14),
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSheet extends StatelessWidget {
  const _InfoSheet({required this.result, required this.onCopy, required this.onReuse});

  final GenResult result;
  final VoidCallback onCopy;
  final VoidCallback onReuse;

  @override
  Widget build(BuildContext context) {
    final r = result;
    final size = GenSize.parse(r.sizeType);
    final rows = <(String, String)>[
      ('モデル', r.modelName.replaceAll(RegExp(r'\s*\[[0-9a-f]+\]$'), '')),
      ('種類', typeLabel(r.modelType)),
      ('サイズ', '${r.width > 0 ? r.width : size.width} × ${r.height > 0 ? r.height : size.height}${r.isHighRes ? '（高解像度）' : ''}'),
      ('Steps', '${r.steps}'),
      ('Scale', '${r.scale}'),
      ('Sampler', r.sampler),
      ('Seed', '${r.seed}'),
      ('Clip Skip', '${r.clipSkip}'),
      if (r.vae != null && r.vae!.isNotEmpty) ('VAE', r.vae!),
    ];
    return Column(
      children: [
        const SheetHandle(),
        Expanded(
          child: ListView(
            controller: PrimaryScrollController.of(context),
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              Text('生成の情報', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 16),
              _block(context, 'プロンプト', r.prompt),
              if (r.negativePrompt.isNotEmpty) _block(context, 'ネガティブプロンプト', r.negativePrompt),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.6), borderRadius: Ds.br(16)),
                child: Column(
                  children: [
                    for (final row in rows)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90,
                              child: Text(row.$1, style: TextStyle(color: context.muted, fontSize: 13)),
                            ),
                            Expanded(
                              child: SelectableText(row.$2, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(onPressed: onCopy, icon: const Icon(Icons.copy_rounded), label: const Text('プロンプトをコピー')),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GradientButton(label: 'この設定で再生成', icon: Icons.replay_rounded, onPressed: onReuse),
            ],
          ),
        ),
      ],
    );
  }

  Widget _block(BuildContext context, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.6), borderRadius: Ds.br(14)),
            child: SelectableText(body, style: const TextStyle(height: 1.5)),
          ),
        ],
      ),
    );
  }
}
