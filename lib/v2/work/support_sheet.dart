import 'dart:math' as math;

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// 推し（コインでクリエイターを応援する）シート
Future<bool> showSupportSheet(
  BuildContext context, {
  required String userId,
  required String userName,
  String? iconUrl,
}) async {
  if (!Nav.requireLogin(context)) return false;
  final sent = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (_) => _SupportSheet(userId: userId, userName: userName, iconUrl: iconUrl),
  );
  return sent == true;
}

class _SupportSheet extends StatefulWidget {
  const _SupportSheet({required this.userId, required this.userName, this.iconUrl});

  final String userId;
  final String userName;
  final String? iconUrl;

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
        title: const Text('枚数を入力'),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(suffixText: '枚'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('キャンセル')),
          FilledButton(onPressed: () => Navigator.pop(context, int.tryParse(controller.text.trim())), child: const Text('決定')),
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
            ? _SentView(name: widget.userName)
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: [
                    Avatar(widget.iconUrl, size: 44, ring: true),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('${widget.userName}さんを推す', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                        Text('コインを送って応援できます', style: context.tt.bodySmall?.copyWith(color: context.muted)),
                      ]),
                    ),
                  ]),
                  const SizedBox(height: 18),
                  _BalanceRow(balance: b, error: _error),
                  const SizedBox(height: 16),
                  Text('送るコイン', style: context.tt.labelLarge?.copyWith(color: context.muted)),
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
                          onTap: () => setState(() => _amount = p),
                        ),
                      _AmountChip(
                        label: _presets.contains(_amount) ? 'その他' : '$_amount',
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
                              b.total == 0 ? 'コインがありません。毎日のログインやプラン加入でもらえます' : 'コインが足りません（残り${b.total}枚）',
                              key: const ValueKey('ng'),
                              style: TextStyle(color: context.cs.error, fontSize: 13),
                            )
                          : Text(
                              '${[
                                if (breakdown.free > 0) 'フリー${breakdown.free}枚',
                                if (breakdown.premium > 0) 'プレミアム${breakdown.premium}枚',
                              ].join('＋')}を使います（推し ${breakdown.pt}pt）',
                              key: ValueKey(breakdown.pt),
                              style: context.tt.bodySmall?.copyWith(color: context.muted),
                            ),
                    ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    value: _anonymous,
                    onChanged: (v) => setState(() => _anonymous = v),
                    title: const Text('匿名で送る'),
                    subtitle: const Text('相手やランキングに名前を出しません'),
                  ),
                  const SizedBox(height: 8),
                  GradientButton(
                    label: breakdown == null ? '推す' : '$_amount枚で推す',
                    icon: Icons.volunteer_activism_rounded,
                    gradient: Ds.goldGradient,
                    loading: _sending,
                    onPressed: breakdown == null ? null : _send,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'フリーコインは1枚1pt、プレミアムコインは1枚10ptとして推しランキングに加算されます。送ったコインは戻せません。',
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
      cell('フリー', balance?.free, Ds.sky),
      const SizedBox(width: 8),
      cell('プレミアム', balance?.premium, Ds.gold),
    ]);
  }
}

class _AmountChip extends StatelessWidget {
  const _AmountChip({required this.label, required this.selected, required this.enabled, required this.onTap, this.icon});

  final String label;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: Ds.fast,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: selected ? Ds.goldGradient : null,
          color: selected ? null : context.skeleton,
          borderRadius: Ds.br(14),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 14, color: selected ? Colors.white : context.muted), const SizedBox(width: 4)],
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: selected ? Colors.white : (enabled ? context.cs.onSurface : context.muted.withValues(alpha: 0.4)),
            ),
          ),
        ]),
      ),
    );
  }
}

class _SentView extends StatefulWidget {
  const _SentView({required this.name});

  final String name;

  @override
  State<_SentView> createState() => _SentViewState();
}

class _SentViewState extends State<_SentView> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..forward();

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
                Text('推しを送りました！', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text('${widget.name}さんに届きました', style: TextStyle(color: context.muted)),
              ]),
            ),
          ]);
        },
      ),
    );
  }
}
