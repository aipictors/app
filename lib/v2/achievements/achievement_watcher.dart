import 'dart:async';

import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/v2/achievements/achievement_ui.dart';
import 'package:aipictors/v2/achievements/achievements_api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

/// 画面を移ったときに確かめる間隔（Web と同じ）
const _routeCheckInterval = Duration(minutes: 10);

/// 投稿・いいねなどのあと、少し待ってからまとめて確かめる
const _requestDebounce = Duration(milliseconds: 1500);

/// これ以上まとめて達成したら、1 件ずつではなく 1 枚にまとめて出す
const _bulkThreshold = 4;

/// 生成のタブ
const _generationTab = 2;

/// 実績を確かめて、達成したら右下（スマホは下のタブの上）に小さく出す（Web の AchievementWatcher と同じ仕組み）
/// - 開いたとき・画面を移ったとき（10 分に 1 回まで）・アプリに戻ったとき・投稿や生成から戻ったとき・いいねやフォローのあと
/// - 1 件ずつ数秒出す。触っている間は消えない。押すと実績の画面へ、横か下へ払うと消える
/// - 出したものは見たことにする（次からは返らない）。はじめての確認でこれまでの分がまとめて返ったときは 1 枚にまとめる
class AchievementWatcher extends ConsumerStatefulWidget {
  const AchievementWatcher({super.key, required this.router, required this.child});

  final GoRouter router;
  final Widget child;

  /// テストで差し替える
  @visibleForTesting
  static Stream<String?> Function() uidChanges = () => FirebaseAuth.instance.authStateChanges().map((u) => u?.uid);
  @visibleForTesting
  static Future<AchievementCheckResult?> Function({bool force}) checkAchievements = AchievementsApi.check;
  @visibleForTesting
  static Future<void> Function(List<String> keys) markSeen = AchievementsApi.markSeen;
  @visibleForTesting
  static Future<AchievementSettings?> Function() loadSettings = AchievementsApi.settings;

  @override
  ConsumerState<AchievementWatcher> createState() => _AchievementWatcherState();
}

class _AchievementWatcherState extends ConsumerState<AchievementWatcher> with WidgetsBindingObserver {
  final _queue = <_Notice>[];

  /// この起動で一度出したもの（同じものを二度出さない）
  final _shownKeys = <String>{};
  DateTime _lastCheckedAt = DateTime.fromMillisecondsSinceEpoch(0);
  bool _checking = false;
  String? _uid;
  String? _previousPath;
  Timer? _debounce;
  StreamSubscription<String?>? _authSub;
  StreamSubscription<void>? _requestSub;

