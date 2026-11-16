import 'dart:math' as math;

import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/support_tier.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/support_tier.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

/// 推し（コインでクリエイターを応援する）シート
Future<bool> showSupportSheet(
  BuildContext context, {
  required String userId,
  required String userName,
  String? iconUrl,
  AvatarFrame? frame,
  bool showRewardNote = true,
}) async {
  if (!Nav.requireLogin(context)) return false;
  final sent = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (_) => _SupportSheet(userId: userId, userName: userName, iconUrl: iconUrl, frame: frame, showRewardNote: showRewardNote),
  );
  return sent == true;
}

class _SupportSheet extends StatefulWidget {
  const _SupportSheet({required this.userId, required this.userName, this.iconUrl, this.frame, this.showRewardNote = true});

  final String userId;
  final String userName;
  final String? iconUrl;
  final AvatarFrame? frame;

  /// 「クリエイターの報酬につながります」の一言（R18 の作品の画面では false）
  final bool showRewardNote;

  @override
  State<_SupportSheet> createState() => _SupportSheetState();
}

class _SupportSheetState extends State<_SupportSheet> {
  static const _presets = [10, 30, 50, 100, 300, 500];

  CoinSummary? _balance;
  String? _error;
  int _amount = 10;
  bool _anonymous = false;
  bool _sending = false;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final b = await Coins.summary();
      if (!mounted) return;
      setState(() {
        _balance = b;
        if (b.total > 0 && _amount > b.total) _amount = b.total;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<void> _send() async {
    final b = _balance;
    if (b == null) return;
    final breakdown = SupportBreakdown.of(_amount, b);
    if (breakdown == null) return;
    setState(() => _sending = true);
    try {
      await Coins.support(recipientUserId: widget.userId, breakdown: breakdown, isAnonymous: _anonymous);
      Ds.success();
      if (!mounted) return;
      setState(() {
        _sending = false;
        _done = true;
      });
      await Future.delayed(const Duration(milliseconds: 1400));
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _sending = false);
      context.toast(e.message, error: true);
    }
  }

  void _custom() async {
    final controller = TextEditingController(text: '$_amount');
    final v = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr('枚数を入力', 'Enter amount')),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(suffixText: tr('枚', 'coins')),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(tr('キャンセル', 'Cancel'))),
          FilledButton(onPressed: () => Navigator.pop(context, int.tryParse(controller.text.trim())), child: Text(tr('決定', 'OK'))),
        ],
      ),
    );
    if (v != null && v > 0) setState(() => _amount = v);
  }

  @override
  Widget build(BuildContext context) {
    final b = _balance;
    final breakdown = b == null ? null : SupportBreakdown.of(_amount, b);
    return AnimatedSize(
      duration: Ds.normal,
      curve: Ds.curve,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + MediaQuery.viewInsetsOf(context).bottom),
        child: _done
            ? _SentView(name: widget.userName, breakdown: b == null ? null : SupportBreakdown.of(_amount, b))
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: [
                    UserAvatar(url: widget.iconUrl, frame: widget.frame, size: 44, ring: true),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(tr('${widget.userName}さんを推す', 'Support ${widget.userName}'), style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                        Text(tr('コインで応援できます', 'Cheer with coins'), style: context.tt.bodySmall?.copyWith(color: context.muted)),
                      ]),
                    ),
                  ]),
                  const SizedBox(height: 18),
                  _BalanceRow(balance: b, error: _error),
                  const SizedBox(height: 16),
                  Text(tr('応援するコイン', 'Coins to send'), style: context.tt.labelLarge?.copyWith(color: context.muted)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final p in _presets)
                        _AmountChip(
                          label: '$p',
                          selected: _amount == p,
                          enabled: b == null || p <= b.total,
                          tier: SupportTier.of(b == null ? p : (SupportBreakdown.of(p, b)?.pt ?? p)),
                          onTap: () => setState(() => _amount = p),
                        ),
                      _AmountChip(
                        label: _presets.contains(_amount) ? tr('その他', 'Other') : '$_amount',
                        icon: Icons.edit_rounded,
                        selected: !_presets.contains(_amount),
                        enabled: true,
                        onTap: _custom,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  if (b != null)
                    AnimatedSwitcher(
                      duration: Ds.fast,
                      child: breakdown == null
                          ? Text(
                              b.total == 0 ? tr('コインがありません。毎日のログインやプラン加入でもらえます', 'No coins. You get coins by logging in daily or with a plan') : tr('コインが足りません（残り${b.total}枚）', 'Not enough coins (${b.total} left)'),
                              key: const ValueKey('ng'),
                              style: TextStyle(color: context.cs.error, fontSize: 13),
                            )
                          : Row(
                              key: ValueKey(breakdown.pt),
                              children: [
                                Expanded(
                                  child: Text(
                                    tr('', 'Uses ') +
                                        [
                                          if (breakdown.free > 0) tr('フリー${breakdown.free}枚', 'Free ${breakdown.free}'),
                                          if (breakdown.premium > 0) tr('プレミアム${breakdown.premium}枚', 'Premium ${breakdown.premium}'),
                                        ].join(tr('＋', ' + ')) +
                                        tr('を使います', ''),
                                    style: context.tt.bodySmall?.copyWith(color: context.muted),
                                  ),
                                ),
                                // 選んだ枚数の段階の色（コメントやランキングでこの色で目立つ）
                                SupportTierChip(free: breakdown.free, premium: breakdown.premium, pt: breakdown.pt),
                              ],
                            ),
                    ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    value: _anonymous,
                    onChanged: (v) => setState(() => _anonymous = v),
                    title: Text(tr('匿名で送る', 'Send anonymously')),
                    subtitle: Text(tr('相手やランキングに名前を出しません', 'Your name is not shown to them or in rankings')),
                  ),
                  if (widget.showRewardNote) ...[const SupportRewardNote(), const SizedBox(height: 10)],
                  GradientButton(
                    label: breakdown == null ? tr('推す', 'Support') : tr('$_amount枚で応援する', 'Send $_amount coins'),
                    icon: Icons.volunteer_activism_rounded,
                    gradient: Ds.goldGradient,
                    loading: _sending,
                    onPressed: breakdown == null ? null : _send,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr('フリーコインは1枚1pt、プレミアムコインは1枚10ptとして推しランキングに加算されます。送ったコインは戻せません。', 'Free coins count 1pt and premium coins 10pt each in the support ranking. Sent coins cannot be returned.'),
                    textAlign: TextAlign.center,
                    style: context.tt.bodySmall?.copyWith(color: context.muted, height: 1.5),
                  ),
                ],
              ),
      ),
    );
  }
}

