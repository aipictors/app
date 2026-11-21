import 'package:aipictors/features/login/functions/is_initialized_user_profile.dart';
import 'package:aipictors/features/login/functions/login_with_apple.dart';
import 'package:aipictors/features/login/functions/login_with_google.dart';
import 'package:aipictors/utils/to_exception_message.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

const _welcomeWorksQuery = '''
query AppWelcomeWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) {
    $workCardFields
  }
  hotWorks(where: { isSensitive: false }) {
    $workCardFields
  }
}''';

/// ログインしていないときにアプリを開くと出る最初の画面。
/// 作品が縦にゆっくり流れる石垣の上に、ログインの入口を重ねる。ログインせずに見ることもできる
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.onSkip});

  /// 「ログインせずに見てみる」
  final VoidCallback onSkip;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<WorkSummary> _works = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(_welcomeWorksQuery, variables: {
        'offset': 0,
        'limit': 48,
        // 最初に見る画面なので全年齢だけ
        'where': {'isRecommended': true, 'sort': 'DESC', 'ratings': ['G']},
      }, cacheFor: const Duration(minutes: 10));
      final seen = <String>{};
      final works = [
        ...WorkSummary.listFrom(data.list('works')),
        ...WorkSummary.listFrom(data.list('hotWorks')).where((w) => w.rating == 'G'),
      ].where((w) => w.imageUrl.isNotEmpty && seen.add(w.id)).toList();
      if (!mounted) return;
      setState(() => _works = works);
    } catch (_) {
      // 取れなくても背景のグラデだけで出す
    }
  }

  Future<void> _login(Future<void> Function() login, String method) async {
    final navigator = Navigator.of(context, rootNavigator: true);
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    showDialog<void>(context: context, barrierDismissible: false, builder: (_) => const LoadingProgress());
    var initialized = true;
    var ok = false;
    try {
      await login();
      ok = true;
      initialized = await isInitializedUserProfile();
      FirebaseAnalytics.instance.logLogin(loginMethod: method);
    } catch (exception) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(toExceptionMessage(exception))));
    }
    if (navigator.canPop()) navigator.pop();
    if (!ok) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(tr('ログインしました', 'Logged in'))));
    if (!initialized) router.push('/profile/setup');
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final bg = dark ? const Color(0xFF14111F) : const Color(0xFFF3EEFB);
    final ink = dark ? Colors.white : const Color(0xFF1F1A2E);
    final isIOS = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          // 作品の石垣（見出しの下から画面の下まで）
          Positioned.fill(
            top: MediaQuery.paddingOf(context).top + 150,
            child: _WorksWall(works: _works, background: bg),
          ),
          // 上のふんわりした紫
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.paddingOf(context).top + 190,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.alphaBlend(Ds.purple.withValues(alpha: dark ? 0.22 : 0.12), bg),
                    bg,
                    bg.withValues(alpha: 0),
                  ],
                  stops: const [0, 0.75, 1],
                ),
              ),
            ),
          ),
          // 見出し
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: _Headline(ink: ink),
              ),
            ),
          ),
          // 下のボタン（後ろの作品が透けすぎないように下をぼかす）
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [bg.withValues(alpha: 0), bg.withValues(alpha: 0.85), bg],
                  stops: const [0, 0.35, 1],
                ),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(28, 72, 28, bottomInset + 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _ContinueButton(
                          icon: Icon(Icons.mail_outline_rounded, color: ink, size: 24),
                          label: tr('メールで続ける', 'Continue with email'),
                          onTap: () => context.push('/login'),
                        ),
                        const SizedBox(height: 12),
                        _ContinueButton(
                          icon: const _GoogleMark(),
                          label: tr('Googleで続ける', 'Continue with Google'),
                          onTap: () => _login(() async => await loginWithGoogle(), 'google'),
                        ),
                        if (isIOS) ...[
                          const SizedBox(height: 12),
                          _ContinueButton(
                            icon: Icon(Icons.apple, color: dark ? Colors.black : Colors.white, size: 26),
                            label: tr('Appleで続ける', 'Continue with Apple'),
                            filled: true,
                            onTap: () => _login(() async => await loginWithApple(), 'apple'),
                          ),
                        ],
                        const SizedBox(height: 6),
                        TextButton(
                          onPressed: widget.onSkip,
                          style: TextButton.styleFrom(foregroundColor: ink.withValues(alpha: 0.7)),
                          child: Text(
                            tr('ログインせずに見てみる', 'Browse without logging in'),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({required this.ink});

  final Color ink;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 26, height: 1.45, fontWeight: FontWeight.w800, color: ink, letterSpacing: 0.5);
    final accent = ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (r) => const LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFFC026D3)]).createShader(r),
      child: Text(tr('イラスト', 'illustrations'), style: style),
    );
    if (!L10n.isJa) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Create the', style: style),
          Row(mainAxisSize: MainAxisSize.min, children: [accent, Text(' you imagine', style: style)]),
          Text('in seconds', style: style),
        ],
      );
    }
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [Text('思い通りの', style: style), accent, Text('を', style: style)]),
          Text('かんたんにつくれる', style: style),
        ],
      ),
    );
  }
}

/// 白い丸いボタン（Apple だけ黒）
class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.icon, required this.label, required this.onTap, this.filled = false});

  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    // ダークでは白黒を入れ替える（Apple のボタンの決まりと同じ）
    final solid = filled != dark;
    final bg = solid ? const Color(0xFF26222E) : Colors.white;
    final fg = solid ? Colors.white : const Color(0xFF1F1A2E);
    return Pressable(
      onTap: () {
        Ds.tap();
        onTap();
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: Ds.br(28),
          border: solid ? null : Border.all(color: Colors.black.withValues(alpha: 0.08)),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.10), blurRadius: 16, offset: const Offset(0, 4))],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            SizedBox(width: 28, child: Center(child: icon)),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: fg, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 28),
          ],
        ),
      ),
    );
  }
}

