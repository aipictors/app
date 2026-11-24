import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/frames/frame_widgets.dart';
import 'package:aipictors/v2/frames/frames_api.dart';
import 'package:aipictors/v2/frames/gacha_prizes.dart';
import 'package:aipictors/v2/frames/gacha_rules.dart';
import 'package:aipictors/v2/plans/coin_shop.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String _n(int v) => v.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');

/// 枠を選ぶ（Web のプロフィール設定の avatar-frame-studio と、ガチャのヘッダー枠）。
/// アイコン枠: 試着・購入・付け外し。ヘッダー枠: ガチャで手に入れた枠を選ぶ
class FrameStudioScreen extends StatefulWidget {
  const FrameStudioScreen({super.key, this.initialTab = 0});

  final int initialTab;

  @override
  State<FrameStudioScreen> createState() => _FrameStudioScreenState();
}

class _FrameStudioScreenState extends State<FrameStudioScreen> {
  late int _tab = widget.initialTab;
  FrameSettings? _settings;
  GachaState? _gacha;
  CoinSummary? _coins;
  Object? _error;

  @override
  void initState() {
    super.initState();
    if (Nav.isLoggedIn) _load();
  }

  Future<void> _load() async {
    try {
      final r = await Future.wait([FramesApi.frameSettings(), FramesApi.viewerGacha()]);
      if (!mounted) return;
      setState(() {
        _settings = r[0] as FrameSettings;
        _gacha = r[1] as GachaState;
        _error = null;
      });
      final c = await Coins.summary();
      if (mounted) setState(() => _coins = c);
    } catch (e) {
      if (mounted && _settings == null) setState(() => _error = e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = _settings;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('枠を選ぶ', 'Choose a frame')),
        actions: [TextButton.icon(onPressed: () => context.push('/gacha'), icon: const Icon(Icons.casino_outlined, size: 18), label: Text(tr('ガチャ', 'Gacha')))],
      ),
      body: !Nav.isLoggedIn
          ? LoginRequiredView(title: tr('ログインが必要です', 'Login required'), message: tr('ログインすると枠を選べます', 'Log in to choose frames'), onLogin: () => Nav.login(context))
          : _error != null
          ? StateView.error(_error.toString(), onRetry: _load)
          : s == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: Ds.s8),
                PillTabs(labels: [tr('アイコン枠', 'Avatar frame'), tr('ヘッダー枠', 'Header frame')], index: _tab, onChanged: (i) => setState(() => _tab = i)),
                const SizedBox(height: Ds.s8),
                Expanded(
                  child: _tab == 0
                      ? _IconFrames(
                          settings: s,
                          coins: _coins,
                          onChanged: (next, coins) => setState(() {
                            _settings = next;
                            if (coins != null) _coins = coins;
                          }),
                          onReloadCoins: () async {
                            final c = await Coins.summary();
                            if (mounted) setState(() => _coins = c);
                          },
                        )
                      : _HeaderFrames(settings: s, gacha: _gacha ?? GachaState.empty, onChanged: (g) => setState(() => _gacha = g)),
                ),
              ],
            ),
    );
  }
}

enum _Kind { all, subscription, coin, owned }

class _IconFrames extends StatefulWidget {
  const _IconFrames({required this.settings, required this.coins, required this.onChanged, required this.onReloadCoins});

  final FrameSettings settings;
  final CoinSummary? coins;
  final void Function(FrameSettings next, CoinSummary? coins) onChanged;
  final Future<void> Function() onReloadCoins;

  @override
  State<_IconFrames> createState() => _IconFramesState();
}

class _IconFramesState extends State<_IconFrames> {
  late String? _previewId = widget.settings.appliedFrameId;
  _Kind _kind = _Kind.all;
  String _category = 'all';
  bool _dark = false;
  bool _busy = false;

  FrameSettings get s => widget.settings;

  FrameAccess _access(FrameItem f) => FrameRules.access(f, currentPassType: s.currentPassType, ownedFrameIds: s.ownedFrameIds);

  List<FrameItem> get _kindFiltered => s.frames.where((f) {
    switch (_kind) {
      case _Kind.all:
        return true;
      case _Kind.subscription:
        return !f.isCoinFrame;
      case _Kind.coin:
        return f.isCoinFrame;
      case _Kind.owned:
        return _access(f) == FrameAccess.available;
    }
  }).toList();

