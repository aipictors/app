import 'dart:math';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/plans/coin_shop.dart';
import 'package:aipictors/v2/requests/requests_api.dart';
import 'package:aipictors/v2/requests/requests_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

String? get _myId => FirebaseAuth.instance.currentUser == null ? null : _cachedUserId;
String? _cachedUserId;

/// ログイン中の利用者の ID（GraphQL の viewer）。所有者の判定に使う
Future<String?> _viewerId() async {
  if (FirebaseAuth.instance.currentUser == null) return null;
  if (_cachedUserId != null) return _cachedUserId;
  try {
    final data = await Api.query('query AppRequestsViewer { viewer { user { id } } }');
    _cachedUserId = data.obj('viewer')?.obj('user')?.strOrNull('id');
  } catch (_) {}
  return _cachedUserId;
}

void _openTerms() => launchUrl(Uri.parse('https://www.aipictors.com/requests/terms'), mode: LaunchMode.inAppBrowserView);

// ---------------------------------------------------------------- プラン一覧

class RequestPlansScreen extends StatefulWidget {
  const RequestPlansScreen({super.key});

  @override
  State<RequestPlansScreen> createState() => _RequestPlansScreenState();
}

class _RequestPlansScreenState extends State<RequestPlansScreen> {
  static final _sorts = [('popular', tr('人気', 'Popular')), ('new', tr('新着', 'New')), ('cheap', tr('安い順', 'Lowest price'))];
  int _category = 0;
  int _sort = 0;
  List<RequestPlan>? _plans;
  Map<String, RequestUser> _users = {};
  String? _error;

