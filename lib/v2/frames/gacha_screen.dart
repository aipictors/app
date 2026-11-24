import 'dart:async';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/frames/frame_widgets.dart';
import 'package:aipictors/v2/frames/frames_api.dart';
import 'package:aipictors/v2/frames/gacha_result.dart';
import 'package:aipictors/v2/frames/gacha_rules.dart';
import 'package:aipictors/v2/plans/coin_shop.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _deep = Color(0xFF1D0B3A);
const _deeper = Color(0xFF120726);

String _n(int v) => v.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');

/// スペシャル枠ガチャ（Web の /gacha）。抽選・コインの支払いはサーバー（drawGacha）で行い、ここは見せるだけ
class GachaScreen extends StatefulWidget {
  const GachaScreen({super.key});

  @override
  State<GachaScreen> createState() => _GachaScreenState();
}

class _GachaScreenState extends State<GachaScreen> {
  GachaState? _state;
  CoinSummary? _coins;
  Object? _error;
  bool _drawing = false;
  (GachaCoinType, int)? _last;

  /// UUR を当てたら獲得者の一覧を読み直す
  int _uniqueKey = 0;

  @override
  void initState() {
    super.initState();
    if (Nav.isLoggedIn) _load();
  }

  Future<void> _load() async {
    try {
      final results = await Future.wait([FramesApi.viewerGacha(), Coins.summary()]);
      if (!mounted) return;
      setState(() {
        _state = results[0] as GachaState;
        _coins = results[1] as CoinSummary;
        _error = null;
      });
    } catch (e) {
      if (mounted) setState(() => _error = e);
    }
  }

  Future<void> _reloadCoins() async {
    try {
      final c = await Coins.summary();
      if (mounted) setState(() => _coins = c);
    } catch (_) {}
  }

  GachaPrice? _price(GachaCoinType type, int count) => GachaRules.price(
        coinType: type,
        count: count,
        freePullsToday: _state?.freePullsToday ?? 0,
        isPremiumDealAvailable: _state?.isPremiumDealAvailable ?? true,
      );

