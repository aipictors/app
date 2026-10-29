import 'dart:io';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/plans/iap.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:url_launcher/url_launcher.dart';

class PlanSpec {
  const PlanSpec({
    required this.type,
    required this.name,
    required this.tagline,
    required this.dailyImages,
    required this.perRequest,
    required this.concurrent,
    required this.lora,
    required this.modelSlots,
    required this.extras,
    required this.color,
  });

  final String type;
  final String name;
  final String tagline;
  final int dailyImages;
  final int perRequest;
  final int concurrent;
  final int lora;
  final int modelSlots;
  final List<String> extras;
  final Color color;

  int get dailyCoins => dailyImages * 10;
}

/// Web の plan-specs.ts と同じ数字
const planSpecs = [
  PlanSpec(
    type: 'LITE',
    name: 'ライト',
    tagline: '毎日気軽に生成したい方に',
    dailyImages: 50,
    perRequest: 4,
    concurrent: 1,
    lora: 2,
    modelSlots: 3,
    extras: ['画像から生成（i2i）', '広告の非表示', '認証マークの表示'],
    color: Ds.sky,
  ),
  PlanSpec(
    type: 'STANDARD',
    name: 'スタンダード',
    tagline: 'しっかり創作したい方に',
    dailyImages: 100,
    perRequest: 4,
    concurrent: 2,
    lora: 5,
    modelSlots: 10,
    extras: ['画像から生成（i2i）', '高速モード・予約生成', '広告の非表示', '認証マークの表示'],
    color: Ds.purple,
  ),
  PlanSpec(
    type: 'PREMIUM',
    name: 'プレミアム',
    tagline: 'とにかくたくさん生成したい方に',
    dailyImages: 200,
    perRequest: 4,
    concurrent: 3,
    lora: 5,
    modelSlots: 30,
    extras: ['画像から生成（i2i）', '高速モード・予約生成', '広告の非表示', '認証マークの表示'],
    color: Ds.gold,
  ),
];

const _rank = {'LITE': 1, 'STANDARD': 2, 'PREMIUM': 3};