  List<String> get _categoryKeys => ['', ...planCategoryLabels.keys];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _plans = null;
      _error = null;
    });
    try {
      final (plans, users) = await RequestsApi.plans(category: _categoryKeys[_category], sort: _sorts[_sort].$1);
      if (!mounted) return;
      setState(() {
        _plans = plans;
        _users = users;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final plans = _plans;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('プラン一覧', 'Request plans')),
        actions: [IconButton(tooltip: tr('依頼の管理', 'My requests'), icon: const Icon(Icons.inbox_rounded), onPressed: () => context.push('/requests'))],
      ),
      body: AppRefresh(
        onRefresh: _load,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(gradient: Ds.brandGradient, borderRadius: Ds.br(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('好きなクリエイターに\nコインで描いてもらおう', 'Ask your favorite creators\nto draw for coins'),
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, height: 1.3),
                    ),
                    const SizedBox(height: 6),
                    Text(tr('プランを選んで内容を書くだけ。お断り・期限切れのときはコインが全額戻ります。', 'Pick a plan and describe what you want. If declined or expired, your coins are fully returned.'), style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 12.5)),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: [
                        ActionChip(
                          avatar: const Icon(Icons.add_rounded, size: 18),
                          label: Text(tr('プランを出品する', 'Offer a plan')),
                          onPressed: () => context.push('/settings/requests'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: PillTabs(
                labels: [tr('すべて', 'All'), ...planCategoryLabels.values],
                index: _category,
                onChanged: (i) {
                  setState(() => _category = i);
                  _load();
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Wrap(
                  spacing: 6,
                  children: [
                    for (var i = 0; i < _sorts.length; i++)
                      ChoiceChip(
                        label: Text(_sorts[i].$2),
                        selected: _sort == i,
                        onSelected: (_) {
                          setState(() => _sort = i);
                          _load();
                        },
                      ),
                  ],
                ),
              ),
            ),
            if (_error != null)
              SliverFillRemaining(
                hasScrollBody: false,
                child: StateView(icon: Icons.wifi_off_rounded, title: _error!, actionLabel: tr('再読み込み', 'Reload'), onAction: _load),
              )
            else if (plans == null)
              const SkeletonGrid(sliver: true, maxExtent: 220, aspect: 0.72)
            else if (plans.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: StateView(
                  icon: Icons.storefront_rounded,
                  title: tr('まだプランがありません', 'No plans yet'),
                  message: tr('最初のプランを出品してみませんか？', 'Why not offer the first plan?'),
                  actionLabel: tr('プランを作る', 'Create a plan'),
                  onAction: () => context.push('/settings/requests'),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 32),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => RequestPlanCard(plan: plans[i], user: _users[plans[i].userId]),
                    childCount: plans.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- プランの詳細

class RequestPlanScreen extends StatefulWidget {
  const RequestPlanScreen({super.key, required this.id});

  final String id;

  @override
  State<RequestPlanScreen> createState() => _RequestPlanScreenState();
}

class _RequestPlanScreenState extends State<RequestPlanScreen> {
  RequestPlan? _plan;
  RequestUser? _user;
  RequestPlanDetail? _detail;
  String? _error;
  String? _me;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final detail = await RequestsApi.planDetail(widget.id);
      final me = await _viewerId();
      if (!mounted) return;
      setState(() {
        _detail = detail;
        _plan = detail.plan;
        _user = detail.users[detail.plan.userId];
        _me = me;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<void> _report() async {
    final reason = await _askText(context, title: tr('プランを通報', 'Report plan'), hint: tr('理由（規約違反の内容など）', 'Reason (what rule is broken, etc.)'), action: tr('通報する', 'Report'));
    if (reason == null || reason.isEmpty) return;
    try {
      await RequestsApi.reportPlan(widget.id, reason);
      if (mounted) context.toast(tr('通報しました。運営が確認します', 'Reported. Our team will check it'));
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final plan = _plan;
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(),
        body: StateView(icon: Icons.search_off_rounded, title: _error!),
      );
    }
    if (plan == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final isOwn = _me != null && _me == plan.userId;
    final muted = TextStyle(color: context.muted, fontSize: 12);
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('プラン', 'Plan')),
        actions: [if (!isOwn) IconButton(tooltip: tr('通報', 'Report'), icon: const Icon(Icons.flag_outlined), onPressed: _report)],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 120),
        children: [
          if (plan.sampleImageUrls.isNotEmpty)
            SizedBox(
              height: 260,
              child: PageView(
                children: [
                  for (final url in plan.sampleImageUrls)
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 2), child: AppImage(url, radius: 20)),
                ],
              ),
            ),
          const SizedBox(height: 12),
          Text(planCategoryLabels[plan.category] ?? '', style: muted),
          Text(plan.title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          RequestUserChip(_user, size: 30),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: context.surfaceCard,
              borderRadius: Ds.br(18),
              border: Border.all(color: context.hairline),
            ),
            child: Column(
              children: [
                Row(children: [Text(tr('価格', 'Price')), const Spacer(), CoinPrice(plan.priceCoins, size: 18)]),
                const Divider(height: 18),
                _Spec(tr('納期', 'Delivery'), tr('承諾から ${plan.deliveryDays} 日', '${plan.deliveryDays} days after accepting')),
                _Spec(tr('納品', 'Delivery'), tr('${plan.imageCount} 枚', '${plan.imageCount} images')),
                _Spec(tr('修正', 'Revisions'), tr('${plan.revisionCount} 回まで', 'Up to ${plan.revisionCount}')),
                _Spec(tr('受付', 'Status'), plan.canApply ? tr('受付中（${plan.activeCount ?? 0}/${plan.maxActive}）', 'Open (${plan.activeCount ?? 0}/${plan.maxActive})') : (plan.isFull ? tr('受付上限', 'Full') : tr('受付停止', 'Closed'))),
                if (plan.allowsR18) _Spec('R18', tr('受け付けます', 'Open')),
                if (plan.completedCount > 0) _Spec(tr('実績', 'Track record'), tr('完了 ${plan.completedCount} 件', '${plan.completedCount} completed')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(plan.description, style: const TextStyle(height: 1.6)),
          if (_detail != null && _detail!.showcase.isNotEmpty) ...[
            const SizedBox(height: 20),
            RequestShowcaseStrip(items: _detail!.showcase, count: _detail!.showcaseCount, users: _detail!.users, planId: plan.id, padding: 0),
          ],
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Ds.sky.withValues(alpha: 0.08), borderRadius: Ds.br(14)),
            child: Text(tr('コインは申し込みのときに運営が預かり、完了したときにクリエイターへ渡ります。お断り・期限切れ・キャンセルのときは全額戻ります。', 'Aipictors holds your coins when you request and passes them to the creator on completion. If declined, expired or canceled, they are fully returned.'), style: const TextStyle(fontSize: 12.5, height: 1.5)),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: isOwn
              ? SecondaryButton(label: tr('プランを編集', 'Edit plan'), icon: Icons.edit_rounded, onPressed: () => context.push('/settings/requests'))
              : PrimaryButton(
                  label: plan.canApply ? tr('このプランで依頼する', 'Request with this plan') : tr('いまは受け付けていません', 'Not accepting requests now'),
                  icon: Icons.send_rounded,
                  onPressed: plan.canApply
                      ? () {
                          if (!Nav.requireLogin(context)) return;
                          context.push('/requests/new?plan=${plan.id}');
                        }
                      : null,
                ),
        ),
      ),
    );
  }
}

class _Spec extends StatelessWidget {
  const _Spec(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: context.muted, fontSize: 13)),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- 申し込み

class RequestNewScreen extends StatefulWidget {
  const RequestNewScreen({super.key, this.planId, this.creatorId});

  final String? planId;
  final String? creatorId;

  @override
  State<RequestNewScreen> createState() => _RequestNewScreenState();
}

class _RequestNewScreenState extends State<RequestNewScreen> {
  final _title = TextEditingController();
  final _body = TextEditingController();
  final _price = TextEditingController();
  final _clientKey = '${DateTime.now().microsecondsSinceEpoch}-${Random().nextInt(1 << 30)}';
  RequestPlan? _plan;
  CreatorProfile? _creator;
  RequestUser? _user;
  CoinSummary? _coins;
  List<String> _images = [];
  bool _isR18 = false;

  /// 完成した作品をクリエイターの実績として公開してよい（透かし入り。既定はオフ）
  bool _showcaseAllowed = false;
  bool _agree = false;
  bool _submitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    _price.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      if (widget.planId != null) {
        final (plan, users) = await RequestsApi.plan(widget.planId!);
        _plan = plan;
        _user = users[plan.userId];
      } else if (widget.creatorId != null) {
        final c = await RequestsApi.creator(widget.creatorId!);
        _creator = c;
        _user = c.users[widget.creatorId!];
        _price.text = '${c.settings.minCoins}';
      }
      await _loadCoins();
      if (mounted) setState(() {});
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<void> _loadCoins() async {
    try {
      final c = await Coins.summary();
      if (mounted) setState(() => _coins = c);
    } catch (_) {}
  }

  int get _priceCoins => _plan?.priceCoins ?? int.tryParse(_price.text.trim()) ?? 0;
  bool get _allowsR18 => _plan?.allowsR18 ?? _creator?.settings.allowsR18 ?? false;
  String get _creatorId => _plan?.userId ?? widget.creatorId ?? '';

  Future<void> _buyCoins() async {
    // 入力はこの画面に残ったまま。買ったら残高を取り直す
    await showCoinShopSheet(context);
    await _loadCoins();
  }

  Future<void> _submit() async {
    final price = _priceCoins;
    if (_body.text.trim().isEmpty) return context.toast(tr('リクエストの内容を書いてください', 'Please describe your request'), error: true);
    if (price < 100 || price > 100000) return context.toast(tr('金額は 100〜100,000 コインで指定してください', 'Please set 100–100,000 coins'), error: true);
    if (!_agree) return context.toast(tr('リクエスト規約に同意してください', 'Please agree to the request terms'), error: true);
    setState(() => _submitting = true);
    try {
      final id = await RequestsApi.apply({
        'planId': _plan?.id,
        'creatorUserId': _creatorId,
        'clientKey': _clientKey,
        'title': _title.text.trim().isEmpty ? (_plan?.title ?? tr('リクエスト', 'Requests')) : _title.text.trim(),
        'body': _body.text.trim(),
        'referenceImageUrls': _images,
        'isR18': _allowsR18 && _isR18,
        'showcaseAllowed': _showcaseAllowed,
        'priceCoins': price,
        if (_plan == null) 'deliveryDays': 14,
      });
      if (!mounted) return;
      Ds.success();
      context.pushReplacement('/requests/$id?created=1');
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.code == 'INSUFFICIENT_COINS') {
        await _buyCoins();
      } else {
        context.toast(e.message, error: true);
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(),
        body: StateView(icon: Icons.error_outline_rounded, title: _error!),
      );
    }
    if (_plan == null && _creator == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (_creator != null && !_creator!.canFreeRequest) {
      return Scaffold(
        appBar: AppBar(),
        body: StateView(icon: Icons.do_not_disturb_on_outlined, title: tr('いまは自由リクエストを受け付けていません', 'Custom requests are not accepted now')),
      );
    }
    final price = _priceCoins;
    final balance = _coins?.total;
    final short = balance != null && price > balance ? price - balance : 0;
    final muted = TextStyle(color: context.muted, fontSize: 12);
    return Scaffold(
      appBar: AppBar(title: Text(tr('リクエストを送る', 'Send a request'))),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 140),
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.surfaceCard,
                borderRadius: Ds.br(16),
                border: Border.all(color: context.hairline),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_plan != null ? tr('プラン', 'Plan') : tr('自由リクエスト', 'Custom request'), style: muted),
                        Text(_plan?.title ?? tr('内容と金額を自分で決めて依頼', 'You decide the content and price'), style: const TextStyle(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 6),
                        RequestUserChip(_user, size: 20, tappable: false),
                      ],
                    ),
                  ),
                  if (_plan != null) CoinPrice(_plan!.priceCoins, size: 17),
                ],
              ),
            ),
            if (_creator != null && _creator!.settings.note.isNotEmpty) ...[const SizedBox(height: 8), Text(_creator!.settings.note, style: muted)],
            const SizedBox(height: 16),
            TextField(
              controller: _title,
              maxLength: 60,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(labelText: tr('タイトル（任意）', 'Title (optional)'), hintText: tr('例: 推しのアイコンをお願いしたいです', 'e.g. An icon of my favorite character')),
            ),
            TextField(
              controller: _body,
              minLines: 5,
              maxLines: 12,
              maxLength: 4000,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(labelText: tr('リクエストの内容', 'Request details'), alignLabelWithHint: true, hintText: tr('描いてほしいもの・雰囲気・色・使い道（アイコン等）など', 'What to draw, mood, colors, how you will use it (icon, etc.)')),
            ),
            const SizedBox(height: 8),
            RequestImagePicker(value: _images, onChanged: (v) => setState(() => _images = v), max: 4, label: tr('参考画像（任意）', 'Reference images (optional)')),
            if (_plan == null) ...[
              const SizedBox(height: 16),
              TextField(
                controller: _price,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 16),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: tr('金額（コイン）', 'Price (coins)'),
                  helperText: tr('${formatCoins(_creator?.settings.minCoins ?? 100)} コインから。納期の目安は承諾から 14 日', 'From ${formatCoins(_creator?.settings.minCoins ?? 100)} coins. Delivery is about 14 days after accepting'),
                ),
              ),
            ],
            if (_allowsR18)
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: Text(tr('R18 の内容を含む', 'Includes R18 content')),
                subtitle: Text(tr('R18 の規約に従います', 'I follow the R18 rules'), style: muted),
                value: _isR18,
                onChanged: (v) => setState(() => _isR18 = v),
              ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: Text(tr('クリエイターの実績として公開してOK', "OK to show as the creator's work")),
              subtitle: Text(
                tr('完成した作品を、透かしを入れてクリエイターのプランやマイページの実績に載せられます。あとから取り消せます', "The finished work can be shown with a watermark on the creator's plan and profile. You can change this later"),
                style: muted,
              ),
              value: _showcaseAllowed,
              onChanged: (v) => setState(() => _showcaseAllowed = v),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: context.surfaceCard,
                borderRadius: Ds.br(16),
                border: Border.all(color: context.hairline),
              ),
              child: Column(
                children: [
                  Row(children: [Text(tr('お支払い', 'Payment')), const Spacer(), CoinPrice(price, size: 17)]),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(tr('いまの残高', 'Your balance'), style: muted),
                      const Spacer(),
                      Text(balance == null ? '…' : tr('${formatCoins(balance)} コイン', '${formatCoins(balance)} coins'), style: muted),
                    ],
                  ),
                  if (short > 0) ...[
                    const SizedBox(height: 10),
                    Text(
                      tr('あと ${formatCoins(short)} コイン足りません。買っても入力はそのまま残ります。', 'You need ${formatCoins(short)} more coins. Your input stays after buying.'),
                      style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: Ds.pink),
                    ),
                    const SizedBox(height: 8),
                    SecondaryButton(label: tr('コインを買う', 'Buy coins'), icon: Icons.add_card_rounded, onPressed: _buyCoins, height: 42),
                  ],
                  const SizedBox(height: 8),
                  Text(tr('コインは運営が預かり、完了したときにクリエイターへ渡ります。お断り・期限切れのときは全額戻ります。', 'Aipictors holds your coins and passes them to the creator on completion. If declined or expired, they are fully returned.'), style: muted),
                ],
              ),
            ),
            CheckboxListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: _agree,
              onChanged: (v) => setState(() => _agree = v ?? false),
              title: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: _openTerms,
                        child: Text(tr('有料リクエスト規約', 'Paid Request Terms'), style: const TextStyle(decoration: TextDecoration.underline, fontSize: 13)),
                      ),
                    ),
                    TextSpan(text: tr('に同意します', ' — I agree'), style: const TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: short > 0
              ? PrimaryButton(label: tr('コインを買って続ける', 'Buy coins and continue'), icon: Icons.add_card_rounded, onPressed: _buyCoins)
              : PrimaryButton(
                  label: tr('${formatCoins(price)} コインで依頼する', 'Request for ${formatCoins(price)} coins'),
                  icon: Icons.send_rounded,
                  loading: _submitting,
                  onPressed: _submitting ? null : _submit,
                ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- 依頼の管理

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  static final _statuses = [('open', tr('進行中', 'Active')), ('pending', tr('承諾待ち', 'Waiting')), ('active', tr('制作中', 'In progress')), ('delivered', tr('納品済み', 'Delivered')), ('done', tr('完了', 'Completed')), ('closed', tr('終了', 'Ended'))];
  bool _sent = false;
  int _status = 0;
  RequestList? _list;
  String? _error;
  (int, int)? _badge;

  @override
  void initState() {
    super.initState();
    _load();
    // 通知（種類 REQUEST）を確認済みにする
    Api.query(
      'query AppMarkRequestNotifications { viewer { id notifications(offset: 0, limit: 1, where: { type: REQUEST }) { __typename } } }',
    ).catchError((_) => <String, dynamic>{});
  }

  Future<void> _load() async {
    if (!Nav.isLoggedIn) return;
    setState(() {
      _list = null;
      _error = null;
    });
    try {
      final results = await Future.wait([RequestsApi.list(sent: _sent, status: _statuses[_status].$1), RequestsApi.badge()]);
      if (!mounted) return;
      setState(() {
        _list = results[0] as RequestList;
        _badge = results[1] as (int, int);
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!Nav.isLoggedIn) {
      return Scaffold(
        appBar: AppBar(title: Text(tr('リクエスト', 'Requests'))),
        body: LoginRequiredView(title: tr('ログインが必要です', 'Please log in'), message: tr('依頼の管理はログインすると使えます', 'Log in to manage your requests'), onLogin: () => Nav.login(context)),
      );
    }
    final list = _list;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('リクエスト', 'Requests')),
        actions: [
          IconButton(tooltip: tr('プラン一覧', 'Request plans'), icon: const Icon(Icons.storefront_rounded), onPressed: () => context.push('/requests/plans')),
          IconButton(tooltip: tr('受付の設定', 'Settings'), icon: const Icon(Icons.tune_rounded), onPressed: () => context.push('/settings/requests')),
        ],
      ),
      body: AppRefresh(
        onRefresh: _load,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  for (final (sent, label, count) in [(false, tr('受けた依頼', 'Received'), _badge?.$1 ?? 0), (true, tr('出した依頼', 'Sent'), _badge?.$2 ?? 0)])
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _sent = sent;
                            _status = 0;
                          });
                          _load();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: _sent == sent ? context.cs.onSurface : context.hairline, width: _sent == sent ? 2 : 1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                label,
                                style: TextStyle(fontWeight: FontWeight.w800, color: _sent == sent ? null : context.muted),
                              ),
                              if (count > 0) ...[const SizedBox(width: 4), Badge2('$count', color: Ds.pink)],
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
                child: PillTabs(
                  labels: [for (final s in _statuses) (list?.counts[s.$1] ?? 0) > 0 ? '${s.$2} ${list!.counts[s.$1]}' : s.$2],
                  index: _status,
                  onChanged: (i) {
                    setState(() => _status = i);
                    _load();
                  },
                ),
              ),
            ),
            if (_error != null)
              SliverFillRemaining(
                hasScrollBody: false,
                child: StateView(icon: Icons.wifi_off_rounded, title: _error!, actionLabel: tr('再読み込み', 'Reload'), onAction: _load),
              )
            else if (list == null)
              const SkeletonList(sliver: true, count: 5)
            else if (list.requests.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: _sent
                    ? StateView(
                        icon: Icons.inbox_rounded,
                        title: tr('まだ依頼していません', 'You have not sent any requests'),
                        message: tr('好きなクリエイターのプランからコインで依頼できます', 'Request from your favorite creators\' plans with coins'),
                        actionLabel: tr('プランを探す', 'Find plans'),
                        onAction: () => context.push('/requests/plans'),
                      )
                    : StateView(
                        icon: Icons.inbox_rounded,
                        title: tr('まだ依頼はありません', 'No requests yet'),
                        message: tr('プランを作るとマイページとプラン一覧に並びます', 'Your plans appear on your page and in the plan list'),
                        actionLabel: tr('プランを作る', 'Create a plan'),
                        onAction: () => context.push('/settings/requests'),
                      ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 32),
                sliver: SliverList.separated(
                  itemCount: list.requests.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _RequestRow(request: list.requests[i], users: list.users, sent: _sent, onBack: _load),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _RequestRow extends StatelessWidget {
  const _RequestRow({required this.request, required this.users, required this.sent, required this.onBack});

  final CoinRequest request;
  final Map<String, RequestUser> users;
  final bool sent;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final r = request;
    final other = users[sent ? r.creatorUserId : r.requesterUserId];
    final (label, at) = switch (r.status) {
      'PENDING' => (tr('返事の期限', 'Reply by'), r.respondBy),
      'ACCEPTED' => (tr('納期', 'Delivery'), r.dueAt),
      'DELIVERED' => (tr('自動で完了', 'Auto-completes'), r.autoCompleteAt),
      _ => ('', null),
    };
    final needsMe = (!sent && (r.status == 'PENDING' || r.status == 'ACCEPTED')) || (sent && r.status == 'DELIVERED');
    return Pressable(
      onTap: () async {
        await context.push('/requests/${r.id}');
        onBack();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.surfaceCard,
          borderRadius: Ds.br(16),
          border: Border.all(color: needsMe ? Ds.sky.withValues(alpha: 0.7) : context.hairline, width: needsMe ? 1.5 : 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RequestStatusBadge(r.status),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    r.planTitle != null ? tr('プラン「${r.planTitle}」', 'Plan "${r.planTitle}"') : tr('自由リクエスト', 'Custom request'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: context.muted, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              r.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(child: RequestUserChip(other, tappable: false)),
                CoinPrice(r.priceCoins, size: 14),
              ],
            ),
            if (at != null) ...[
              const SizedBox(height: 4),
              Text('$label: ${formatRemaining(at)}', style: TextStyle(color: context.muted, fontSize: 12)),
            ],
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- 依頼の詳細

class RequestDetailScreen extends StatefulWidget {
  const RequestDetailScreen({super.key, required this.id, this.created = false});

  final String id;
  final bool created;

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  CoinRequest? _r;
  Map<String, RequestUser> _users = {};
  String? _error;
  String? _busy;
  final _message = TextEditingController();
  List<String> _messageImages = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      await _viewerId();
      final (r, users) = await RequestsApi.detail(widget.id);
      if (!mounted) return;
      setState(() {
        _r = r;
        _users = users;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<bool> _act(String action, [Map<String, dynamic> extra = const {}, String? success]) async {
    setState(() => _busy = action);
    try {
      final r = await RequestsApi.act(widget.id, action, extra);
      if (r != null && mounted) setState(() => _r = r);
      if (r == null || action == 'message') await _load();
      if (success != null && mounted) {
        Ds.success();
        context.toast(success);
      }
      return true;
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
      await _load();
      return false;
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  Future<void> _deliver() async {
    final result = await showModalBottomSheet<(List<String>, String)>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (_) => const _DeliverSheet(),
    );
    if (result == null) return;
    await _act('deliver', {'imageUrls': result.$1, 'message': result.$2}, tr('納品しました', 'Delivered'));
  }

  @override
  Widget build(BuildContext context) {
    final r = _r;
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(),
        body: StateView(icon: Icons.error_outline_rounded, title: _error!),
      );
    }
    if (r == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final other = _users[r.isCreator ? r.requesterUserId : r.creatorUserId];
    final muted = TextStyle(color: context.muted, fontSize: 12);
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final overdue = r.status == 'ACCEPTED' && r.dueAt != null && now > r.dueAt!;
    return Scaffold(
      appBar: AppBar(
        title: Text(r.isCreator ? tr('受けた依頼', 'Received') : tr('出した依頼', 'Sent')),
        actions: [
          PopupMenuButton<String>(
            onSelected: (_) async {
              final reason = await _askText(context, title: tr('通報', 'Report'), hint: tr('理由', 'Reason'), action: tr('通報する', 'Report'));
              if (reason != null && reason.isNotEmpty) await _act('report', {'reason': reason}, tr('通報しました。運営が確認します', 'Reported. Our team will check it'));
            },
            itemBuilder: (_) => [PopupMenuItem(value: 'report', child: Text(tr('運営に通報', 'Report to staff')))],
          ),
        ],
      ),
      body: AppRefresh(
        onRefresh: _load,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
          children: [
            if (widget.created && r.status == 'PENDING')
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(gradient: Ds.brandGradient, borderRadius: Ds.br(18)),
                child: Text(
                  tr('リクエストを送りました！\nクリエイターの承諾を待っています（${formatDateTime(r.respondBy)} まで）。返事がなければコインは全額戻ります。', 'Request sent!\nWaiting for the creator to accept (until ${formatDateTime(r.respondBy)}). If there is no reply, your coins are fully returned.'),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, height: 1.5),
                ),
              ),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: context.surfaceCard,
                borderRadius: Ds.br(20),
                border: Border.all(color: context.hairline),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(r.planTitle != null ? tr('プラン「${r.planTitle}」', 'Plan "${r.planTitle}"') : tr('自由リクエスト', 'Custom request'), style: muted)),
                      RequestStatusBadge(r.status),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(r.title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(r.isCreator ? tr('依頼者 ', 'Requester ') : tr('クリエイター ', 'Creator '), style: muted),
                      Expanded(child: RequestUserChip(other)),
                      CoinPrice(r.priceCoins, size: 17),
                    ],
                  ),
                  const SizedBox(height: 14),
                  RequestSteps(r),
                  const SizedBox(height: 8),
                  if (r.status == 'PENDING') Text(tr('返事の期限: ${formatDateTime(r.respondBy)}（${formatRemaining(r.respondBy)}）', 'Reply by: ${formatDateTime(r.respondBy)} (${formatRemaining(r.respondBy)})'), style: muted),
                  if (r.status == 'ACCEPTED' && r.dueAt != null)
                    Text(tr('納期: ${formatDateTime(r.dueAt)}（${formatRemaining(r.dueAt)}）・修正あと ${r.revisionLeft} 回', 'Due: ${formatDateTime(r.dueAt)} (${formatRemaining(r.dueAt)}) · ${r.revisionLeft} revisions left'), style: muted),
                  if (r.status == 'DELIVERED' && r.autoCompleteAt != null) Text(tr('${formatDateTime(r.autoCompleteAt)} に自動で完了します', 'Auto-completes on ${formatDateTime(r.autoCompleteAt)}'), style: muted),
                  if (r.closedReason != null && r.closedReason!.isNotEmpty) Text(tr('理由: ${requestClosedReason(r.closedReason!)}', 'Reason: ${requestClosedReason(r.closedReason!)}'), style: muted),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ..._actions(context, r, overdue),
            if (r.settlement != null && r.isCreator) ...[const SizedBox(height: 8), _SettlementCard(r.settlement!)],
            _ShowcaseCard(request: r, busy: _busy != null, act: _act),
            if (r.deliveryImageUrls.isNotEmpty || r.deliveredWorkId != null) ...[
              const SizedBox(height: 16),
              Text(tr('納品', 'Delivery'), style: const TextStyle(fontWeight: FontWeight.w900)),
              if (r.deliveryMessage != null && r.deliveryMessage!.isNotEmpty) ...[const SizedBox(height: 6), Text(r.deliveryMessage!)],
              const SizedBox(height: 8),
              if (r.deliveryImageUrls.isNotEmpty) RequestImageGrid(r.deliveryImageUrls),
              if (r.deliveredWorkId != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () => Nav.work(context, r.deliveredWorkId!),
                    icon: const Icon(Icons.image_outlined, size: 18),
                    label: Text(tr('納品された作品を見る', 'View the delivered work')),
                  ),
                ),
            ],
            const SizedBox(height: 16),
            Text(tr('リクエストの内容', 'Request details'), style: const TextStyle(fontWeight: FontWeight.w900)),
            const SizedBox(height: 6),
            Text(r.body, style: const TextStyle(height: 1.6)),
            if (r.referenceImageUrls.isNotEmpty) ...[const SizedBox(height: 8), RequestImageGrid(r.referenceImageUrls)],
            const SizedBox(height: 20),
            Text(tr('メッセージ', 'Messages'), style: const TextStyle(fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            for (final m in r.messages) _MessageBubble(m, users: _users),
            if (r.isOpen) ...[
              const SizedBox(height: 8),
              TextField(
                controller: _message,
                minLines: 1,
                maxLines: 5,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: tr('メッセージを書く（サイトの外での連絡先の交換はできません）', 'Write a message (no sharing contact info outside the site)'),
                  suffixIcon: IconButton(
                    icon: _busy == 'message'
                        ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.send_rounded),
                    onPressed: _busy != null
                        ? null
                        : () async {
                            final text = _message.text.trim();
                            if (text.isEmpty && _messageImages.isEmpty) return;
                            if (await _act('message', {'body': text, 'imageUrls': _messageImages})) {
                              _message.clear();
                              setState(() => _messageImages = []);
                            }
                          },
                  ),
                ),
              ),
              const SizedBox(height: 6),
              RequestImagePicker(value: _messageImages, onChanged: (v) => setState(() => _messageImages = v), max: 4, label: tr('画像', 'Images')),
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _actions(BuildContext context, CoinRequest r, bool overdue) {
    const gap = SizedBox(height: 8);
    if (r.isCreator && r.status == 'PENDING') {
      return [
        PrimaryButton(
          label: tr('承諾して制作を始める', 'Accept and start'),
          icon: Icons.check_rounded,
          loading: _busy == 'accept',
          onPressed: _busy != null ? null : () => _act('accept', {}, tr('承諾しました。納期までに納品してください', 'Accepted. Please deliver by the due date')),
        ),
        gap,
        SecondaryButton(
          label: tr('お断りする（コインは全額返却）', 'Decline (coins fully returned)'),
          onPressed: _busy != null
              ? null
              : () async {
                  final reason = await _askText(context, title: tr('お断りする', 'Decline'), hint: tr('理由（依頼者に表示されます）', 'Reason (shown to the requester)'), action: tr('お断りする', 'Decline'));
                  if (reason != null) await _act('decline', {'reason': reason}, tr('お断りしました', 'Declined'));
                },
        ),
      ];
    }
    if (r.isCreator && r.status == 'ACCEPTED') {
      return [PrimaryButton(label: tr('納品する', 'Deliver'), icon: Icons.upload_rounded, loading: _busy == 'deliver', onPressed: _busy != null ? null : _deliver)];
    }
    if (!r.isCreator && r.status == 'DELIVERED') {
      return [
        PrimaryButton(
          label: tr('受け取りを確認して完了する', 'Confirm receipt and complete'),
          icon: Icons.celebration_rounded,
          loading: _busy == 'complete',
          onPressed: _busy != null
              ? null
              : () async {
                  final ok = await _confirm(context, tr('受け取りを確認しますか？', 'Confirm receipt?'), tr('完了するとコインがクリエイターに渡り、取り消せません。', 'On completion the coins go to the creator. This cannot be undone.'));
                  if (ok) await _act('complete', {}, tr('完了しました。ありがとうございました！', 'Completed. Thank you!'));
                },
        ),
        if (r.revisionLeft > 0) ...[
          gap,
          SecondaryButton(
            label: tr('修正をお願いする（あと ${r.revisionLeft} 回）', 'Ask for a revision (${r.revisionLeft} left)'),
            onPressed: _busy != null
                ? null
                : () async {
                    final text = await _askText(context, title: tr('修正をお願いする', 'Ask for a revision'), hint: tr('直してほしいところ', 'What to change'), action: tr('送る', 'Send'));
                    if (text != null && text.isNotEmpty) await _act('revise', {'message': text}, tr('修正をお願いしました', 'Revision requested'));
                  },
          ),
        ],
      ];
    }
    if (!r.isCreator && r.status == 'PENDING') {
      return [
        SecondaryButton(
          label: tr('取り下げる（コインは全額返却）', 'Withdraw (coins fully returned)'),
          onPressed: _busy != null
              ? null
              : () async {
                  if (await _confirm(context, tr('取り下げますか？', 'Withdraw this request?'), tr('預けたコインは全額戻ります。', 'Your coins will be fully returned.'))) {
                    await _act('cancel', {}, tr('取り下げました。コインを返却しました', 'Withdrawn. Your coins were returned'));
                  }
                },
        ),
      ];
    }
    if (!r.isCreator && overdue) {
      return [
        SecondaryButton(
          label: tr('納期を過ぎたのでキャンセルする（全額返却）', 'Cancel because it is overdue (full refund)'),
          onPressed: _busy != null
              ? null
              : () async {
                  if (await _confirm(context, tr('キャンセルしますか？', 'Cancel this request?'), tr('預けたコインは全額戻ります。', 'Your coins will be fully returned.'))) {
                    await _act('cancel', {}, tr('キャンセルしました。コインを返却しました', 'Canceled. Your coins were returned'));
                  }
                },
        ),
      ];
    }
    return const [];
  }
}

/// 実績としての公開（依頼者は許可・取り消し、クリエイターは自分の実績から外せる）。完了せずに終わった依頼には出さない。
/// R18 の依頼もサーバーでは実績になる（Web で年齢の確認のあとに表示）が、アプリの一覧には出さない
class _ShowcaseCard extends StatelessWidget {
  const _ShowcaseCard({required this.request, required this.busy, required this.act});

  final CoinRequest request;
  final bool busy;
  final Future<bool> Function(String action, [Map<String, dynamic> extra, String? success]) act;

  @override
  Widget build(BuildContext context) {
    final r = request;
    const closed = ['DECLINED', 'CANCELED', 'EXPIRED', 'ADMIN_CANCELED'];
    if (closed.contains(r.status)) return const SizedBox.shrink();
    if (r.isCreator && !r.showcaseAllowed) return const SizedBox.shrink();
    final muted = TextStyle(color: context.muted, fontSize: 12);
    final images = r.showcaseImageUrls;
    String? status;
    if (r.showcaseAllowed) {
      if (!r.isCompleted) {
        status = tr('取引が完了すると、透かし入りで実績に載ります', 'It will be shown with a watermark once the request is completed');
      } else if (images == null) {
        status = tr('透かし入りの画像を準備しています（数分かかります）', 'Preparing the watermarked image (takes a few minutes)');
      } else if (images.isEmpty) {
        status = tr('載せられる画像がありませんでした', 'There were no images that could be shown');
      } else if (r.showcaseHidden) {
        status = tr('クリエイターが実績に載せていません', 'The creator has chosen not to show it');
      } else {
        status = tr('プランとクリエイターのページの実績に載っています', "Shown on the plan and the creator's profile");
      }
    }
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.surfaceCard,
        borderRadius: Ds.br(18),
        border: Border.all(color: context.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(tr('実績としての公開', 'Showing as a work'), style: const TextStyle(fontWeight: FontWeight.w800)),
                    const RequestShowcaseBadge(),
                  ],
                ),
              ),
              Switch.adaptive(
                value: r.isCreator ? !r.showcaseHidden : r.showcaseAllowed,
                onChanged: busy
                    ? null
                    : (value) => r.isCreator
                          ? act('showcase-hide', {'hidden': !value}, value ? tr('実績に載せました', 'Now shown in your works') : tr('実績から外しました', 'Removed from your works'))
                          : act('showcase', {'allowed': value}, value ? tr('公開を許可しました', 'Permission granted') : tr('許可を取り消しました', 'Permission withdrawn')),
              ),
            ],
          ),
          Text(
            r.isCreator
                ? tr('依頼者が、完成した作品を実績として公開することを許可しています（透かし入り）', 'The requester allows the finished work to be shown (watermarked)')
                : tr(
                    '完成した作品を、透かしを入れてクリエイターのプランやマイページの実績に載せてよいか選べます。いつでも変えられます',
                    "Choose whether the finished work may be shown with a watermark on the creator's plan and profile. You can change this anytime",
                  ),
            style: muted,
          ),
          if (status != null) ...[const SizedBox(height: 6), Text(status, style: muted)],
          if (r.showcaseAllowed && images != null && images.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [for (final url in images) Padding(padding: const EdgeInsets.only(right: 8), child: AppImage(url, width: 72, height: 72, radius: 12))],
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- 実績の一覧

class RequestShowcaseScreen extends StatefulWidget {
  const RequestShowcaseScreen({super.key, this.planId, this.userId});

  final String? planId;
  final String? userId;

  @override
  State<RequestShowcaseScreen> createState() => _RequestShowcaseScreenState();
}

class _RequestShowcaseScreenState extends State<RequestShowcaseScreen> {
  List<RequestShowcaseItem>? _items;
  Map<String, RequestUser> _users = {};
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final (items, users) = await RequestsApi.showcase(planId: widget.planId, userId: widget.userId);
      if (!mounted) return;
      setState(() {
        _items = items;
        _users = users;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final planTitle = items != null && items.isNotEmpty ? items.first.planTitle : null;
    return Scaffold(
      appBar: AppBar(title: Text(widget.planId != null && planTitle != null ? tr('「$planTitle」の実績', 'Works from "$planTitle"') : tr('リクエストの実績', 'Request works'))),
      body: _error != null
          ? StateView(icon: Icons.error_outline_rounded, title: _error!)
          : items == null
          ? const Center(child: CircularProgressIndicator())
          : items.isEmpty
          ? StateView(icon: Icons.photo_library_outlined, title: tr('まだ公開されている実績はありません', 'No works shown yet'))
          : GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.78),
              itemCount: items.length,
              itemBuilder: (_, i) => RequestShowcaseCard(item: items[i], user: widget.planId != null ? null : _users[items[i].creatorUserId]),
            ),
    );
  }
}

class _SettlementCard extends StatelessWidget {
  const _SettlementCard(this.s);

  final Map<String, dynamic> s;

  @override
  Widget build(BuildContext context) {
    final yen = s.integer('earnedYen');
    final coins = s.integer('freeCoins') + s.integer('premiumCoins');
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF10B981).withValues(alpha: 0.1), borderRadius: Ds.br(14)),
      child: Text(
        tr(
          '受け取り: ${yen > 0 ? '報酬 ${formatYenL10n(yen)}（確認期間のあと振込）' : ''}${yen > 0 && coins > 0 ? '＋' : ''}${coins > 0 ? 'コイン ${formatCoins(coins)}' : ''}（手数料 ${formatCoins(s.integer('feeCoins'))} コイン）',
          'You receive: ${yen > 0 ? '${formatYenL10n(yen)} in rewards (paid after the check period)' : ''}${yen > 0 && coins > 0 ? ' + ' : ''}${coins > 0 ? '${formatCoins(coins)} coins' : ''} (fee ${formatCoins(s.integer('feeCoins'))} coins)',
        ),
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble(this.m, {required this.users});

  final RequestMessage m;
  final Map<String, RequestUser> users;

  @override
  Widget build(BuildContext context) {
    final system = m.senderUserId == null;
    final mine = !system && m.senderUserId == _myId;
    if (system) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Center(
          child: Text(
            '${formatDateTime(m.createdAt)}  ${requestSystemMessage(m.body)}',
            textAlign: TextAlign.center,
            style: TextStyle(color: context.muted, fontSize: 11.5),
          ),
        ),
      );
    }
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(color: mine ? Ds.sky.withValues(alpha: 0.16) : context.skeleton, borderRadius: Ds.br(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${users[m.senderUserId]?.name ?? ''}  ${formatDateTime(m.createdAt)}', style: TextStyle(color: context.muted, fontSize: 11)),
            if (m.body.isNotEmpty) Text(requestSystemMessage(m.body)),
            if (m.imageUrls.isNotEmpty) ...[const SizedBox(height: 6), RequestImageGrid(m.imageUrls)],
          ],
        ),
      ),
    );
  }
}

class _DeliverSheet extends StatefulWidget {
  const _DeliverSheet();

  @override
  State<_DeliverSheet> createState() => _DeliverSheetState();
}

class _DeliverSheetState extends State<_DeliverSheet> {
  List<String> _images = [];
  final _text = TextEditingController();

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, MediaQuery.viewInsetsOf(context).bottom + 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tr('納品する', 'Deliver'), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
          const SizedBox(height: 12),
          RequestImagePicker(value: _images, onChanged: (v) => setState(() => _images = v), max: 10, label: tr('納品する画像', 'Images to deliver')),
          const SizedBox(height: 8),
          TextField(
            controller: _text,
            minLines: 2,
            maxLines: 5,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(hintText: tr('ひとこと（任意）', 'Message (optional)')),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: tr('納品する', 'Deliver'),
            icon: Icons.upload_rounded,
            onPressed: _images.isEmpty ? null : () => Navigator.of(context).pop((_images, _text.text.trim())),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- プランの作成と受付の設定

class RequestSettingsScreen extends StatefulWidget {
  const RequestSettingsScreen({super.key});

  @override
  State<RequestSettingsScreen> createState() => _RequestSettingsScreenState();
}

class _RequestSettingsScreenState extends State<RequestSettingsScreen> {
  CreatorProfile? _profile;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final me = await _viewerId();
    if (me == null) {
      if (mounted) setState(() => _error = tr('ログインしてください', 'Please log in'));
      return;
    }
    try {
      final p = await RequestsApi.creator(me);
      if (mounted) setState(() => _profile = p);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<void> _edit([RequestPlan? plan]) async {
    final saved = await Navigator.of(context).push<bool>(MaterialPageRoute(builder: (_) => _PlanEditor(plan: plan)));
    if (saved == true) _load();
  }

  @override
  Widget build(BuildContext context) {
    final p = _profile;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('リクエストとプラン', 'Requests & plans')),
        actions: [IconButton(tooltip: tr('依頼の管理', 'My requests'), icon: const Icon(Icons.inbox_rounded), onPressed: () => context.push('/requests'))],
      ),
      floatingActionButton: p == null
          ? null
          : FloatingActionButton.extended(onPressed: () => _edit(), icon: const Icon(Icons.add), label: Text(tr('プランを作る', 'Create a plan'))),
      body: _error != null
          ? StateView(icon: Icons.lock_person_rounded, title: _error!)
          : p == null
          ? const Center(child: CircularProgressIndicator())
          : AppRefresh(
              onRefresh: _load,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(gradient: Ds.brandGradient, borderRadius: Ds.br(20)),
                    child: Text(
                      tr('プランを出品して、コインで依頼を受けよう。作ったプランはマイページとプラン一覧に並びます。完了すると代金から手数料 10% を引いた分を受け取れます（全年齢の依頼でクリエイター報酬に参加していれば、有料コインの分は報酬・円に）。', 'Offer plans and take requests for coins. Your plans appear on your page and in the plan list. On completion you receive the price minus a 10% fee (for all-ages requests, if you joined Rewards payout, the purchased-coin part becomes money in yen).'),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, height: 1.5, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(tr('自分のプラン ${p.plans.length}/20', 'My plans ${p.plans.length}/20'), style: const TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  if (p.plans.isEmpty)
                    StateView(
                      icon: Icons.storefront_rounded,
                      title: tr('まだプランがありません', 'No plans yet'),
                      message: tr('例:「アイコン 1 枚 1,000 コイン・納期 7 日・修正 1 回」', 'e.g. "1 icon, 1,000 coins, 7 days, 1 revision"'),
                      actionLabel: tr('最初のプランを作る', 'Create your first plan'),
                      onAction: () => _edit(),
                      compact: true,
                    ),
                  for (final plan in p.plans)
                    Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: plan.sampleImageUrls.isEmpty
                            ? const Icon(Icons.brush_rounded)
                            : AppImage(plan.sampleImageUrls.first, width: 52, height: 52, radius: 10),
                        title: Text(plan.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                        subtitle: Text(
                          '${formatCoins(plan.priceCoins)} ${tr('コイン', 'coins')}・${plan.deliveryDays} ${tr('日', 'days')}・${plan.isHidden
                              ? tr('非公開', 'Hidden')
                              : plan.isAccepting
                              ? tr('受付中', 'Open')
                              : tr('受付停止', 'Closed')}',
                        ),
                        trailing: const Icon(Icons.edit_rounded),
                        onTap: () => _edit(plan),
                      ),
                    ),
                  const SizedBox(height: 16),
                  _FreeRequestCard(settings: p.settings, onSaved: _load),
                  const SizedBox(height: 12),
                  TextButton(onPressed: _openTerms, child: Text(tr('有料リクエスト規約', 'Paid Request Terms'))),
                ],
              ),
            ),
    );
  }
}

