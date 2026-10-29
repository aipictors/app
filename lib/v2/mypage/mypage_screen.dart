import 'dart:async';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/plans/plans_screen.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _viewerQuery = '''
query AppMyPage {
  viewer {
    user {
      id login name iconUrl headerImageUrl biography
      followersCount followeesCount worksCount receivedLikesCount
    }
    currentPass { id type periodEnd }
  }
}''';

/// マイページタブ
class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  Map<String, dynamic>? _user;
  Map<String, dynamic>? _pass;
  CoinSummary? _coins;
  bool _loading = true;
  String? _error;
  StreamSubscription<User?>? _authSub;

  @override
  void initState() {
    super.initState();
    _authSub = FirebaseAuth.instance.authStateChanges().listen((_) => _load());
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    if (!Nav.isLoggedIn) {
      if (mounted) setState(() => _loading = false);
      return;
    }
    try {
      final data = await Api.query(_viewerQuery);
      if (!mounted) return;
      setState(() {
        _user = data.obj('viewer')?.obj('user');
        _pass = data.obj('viewer')?.obj('currentPass');
        _loading = false;
        _error = null;
      });
      Coins.summary().then((c) {
        if (mounted) setState(() => _coins = c);
      }).catchError((_) {});
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!Nav.isLoggedIn) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('マイページ', style: TextStyle(fontWeight: FontWeight.w900)),
          actions: [IconButton(onPressed: () => context.push('/more'), icon: const Icon(Icons.settings_outlined))],
        ),
        body: LoginRequiredView(
          icon: Icons.person_rounded,
          title: 'ログインして始めよう',
          message: '作品へのいいね・コメント・フォロー、画像生成、推しなど、すべての機能が使えるようになります。',
          onLogin: () => Nav.login(context),
        ),
      );
    }
    final u = _user;
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: _load,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverAppBar(
              pinned: true,
              title: const Text('マイページ', style: TextStyle(fontWeight: FontWeight.w900)),
              actions: [IconButton(tooltip: '設定', onPressed: () => context.push('/more'), icon: const Icon(Icons.settings_outlined))],
            ),
            if (_loading)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(children: [Skeleton(height: 150, radius: 24), SizedBox(height: 12), Skeleton(height: 90, radius: 20)]),
                ),
              )
            else if (u == null)
              SliverToBoxAdapter(child: StateView.error(_error ?? 'ユーザー情報を取得できませんでした', onRetry: _load))
            else ...[
              SliverToBoxAdapter(child: _ProfileCard(user: u)),
              SliverToBoxAdapter(child: _PlanAndCoins(pass: _pass, coins: _coins)),
              SliverToBoxAdapter(
                child: _MenuGroup(title: '作品', items: [
                  _MenuItem(Icons.person_outline_rounded, '自分のページ', () => Nav.user(context, u.str('id'))),
                  _MenuItem(Icons.favorite_border_rounded, 'いいねした作品', () => context.push('/viewer/likes')),
                  _MenuItem(Icons.collections_bookmark_outlined, 'シリーズ', () => context.push('/viewer/albums')),
                  _MenuItem(Icons.folder_outlined, 'ブックマーク・フォルダ', () => context.push('/viewer/folders')),
                  _MenuItem(Icons.image_outlined, '自分の作品', () => context.push('/viewer/works')),
                ]),
              ),
              SliverToBoxAdapter(
                child: _MenuGroup(title: 'つながり', items: [
                  _MenuItem(Icons.people_outline_rounded, 'フォロー中', () => context.push('/users/${u.str('id')}/followees')),
                  _MenuItem(Icons.group_add_outlined, 'フォロワー', () => context.push('/users/${u.str('id')}/followers')),
                  _MenuItem(Icons.emoji_emotions_outlined, 'スタンプ', () => context.push('/stickers')),
                ]),
              ),
              SliverToBoxAdapter(
                child: _MenuGroup(title: 'アカウント', items: [
                  _MenuItem(Icons.workspace_premium_outlined, 'プラン', () => Nav.plans(context)),
                  _MenuItem(Icons.badge_outlined, 'プロフィールを編集', () => context.push('/config/profile')),
                  _MenuItem(Icons.tune_rounded, 'その他の設定・ヘルプ', () => context.push('/more')),
                ]),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.user});

  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    Widget stat(String label, int v) => Expanded(
          child: Column(children: [
            Text(compactCount(v), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: context.muted, fontSize: 11)),
          ]),
        );
    final header = user.strOrNull('headerImageUrl');
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: Pressable(
        scale: 0.99,
        onTap: () => Nav.user(context, user.str('id')),
        child: Container(
          decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(24), border: Border.all(color: context.hairline)),
          clipBehavior: Clip.antiAlias,
          child: Column(children: [
            SizedBox(
              height: 86,
              width: double.infinity,
              child: header != null
                  ? AppImage(header, memCacheWidth: 900)
                  : const DecoratedBox(decoration: BoxDecoration(gradient: Ds.brandGradient)),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Column(children: [
                Avatar(user.strOrNull('iconUrl'), size: 72, ring: true),
                const SizedBox(height: 6),
                Text(user.str('name'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                Text('@${user.str('login')}', style: TextStyle(color: context.muted, fontSize: 12)),
                const SizedBox(height: 12),
                Row(children: [
                  stat('作品', user.integer('worksCount')),
                  stat('フォロワー', user.integer('followersCount')),
                  stat('フォロー', user.integer('followeesCount')),
                  stat('いいねされた', user.integer('receivedLikesCount')),
                ]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

class _PlanAndCoins extends StatelessWidget {
  const _PlanAndCoins({required this.pass, required this.coins});

  final Map<String, dynamic>? pass;
  final CoinSummary? coins;

  @override
  Widget build(BuildContext context) {
    final plan = planSpecs.where((p) => p.type == pass?.str('type')).firstOrNull;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(children: [
        Expanded(
          child: Pressable(
            onTap: () => Nav.plans(context),
            child: Container(
              height: 96,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: plan == null ? Ds.brandGradient : LinearGradient(colors: [plan.color, Color.lerp(plan.color, Ds.pink, 0.4)!]),
                borderRadius: Ds.br(20),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Icon(Icons.workspace_premium_rounded, color: Colors.white),
                Text(plan == null ? '無料プラン' : '${plan.name}プラン', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                Text(plan == null ? 'プランを見る ›' : '加入中 ›', style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ]),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 96,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Ds.gold.withValues(alpha: context.isDark ? 0.18 : 0.12), borderRadius: Ds.br(20)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Icon(Icons.monetization_on_rounded, color: Ds.gold),
              coins == null
                  ? const Skeleton(width: 70, height: 18, radius: 6)
                  : Text('${coins!.total}コイン', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              Text(coins == null ? '' : 'フリー${coins!.free}・プレミアム${coins!.premium}', style: TextStyle(color: context.muted, fontSize: 11)),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _MenuItem {
  const _MenuItem(this.icon, this.label, this.onTap);

  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

class _MenuGroup extends StatelessWidget {
  const _MenuGroup({required this.title, required this.items});

  final String title;
  final List<_MenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(title, style: TextStyle(color: context.muted, fontWeight: FontWeight.w700, fontSize: 13)),
        ),
        Container(
          decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(18), border: Border.all(color: context.hairline)),
          clipBehavior: Clip.antiAlias,
          child: Column(children: [
            for (var i = 0; i < items.length; i++) ...[
              ListTile(
                leading: Icon(items[i].icon),
                title: Text(items[i].label, style: const TextStyle(fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.chevron_right_rounded, color: context.muted),
                onTap: () {
                  Ds.tap();
                  items[i].onTap();
                },
              ),
              if (i != items.length - 1) Divider(height: 1, indent: 56, color: context.hairline),
            ],
          ]),
        ),
      ]),
    );
  }
}
