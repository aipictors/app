import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_controller.dart';
import 'package:aipictors/v2/generation/generation_sheets.dart';
import 'package:aipictors/v2/generation/model_picker.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/zoomable_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:share_plus/share_plus.dart';

/// 生成結果を全画面で見る（ピンチ・ダブルタップで拡大・左右で切り替え）
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
      if (mounted) context.toast(tr('画像を読み込めませんでした。もう一度お試しください', 'Could not load the image. Please try again.'), error: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _delete(GenResult r) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(tr('この画像を削除しますか？', 'Delete this image?')),
        content: Text(tr('削除した画像は元に戻せません', 'Deleted images cannot be restored')),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialog).pop(false), child: Text(tr('やめる', 'Cancel'))),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(dialog).colorScheme.error),
            onPressed: () => Navigator.of(dialog).pop(true),
            child: Text(tr('削除', 'Delete')),
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
    context.toast(tr('削除しました', 'Deleted'));
  }

  /// 不適切な画像を運営に報告する。送ったあとは削除もすすめる
  Future<void> _report(GenResult r) async {
    final sent = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _ReportSheet(result: r),
    );
    if (sent != true || !mounted) return;
    context.toast(tr('報告しました。運営が確認します', 'Reported. Our team will review it.'), icon: Icons.flag_rounded);
    await _delete(r);
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
      context.toast(next ? tr('保護しました', 'Protected') : tr('保護を外しました', 'Protection removed'), icon: Icons.shield_rounded);
    }
  }

  void _copyPrompt(GenResult r) {
    Clipboard.setData(ClipboardData(text: r.prompt));
    Ds.success();
    context.toast(tr('プロンプトをコピーしました', 'Prompt copied'), icon: Icons.copy_rounded);
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
                    onReport: r == null || (r.imageUrl ?? '').isEmpty ? null : () => _report(r),
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
                      onPost: r.nanoid == null ? null : () => context.push('/works/create?generation=${r.nanoid}'),
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

class _ZoomImage extends StatelessWidget {
  const _ZoomImage({required this.result, required this.onTap, required this.onZoomChanged});

  final GenResult result;
  final VoidCallback onTap;
  final ValueChanged<bool> onZoomChanged;

  @override
  Widget build(BuildContext context) {
    final r = result;
    return ZoomableImage(
      onTap: onTap,
      onZoomChanged: onZoomChanged,
      maxScale: 6,
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
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.title, required this.subtitle, required this.onClose, required this.onInfo, required this.onReport});

  final String title;
  final String subtitle;
  final VoidCallback onClose;
  final VoidCallback? onInfo;
  final VoidCallback? onReport;

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
              // 不適切な生成画像を運営に報告する（AI 生成コンテンツの報告）
              IconButton(
                onPressed: onReport,
                tooltip: tr('この画像を報告', 'Report this image'),
                icon: const Icon(Icons.flag_outlined, color: Colors.white),
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
    required this.onPost,
    required this.onReuse,
    required this.onDelete,
  });

  final GenResult result;
  final bool saving;
  final ValueChanged<int> onRate;
  final VoidCallback onShare;
  final VoidCallback onProtect;
  final VoidCallback onCopy;
  final VoidCallback? onPost;
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
                    _Action(icon: Icons.ios_share_rounded, label: tr('保存・共有', 'Save / share'), loading: saving, onTap: onShare),
                    _Action(
                      icon: r.isProtected ? Icons.shield_rounded : Icons.shield_outlined,
                      label: r.isProtected ? tr('保護中', 'Protected') : tr('保護', 'Protect'),
                      active: r.isProtected,
                      onTap: onProtect,
                    ),
                    _Action(icon: Icons.copy_rounded, label: tr('プロンプト', 'Prompt'), onTap: onCopy),
                    if (onPost != null) _Action(icon: Icons.upload_rounded, label: tr('投稿', 'Post'), onTap: onPost!),
                    _Action(icon: Icons.delete_outline_rounded, label: tr('削除', 'Delete'), onTap: onDelete),
                  ],
                ),
                const SizedBox(height: 12),
                GradientButton(label: tr('この設定で再生成', 'Regenerate with these settings'), icon: Icons.replay_rounded, height: 48, onPressed: onReuse),
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
      (tr('モデル', 'Model'), r.modelName.replaceAll(RegExp(r'\s*\[[0-9a-f]+\]$'), '')),
      (tr('種類', 'Type'), typeLabel(r.modelType)),
      (tr('サイズ', 'Size'), '${r.width > 0 ? r.width : size.width} × ${r.height > 0 ? r.height : size.height}${r.isHighRes ? tr('（高解像度）', ' (high-res)') : ''}'),
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
              Text(tr('生成の情報', 'Generation info'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 16),
              _block(context, tr('プロンプト', 'Prompt'), r.prompt),
              if (r.negativePrompt.isNotEmpty) _block(context, tr('ネガティブプロンプト', 'Negative prompt'), r.negativePrompt),
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
                    child: OutlinedButton.icon(onPressed: onCopy, icon: const Icon(Icons.copy_rounded), label: Text(tr('プロンプトをコピー', 'Copy prompt'))),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GradientButton(label: tr('この設定で再生成', 'Regenerate with these settings'), icon: Icons.replay_rounded, onPressed: onReuse),
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

/// 生成画像の報告（理由と詳細）
class _ReportSheet extends StatefulWidget {
  const _ReportSheet({required this.result});

  final GenResult result;

  @override
  State<_ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<_ReportSheet> {
  static List<(String, String)> get _reasons => [
        ('SEXUAL', tr('性的な内容', 'Sexual content')),
        ('MINOR', tr('子どもに見える人物の不適切な描写', 'Inappropriate depiction of a minor')),
        ('VIOLENCE', tr('暴力的・グロテスク', 'Violent or gory')),
        ('HATE', tr('差別・ヘイト', 'Hate or discrimination')),
        ('REAL_PERSON', tr('実在の人物', 'Real person')),
        ('ILLEGAL', tr('違法・危険な内容', 'Illegal or dangerous')),
        ('OTHER', tr('その他', 'Other')),
      ];

  String? _reason;
  final _detail = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _detail.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final reason = _reason;
    if (reason == null || _sending) return;
    setState(() => _sending = true);
    try {
      await GenApi.reportResult(nanoid: widget.result.nanoid, imageUrl: widget.result.imageUrl ?? '', reason: reason, detail: _detail.text.trim());
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr('この画像を報告', 'Report this image'), style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text(
                tr('意図しない不適切な画像ができたときは運営に知らせてください。生成の仕組みの改善に使います。', 'Let us know if an inappropriate image was generated. We use reports to improve generation.'),
                style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 13),
              ),
              const SizedBox(height: 8),
              RadioGroup<String>(
                groupValue: _reason,
                onChanged: (v) => setState(() => _reason = v),
                child: Column(
                  children: [
                    for (final (value, label) in _reasons) RadioListTile<String>(value: value, title: Text(label), contentPadding: EdgeInsets.zero, dense: true),
                  ],
                ),
              ),
              TextField(
                controller: _detail,
                maxLength: 500,
                maxLines: 3,
                minLines: 1,
                decoration: InputDecoration(hintText: tr('詳しい内容（任意）', 'Details (optional)'), border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _reason == null || _sending ? null : _send,
                  child: Text(_sending ? tr('送信中…', 'Sending…') : tr('報告する', 'Report')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