class _FreeRequestCard extends StatefulWidget {
  const _FreeRequestCard({required this.settings, required this.onSaved});

  final RequestSettings settings;
  final VoidCallback onSaved;

  @override
  State<_FreeRequestCard> createState() => _FreeRequestCardState();
}

class _FreeRequestCardState extends State<_FreeRequestCard> {
  late bool _on = widget.settings.acceptsFreeRequests;
  late bool _r18 = widget.settings.allowsR18;
  late final _min = TextEditingController(text: '${widget.settings.minCoins}');
  late final _max = TextEditingController(text: '${widget.settings.maxActive}');
  late final _note = TextEditingController(text: widget.settings.note);
  bool _saving = false;

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await RequestsApi.saveSettings({
        'acceptsFreeRequests': _on,
        'allowsR18': _r18,
        'minCoins': int.tryParse(_min.text) ?? 100,
        'maxActive': int.tryParse(_max.text) ?? 3,
        'note': _note.text.trim(),
      });
      if (mounted) context.toast(tr('保存しました', 'Saved'));
      widget.onSaved();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.surfaceCard,
        borderRadius: Ds.br(18),
        border: Border.all(color: context.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: Text(tr('自由リクエストを受け付ける', 'Accept custom requests'), style: const TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Text(tr('プランにない内容を、依頼する人が金額を決めて送れます', 'People can send requests outside your plans at a price they choose'), style: const TextStyle(fontSize: 12)),
            value: _on,
            onChanged: (v) => setState(() => _on = v),
          ),
          if (_on) ...[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _min,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: tr('最低コイン', 'Minimum coins')),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _max,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: tr('同時に受ける数', 'Max active requests')),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _note,
              maxLength: 500,
              decoration: InputDecoration(labelText: tr('依頼する人へのひとこと', 'Note to requesters')),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: Text(tr('R18 の依頼も受ける', 'Accept R18 requests')),
              value: _r18,
              onChanged: (v) => setState(() => _r18 = v),
            ),
          ],
          SecondaryButton(label: tr('保存する', 'Save'), loading: _saving, onPressed: _saving ? null : _save, height: 42),
        ],
      ),
    );
  }
}

