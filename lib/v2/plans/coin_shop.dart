import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/plans/iap.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

/// コインを買う画面（下から出るシート）
Future<void> showCoinShopSheet(BuildContext context) async {
  if (!Nav.requireLogin(context)) return;
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (context) => const _CoinShop(),
  );
}

class _CoinShop extends StatefulWidget {
  const _CoinShop();

  @override
  State<_CoinShop> createState() => _CoinShopState();
}

class _CoinShopState extends State<_CoinShop> {
  List<ProductDetails> _items = [];
  CoinSummary? _balance;
  bool _loading = true;
  String? _userId;
  String? _buyingId;

  @override
  void initState() {
    super.initState();
    Iap.start();
    Iap.state.addListener(_onIap);
    _load();
  }

  @override
  void dispose() {
    Iap.state.removeListener(_onIap);
    super.dispose();
  }

  void _onIap() {
    if (!mounted) return;
    final s = Iap.state.value;
    switch (s.phase) {
      case IapPhase.done:
        setState(() => _buyingId = null);
        if (s.grantedCoins != null) {
          context.toast(
            s.grantedCoins! > 0 ? '${s.grantedCoins} コインを受け取りました' : '購入はすでに反映されています',
            icon: Icons.monetization_on_rounded,
          );
          _loadBalance();
        }
      case IapPhase.failed:
        setState(() => _buyingId = null);
        if (s.message != null) context.toast(s.message!, error: true);
      case IapPhase.canceled:
        setState(() => _buyingId = null);
      case IapPhase.purchasing:
      case IapPhase.syncing:
      case IapPhase.idle:
        break;
    }
  }

  Future<void> _load() async {
    final items = await Iap.coinItems().catchError((_) => <ProductDetails>[]);
    String? userId;
    try {
      final data = await Api.query('query AppViewerId { viewer { id user { id } } }');
      userId = data.obj('viewer')?.obj('user')?.strOrNull('id');
    } on ApiException {
      userId = null;
    }
    if (!mounted) return;
    setState(() {
      _items = items;
      _userId = userId;
      _loading = false;
    });
    await _loadBalance();
  }

  Future<void> _loadBalance() async {
    try {
      final balance = await Coins.summary();
      if (mounted) setState(() => _balance = balance);
    } catch (_) {
      // 残高が出せなくても購入はできる
    }
  }

  Future<void> _buy(ProductDetails product) async {
    final userId = _userId;
    if (userId == null) {
      context.toast('ログインしてからお試しください', error: true);
      return;
    }
    setState(() => _buyingId = product.id);
    await Iap.buyCoins(product, userId: userId);
  }

  @override
  Widget build(BuildContext context) {
    final busy = _buyingId != null || Iap.state.value.phase == IapPhase.syncing;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            const Icon(Icons.monetization_on_rounded, color: Ds.gold),
            const SizedBox(width: 8),
            Text('コインを買う', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
            const Spacer(),
            if (_balance != null)
              Text('残り ${_balance!.total}', style: TextStyle(color: context.muted, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 4),
          Text(
            'コインは画像生成や、作品への応援に使えます。買ったコインに期限はありません。',
            style: TextStyle(color: context.muted, fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 14),
          if (_loading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Center(child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5))),
            )
          else if (_items.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(children: [
                Icon(Icons.storefront_outlined, color: context.muted, size: 28),
                const SizedBox(height: 8),
                Text(
                  '現在このプラットフォームでは購入できません',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: context.muted, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  'ウェブ版（www.aipictors.com）からは購入できます',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: context.muted, fontSize: 12),
                ),
                if (Iap.lastProductIssue.value != null) ...[
                  const SizedBox(height: 4),
                  Text(Iap.lastProductIssue.value!, textAlign: TextAlign.center, style: TextStyle(color: context.muted, fontSize: 11)),
                ],
              ]),
            )
          else
            for (final item in _items) ...[
              _CoinItem(
                product: item,
                coins: coinProducts[item.id] ?? 0,
                busy: busy,
                isBuying: _buyingId == item.id,
                onTap: () => _buy(item),
              ),
              const SizedBox(height: 8),
            ],
          const SizedBox(height: 4),
          Text(
            'お支払いは $storeName で行われます。購入したコインは払い戻しできません。',
            style: TextStyle(color: context.muted, fontSize: 11, height: 1.5),
          ),
        ]),
      ),
    );
  }
}

class _CoinItem extends StatelessWidget {
  const _CoinItem({
    required this.product,
    required this.coins,
    required this.busy,
    required this.isBuying,
    required this.onTap,
  });

  final ProductDetails product;
  final int coins;
  final bool busy;
  final bool isBuying;
  final VoidCallback onTap;

  /// 1,100 のように 3 桁ごとに区切る
  static String _comma(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }

  /// おまけの枚数（商品 ID の数字と配る枚数の差）
  int get _bonus {
    final base = int.tryParse(product.id.split(RegExp(r'[._]')).last) ?? coins;
    return coins > base ? coins - base : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Pressable(
      scale: 0.99,
      onTap: busy ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: context.skeleton.withValues(alpha: 0.6),
          borderRadius: Ds.br(14),
        ),
        child: Row(children: [
          const Icon(Icons.monetization_on_rounded, color: Ds.gold, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${_comma(coins)} コイン', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
              if (_bonus > 0)
                Text('＋${_comma(_bonus)} 枚のおまけ', style: TextStyle(color: context.muted, fontSize: 11.5)),
            ]),
          ),
          if (isBuying)
            const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.2))
          else
            Text(product.price, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
        ]),
      ),
    );
  }
}