  FrameSettings _with({String? applied, bool clearApplied = false, String? bought}) => FrameSettings(
    frames: s.frames,
    ownedFrameIds: {...s.ownedFrameIds, if (bought != null) bought},
    appliedFrameId: clearApplied ? null : (applied ?? s.appliedFrameId),
    currentPassType: s.currentPassType,
    iconUrl: s.iconUrl,
    userName: s.userName,
    headerImageUrl: s.headerImageUrl,
  );

  Future<bool> _apply(String? id) async {
    setState(() => _busy = true);
    try {
      await FramesApi.applyIconFrame(id);
      if (!mounted) return false;
      widget.onChanged(_with(applied: id, clearApplied: id == null), null);
      context.toast(tr('アイコン枠を変更しました', 'Avatar frame updated'));
      return true;
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } catch (_) {
      if (mounted) context.toast(tr('変更できませんでした', 'Could not update'), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
    return false;
  }

  Future<void> _buy(FrameItem f, int payable) async {
    final price = f.priceCoins ?? 0;
    final ok = await showConfirmSheet(
      context,
      title: tr('「${f.name}」を ${_n(price)} コインで買います', 'Buy "${f.name}" for ${_n(price)} coins?'),
      message: f.isPremiumCoinsOnly
          ? tr('プレミアムコイン ${_n(payable)} → ${_n(payable - price)} 枚。無料コインは使いません。ずっと使えます', 'Premium coins ${_n(payable)} → ${_n(payable - price)}. Free coins aren\'t used. Yours to keep.')
          : tr('コイン ${_n(payable)} → ${_n(payable - price)} 枚。ずっと使えます', 'Coins ${_n(payable)} → ${_n(payable - price)}. Yours to keep.'),
      confirmLabel: tr('購入してこの枠にする', 'Buy and use'),
    );
    if (!ok || !mounted) return;
    setState(() => _busy = true);
    try {
      await FramesApi.purchaseIconFrame(f.id);
    } on ApiException catch (e) {
      if (mounted) {
        context.toast(e.message, error: true);
        setState(() => _busy = false);
      }
      return;
    } catch (_) {
      if (mounted) {
        context.toast(tr('購入できませんでした', 'Could not purchase'), error: true);
        setState(() => _busy = false);
      }
      return;
    }
    if (!mounted) return;
    context.toast(tr('「${f.name}」を購入しました', 'Purchased "${f.name}"'));
    widget.onChanged(_with(bought: f.id), null);
    await widget.onReloadCoins();
    if (!mounted) return;
    await FramesApi.applyIconFrame(f.id)
        .then((_) {
          if (mounted) widget.onChanged(_with(bought: f.id, applied: f.id), null);
        })
        .catchError((Object _) {});
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final preview = s.byId(_previewId);
    final kindFiltered = _kindFiltered;
    final visible = _category == 'all' ? kindFiltered : kindFiltered.where((f) => FrameRules.category(f.slug) == _category).toList();
    final special = _category == 'all' ? visible.where((f) => FrameRules.category(f.slug) == 'special').toList() : <FrameItem>[];
    final plan = _category == 'all' ? visible.where((f) => FrameRules.category(f.slug) == 'plan').toList() : <FrameItem>[];
    final others = _category == 'all' ? visible.where((f) => !{'special', 'plan'}.contains(FrameRules.category(f.slug))).toList() : visible;
    final categories = FrameRules.categories.where((c) => c.$1 == 'all' || kindFiltered.any((f) => FrameRules.category(f.slug) == c.$1)).toList();

    return Column(
      children: [
        _previewPanel(context, preview),
        const SizedBox(height: Ds.s8),
        PillTabs(
          labels: [tr('すべて', 'All'), tr('サブスク', 'Plan'), tr('コイン', 'Coins'), tr('使える枠', 'Available')],
          index: _kind.index,
          padding: const EdgeInsets.symmetric(horizontal: Ds.s12),
          onChanged: (i) => setState(() {
            _kind = _Kind.values[i];
            _category = 'all';
          }),
        ),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: 4),
            children: [
              for (final c in categories)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: AppChip(tr(c.$2, c.$3), selected: _category == c.$1, onTap: () => setState(() => _category = c.$1)),
                ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Ds.s12, Ds.s8, Ds.s12, Ds.s16),
            children: [
              if (special.isNotEmpty) ...[
                _sectionTitle(context, Icons.auto_awesome_rounded, tr('スペシャル', 'Special'), tr('プレミアムコイン限定。いちばん豪華な枠です', 'Premium coins only. Our most luxurious frames')),
                _grid(special),
                const SizedBox(height: Ds.s12),
              ],
              if (plan.isNotEmpty) ...[
                _sectionTitle(context, Icons.workspace_premium_rounded, tr('プラン限定', 'Plan exclusive'), tr('プランが上がるほど、豪華な枠を選べます', 'Higher plans unlock more luxurious frames')),
                _grid(plan),
                const SizedBox(height: Ds.s12),
              ],
              if (special.isNotEmpty || plan.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(tr('そのほかの枠', 'More frames'), style: const TextStyle(fontWeight: FontWeight.w700)),
                ),
              _grid(others, withNone: _kind != _Kind.coin && _kind != _Kind.subscription && _category == 'all'),
              if (visible.isEmpty && _kind != _Kind.all)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Text(
                    _kind == _Kind.owned ? tr('使える枠はまだありません。気になる枠を押すと試着できます', 'No frames yet. Tap any frame to try it on') : tr('該当する枠はありません', 'No frames found'),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: context.muted),
                  ),
                ),
              if (_kind == _Kind.all)
                Pressable(
                  onTap: () => context.push('/gacha'),
                  child: Container(
                    margin: const EdgeInsets.only(top: Ds.s16),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: context.hairline),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.casino_outlined, size: 18, color: Ds.purple),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(tr('ガチャでしか手に入らない枠もあります', 'Some frames are gacha-only'), style: TextStyle(color: context.muted, fontSize: 12)),
                        ),
                        Text(tr('スペシャル枠ガチャ', 'Special frame gacha'), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
                        const Icon(Icons.chevron_right_rounded, size: 18),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        _actionBar(context, preview),
      ],
    );
  }