  Future<void> _draw(GachaCoinType type, int count) async {
    if (_drawing) return;
    if (!Nav.requireLogin(context)) return;
    final price = _price(type, count);
    if (price == null) {
      context.toast(tr('フリーコインで引けるのは 1 日 ${GachaRules.freeDailyLimit} 回までです。プレミアムコインなら何回でも引けます', 'Free coins allow up to ${GachaRules.freeDailyLimit} pulls a day. Premium coins have no limit.'), error: true);
      return;
    }
    final coins = _coins;
    if (coins != null) {
      if (type == GachaCoinType.premium && coins.premium < price.costCoins) {
        await _shortage(count, price.costCoins);
        return;
      }
      if (type == GachaCoinType.free && coins.free < price.costCoins) {
        context.toast(tr('フリーコインが足りません（あと ${_n(price.costCoins - coins.free)} 枚）。フリーコインは毎日もらえます', 'Not enough free coins (${_n(price.costCoins - coins.free)} more). You get free coins every day.'), error: true);
        return;
      }
      // プレミアムコイン（有償）は押し間違いで使わないよう、引く前に確かめる
      if (type == GachaCoinType.premium) {
        final ok = await showConfirmSheet(
          context,
          title: tr('プレミアムコイン ${_n(price.costCoins)} 枚で${count == 10 ? ' 10 連' : ' 1 回'}引きます', 'Pull ${count == 10 ? '10x' : 'once'} for ${_n(price.costCoins)} premium coins?'),
          message: tr('プレミアムコイン ${_n(coins.premium)} → ${_n(coins.premium - price.costCoins)} 枚。引いたあとの取り消しはできません', 'Premium coins ${_n(coins.premium)} → ${_n(coins.premium - price.costCoins)}. Pulls cannot be undone.'),
          confirmLabel: tr('引く', 'Pull'),
        );
        if (!ok || !mounted) return;
      }
    }
    setState(() => _drawing = true);
    try {
      final result = await FramesApi.draw(coinType: type, count: count, expectedCostCoins: price.costCoins);
      if (!mounted) return;
      final c = _coins;
      setState(() {
        _state = result.state;
        _last = (type, count);
        if (result.pulls.any((p) => p.prize.rarity.isUnique)) _uniqueKey++;
        if (c != null) {
          _coins = type == GachaCoinType.free
              ? CoinSummary(free: (c.free - result.costCoins).clamp(0, 1 << 31), premium: c.premium)
              : CoinSummary(free: c.free, premium: (c.premium - result.costCoins).clamp(0, 1 << 31));
        }
      });
      Ds.impact();
      final again = await showGachaResult(context, result: result);
      unawaited(_reloadCoins());
      if (again != null && mounted) {
        final t = again == 10 ? GachaCoinType.premium : (_last?.$1 ?? GachaCoinType.premium);
        unawaited(_draw(t, again));
      }
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.code == 'GACHA_INSUFFICIENT_COINS' && type == GachaCoinType.premium) {
        await _shortage(count, price.costCoins);
      } else {
        if (e.code == 'GACHA_PRICE_CHANGED') unawaited(_load());
        context.toast(e.message, error: true);
      }
    } catch (_) {
      if (mounted) context.toast(tr('引けませんでした', 'Could not pull'), error: true);
    } finally {
      if (mounted) setState(() => _drawing = false);
    }
  }

  /// プレミアムコインが足りないとき。アプリ内のコイン購入へ（Web の GachaCoinShortageDialog）
  Future<void> _shortage(int count, int cost) async {
    final balance = _coins?.premium ?? 0;
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s16),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(tr('プレミアムコインが足りません', 'Not enough premium coins'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
            const SizedBox(height: 6),
            Text(
              tr('${count == 10 ? '10 連' : '1 回'}には ${_n(cost)} 枚必要です（いま ${_n(balance)} 枚、あと ${_n(cost - balance)} 枚）', '${count == 10 ? '10x pull' : 'A pull'} needs ${_n(cost)} coins (you have ${_n(balance)}, ${_n(cost - balance)} more).'),
              style: TextStyle(color: context.muted),
            ),
            const SizedBox(height: Ds.s16),
            GradientButton(label: tr('プレミアムコインを買う', 'Buy premium coins'), icon: Icons.add_circle_outline_rounded, onPressed: () => Navigator.pop(context, 'buy')),
            if (count == 10 && balance >= GachaRules.premiumSingle) ...[
              const SizedBox(height: Ds.s8),
              SecondaryButton(label: tr('1 回だけ引く（${_n(GachaRules.premiumSingle)} 枚）', 'Pull once (${_n(GachaRules.premiumSingle)})'), onPressed: () => Navigator.pop(context, 'single')),
            ],
          ]),
        ),
      ),
    );
    if (!mounted) return;
    if (action == 'buy') {
      await showCoinShopSheet(context);
      await _reloadCoins();
    } else if (action == 'single') {
      await _draw(GachaCoinType.premium, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loggedIn = Nav.isLoggedIn;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('スペシャル枠ガチャ', 'Special Frame Gacha')),
        actions: [
          IconButton(tooltip: tr('提供割合・ご注意', 'Rates & notes'), icon: const Icon(Icons.info_outline_rounded), onPressed: () => context.push('/gacha/rates')),
        ],
      ),
      body: AppRefresh(
        onRefresh: loggedIn ? _load : () async {},
        child: ListView(
          padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s32),
          children: [
            ContentWidth(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                _Hero(isPremiumDealAvailable: _state?.isPremiumDealAvailable ?? true, isFreeFirstAvailable: (_state?.freePullsToday ?? 0) == 0),
                const SizedBox(height: Ds.s16),
                if (!loggedIn)
                  LoginRequiredView(
                    title: tr('ログインしてガチャを引こう', 'Log in to pull'),
                    message: tr('毎日 1 回目はフリーコイン ${GachaRules.freeFirst} 枚、プレミアムコインの 10 連は 1 日 1 回半額です', 'First free pull each day costs ${GachaRules.freeFirst} free coins, and one premium 10x pull a day is half price.'),
                    onLogin: () => Nav.login(context),
                    icon: Icons.casino_outlined,
                  )
                else if (_error != null && _state == null)
                  StateView.error(_error.toString(), onRetry: _load)
                else
                  _drawPanel(context),
                const SizedBox(height: Ds.s16),
                _UniquePrizes(key: ValueKey(_uniqueKey)),
                const SizedBox(height: Ds.s16),
                if (loggedIn && _state != null) ...[
                  _Collection(state: _state!, onState: (s) => setState(() => _state = s)),
                  const SizedBox(height: Ds.s16),
                ],
                const _Lineup(),
                const SizedBox(height: Ds.s16),
                const _RatesNote(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawPanel(BuildContext context) {
    final s = _state;
    final free = _price(GachaCoinType.free, 1);
    final single = _price(GachaCoinType.premium, 1);
    final ten = _price(GachaCoinType.premium, 10);
    final points = s?.exchangePoints ?? 0;
    return Container(
      padding: const EdgeInsets.all(Ds.s16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [_deep, _deeper]),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          const Icon(Icons.diamond_rounded, size: 16, color: Color(0xFFFFC94D)),
          const SizedBox(width: 4),
          Text(_coins == null ? '…' : _n(_coins!.premium), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
          const SizedBox(width: 12),
          const Icon(Icons.monetization_on_rounded, size: 16, color: Colors.white70),
          const SizedBox(width: 4),
          Text(_coins == null ? '…' : _n(_coins!.free), style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w800)),
          const Spacer(),
          IconButton(
            tooltip: tr('コインを買う', 'Buy coins'),
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add_circle_outline_rounded, color: Colors.white70, size: 20),
            onPressed: () async {
              await showCoinShopSheet(context);
              await _reloadCoins();
            },
          ),
          GestureDetector(
            onTap: () => context.push('/gacha/rates'),
            child: Row(children: [
              const Icon(Icons.info_outline_rounded, size: 14, color: Colors.white60),
              const SizedBox(width: 3),
              Text(tr('提供割合・ご注意', 'Rates & notes'), style: const TextStyle(color: Colors.white60, fontSize: 12, decoration: TextDecoration.underline, decorationColor: Colors.white38)),
            ]),
          ),
        ]),
        const SizedBox(height: Ds.s12),
        LayoutBuilder(builder: (context, c) {
          final buttons = [
            _DrawButton(
              title: tr('フリーで 1 回', 'Free x1'),
              icon: Icons.monetization_on_rounded,
              cost: free?.costCoins,
              originalCost: free?.isDeal == true ? GachaRules.freeSingle : null,
              badge: free?.isDeal == true ? tr('1 日 1 回目お得', 'First of the day') : null,
              sub: tr('今日 ${s?.freePullsToday ?? 0} / ${GachaRules.freeDailyLimit} 回', 'Today ${s?.freePullsToday ?? 0} / ${GachaRules.freeDailyLimit}'),
              disabledLabel: free == null ? tr('今日は終わり', 'Done today') : null,
              loading: _drawing,
              onTap: () => _draw(GachaCoinType.free, 1),
            ),
            _DrawButton(
              title: tr('プレミアム 1 回', 'Premium x1'),
              icon: Icons.diamond_rounded,
              cost: single?.costCoins,
              sub: tr('何回でも引けます', 'No daily limit'),
              loading: _drawing,
              onTap: () => _draw(GachaCoinType.premium, 1),
            ),
            _DrawButton(
              title: tr('プレミアム 10 連', 'Premium x10'),
              icon: Icons.diamond_rounded,
              cost: ten?.costCoins,
              originalCost: ten?.isDeal == true ? GachaRules.premiumTen : null,
              badge: ten?.isDeal == true ? tr('今日だけ半額', 'Half price today') : null,
              sub: tr('SR 以上 1 枠確定', 'One SR+ guaranteed'),
              highlighted: true,
              loading: _drawing,
              onTap: () => _draw(GachaCoinType.premium, 10),
            ),
          ];
          if (c.maxWidth >= 560) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              for (final (i, b) in buttons.indexed) ...[if (i > 0) const SizedBox(width: Ds.s12), Expanded(child: b)],
            ]);
          }
          return Column(children: [
            buttons[2],
            const SizedBox(height: Ds.s12),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: buttons[0]), const SizedBox(width: Ds.s12), Expanded(child: buttons[1])]),
          ]);
        }),
        const SizedBox(height: Ds.s16),
        PityMeter(points: points),
        if (points >= GachaRules.exchangePoints) ...[
          const SizedBox(height: Ds.s8),
          Text(tr('下のコレクションで、まだ持っていない枠を選ぶと交換できます', 'Pick a frame you don\'t own in the collection below to exchange.'),
              textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFFBCFE8), fontWeight: FontWeight.w700, fontSize: 13)),
        ],
      ]),
    );
  }
}