class _PlanEditor extends StatefulWidget {
  const _PlanEditor({this.plan});

  final RequestPlan? plan;

  @override
  State<_PlanEditor> createState() => _PlanEditorState();
}

class _PlanEditorState extends State<_PlanEditor> {
  late final RequestPlan? p = widget.plan;
  late final _title = TextEditingController(text: p?.title ?? '');
  late final _desc = TextEditingController(text: p?.description ?? '');
  late final _price = TextEditingController(text: '${p?.priceCoins ?? 1000}');
  late final _days = TextEditingController(text: '${p?.deliveryDays ?? 7}');
  late final _count = TextEditingController(text: '${p?.imageCount ?? 1}');
  late final _rev = TextEditingController(text: '${p?.revisionCount ?? 1}');
  late final _max = TextEditingController(text: '${p?.maxActive ?? 3}');
  late String _category = p?.category ?? 'ILLUSTRATION';
  late List<String> _images = p?.sampleImageUrls ?? [];
  late bool _accepting = p?.isAccepting ?? true;
  late bool _r18 = p?.allowsR18 ?? false;
  late bool _hidden = p?.isHidden ?? false;
  bool _saving = false;

  int _n(TextEditingController c, int fallback) => int.tryParse(c.text.trim()) ?? fallback;

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await RequestsApi.savePlan({
        if (p != null) 'planId': p!.id,
        'title': _title.text.trim(),
        'description': _desc.text.trim(),
        'category': _category,
        'sampleImageUrls': _images,
        'priceCoins': _n(_price, 1000),
        'deliveryDays': _n(_days, 7),
        'imageCount': _n(_count, 1),
        'revisionCount': _n(_rev, 1),
        'maxActive': _n(_max, 3),
        'isAccepting': _accepting,
        'allowsR18': _r18,
        'status': _hidden ? 'HIDDEN' : 'ACTIVE',
      });
      if (!mounted) return;
      Ds.success();
      context.toast(p == null ? tr('プランを公開しました', 'Plan published') : tr('保存しました', 'Saved'));
      Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _delete() async {
    if (!await _confirm(context, tr('プランを削除しますか？', 'Delete this plan?'), tr('進行中の依頼はそのまま続きます。', 'Active requests continue as they are.'))) return;
    try {
      await RequestsApi.deletePlan(p!.id);
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  Widget _num(String label, TextEditingController c, String suffix) => Expanded(
    child: TextField(
      controller: c,
      keyboardType: TextInputType.number,
      onChanged: (_) => setState(() {}),
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(labelText: label, suffixText: suffix),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final price = _n(_price, 0);
    final receive = price - (price * 0.1).ceil();
    return Scaffold(
      appBar: AppBar(
        title: Text(p == null ? tr('プランを作る', 'Create a plan') : tr('プランを編集', 'Edit plan')),
        actions: [if (p != null) IconButton(tooltip: tr('削除', 'Delete'), icon: const Icon(Icons.delete_outline_rounded), onPressed: _delete)],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
          children: [
            TextField(
              controller: _title,
              maxLength: 60,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(labelText: tr('タイトル', 'Title'), hintText: tr('例: ゆるかわアイコン 1 枚', 'e.g. 1 cute icon')),
            ),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final e in planCategoryLabels.entries)
                  ChoiceChip(label: Text(e.value), selected: _category == e.key, onSelected: (_) => setState(() => _category = e.key)),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _desc,
              minLines: 5,
              maxLines: 12,
              maxLength: 4000,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: tr('説明（できること・できないこと・使い方の範囲）', 'Description (what you can and cannot do, allowed use)'),
                alignLabelWithHint: true,
                hintText: tr('・バストアップのアイコンを 1 枚\n・SNS のアイコンに使えます（商用はご相談）\n・実在の人物、他の作品のキャラクターは受けられません', '- 1 bust-up icon\n- OK for social media icons (ask about commercial use)\n- No real people or characters from other works'),
              ),
            ),
            RequestImagePicker(value: _images, onChanged: (v) => setState(() => _images = v), max: 4, label: tr('見本の画像（1 枚目がカードに出ます）', 'Sample images (the first one is shown on the card)')),
            const SizedBox(height: 8),
            Row(children: [_num(tr('価格', 'Price'), _price, tr('コイン', 'coins')), const SizedBox(width: 12), _num(tr('納期（承諾から）', 'Delivery (after accepting)'), _days, tr('日', 'days'))]),
            Row(children: [_num(tr('納品する枚数', 'Images to deliver'), _count, tr('枚', 'images')), const SizedBox(width: 12), _num(tr('修正の回数', 'Revisions'), _rev, tr('回', 'times'))]),
            Row(children: [_num(tr('同時に受ける数', 'Max active requests'), _max, tr('件', '')), const Spacer()]),
            const SizedBox(height: 8),
            Text(tr('完了で受け取る分: ${receive > 0 ? formatCoins(receive) : '-'} コイン相当（手数料 10% を引いた分）', 'You receive on completion: ${receive > 0 ? formatCoins(receive) : '-'} coins worth (after the 10% fee)'), style: const TextStyle(fontWeight: FontWeight.w700)),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: Text(tr('受付中にする', 'Open for requests')),
              value: _accepting,
              onChanged: (v) => setState(() => _accepting = v),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: Text(tr('R18 の依頼も受ける', 'Accept R18 requests')),
              subtitle: Text(tr('R18 の依頼はコインで受け取ります（報酬の対象外）', 'R18 requests are paid in coins (not Rewards payout)'), style: const TextStyle(fontSize: 12)),
              value: _r18,
              onChanged: (v) => setState(() => _r18 = v),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: Text(tr('非公開にする（下書き）', 'Hide (draft)')),
              value: _hidden,
              onChanged: (v) => setState(() => _hidden = v),
            ),
            TextButton(onPressed: _openTerms, child: Text(tr('出品すると有料リクエスト規約に同意したことになります', 'By publishing you agree to the Paid Request Terms'))),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: PrimaryButton(label: p == null ? (_hidden ? tr('下書きで保存', 'Save as draft') : tr('公開する', 'Publish')) : tr('保存する', 'Save'), loading: _saving, onPressed: _saving ? null : _save),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- 共通のダイアログ

Future<String?> _askText(BuildContext context, {required String title, required String hint, required String action}) {
  final c = TextEditingController();
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: TextField(
        controller: c,
        autofocus: true,
        minLines: 2,
        maxLines: 5,
        decoration: InputDecoration(hintText: hint),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(tr('やめる', 'Cancel'))),
        FilledButton(onPressed: () => Navigator.of(ctx).pop(c.text.trim()), child: Text(action)),
      ],
    ),
  );
}

Future<bool> _confirm(BuildContext context, String title, String message) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(tr('やめる', 'Cancel'))),
        FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(tr('はい', 'Yes'))),
      ],
    ),
  );
  return ok == true;
}