  Widget _previewPanel(BuildContext context, FrameItem? preview) {
    final fg = _dark ? Colors.white : context.cs.onSurface;
    return Container(
      color: _dark ? const Color(0xFF1B1D23) : context.skeleton.withValues(alpha: 0.5),
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, Ds.s12),
      child: Row(
        children: [
          UserAvatar(url: s.iconUrl, frame: preview?.frame, size: 96, animateDecoration: true),
          const SizedBox(width: Ds.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  preview?.name ?? tr('枠なし', 'No frame'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: fg),
                ),
                const SizedBox(height: 2),
                Text(
                  preview?.description ?? tr('アイコンをそのまま表示します', 'Shows your icon as it is'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: fg.withValues(alpha: 0.7)),
                ),
                if (preview?.isPremiumCoinsOnly == true) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.diamond_rounded, size: 13, color: Ds.gold),
                      const SizedBox(width: 3),
                      Text(
                        tr('プレミアムコイン限定', 'Premium coins only'),
                        style: const TextStyle(fontSize: 11, color: Ds.gold, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 6),
                // コメント欄など、小さく出たときの見え方
                Row(
                  children: [
                    UserAvatar(url: s.iconUrl, frame: preview?.frame, size: 28, animated: false),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        s.userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fg),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _dark = !_dark),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(color: fg.withValues(alpha: 0.3)),
                        ),
                        child: Text(_dark ? tr('明るい背景', 'Light') : tr('暗い背景', 'Dark'), style: TextStyle(fontSize: 11, color: fg)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, IconData icon, String title, String sub) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 6,
      children: [
        Icon(icon, size: 15, color: Ds.gold),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        Text(sub, style: TextStyle(color: context.muted, fontSize: 12)),
      ],
    ),
  );