/// 交換 pt のメーター（Web の GachaPityMeter）
class PityMeter extends StatelessWidget {
  const PityMeter({super.key, required this.points, this.compact = false});

  final int points;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    const max = GachaRules.exchangePoints;
    final ratio = (points / max).clamp(0.0, 1.0);
    final can = points >= max;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        Text(tr('交換 pt', 'Exchange pt'), style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w700)),
        const Spacer(),
        Text(can ? tr('好きな枠と交換できます', 'Ready to exchange') : tr('あと ${max - points} 回で好きな枠と交換', '${max - points} more pulls to pick any frame'),
            style: TextStyle(color: can ? const Color(0xFFFBCFE8) : Colors.white70, fontSize: 12, fontWeight: FontWeight.w700)),
      ]),
      const SizedBox(height: 6),
      ClipRRect(
        borderRadius: BorderRadius.circular(99),
        child: Stack(children: [
          Container(height: compact ? 6 : 10, color: Colors.white12),
          FractionallySizedBox(
            widthFactor: ratio,
            child: Container(height: compact ? 6 : 10, decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFEC4899), Color(0xFFF59E0B)]))),
          ),
        ]),
      ),
      if (!compact) ...[
        const SizedBox(height: 4),
        Text('$points / $max', textAlign: TextAlign.right, style: const TextStyle(color: Colors.white54, fontSize: 11, fontFeatures: [FontFeature.tabularFigures()])),
      ],
    ]);
  }
}