  bool get _isLoggedIn => _uid != null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.router.routerDelegate.addListener(_onRoute);
    _authSub = AchievementWatcher.uidChanges().listen((uid) {
      if (uid == _uid) return;
      _uid = uid;
      // ログインし直したら、前の人の分は持ち越さない
      _shownKeys.clear();
      _lastCheckedAt = DateTime.fromMillisecondsSinceEpoch(0);
      if (mounted) setState(_queue.clear);
      if (uid != null) _check(false);
    });
    _requestSub = AchievementsApi.checkRequests.listen((_) {
      if (!_isLoggedIn) return;
      _debounce?.cancel();
      _debounce = Timer(_requestDebounce, () => _check(true));
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.router.routerDelegate.removeListener(_onRoute);
    _authSub?.cancel();
    _requestSub?.cancel();
    _debounce?.cancel();
    super.dispose();
  }

  // アプリに戻ったとき
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _isLoggedIn && DateTime.now().difference(_lastCheckedAt) > _routeCheckInterval) {
      _check(false);
    }
  }

  // 画面を移ったとき（投稿の画面から移ったときはすぐ）
  void _onRoute() {
    final config = widget.router.routerDelegate.currentConfiguration;
    if (config.isEmpty) return;
    // push した画面は ImperativeRouteMatch の中にある
    final last = config.last;
    final path = last is ImperativeRouteMatch ? last.matches.uri.path : config.uri.path;
    final previous = _previousPath;
    if (path == previous) return;
    _previousPath = path;
    if (!_isLoggedIn) return;
    final isAfterCreating = previous != null && RegExp(r'^/(works/create|generation)(/|$)|^/works/[^/]+/update$').hasMatch(previous);
    _onMove(isAfterCreating);
  }

  void _onMove(bool isAfterCreating) {
    if (isAfterCreating) {
      _check(true);
      return;
    }
    if (DateTime.now().difference(_lastCheckedAt) < _routeCheckInterval) return;
    _check(false);
  }

  Future<void> _check(bool force) async {
    if (!_isLoggedIn || _checking) return;
    _checking = true;
    _lastCheckedAt = DateTime.now();
    try {
      final result = await AchievementWatcher.checkAchievements(force: force);
      if (result == null || !mounted) return;
      final fresh = result.unlocked.where((a) => !_shownKeys.contains(a.key)).toList();
      if (fresh.isEmpty) return;
      _shownKeys.addAll(fresh.map((a) => a.key));
      _requestDiscordSync();

      // 「実績を取ったときに知らせる」をオフにしている人には出さない（見たことにだけする）
      final settings = await AchievementWatcher.loadSettings().catchError((_) => null);
      if (!mounted) return;
      if (settings?.isUnlockNoticeOff == true) {
        AchievementWatcher.markSeen(fresh.map((a) => a.key).toList()).catchError((_) {});
        return;
      }
      if (result.isInitialSync && fresh.length >= _bulkThreshold) {
        setState(() => _queue.add(_Notice.bulk(fresh)));
        return;
      }
      // 古い順に出す
      setState(() => _queue.addAll(fresh.reversed.map(_Notice.single)));
    } catch (_) {
      // 実績はおまけなので、失敗しても何もしない
    } finally {
      _checking = false;
    }
  }

  void _onShown(List<String> keys) => AchievementWatcher.markSeen(keys).catchError((_) {});

  void _open() => widget.router.push('/achievements');

  /// Discord の表示（レベル・お祝い）を次の反映で更新してもらう。連携していなければ何も起きない
  Future<void> _requestDiscordSync() async {
    if (kDebugMode) return;
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      if (token == null) return;
      await http.post(
        Uri.parse('https://www.aipictors.com/api/discord/status'),
        headers: {'authorization': 'Bearer $token', 'content-type': 'application/json'},
        body: '{"intent":"request-sync"}',
      );
    } catch (_) {
      // 5 分ごとの反映に任せる
    }
  }

  @override
  Widget build(BuildContext context) {
    // 生成のタブから移ったときもすぐ確かめる（Web の生成の画面から移ったときと同じ）
    ref.listen<int>(homeTabIndexProvider, (previous, next) {
      if (_isLoggedIn && previous != next) _onMove(previous == _generationTab);
    });
    final current = _queue.isEmpty ? null : _queue.first;
    return Stack(children: [
      widget.child,
      if (current != null)
        _AchievementBanner(
          key: ValueKey(current.id),
          notice: current,
          remaining: current.items.length > 1 ? 0 : _queue.length - 1,
          onShown: _onShown,
          onOpen: _open,
          onDone: () => setState(() => _queue.remove(current)),
        ),
    ]);
  }
}

class _Notice {
  _Notice.single(UnlockedAchievement a)
      : items = [a],
        id = a.key;

  _Notice.bulk(List<UnlockedAchievement> all)
      : items = [...all]..sort((a, b) => b.tier.compareTo(a.tier)),
        id = 'bulk/${all.length}';

  final String id;

  /// 2 件以上ならまとめ（先頭がいちばん上のランク）
  final List<UnlockedAchievement> items;
}

/// 1 件ずつのバナー（Web の AchievementUnlockToast を控えめにしたもの）
class _AchievementBanner extends StatefulWidget {
  const _AchievementBanner({
    super.key,
    required this.notice,
    required this.remaining,
    required this.onShown,
    required this.onOpen,
    required this.onDone,
  });

  final _Notice notice;
  final int remaining;
  final void Function(List<String> keys) onShown;
  final VoidCallback onOpen;
  final VoidCallback onDone;

  @override
  State<_AchievementBanner> createState() => _AchievementBannerState();
}

class _AchievementBannerState extends State<_AchievementBanner> with TickerProviderStateMixin {
  late final UnlockedAchievement _best = widget.notice.items.first;
  late final bool _isBulk = widget.notice.items.length > 1;

  /// 出ている時間（Web と同じ。ダイヤモンド以上は長め）
  late final Duration _duration = Duration(milliseconds: _best.tier >= 5 ? 8000 : 6000);
  late final AnimationController _timer = AnimationController(vsync: this, duration: _duration)
    ..addStatusListener((s) {
      if (s == AnimationStatus.completed) _leave();
    });
  late final AnimationController _enter = AnimationController(vsync: this, duration: const Duration(milliseconds: 320))..forward();
  bool _leaving = false;

  @override
  void initState() {
    super.initState();
    widget.onShown(widget.notice.items.map((a) => a.key).toList());
    _timer.forward();
  }

  @override
  void dispose() {
    _timer.dispose();
    _enter.dispose();
    super.dispose();
  }

  Future<void> _leave() async {
    if (_leaving) return;
    _leaving = true;
    _timer.stop();
    await _enter.reverse();
    if (mounted) widget.onDone();
  }

  // 触っている間は消えない
  void _pause() => _timer.stop();