  Widget _grid(List<FrameItem> frames, {bool withNone = false}) {
    final tiles = <Widget>[if (withNone) _tile(null), for (final f in frames) _tile(f)];
    if (tiles.isEmpty) return const SizedBox.shrink();
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.sizeOf(context).width >= 600 ? 5 : 3,
      childAspectRatio: 0.82,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: tiles,
    );
  }

  Widget _tile(FrameItem? f) {
    final selected = _previewId == f?.id;
    final applied = s.appliedFrameId == f?.id;
    final access = f == null ? FrameAccess.available : _access(f);
    Widget? badge;
    if (f != null) {
      if (access == FrameAccess.needsPlan) {
        badge = _badge(Icons.lock_rounded, FrameRules.passLabel(f.requiredPassType));
      } else if (access == FrameAccess.needsCoins) {
        badge = _badge(f.isPremiumCoinsOnly ? Icons.diamond_rounded : Icons.monetization_on_rounded, _n(f.priceCoins ?? 0));
      } else if (f.isCoinFrame || f.isGachaOnly) {
        badge = _badge(Icons.check_rounded, tr('購入済み', 'Owned'));
      }
    }
    return Pressable(
      onTap: () => setState(() => _previewId = f?.id),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? Ds.pink.withValues(alpha: 0.08) : null,
          border: Border.all(color: selected ? Ds.pink : context.hairline, width: selected ? 2 : 1),
        ),
        padding: const EdgeInsets.all(6),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: UserAvatar(url: s.iconUrl, frame: f?.frame, size: 64, animated: false),
                  ),
                ),
                Text(f?.name ?? tr('枠なし', 'No frame'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11)),
                if (badge != null) badge,
              ],
            ),
            if (applied) const Positioned(top: 0, right: 0, child: Icon(Icons.check_circle_rounded, size: 18, color: Ds.pink)),
          ],
        ),
      ),
    );
  }

  Widget _badge(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(top: 2),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 11, color: context.muted),
        const SizedBox(width: 2),
        Text(text, style: TextStyle(fontSize: 10, color: context.muted)),
      ],
    ),
  );

  Widget _actionBar(BuildContext context, FrameItem? preview) {
    final applied = _previewId == s.appliedFrameId;
    final access = preview == null ? FrameAccess.available : _access(preview);
    final coins = widget.coins;
    final premiumOnly = preview?.isPremiumCoinsOnly == true;
    final payable = coins == null ? null : (premiumOnly ? coins.premium : coins.total);
    final price = preview?.priceCoins ?? 0;
    Widget child;
    if (applied) {
      child = SecondaryButton(label: tr('使用中です', 'In use'), icon: Icons.check_rounded, onPressed: () => context.pop());
    } else if (access == FrameAccess.available) {
      child = PrimaryButton(label: preview == null ? tr('枠をはずす', 'Remove frame') : tr('この枠にする', 'Use this frame'), loading: _busy, onPressed: _busy ? null : () => _apply(_previewId));
    } else if (access == FrameAccess.needsPlan) {
      final label = FrameRules.passLabel(preview!.requiredPassType);
      child = PrimaryButton(label: tr('$label プランで使えます。プランを見る', 'Available on $label. See plans'), icon: Icons.workspace_premium_rounded, onPressed: () => Nav.plans(context));
    } else if (payable != null && payable < price) {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            premiumOnly
                ? tr(
                    'プレミアムコインがあと ${_n(price - payable)} 枚足りません（保有 ${_n(payable)}）。無料コインでは買えません',
                    '${_n(price - payable)} more premium coins needed (you have ${_n(payable)}). Free coins can\'t be used',
                  )
                : tr('あと ${_n(price - payable)} コイン足りません（保有 ${_n(payable)}）', '${_n(price - payable)} more coins needed (you have ${_n(payable)})'),
            textAlign: TextAlign.center,
            style: TextStyle(color: context.muted, fontSize: 12),
          ),
          const SizedBox(height: 6),
          SecondaryButton(
            label: premiumOnly ? tr('プレミアムコインを買う', 'Buy premium coins') : tr('コインを増やす', 'Get more coins'),
            onPressed: () async {
              await showCoinShopSheet(context);
              await widget.onReloadCoins();
            },
          ),
        ],
      );
    } else {
      child = PrimaryButton(
        label: tr('${_n(price)} コインで購入してこの枠にする', 'Buy for ${_n(price)} coins and use'),
        icon: premiumOnly ? Icons.diamond_rounded : Icons.monetization_on_rounded,
        loading: _busy,
        onPressed: _busy || payable == null ? null : () => _buy(preview!, payable),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: context.hairline)),
      ),
      padding: EdgeInsets.fromLTRB(Ds.s12, Ds.s12, Ds.s12, Ds.s12 + MediaQuery.paddingOf(context).bottom),
      child: child,
    );
  }
}

/// ヘッダー枠。ガチャで手に入れた枠だけ選べる
class _HeaderFrames extends StatefulWidget {
  const _HeaderFrames({required this.settings, required this.gacha, required this.onChanged});