class _DrawButton extends StatelessWidget {
  const _DrawButton({
    required this.title,
    required this.icon,
    required this.cost,
    required this.sub,
    required this.loading,
    required this.onTap,
    this.originalCost,
    this.badge,
    this.disabledLabel,
    this.highlighted = false,
  });

  final String title;
  final IconData icon;
  final int? cost;
  final int? originalCost;
  final String? badge;
  final String sub;
  final String? disabledLabel;
  final bool highlighted;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final disabled = loading || disabledLabel != null;
    final fg = highlighted ? Colors.white : const Color(0xFF0F172A);
    final subColor = highlighted ? Colors.white.withValues(alpha: 0.9) : const Color(0xFF64748B);
    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: Stack(clipBehavior: Clip.none, children: [
        Pressable(
          onTap: disabled ? null : onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: highlighted ? null : Colors.white,
              gradient: highlighted ? const LinearGradient(colors: [Color(0xFFEC4899), Color(0xFFD946EF), Color(0xFFFB923C)]) : null,
              boxShadow: highlighted ? [BoxShadow(color: const Color(0xFFEC4899).withValues(alpha: 0.6), blurRadius: 20, offset: const Offset(0, 6))] : null,
            ),
            child: Column(children: [
              Text(title, style: TextStyle(color: fg, fontWeight: FontWeight.w800, fontSize: 14)),
              const SizedBox(height: 4),
              FittedBox(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(icon, size: 20, color: highlighted ? Colors.white : const Color(0xFFE2A21B)),
                  const SizedBox(width: 4),
                  Text(disabledLabel ?? (cost == null ? '-' : _n(cost!)), style: TextStyle(color: fg, fontWeight: FontWeight.w900, fontSize: 24)),
                  if (originalCost != null) ...[
                    const SizedBox(width: 6),
                    Text(_n(originalCost!), style: TextStyle(color: highlighted ? Colors.white70 : const Color(0xFF94A3B8), fontWeight: FontWeight.w700, fontSize: 14, decoration: TextDecoration.lineThrough)),
                  ],
                ]),
              ),
              const SizedBox(height: 2),
              Text(sub, style: TextStyle(color: subColor, fontSize: 11)),
            ]),
          ),
        ),
        if (badge != null)
          Positioned(
            top: -10,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: const Color(0xFFFCD34D), borderRadius: BorderRadius.circular(99), boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)]),
              child: Text(badge!, style: const TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.w900, fontSize: 11)),
            ),
          ),
      ]),
    );
  }
}

/// 看板（Web の SpecialGachaHero）。お得な回が残っているときは日付が変わるまでの残り時間を出す
class _Hero extends StatefulWidget {
  const _Hero({required this.isPremiumDealAvailable, required this.isFreeFirstAvailable});

  final bool isPremiumDealAvailable;
  final bool isFreeFirstAvailable;

  @override
  State<_Hero> createState() => _HeroState();
}