/// Google の「G」（4 色）
class _GoogleMark extends StatelessWidget {
  const _GoogleMark();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 22, height: 22, child: CustomPaint(painter: _GooglePainter()));
  }
}

class _GooglePainter extends CustomPainter {
  const _GooglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final stroke = s * 0.2;
    final rect = Rect.fromLTWH(stroke / 2, stroke / 2, s - stroke, s - stroke);
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    const deg = 3.14159265 / 180;
    // 右上の切れ目から時計回りに 赤・黄・緑・青
    canvas.drawArc(rect, -45 * deg, -90 * deg, false, p..color = const Color(0xFFEA4335));
    canvas.drawArc(rect, -135 * deg, -90 * deg, false, p..color = const Color(0xFFFBBC05));
    canvas.drawArc(rect, 135 * deg, -90 * deg, false, p..color = const Color(0xFF34A853));
    canvas.drawArc(rect, 45 * deg, -45 * deg, false, p..color = const Color(0xFF4285F4));
    // 横棒
    canvas.drawRect(
      Rect.fromLTWH(s / 2, s / 2 - stroke / 2, s / 2, stroke),
      Paint()..color = const Color(0xFF4285F4),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 作品が縦に流れる列を横に並べる（端の列は画面からはみ出させる）
class _WorksWall extends StatefulWidget {
  const _WorksWall({required this.works, required this.background});

  final List<WorkSummary> works;
  final Color background;

  @override
  State<_WorksWall> createState() => _WorksWallState();
}

class _WorksWallState extends State<_WorksWall> with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  final _elapsed = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((d) => _elapsed.value = d.inMicroseconds / 1e6)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _elapsed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    return LayoutBuilder(builder: (context, c) {
      const gap = 10.0;
      // スマホでは 3 列ぶん＋両端に少し見える列。iPad では列を増やす
      final visible = (c.maxWidth / 170).clamp(3.0, 7.0).floorToDouble();
      final colWidth = (c.maxWidth - gap * (visible - 1)) / (visible + 0.5);
      final count = visible.toInt() + 2;
      final totalWidth = count * colWidth + (count - 1) * gap;
      final left = (c.maxWidth - totalWidth) / 2;
      return ClipRect(
        child: Stack(
          children: [
            for (var i = 0; i < count; i++)
              Positioned(
                left: left + i * (colWidth + gap),
                top: 0,
                bottom: 0,
                width: colWidth,
                child: _WallColumn(
                  works: _columnWorks(i, count),
                  width: colWidth,
                  gap: gap,
                  // 列ごとに向きと速さを変える
                  speed: reduceMotion ? 0 : (i.isEven ? 1 : -1) * (14.0 + (i % 3) * 4),
                  startOffset: i * 97.0,
                  elapsed: _elapsed,
                ),
              ),
          ],
        ),
      );
    });
  }

  List<WorkSummary> _columnWorks(int column, int count) {
    final all = widget.works;
    if (all.isEmpty) return const [];
    final mine = [for (var j = column; j < all.length; j += count) all[j]];
    // 作品が少ないときは全体をずらして使い回す
    if (mine.length >= 4) return mine;
    return [for (var j = 0; j < all.length; j++) all[(j + column * 3) % all.length]];
  }
}

class _WallColumn extends StatelessWidget {
  const _WallColumn({
    required this.works,
    required this.width,
    required this.gap,
    required this.speed,
    required this.startOffset,
    required this.elapsed,
  });

  final List<WorkSummary> works;
  final double width;
  final double gap;

  /// 1 秒あたりのピクセル（マイナスは下向き）
  final double speed;
  final double startOffset;
  final ValueNotifier<double> elapsed;

  double _heightOf(WorkSummary w) => (width / w.aspect).clamp(width * 0.75, width * 1.6);

  @override
  Widget build(BuildContext context) {
    final skeleton = context.skeleton;
    if (works.isEmpty) {
      // 読み込み中は角丸の箱だけ並べる
      final heights = [1.3, 0.9, 1.5, 1.1, 1.25];
      return Column(
        children: [
          for (var k = 0; k < 8; k++)
            Container(
              height: width * heights[(k + startOffset ~/ 97) % heights.length],
              margin: EdgeInsets.only(bottom: gap),
              decoration: BoxDecoration(color: skeleton, borderRadius: Ds.br(16)),
            ),
        ],
      );
    }
    final heights = [for (final w in works) _heightOf(w)];
    final cycle = heights.fold<double>(0, (a, h) => a + h + gap);
    return ValueListenableBuilder<double>(
      valueListenable: elapsed,
      builder: (context, t, _) {
        return LayoutBuilder(builder: (context, c) {
          // 1 周の長さで割った余りの位置から、画面の高さを埋めるまで並べる
          final offset = ((startOffset + t * speed) % cycle + cycle) % cycle;
          final children = <Widget>[];
          var y = -offset;
          var k = 0;
          while (y < c.maxHeight) {
            final idx = k % works.length;
            final h = heights[idx];
            if (y + h > 0) {
              children.add(Positioned(
                key: ValueKey('${works[idx].id}-${k ~/ works.length}'),
                top: y,
                left: 0,
                width: width,
                height: h,
                child: AppImage(
                  works[idx].imageUrl,
                  radius: 16,
                  memCacheWidth: 400,
                ),
              ));
            }
            y += h + gap;
            k++;
          }
          return Stack(clipBehavior: Clip.hardEdge, children: children);
        });
      },
    );
  }
}