  final FrameSettings settings;
  final GachaState gacha;
  final ValueChanged<GachaState> onChanged;

  @override
  State<_HeaderFrames> createState() => _HeaderFramesState();
}

class _HeaderFramesState extends State<_HeaderFrames> {
  late String? _preview = widget.gacha.selectedHeaderFrameSlug;
  bool _busy = false;

  Future<void> _apply() async {
    setState(() => _busy = true);
    try {
      final next = await FramesApi.selectHeaderFrame(_preview);
      if (!mounted) return;
      widget.onChanged(next);
      context.toast(_preview == null ? tr('ヘッダー枠を外しました', 'Header frame removed') : tr('ヘッダー枠を変更しました', 'Header frame updated'));
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
    final owned = GachaRules.pool.where((p) => p.kind == GachaPrizeKind.header && widget.gacha.owns(p)).toList()..sort((a, b) => b.rarity.index - a.rarity.index);
    final allHeaders = gachaPrizes.where((p) => p.kind == GachaPrizeKind.header && !owned.contains(p) && widget.gacha.owns(p));
    final list = [...owned, ...allHeaders];
    final applied = _preview == widget.gacha.selectedHeaderFrameSlug;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s4, Ds.s16, Ds.s8),
          child: AspectRatio(
            aspectRatio: 5 / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (widget.settings.headerImageUrl != null)
                    AppImage(widget.settings.headerImageUrl, memCacheWidth: 1000, fallback: const DecoratedBox(decoration: BoxDecoration(gradient: Ds.brandGradient)))
                  else
                    const DecoratedBox(decoration: BoxDecoration(gradient: Ds.brandGradient)),
                  if (_preview != null) HeaderFrameOverlay(key: ValueKey(_preview), slug: _preview!),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: list.isEmpty
              ? StateView.empty(
                  tr('ヘッダー枠はまだありません', 'No header frames yet'),
                  message: tr('ヘッダー枠はスペシャル枠ガチャで手に入ります', 'Header frames come from the special frame gacha'),
                  icon: Icons.casino_outlined,
                  actionLabel: tr('ガチャを見る', 'See the gacha'),
                  onAction: () => context.push('/gacha'),
                )
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: Ds.s12),
                  children: [
                    _row(null),
                    for (final p in list) _row(p),
                    const SizedBox(height: Ds.s12),
                    Center(
                      child: TextButton.icon(onPressed: () => context.push('/gacha'), icon: const Icon(Icons.casino_outlined, size: 18), label: Text(tr('ガチャでヘッダー枠を集める', 'Collect more in the gacha'))),
                    ),
                  ],
                ),
        ),
        if (list.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(top: BorderSide(color: context.hairline)),
            ),
            padding: EdgeInsets.fromLTRB(Ds.s12, Ds.s12, Ds.s12, Ds.s12 + MediaQuery.paddingOf(context).bottom),
            child: applied
                ? SecondaryButton(label: tr('使用中です', 'In use'), icon: Icons.check_rounded, onPressed: () => context.pop())
                : PrimaryButton(label: _preview == null ? tr('ヘッダー枠をはずす', 'Remove header frame') : tr('このヘッダー枠にする', 'Use this header frame'), loading: _busy, onPressed: _busy ? null : _apply),
          ),
      ],
    );
  }

  Widget _row(GachaPrize? p) {
    final selected = _preview == p?.slug;
    final wearing = widget.gacha.selectedHeaderFrameSlug == p?.slug;
    return Pressable(
      onTap: () => setState(() => _preview = p?.slug),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? Ds.pink : context.hairline, width: selected ? 2 : 1),
        ),
        child: Row(
          children: [
            if (p != null)
              PrizeThumb(p, size: 36)
            else
              SizedBox(
                width: 108,
                height: 36,
                child: Center(child: Icon(Icons.block_rounded, color: context.muted)),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (p != null) ...[RarityBadge(p.rarity, small: true), const SizedBox(width: 6)],
                      Flexible(
                        child: Text(
                          p?.name ?? tr('枠なし', 'No frame'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  if (p != null)
                    Text(
                      p.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: context.muted, fontSize: 11),
                    ),
                ],
              ),
            ),
            if (wearing) const Icon(Icons.check_circle_rounded, color: Ds.pink, size: 20),
          ],
        ),
      ),
    );
  }
}