class _HeroState extends State<_Hero> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// 日本時間の次の 0:00 まで
  static Duration untilJstMidnight(DateTime now) {
    const day = Duration.millisecondsPerDay;
    final jst = now.millisecondsSinceEpoch + 9 * 3600 * 1000;
    return Duration(milliseconds: day - jst % day);
  }

  @override
  Widget build(BuildContext context) {
    final left = untilJstMidnight(DateTime.now());
    final hasDeal = widget.isPremiumDealAvailable || widget.isFreeFirstAvailable;
    String two(int v) => v.toString().padLeft(2, '0');
    final countdown = '${left.inHours}:${two(left.inMinutes % 60)}:${two(left.inSeconds % 60)}';
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        color: const Color(0xFF2A0F4F),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const AspectRatio(aspectRatio: 1584 / 672, child: AppImage('${GachaRules.webOrigin}/images/gacha/special-gacha-banner.sm.webp', memCacheWidth: 1000)),
          Padding(
            padding: const EdgeInsets.all(Ds.s16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('SPECIAL FRAME GACHA', style: TextStyle(color: Color(0xFFF5D0FE), fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 2.2)),
              const SizedBox(height: 2),
              ShaderMask(
                shaderCallback: (r) => const LinearGradient(colors: [Color(0xFFFBCFE8), Color(0xFFFEF3C7), Color(0xFFBAE6FD)]).createShader(r),
                child: Text(tr('スペシャル枠ガチャ', 'Special Frame Gacha'), style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
              ),
              const SizedBox(height: 4),
              Text(tr('ここでしか手に入らないアイコン枠・ヘッダー枠', 'Avatar and header frames you can only get here'), style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Wrap(spacing: 6, runSpacing: 6, children: [
                _pill(tr('10 連は SR 以上 1 枠確定', 'SR+ guaranteed in 10x'), gradient: true),
                _pill(tr('${GachaRules.exchangePoints} 回で好きな枠と交換', 'Pick any frame every ${GachaRules.exchangePoints} pulls')),
                if (hasDeal) _pill(tr('今日のお得はあと $countdown', 'Today\'s deals end in $countdown')),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _pill(String text, {bool gradient = false}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: gradient ? null : Colors.white.withValues(alpha: 0.9),
          gradient: gradient ? const LinearGradient(colors: [Color(0xFFEC4899), Color(0xFFFB923C)]) : null,
        ),
        child: Text(text, style: TextStyle(color: gradient ? Colors.white : const Color(0xFF6D28D9), fontWeight: FontWeight.w900, fontSize: 12, fontFeatures: const [FontFeature.tabularFigures()])),
      );
}

/// 集めた枠。持っている枠は着ける・外す、持っていない枠は交換 pt かかけらで交換できる（Web の SpecialGachaCollection）
class _Collection extends StatefulWidget {
  const _Collection({required this.state, required this.onState});

  final GachaState state;
  final ValueChanged<GachaState> onState;

  @override
  State<_Collection> createState() => _CollectionState();
}

class _CollectionState extends State<_Collection> {
  GachaPrizeKind _kind = GachaPrizeKind.icon;
  FrameSettings? _frames;

  @override
  void initState() {
    super.initState();
    _loadFrames();
  }

  Future<void> _loadFrames() async {
    try {
      final f = await FramesApi.frameSettings();
      if (mounted) setState(() => _frames = f);
    } catch (_) {}
  }

  String? _iconFrameId(GachaPrize p) {
    for (final f in _frames?.frames ?? const <FrameItem>[]) {
      if (f.slug == p.slug) return f.id;
    }
    return null;
  }

  bool _wearing(GachaPrize p) => p.kind == GachaPrizeKind.header
      ? widget.state.selectedHeaderFrameSlug == p.slug
      : _frames?.appliedFrameId != null && _frames?.appliedFrameId == _iconFrameId(p);

  Future<void> _open(GachaPrize p) async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: context.surfaceCard,
      builder: (_) => _PrizeSheet(
        prize: p,
        state: widget.state,
        wearing: _wearing(p),
        iconFrameId: () => _iconFrameId(p),
        reloadFrames: _loadFrames,
        onState: widget.onState,
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.state;
    // UUR（世界で 1 人だけ）はコンプリートの数に入れず、持っているときだけ並べる
    final prizes = GachaRules.pool.where((p) => p.kind == _kind && (!p.rarity.isUnique || s.owns(p))).toList()..sort((a, b) => b.rarity.index - a.rarity.index);
    final collectable = GachaRules.pool.where((p) => !p.rarity.isUnique).length;
    return _Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(tr('コレクション', 'Collection'), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(width: 6),
          Text('${s.ownedInPool} / $collectable', style: TextStyle(color: context.muted, fontWeight: FontWeight.w700, fontSize: 13)),
        ]),
        const SizedBox(height: 2),
        Text(tr('交換 pt ${_n(s.exchangePoints)}・かけら ${_n(s.shards)}', 'Exchange pt ${_n(s.exchangePoints)} · Shards ${_n(s.shards)}'), style: TextStyle(color: context.muted, fontSize: 12)),
        const SizedBox(height: Ds.s12),
        PillTabs(
          labels: [tr('アイコン枠', 'Avatar frames'), tr('ヘッダー枠', 'Header frames')],
          index: _kind.index,
          padding: EdgeInsets.zero,
          onChanged: (i) => setState(() => _kind = GachaPrizeKind.values[i]),
        ),
        const SizedBox(height: Ds.s12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: prizes.length,
          gridDelegate: _kind == GachaPrizeKind.icon
              ? const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 112, mainAxisExtent: 136, crossAxisSpacing: 4, mainAxisSpacing: 8)
              : const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 320, mainAxisExtent: 128, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, i) {
            final p = prizes[i];
            final count = s.owned[p.id] ?? 0;
            final wearing = _wearing(p);
            return Pressable(
              onTap: () => _open(p),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: wearing ? Border.all(color: Ds.pink, width: 2) : null),
                child: Stack(children: [
                  Column(children: [
                    Expanded(child: Center(child: LayoutBuilder(builder: (context, c) => PrizeThumb(p, size: _kind == GachaPrizeKind.icon ? 72 : (c.maxWidth / 3).clamp(40, 68), locked: count == 0)))),
                    const SizedBox(height: 4),
                    RarityBadge(p.rarity, small: true),
                    const SizedBox(height: 2),
                    Text(p.name + (count > 1 ? ' ×$count' : ''), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11)),
                  ]),
                  if (wearing) const Positioned(top: 0, right: 0, child: Icon(Icons.check_circle_rounded, size: 18, color: Ds.pink)),
                  if (count == 0) Positioned(top: 0, right: 0, child: Icon(Icons.lock_rounded, size: 14, color: context.muted)),
                ]),
              ),
            );
          },
        ),
      ]),
    );
  }
}