  void _resume() {
    if (!_leaving) _timer.forward();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width >= 600;
    final tier = achievementTier(_best.tier);
    // スマホは下のタブの上（Web の --aip-tabbar-h + 0.75rem）。キーボードが出ていればその上
    final bottom = mq.viewInsets.bottom > 0 ? mq.viewInsets.bottom + Ds.s12 : (isWide ? 24.0 : mq.padding.bottom + 64 + Ds.s12);
    final curve = CurvedAnimation(parent: _enter, curve: Curves.easeOutCubic, reverseCurve: Curves.easeInCubic);
    final name = tr(_best.name, _best.enName);
    final title = _isBulk
        ? tr('これまでの実績 ${widget.notice.items.length} 個を達成しました！', 'You unlocked ${widget.notice.items.length} achievements!')
        : _best.isHidden
            ? tr('隠し実績を発見！', 'Secret achievement!')
            : tr('実績を達成！', 'Achievement unlocked!');
    final coins = widget.notice.items.fold<int>(0, (sum, a) => sum + a.rewardCoins);

    final card = Material(
      type: MaterialType.transparency,
      child: Listener(
        onPointerDown: (_) => _pause(),
        onPointerUp: (_) => _resume(),
        onPointerCancel: (_) => _resume(),
        child: Dismissible(
          key: const ValueKey('achievement-banner'),
          direction: DismissDirection.horizontal,
          onDismissed: (_) => widget.onDone(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Ds.tap();
              _leave();
              widget.onOpen();
            },
            onVerticalDragEnd: (d) {
              if ((d.primaryVelocity ?? 0) > 200) _leave();
            },
            child: Container(
              constraints: const BoxConstraints(maxWidth: 384),
              decoration: BoxDecoration(
                color: context.surfaceCard.withValues(alpha: 0.97),
                borderRadius: Ds.br(16),
                border: Border.all(color: context.hairline),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: context.isDark ? 0.45 : 0.1), blurRadius: 16, offset: const Offset(0, 4)),
                  BoxShadow(color: tier.glow.withValues(alpha: 0.25), blurRadius: 18),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(Ds.s12, Ds.s12, 36, Ds.s12),
                  child: Row(children: [
                    ScaleTransition(
                      scale: Tween(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _enter, curve: Curves.easeOutBack)),
                      child: AchievementBadge(achievementKey: _best.key, tier: _best.tier, isHidden: _best.isHidden, isUnlocked: true, size: 52),
                    ),
                    const SizedBox(width: Ds.s12),
                    Expanded(
                      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Flexible(
                            child: Text(title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: context.muted, fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: _isBulk ? 0 : 0.6)),
                          ),
                          if (!_isBulk) ...[const SizedBox(width: 6), AchievementTierChip(_best.tier, fontSize: 9.5)],
                          if (widget.remaining > 0) ...[
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                              decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(99)),
                              child: Text(tr('ほか ${widget.remaining} 件', '+${widget.remaining} more'), style: const TextStyle(fontSize: 9.5, fontWeight: FontWeight.w800)),
                            ),
                          ],
                        ]),
                        const SizedBox(height: 2),
                        Text(_isBulk ? tr('いちばん上は「$name」', 'Top: $name') : name,
                            maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5, height: 1.25)),
                        if (!_isBulk)
                          Text(tr(_best.description, _best.enDescription), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 11.5)),
                        if (!_isBulk && _best.isHidden)
                          Text(tr('🤫 条件はナイショにしてね', '🤫 Please keep the condition a secret'),
                              maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 11)),
                        if (coins > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(text: '+$coins ', style: TextStyle(color: context.isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706), fontWeight: FontWeight.w800)),
                                TextSpan(text: tr('フリーコイン・7日有効', 'free coins · 7 days'), style: TextStyle(color: context.muted)),
                              ]),
                              style: const TextStyle(fontSize: 11.5),
                            ),
                          ),
                      ]),
                    ),
                  ]),
                ),
                // Navigator の外なので Tooltip（Overlay が要る）は使わない
                Positioned(
                  top: 0,
                  right: 0,
                  child: Semantics(
                    button: true,
                    label: tr('閉じる', 'Close'),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: _leave,
                      child: Padding(padding: const EdgeInsets.all(10), child: Icon(Icons.close_rounded, size: 16, color: context.muted)),
                    ),
                  ),
                ),
                // 残りの時間（Web の下の細い線）
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedBuilder(
                    animation: _timer,
                    builder: (context, _) => Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(widthFactor: 1 - _timer.value, child: Container(height: 2, color: tier.glow)),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );

    return Positioned(
      left: isWide ? null : Ds.s12,
      right: isWide ? 24 : Ds.s12,
      bottom: bottom,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Align(
          alignment: isWide ? Alignment.bottomRight : Alignment.bottomCenter,
          widthFactor: isWide ? 1 : null,
          heightFactor: 1,
          child: SizedBox(
            width: isWide ? 384 : null,
            child: Semantics(
              liveRegion: true,
              child: FadeTransition(
                opacity: curve,
                child: SlideTransition(position: Tween(begin: const Offset(0, 0.4), end: Offset.zero).animate(curve), child: card),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