/// プラン（App 内課金）
class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  List<ProductDetails> _products = [];
  String? _productsError;
  bool _loading = true;
  String? _userId;
  Map<String, dynamic>? _pass;
  String? _buying;

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
    final s = Iap.state.value;
    if (!mounted) return;
    switch (s.phase) {
      case IapPhase.done:
        setState(() => _buying = null);
        if (s.passType != null) {
          Ds.success();
          _celebrate(s.passType!);
        } else if (s.message != null) {
          context.toast(s.message!);
        }
        _loadViewer();
      case IapPhase.failed:
        setState(() => _buying = null);
        if (s.message != null) context.toast(s.message!, error: true);
      case IapPhase.canceled:
        setState(() => _buying = null);
      case IapPhase.purchasing:
      case IapPhase.syncing:
      case IapPhase.idle:
        setState(() {});
    }
  }

  Future<void> _load() async {
    await Future.wait([_loadProducts(), _loadViewer()]);
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _loadProducts() async {
    try {
      final p = await Iap.products();
      if (mounted) setState(() => _products = p);
    } on ApiException catch (e) {
      if (mounted) setState(() => _productsError = e.message);
    } catch (e) {
      if (mounted) setState(() => _productsError = 'プランの情報を取得できませんでした');
    }
  }

  Future<void> _loadViewer() async {
    if (!Nav.isLoggedIn) return;
    Map<String, dynamic>? data;
    try {
      data = await Api.query('query AppViewerPass { viewer { user { id } currentPass { id type periodEnd paymentProvider } } }');
    } on ApiException {
      // paymentProvider がまだ無いサーバーでも動くように
      try {
        data = await Api.query('query AppViewerPassLegacy { viewer { user { id } currentPass { id type periodEnd } } }');
      } on ApiException catch (_) {}
    }
    if (!mounted || data == null) return;
    setState(() {
      _userId = data!.obj('viewer')?.obj('user')?.strOrNull('id');
      _pass = data.obj('viewer')?.obj('currentPass');
    });
  }

  ProductDetails? _productFor(String type) {
    final id = productIdOf(type);
    for (final p in _products) {
      if (p.id == id) return p;
    }
    return null;
  }

  Future<void> _buy(PlanSpec plan) async {
    if (!Nav.requireLogin(context)) return;
    if (_userId == null) await _loadViewer();
    if (!mounted) return;
    final product = _productFor(plan.type);
    if (product == null || _userId == null) {
      context.toast(_productsError ?? 'プランの情報を取得できませんでした', error: true);
      return;
    }
    if (_pass != null && _pass!.strOrNull('paymentProvider') != storeProvider) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog.adaptive(
          title: const Text('すでにプランに加入しています'),
          content: Text('現在のプランは $storeName 以外の方法で加入しています。二重のお支払いにならないよう、アプリからは加入できません。プランの変更・解約は、加入したときと同じ方法で行ってください。'),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
        ),
      );
      return;
    }
    setState(() => _buying = plan.type);
    Ds.impact();
    await Iap.buy(product, userId: _userId!);
  }

  void _celebrate(String type) {
    final plan = planSpecs.firstWhere((p) => p.type == type, orElse: () => planSpecs.first);
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: Ds.br(28)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: 84,
              height: 84,
              decoration: const BoxDecoration(shape: BoxShape.circle, gradient: Ds.brandGradient),
              child: const Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 48),
            ),
            const SizedBox(height: 16),
            Text('${plan.name}プランへようこそ！', textAlign: TextAlign.center, style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            Text('毎日${plan.dailyCoins}コイン（約${plan.dailyImages}枚分）で、たくさん生成できます。', textAlign: TextAlign.center, style: TextStyle(color: context.muted, height: 1.5)),
            const SizedBox(height: 20),
            GradientButton(label: 'さっそく生成する', icon: Icons.auto_awesome_rounded, onPressed: () => Navigator.pop(context)),
          ]),
        ),
      ),
    );
  }

  Future<void> _open(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

  @override
  Widget build(BuildContext context) {
    final current = _pass?.strOrNull('type');
    final provider = _pass?.strOrNull('paymentProvider');
    final busy = Iap.state.value.phase == IapPhase.syncing;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 210,
            stretch: true,
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF3A2C9E),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Aipictors プラン', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white)),
              background: Stack(fit: StackFit.expand, children: [
                const DecoratedBox(decoration: BoxDecoration(gradient: Ds.brandGradient)),
                Positioned(right: -30, top: 20, child: Icon(Icons.auto_awesome_rounded, size: 180, color: Colors.white.withValues(alpha: 0.12))),
                const Positioned(
                  left: 20,
                  right: 20,
                  bottom: 64,
                  child: Text('もっとたくさん、もっと自由に生成しよう', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              ]),
            ),
          ),
          if (_pass != null)
            SliverToBoxAdapter(
              child: _CurrentPassCard(
                pass: _pass!,
                provider: provider,
                onManage: () => _open(Platform.isAndroid ? 'https://play.google.com/store/account/subscriptions?package=com.aipictors.app' : 'https://apps.apple.com/account/subscriptions'),
              ),
            ),
          if (busy)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: LinearProgressIndicator(),
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            sliver: SliverList.separated(
              itemCount: planSpecs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, i) {
                final plan = planSpecs[i];
                final product = _productFor(plan.type);
                final isCurrent = current == plan.type;
                final isDowngrade = current != null && (_rank[plan.type] ?? 0) < (_rank[current] ?? 0);
                return _PlanCard(
                  plan: plan,
                  price: product?.price ?? (kDebugMode ? const {'LITE': '¥600', 'STANDARD': '¥2,500', 'PREMIUM': '¥4,900'}[plan.type] : null),
                  loadingPrice: _loading,
                  recommended: plan.type == 'STANDARD',
                  isCurrent: isCurrent,
                  buttonLabel: isCurrent
                      ? '加入中'
                      : !Nav.isLoggedIn
                          ? 'ログインして加入'
                          : current == null
                              ? 'このプランに加入'
                              : isDowngrade
                                  ? 'このプランに変更'
                                  : 'アップグレード',
                  loading: _buying == plan.type,
                  onTap: isCurrent || (_buying != null) || (product == null && Nav.isLoggedIn) ? null : () => _buy(plan),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                if (_productsError != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(_productsError!, textAlign: TextAlign.center, style: TextStyle(color: context.cs.error)),
                  ),
                OutlinedButton.icon(
                  onPressed: busy ? null : () => Iap.restore(),
                  icon: const Icon(Icons.restore_rounded),
                  label: const Text('購入を復元'),
                ),
                const SizedBox(height: 16),
                Text(
                  Platform.isAndroid
                      ? '・お支払いは購入の確定時に Google アカウントに請求されます。\n'
                          '・定期購入は1か月ごとに自動で更新されます。解約しない限り、期間の終わりに次の期間の料金が請求されます。\n'
                          '・解約やプランの変更は、Google Play ストアの［お支払いと定期購入］→［定期購入］からいつでも行えます。\n'
                          '・Google Play 以外の方法で加入したプランとは別のお支払いです。二重に加入しないようご注意ください。'
                      : '・お支払いは購入の確定時に Apple ID に請求されます。\n'
                          '・サブスクリプションは1か月ごとに自動で更新されます。現在の期間が終わる24時間前までに自動更新をオフにしない限り、期間終了前の24時間以内に次の期間の料金が請求されます。\n'
                          '・自動更新の停止やプランの変更は、iPhone の［設定］→［Apple ID］→［サブスクリプション］からいつでも行えます。\n'
                          '・App Store 以外の方法で加入したプランとは別のお支払いです。二重に加入しないようご注意ください。',
                  style: TextStyle(color: context.muted, fontSize: 12, height: 1.6),
                ),
                const SizedBox(height: 12),
                Wrap(alignment: WrapAlignment.center, spacing: 4, children: [
                  if (!Platform.isAndroid) TextButton(onPressed: () => _open('https://www.apple.com/legal/internet-services/itunes/dev/stdeula/'), child: const Text('利用規約（EULA）')),
                  TextButton(onPressed: () => _open('https://www.aipictors.com/terms'), child: const Text('Aipictors 利用規約')),
                  TextButton(onPressed: () => _open('https://www.aipictors.com/privacy'), child: const Text('プライバシーポリシー')),
                  TextButton(onPressed: () => _open('https://www.aipictors.com/specified-commercial-transaction-act'), child: const Text('特定商取引法に基づく表記')),
                ]),
                SizedBox(height: 32 + MediaQuery.paddingOf(context).bottom),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentPassCard extends StatelessWidget {
  const _CurrentPassCard({required this.pass, required this.provider, required this.onManage});

  final Map<String, dynamic> pass;
  final String? provider;
  final VoidCallback onManage;

  @override
  Widget build(BuildContext context) {
    final plan = planSpecs.where((p) => p.type == pass.str('type')).firstOrNull;
    final end = pass.integer('periodEnd');
    final endText = end > 0
        ? () {
            final d = DateTime.fromMillisecondsSinceEpoch(end * 1000);
            return '${d.year}年${d.month}月${d.day}日';
          }()
        : null;
    final appStore = provider == storeProvider;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: Ds.br(20),
          color: (plan?.color ?? Ds.blue).withValues(alpha: 0.12),
          border: Border.all(color: (plan?.color ?? Ds.blue).withValues(alpha: 0.4)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.verified_rounded, color: plan?.color ?? Ds.blue),
            const SizedBox(width: 8),
            Text('${plan?.name ?? pass.str('type')}プランに加入中', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          ]),
          const SizedBox(height: 6),
          Text(
            [
              if (endText != null) '次の更新日：$endText',
              appStore ? '$storeName でお支払い中' : '$storeName 以外の方法でお支払い中',
            ].join('\n'),
            style: TextStyle(color: context.muted, height: 1.5),
          ),
          if (appStore) ...[
            const SizedBox(height: 10),
            OutlinedButton.icon(onPressed: onManage, icon: const Icon(Icons.settings_rounded), label: const Text('サブスクリプションを管理')),
          ] else ...[
            const SizedBox(height: 6),
            Text('プランの変更・解約は、加入したときと同じ方法で行えます。', style: TextStyle(color: context.muted, fontSize: 12)),
          ],
        ]),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.plan,
    required this.price,
    required this.loadingPrice,
    required this.recommended,
    required this.isCurrent,
    required this.buttonLabel,
    required this.loading,
    required this.onTap,
  });

  final PlanSpec plan;
  final String? price;
  final bool loadingPrice;
  final bool recommended;
  final bool isCurrent;
  final String buttonLabel;
  final bool loading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget feature(IconData icon, String text) => Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, size: 18, color: plan.color),
            const SizedBox(width: 8),
            Expanded(child: Text(text, style: const TextStyle(height: 1.35))),
          ]),
        );
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        decoration: BoxDecoration(
          color: context.surfaceCard,
          borderRadius: Ds.br(24),
          border: Border.all(color: recommended ? plan.color : context.hairline, width: recommended ? 2 : 1),
          boxShadow: recommended ? [BoxShadow(color: plan.color.withValues(alpha: 0.18), blurRadius: 24, offset: const Offset(0, 10))] : null,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(plan.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: plan.color)),
                const SizedBox(height: 2),
                Text(plan.tagline, style: TextStyle(color: context.muted, fontSize: 13)),
              ]),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              loadingPrice
                  ? const Skeleton(width: 80, height: 24, radius: 6)
                  : Text(price ?? '—', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              Text('/月', style: TextStyle(color: context.muted, fontSize: 12)),
            ]),
          ]),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(color: plan.color.withValues(alpha: 0.1), borderRadius: Ds.br(14)),
            child: Row(children: [
              Icon(Icons.monetization_on_rounded, color: plan.color),
              const SizedBox(width: 8),
              Expanded(
                child: Text.rich(TextSpan(children: [
                  const TextSpan(text: '毎日 '),
                  TextSpan(text: '${plan.dailyCoins}コイン', style: const TextStyle(fontWeight: FontWeight.w900)),
                  TextSpan(text: '（約${plan.dailyImages}枚分）'),
                ])),
              ),
            ]),
          ),
          feature(Icons.grid_view_rounded, '1回で${plan.perRequest}枚まとめて生成・同時に${plan.concurrent}件'),
          feature(Icons.layers_rounded, 'LoRA を${plan.lora}個まで同時に使える'),
          feature(Icons.upload_file_rounded, '自分のモデルを${plan.modelSlots}個まで登録'),
          for (final e in plan.extras) feature(Icons.check_circle_rounded, e),
          const SizedBox(height: 16),
          GradientButton(
            label: buttonLabel,
            loading: loading,
            gradient: isCurrent
                ? const LinearGradient(colors: [Color(0xFF9AA0AA), Color(0xFF9AA0AA)])
                : LinearGradient(colors: [plan.color, Color.lerp(plan.color, Ds.pink, 0.45)!]),
            onPressed: onTap,
          ),
        ]),
      ),
      if (recommended)
        Positioned(
          top: -11,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(gradient: Ds.brandGradient, borderRadius: Ds.br(12)),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.auto_awesome_rounded, size: 13, color: Colors.white),
                SizedBox(width: 4),
                Text('おすすめ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
              ]),
            ),
          ),
        ),
    ]);
  }
}