class _PrizeSheet extends StatefulWidget {
  const _PrizeSheet({required this.prize, required this.state, required this.wearing, required this.iconFrameId, required this.reloadFrames, required this.onState});

  final GachaPrize prize;
  final GachaState state;
  final bool wearing;
  final String? Function() iconFrameId;
  final Future<void> Function() reloadFrames;
  final ValueChanged<GachaState> onState;

  @override
  State<_PrizeSheet> createState() => _PrizeSheetState();
}

class _PrizeSheetState extends State<_PrizeSheet> {
  bool _busy = false;
  late GachaState _state = widget.state;

  Future<void> _exchange({required bool shards}) async {
    setState(() => _busy = true);
    try {
      final next = await FramesApi.exchange(widget.prize, shards: shards);
      await widget.reloadFrames();
      if (!mounted) return;
      setState(() => _state = next);
      widget.onState(next);
      context.toast(tr('「${widget.prize.name}」を手に入れました', 'Got "${widget.prize.name}"'));
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } catch (_) {
      if (mounted) context.toast(tr('交換できませんでした', 'Could not exchange'), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _wear(bool on) async {
    setState(() => _busy = true);
    try {
      var next = _state;
      if (widget.prize.kind == GachaPrizeKind.header) {
        next = await FramesApi.selectHeaderFrame(on ? widget.prize.slug : null);
      } else {
        final id = on ? widget.iconFrameId() : null;
        if (on && id == null) {
          await widget.reloadFrames();
          if (mounted) context.toast(tr('枠を読み込み中です。少し待ってからお試しください', 'Loading frames. Try again in a moment.'), error: true);
          return;
        }
        await FramesApi.applyIconFrame(id);
        await widget.reloadFrames();
      }
      if (!mounted) return;
      widget.onState(next);
      context.toast(on ? tr('着けました', 'Equipped') : tr('外しました', 'Removed'));
      Navigator.pop(context);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } catch (_) {
      if (mounted) context.toast(tr('変更できませんでした', 'Could not update'), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.prize;
    final owned = _state.owns(p);
    final shardCost = GachaRules.exchangeShards[p.rarity]!;
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s16),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(children: [
              RarityBadge(p.rarity),
              const SizedBox(width: 8),
              Expanded(child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18))),
            ]),
            const SizedBox(height: 4),
            Text('${p.kindLabel}・${p.description}', style: TextStyle(color: context.muted, fontSize: 13)),
            const SizedBox(height: Ds.s16),
            Center(child: PrizeThumb(p, size: p.kind == GachaPrizeKind.icon ? 140 : 90, animated: true)),
            const SizedBox(height: Ds.s16),
            if (owned)
              widget.wearing
                  ? SecondaryButton(label: tr('外す', 'Remove'), loading: _busy, onPressed: _busy ? null : () => _wear(false))
                  : PrimaryButton(label: tr('着ける', 'Equip'), loading: _busy, onPressed: _busy ? null : () => _wear(true))
            else if (p.rarity.isUnique)
              Text(
                tr('UUR は世界でひとりだけの枠です。ガチャで最初に当てた人だけが持てて、交換 pt・かけらでは交換できません', 'UUR frames are one of a kind: only the first person to pull one owns it. They cannot be exchanged for pt or shards.'),
                textAlign: TextAlign.center,
                style: TextStyle(color: context.muted, fontSize: 12, height: 1.6),
              )
            else ...[
              PrimaryButton(
                label: tr('交換 pt ${GachaRules.exchangePoints} で交換（いま ${_state.exchangePoints}）', 'Exchange for ${GachaRules.exchangePoints} pt (have ${_state.exchangePoints})'),
                loading: _busy,
                onPressed: _busy || _state.exchangePoints < GachaRules.exchangePoints ? null : () => _exchange(shards: false),
              ),
              const SizedBox(height: Ds.s8),
              SecondaryButton(
                label: tr('かけら ${_n(shardCost)} で交換（いま ${_n(_state.shards)}）', 'Exchange for ${_n(shardCost)} shards (have ${_n(_state.shards)})'),
                onPressed: _busy || _state.shards < shardCost ? null : () => _exchange(shards: true),
              ),
              const SizedBox(height: 6),
              Text(tr('交換 pt は 1 回引くごとに 1 たまります', 'You earn 1 pt per pull'), textAlign: TextAlign.center, style: TextStyle(color: context.muted, fontSize: 12)),
            ],
          ]),
        ),
    );
  }
}