class _BalanceRow extends StatelessWidget {
  const _BalanceRow({required this.balance, this.error});

  final CoinSummary? balance;
  final String? error;

  @override
  Widget build(BuildContext context) {
    Widget cell(String label, int? v, Color color) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: Ds.br(14)),
            child: Row(children: [
              Icon(Icons.monetization_on_rounded, color: color, size: 20),
              const SizedBox(width: 6),
              Expanded(child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
              v == null
                  ? const Skeleton(width: 28, height: 14, radius: 4)
                  : Text('$v', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            ]),
          ),
        );
    if (error != null) {
      return Text(error!, style: TextStyle(color: context.cs.error));
    }
    return Row(children: [
      cell(tr('フリー', 'Free'), balance?.free, Ds.sky),
      const SizedBox(width: 8),
      cell(tr('プレミアム', 'Premium'), balance?.premium, Ds.gold),
    ]);
  }
}

class _AmountChip extends StatelessWidget {
  const _AmountChip({required this.label, required this.selected, required this.enabled, required this.onTap, this.icon, this.tier});

  final String label;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;
  final IconData? icon;

  /// 金額の段階（選ぶとその色で塗る）
  final SupportTier? tier;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: Ds.fast,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: selected ? (tier?.gradient ?? Ds.goldGradient) : null,
          color: selected ? null : (tier == null ? context.skeleton : tier!.color.withValues(alpha: context.isDark ? 0.16 : 0.1)),
          border: tier == null || selected ? null : Border.all(color: tier!.color.withValues(alpha: 0.5), width: 1.5),
          borderRadius: Ds.br(14),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 14, color: selected ? (tier?.onColor ?? Colors.white) : context.muted), const SizedBox(width: 4)],
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: selected ? (tier?.onColor ?? Colors.white) : (enabled ? context.cs.onSurface : context.muted.withValues(alpha: 0.4)),
            ),
          ),
        ]),
      ),
    );
  }
}

class _SentView extends StatefulWidget {
  const _SentView({required this.name, this.breakdown});

  final String name;
  final SupportBreakdown? breakdown;

  @override
  State<_SentView> createState() => _SentViewState();
}

class _SentViewState extends State<_SentView> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 端末の「動きを減らす」では最後の形だけ出す
    if (MediaQuery.disableAnimationsOf(context)) {
      _c.value = 1;
    } else if (_c.value == 0 && !_c.isAnimating) {
      _c.forward();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          final t = Curves.easeOutBack.transform(_c.value.clamp(0, 1));
          return Stack(alignment: Alignment.center, children: [
            for (var i = 0; i < 12; i++)
              Transform.translate(
                offset: Offset(math.cos(i * math.pi / 6) * 110 * _c.value, math.sin(i * math.pi / 6) * 90 * _c.value),
                child: Opacity(
                  opacity: (1 - _c.value).clamp(0, 1),
                  child: Icon(Icons.monetization_on_rounded, color: i.isEven ? Ds.gold : Ds.pink, size: 18),
                ),
              ),
            Transform.scale(
              scale: t,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ShaderMask(
                  shaderCallback: (r) => Ds.goldGradient.createShader(r),
                  child: const Icon(Icons.volunteer_activism_rounded, size: 72, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(tr('推しました！', 'Supported!'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text(tr('${widget.name}さんに応援が届きました', 'Your support reached ${widget.name}'), style: TextStyle(color: context.muted)),
                if (widget.breakdown != null) ...[
                  const SizedBox(height: 10),
                  SupportTierChip(free: widget.breakdown!.free, premium: widget.breakdown!.premium, pt: widget.breakdown!.pt),
                ],
              ]),
            ),
          ]);
        },
      ),
    );
  }
}