/// 目玉の UR（アイコン枠は動く絵で見せる）と、レア度ごとの数・確率（Web の SpecialGachaLineup）
class _Lineup extends StatelessWidget {
  const _Lineup();

  @override
  Widget build(BuildContext context) {
    final pool = GachaRules.pool;
    final urs = pool.where((p) => p.rarity == GachaRarity.ur && p.kind == GachaPrizeKind.icon).toList();
    return _Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Text(tr('目玉の UR', 'Featured UR'), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const Spacer(),
          Text(tr('UR ${GachaRules.formatRate(GachaRules.rates[GachaRarity.ur]!)}・全 ${pool.length} 種', 'UR ${GachaRules.formatRate(GachaRules.rates[GachaRarity.ur]!)} · ${pool.length} total'), style: TextStyle(color: context.muted, fontSize: 12)),
        ]),
        const SizedBox(height: Ds.s12),
        Row(children: [
          for (final p in urs.take(3))
            Expanded(
              child: Column(children: [
                PrizeThumb(p, size: 96, animated: true),
                const SizedBox(height: 4),
                const RarityBadge(GachaRarity.ur, small: true),
                const SizedBox(height: 2),
                Text(p.name, textAlign: TextAlign.center, maxLines: 2, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 11)),
              ]),
            ),
        ]),
        const SizedBox(height: Ds.s12),
        Wrap(alignment: WrapAlignment.center, spacing: 6, runSpacing: 6, children: [
          for (final r in GachaRules.raritiesDesc)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(color: context.skeleton, borderRadius: BorderRadius.circular(99)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                RarityBadge(r, small: true),
                const SizedBox(width: 4),
                Text(tr('${pool.where((p) => p.rarity == r).length} 種・${r.isUnique ? '合計 ' : ''}${GachaRules.formatRate(GachaRules.rates[r]!)}', '${pool.where((p) => p.rarity == r).length} · ${r.isUnique ? 'total ' : ''}${GachaRules.formatRate(GachaRules.rates[r]!)}'), style: const TextStyle(fontSize: 12)),
              ]),
            ),
        ]),
      ]),
    );
  }
}

/// UUR（世界で 1 人だけが持てる枠）の 5 枠と獲得した人（Web の SpecialGachaUniquePrizes）。
/// 獲得した人はアイコンを枠に入れて見せ、押すとプロフィールへ。退会した人は名前を出さない
class _UniquePrizes extends StatefulWidget {
  const _UniquePrizes({super.key});

  @override
  State<_UniquePrizes> createState() => _UniquePrizesState();
}

class _UniquePrizesState extends State<_UniquePrizes> {
  List<GachaUniquePrize>? _items;

  @override
  void initState() {
    super.initState();
    FramesApi.uniquePrizes().then((v) {
      if (mounted) setState(() => _items = v);
    }).catchError((_) {});
  }

  String _date(DateTime d) => '${d.year}/${d.month}/${d.day}';

  @override
  Widget build(BuildContext context) {
    final items = _items ?? GachaUniquePrize.unclaimed;
    final remaining = items.where((u) => !u.isClaimed).length;
    const gold = Color(0xFFF8E7A8);
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(colors: [gold, Colors.white, Color(0xFFA5F3FC), Color(0xFFF0ABFC), gold]),
      ),
      child: Container(
        padding: const EdgeInsets.all(Ds.s16),
        decoration: BoxDecoration(color: const Color(0xFF07060D), borderRadius: BorderRadius.circular(22)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            const RarityBadge(GachaRarity.uur),
            const SizedBox(width: 8),
            Expanded(child: Text(tr('世界でひとりだけの枠', 'One of a kind'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18))),
          ]),
          const SizedBox(height: 4),
          Text(
            tr('残り $remaining / ${items.length}・1 回あたり合計 ${GachaRules.formatRate(remaining > 0 ? GachaRules.rates[GachaRarity.uur]! : 0)}。最初に当てた 1 人だけが持てる枠です。当たった枠はガチャから抜け、残りの枠で同じ割合を分けます。交換 pt・かけらでは交換できません。',
                '$remaining of ${items.length} left · ${GachaRules.formatRate(remaining > 0 ? GachaRules.rates[GachaRarity.uur]! : 0)} total per pull. Only the first person to pull one owns it; claimed frames leave the gacha. Not exchangeable for pt or shards.'),
            style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.6),
          ),
          const SizedBox(height: Ds.s12),
          Wrap(alignment: WrapAlignment.center, spacing: 8, runSpacing: 12, children: [
            for (final u in items)
              SizedBox(
                width: 104,
                child: GestureDetector(
                  onTap: u.ownerId != null ? () => context.push('/users/${u.ownerId}') : null,
                  child: Column(children: [
                    PrizeThumb(u.prize, size: 96, animated: true, avatarUrl: u.ownerIconUrl),
                    const SizedBox(height: 4),
                    Text(u.prize.name, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
                    Text(
                      !u.isClaimed
                          ? tr('まだ誰も持っていない', 'Not claimed yet')
                          : u.ownerName ?? (u.isOwnerWithdrawn ? tr('退会したユーザー', 'Deleted user') : tr('獲得済み', 'Claimed')),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: u.ownerName != null ? const Color(0xFFFDE68A) : Colors.white60, fontWeight: u.ownerName != null ? FontWeight.w700 : FontWeight.w400, fontSize: 11),
                    ),
                    if (u.claimedAt != null) Text(tr('${_date(u.claimedAt!)} 獲得', 'Claimed ${_date(u.claimedAt!)}'), style: const TextStyle(color: Colors.white38, fontSize: 10)),
                  ]),
                ),
              ),
          ]),
        ]),
      ),
    );
  }
}

class _RatesNote extends StatelessWidget {
  const _RatesNote();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/gacha/rates'),
      child: Text.rich(
        TextSpan(children: [
          TextSpan(text: tr('提供割合（確率）・天井・ご注意', 'Rates, pity and notes'), style: const TextStyle(decoration: TextDecoration.underline)),
          TextSpan(text: tr('／景品はアイコン枠・ヘッダー枠（デジタルの見た目の飾り）です。プレミアムコインは有償、フリーコインは無償のコインです。', ' / Prizes are avatar and header frames (digital cosmetic items). Premium coins are paid; free coins are free.')),
        ]),
        textAlign: TextAlign.center,
        style: TextStyle(color: context.muted, fontSize: 12, height: 1.6),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(Ds.s16),
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: BorderRadius.circular(24), border: Border.all(color: context.hairline)),
        child: child,
      );
}
