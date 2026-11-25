import 'dart:async';

import 'package:aipictors/v2/albums/album_api.dart' show isAllowedInApp;

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/plans/coin_shop.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/mypage/mypage_search.dart';
import 'package:aipictors/v2/plans/plans_screen.dart';
import 'package:aipictors/v2/post/my_posts_screen.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/settings/status_sheet.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _viewerQuery = '''
query AppMyPage {
  viewer {
    user {
      id login name iconUrl isOfficial isModerator headerImageUrl biography
      $avatarFrameFields
      followersCount followeesCount worksCount receivedLikesCount
      receivedViewsCount createdLikesCount createdCommentsCount createdBookmarksCount
    }
    currentPass { id type periodEnd }
  }
}''';

const _debugAsQuery = '''
query DebugMyPageAs(\$id: ID!) {
  user(id: \$id) {
    id login name iconUrl isOfficial isModerator headerImageUrl biography
    $avatarFrameFields
    followersCount followeesCount: followCount worksCount
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
  List<Map<String, dynamic>>? _recentWorks;
  CoinSummary? _coins;
  bool _loading = true;
  String? _error;
  StreamSubscription<User?>? _authSub;
  final _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _search.addListener(() => setState(() {}));
    _authSub = FirebaseAuth.instance.authStateChanges().listen((_) => _load());
  }

  @override
  void dispose() {
    _authSub?.cancel();
    _search.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    if (!Nav.isLoggedIn) {
      if (mounted) setState(() => _loading = false);
      return;
    }
    try {
      final data = await Api.query(_viewerQuery);
      // 開発用: /tmp/aipictors-debug の 2 行目が as:<ユーザーID> なら、その人の見た目で表示する（枠の確認用）
      final asUser = DebugBoot.screenTab?.startsWith('as:') == true ? DebugBoot.screenTab!.substring(3) : null;
      final other = asUser == null
          ? null
          : (await Api.query(_debugAsQuery, variables: {'id': asUser})).obj('user');
      if (!mounted) return;
      setState(() {
        _user = other ?? data.obj('viewer')?.obj('user');
        _pass = data.obj('viewer')?.obj('currentPass');
        _loading = false;
        _error = null;
      });
      _loadRecentWorks(_user?.str('id'));
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

  /// 最近の作品（Web の /my の「最近の作品」。アプリで出せる年齢だけ）
  Future<void> _loadRecentWorks(String? userId) async {
    if (userId == null) return;
    try {
      final data = await Api.query(r'''
query AppMyRecentWorks($where: WorksWhereInput) {
  works(offset: 0, limit: 8, where: $where) { id title rating isSensitive accessType createdAt smallThumbnailImageURL likesCount }
}''', variables: {
        'where': {
          'userId': userId,
          'orderBy': 'DATE_CREATED',
          'sort': 'DESC',
          'isIncludePrivate': true,
          'ratings': appRatings,
          'createdAtAfter': DateTime.utc(1999).toIso8601String(),
          'beforeCreatedAt': DateTime.utc(2099).toIso8601String(),
        },
      });
      if (mounted) setState(() => _recentWorks = data.list('works').where(isAllowedInApp).toList());
    } on ApiException {
      if (mounted) setState(() => _recentWorks = const []);
    }
  }

  /// メニューの一覧。表示と検索の両方で使う（keywords は内容・読み・別名）
  List<MyPageMenuGroup> _groups(Map<String, dynamic> u) {
    final id = u.str('id');
    return [
      MyPageMenuGroup('作品', 'Works', [
        MyPageMenuItem(Icons.add_circle_outline_rounded, '作品を投稿', 'Post a work', onTap: () => openNewPost(context), keywords: const ['投稿', 'とうこう', '画像', '小説', '動画', 'アップロード', 'post', 'upload', 'new']),
        MyPageMenuItem(Icons.person_outline_rounded, '自分のページ', 'My page', onTap: () => Nav.user(context, id), keywords: const ['プロフィール', 'ユーザーページ', 'じぶん', 'profile', 'user page']),
        const MyPageMenuItem(Icons.favorite_border_rounded, 'いいねした作品', 'Liked works', path: '/my/likes', keywords: ['いいね', 'ハート', 'like', 'likes', 'favorite']),
        const MyPageMenuItem(Icons.collections_bookmark_outlined, 'シリーズ', 'Series', path: '/viewer/albums', keywords: ['アルバム', 'まとめ', 'album', 'collection']),
        const MyPageMenuItem(Icons.bookmark_border_rounded, 'ブックマーク', 'Bookmarks', path: '/my/bookmarks', keywords: ['保存', 'ほぞん', 'あとで見る', 'bookmark', 'saved']),
        const MyPageMenuItem(Icons.thumb_up_alt_outlined, '推薦した作品', 'Recommended works', path: '/my/recommended', keywords: ['推薦', 'すいせん', 'おすすめ', 'recommend']),
        const MyPageMenuItem(Icons.folder_outlined, 'フォルダ', 'Folders', path: '/my/folders', keywords: ['フォルダー', '整理', 'せいり', 'folder']),
        const MyPageMenuItem(Icons.history_rounded, '閲覧履歴', 'History', path: '/my/views', keywords: ['履歴', 'りれき', 'えつらん', '見た作品', '最近見た', 'history', 'viewed', 'recent']),
        const MyPageMenuItem(Icons.image_outlined, '自分の作品', 'My works', path: '/viewer/works', keywords: ['作品管理', '編集', 'へんしゅう', '削除', '公開', '非公開', '最近の作品', 'さくひん', 'manage', 'edit', 'my posts']),
        const MyPageMenuItem(Icons.volunteer_activism_outlined, 'リクエスト', 'Requests', path: '/requests', keywords: ['依頼', 'いらい', 'コミッション', 'request', 'commission']),
        const MyPageMenuItem(Icons.storefront_outlined, 'プラン一覧', 'Request plans', path: '/requests/plans', keywords: ['リクエスト', '依頼', 'クリエイター', 'request', 'plans', 'creator']),
        const MyPageMenuItem(Icons.payments_outlined, '収益の受け取り', 'Rewards payout', path: '/settings/creator-rewards', keywords: ['収益', 'しゅうえき', '報酬', '振込', '口座', 'お金', 'reward', 'payout', 'bank']),
        const MyPageMenuItem(Icons.edit_note_rounded, '作品の履歴', 'Edit history', path: '/my/histories', keywords: ['履歴', 'りれき', '編集履歴', '変更', 'history', 'edit']),
      ]),
      MyPageMenuGroup('つながり', 'Connections', [
        MyPageMenuItem(Icons.people_outline_rounded, 'フォロー中', 'Following', path: '/users/$id/followees', keywords: const ['フォロー', 'フォローしている', 'follow', 'followees']),
        MyPageMenuItem(Icons.group_add_outlined, 'フォロワー', 'Followers', path: '/users/$id/followers', keywords: const ['フォロー', 'ファン', 'follow', 'fans']),
        const MyPageMenuItem(Icons.emoji_emotions_outlined, 'スタンプ', 'Stickers', path: '/stickers', keywords: ['スタンプを作る', '絵文字', 'えもじ', 'sticker', 'stamp', 'emoji']),
        const MyPageMenuItem(Icons.auto_awesome_outlined, 'アイコン枠・ヘッダー枠', 'Frames', path: '/settings/frames', keywords: ['枠', 'わく', 'フレーム', '装飾', 'デコ', 'frame', 'decoration', 'avatar']),
        const MyPageMenuItem(Icons.casino_outlined, 'スペシャル枠ガチャ', 'Frame gacha', path: '/gacha', keywords: ['ガチャ', 'がちゃ', 'くじ', '枠', 'gacha', 'lottery', 'frame']),
        const MyPageMenuItem(Icons.emoji_events_outlined, '実績', 'Achievements', path: '/achievements', keywords: ['じっせき', 'バッジ', '称号', 'トロフィー', 'badge', 'trophy']),
      ]),
      const MyPageMenuGroup('コミュニティ', 'Community', [
        MyPageMenuItem(Icons.mail_outline_rounded, 'メッセージ', 'Messages', path: '/messages', keywords: ['DM', 'ダイレクトメッセージ', 'チャット', 'message', 'chat']),
        MyPageMenuItem(Icons.campaign_outlined, 'お知らせ', 'News', path: '/releases', keywords: ['おしらせ', 'リリース', '更新', '新機能', 'release', 'update', 'news']),
        MyPageMenuItem(Icons.celebration_outlined, 'イベント', 'Events', path: '/events', keywords: ['企画', 'きかく', 'コンテスト', 'お題', 'event', 'contest', 'theme']),
        MyPageMenuItem(Icons.hub_outlined, 'モデル', 'Models', path: '/models', keywords: ['AIモデル', 'チェックポイント', '生成', 'model', 'checkpoint']),
      ]),
      const MyPageMenuGroup('サポート', 'Support', [
        MyPageMenuItem(Icons.support_agent_rounded, 'お問い合わせ', 'Contact us', path: '/support/chat', keywords: ['問い合わせ', 'といあわせ', '要望', '不具合', 'バグ', 'contact', 'feedback', 'bug']),
        MyPageMenuItem(Icons.help_outline_rounded, 'ヘルプ', 'Help', path: '/help', keywords: ['使い方', 'つかいかた', 'よくある質問', 'FAQ', 'how to']),
        MyPageMenuItem(Icons.gavel_rounded, 'ガイドライン', 'Guidelines', path: '/guideline', keywords: ['ルール', 'rule', 'guideline']),
        MyPageMenuItem(Icons.description_outlined, '利用規約', 'Terms of use', path: '/terms', keywords: ['規約', 'きやく', 'terms', 'tos']),
        MyPageMenuItem(Icons.privacy_tip_outlined, 'プライバシーポリシー', 'Privacy policy', path: '/privacy', keywords: ['個人情報', 'こじんじょうほう', 'privacy']),
        MyPageMenuItem(Icons.map_outlined, 'ロードマップ', 'Roadmap', path: '/roadmap', keywords: ['予定', 'よてい', '今後', '開発', 'roadmap', 'plan']),
      ]),
      MyPageMenuGroup('アカウント', 'Account', [
        MyPageMenuItem(Icons.workspace_premium_outlined, 'プラン', 'Plan', onTap: () => Nav.plans(context), keywords: const ['有料プラン', 'プレミアム', 'サブスク', '加入', '解約', 'premium', 'subscription', 'pass']),
        MyPageMenuItem(Icons.monetization_on_outlined, 'コインを購入', 'Buy coins', onTap: () => showCoinShopSheet(context), searchOnly: true, keywords: const ['コイン', 'こいん', '買う', 'チャージ', '課金', 'coin', 'coins', 'buy', 'shop']),
        const MyPageMenuItem(Icons.badge_outlined, 'プロフィールを編集', 'Edit profile', path: '/settings/profile', keywords: ['プロフィール', '名前', 'なまえ', 'アイコン', 'ヘッダー', '自己紹介', 'profile', 'name', 'icon', 'bio']),
        MyPageMenuItem(Icons.chat_bubble_outline_rounded, 'ステータス', 'Status', onTap: () => showStatusSheet(context), keywords: const ['吹き出し', 'ふきだし', 'ひとこと', '今なにしてる', 'status', 'balloon']),
        const MyPageMenuItem(Icons.shield_outlined, '運営からのお知らせ', 'Notices from staff', path: '/my/reports', keywords: ['運営', 'うんえい', '通報', '警告', '対応', 'report', 'staff', 'notice']),
        const MyPageMenuItem(Icons.tune_rounded, '設定', 'Settings', path: '/settings', keywords: ['せってい', 'settings', 'preferences']),
      ]),
    ];
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: SizedBox(
        height: 40,
        child: TextField(
          controller: _search,
          textInputAction: TextInputAction.search,
          autocorrect: false,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: tr('機能・設定を検索', 'Search features & settings'),
            hintStyle: TextStyle(color: context.muted, fontSize: 14),
            prefixIcon: Icon(Icons.search_rounded, size: 20, color: context.muted),
            suffixIcon: _search.text.isEmpty
                ? null
                : IconButton(tooltip: tr('消す', 'Clear'), icon: const Icon(Icons.close_rounded, size: 18), onPressed: _search.clear),
            isDense: true,
            filled: true,
            fillColor: context.surfaceCard,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(borderRadius: Ds.br(12), borderSide: BorderSide(color: context.hairline)),
            enabledBorder: OutlineInputBorder(borderRadius: Ds.br(12), borderSide: BorderSide(color: context.hairline)),
          ),
        ),
      ),
    );
  }

  List<Widget> _results(String query, List<MyPageMenuGroup> groups) {
    final hits = searchMyPage(query, groups);
    if (hits.isEmpty) {
      return [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(children: [
              Icon(Icons.search_off_rounded, size: 40, color: context.muted),
              const SizedBox(height: 8),
              Text(tr('「$query」に当たる機能はありません', 'No features match "$query"'), textAlign: TextAlign.center, style: TextStyle(color: context.muted)),
            ]),
          ),
        ),
      ];
    }
    final settings = tr('設定', 'Settings');
    return [
      SliverToBoxAdapter(
        child: SettingsGroup(title: tr('検索結果', 'Results'), children: [
          for (final h in hits)
            if (h.menu != null)
              SettingsLink(icon: h.menu!.icon, label: h.menu!.label, subtitle: h.group!.title, onTap: () => _openHit(() => h.menu!.open(context)))
            else
              SettingsLink(
                icon: h.setting!.item.icon,
                label: h.setting!.inner?.label ?? h.setting!.item.label,
                subtitle: [settings, h.setting!.inner != null ? h.setting!.item.label : h.setting!.section?.title].nonNulls.join(' › '),
                onTap: () => _openHit(() => openSettingsHit(context, h.setting!)),
              ),
        ]),
      ),
    ];
  }

  void _openHit(VoidCallback open) {
    FocusScope.of(context).unfocus();
    open();
  }

  @override
  Widget build(BuildContext context) {
    if (!Nav.isLoggedIn) {
      return Scaffold(
        appBar: AppBar(
          title: Text(tr('マイページ', 'My page'), style: const TextStyle(fontWeight: FontWeight.w900)),
          actions: [IconButton(tooltip: tr('設定', 'Settings'), onPressed: () => context.push('/settings'), icon: const Icon(Icons.settings_outlined))],
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
    final groups = u == null ? const <MyPageMenuGroup>[] : _groups(u);
    final query = _search.text.trim();
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: _load,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(tr('マイページ', 'My page'), style: const TextStyle(fontWeight: FontWeight.w900)),
              actions: [IconButton(tooltip: tr('設定', 'Settings'), onPressed: () => context.push('/settings'), icon: const Icon(Icons.settings_outlined))],
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
              SliverToBoxAdapter(child: _searchField()),
              if (query.isNotEmpty) ..._results(query, groups) else ...[
                SliverToBoxAdapter(child: _ProfileCard(user: u)),
                SliverToBoxAdapter(child: _PlanAndCoins(pass: _pass, coins: _coins)),
                SliverToBoxAdapter(child: _Stats(user: u)),
                SliverToBoxAdapter(child: _RecentWorks(works: _recentWorks)),
                for (final g in groups)
                  if (g.items.any((i) => !i.searchOnly)) SliverToBoxAdapter(child: _MenuGroup(group: g)),
              ],
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
    // 装飾の枠は箱の中に収めて描くので、そのぶん大きく取って顔の大きさをそろえる
    final avatarSize = UserAvatar.hasDecoration(UserSummary.fromJson(user).avatarFrame) ? 96.0 : 72.0;
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
                  ? AppImage(header, memCacheWidth: 900, fallback: const DecoratedBox(decoration: BoxDecoration(gradient: Ds.brandGradient)))
                  : const DecoratedBox(decoration: BoxDecoration(gradient: Ds.brandGradient)),
            ),
            Transform.translate(
              offset: Offset(0, -(avatarSize / 2 - 6)),
              child: Column(children: [
                UserAvatar.json(user, size: avatarSize, ring: true),
                const SizedBox(height: 6),
                Text(user.str('name'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                Text('@${user.str('login').replaceFirst(RegExp(r'^@+'), '')}', style: TextStyle(color: context.muted, fontSize: 12)),
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
          child: Pressable(
            scale: 0.99,
            onTap: () => showCoinShopSheet(context),
            child: Container(
            height: 96,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Ds.gold.withValues(alpha: context.isDark ? 0.18 : 0.12), borderRadius: Ds.br(20)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Row(children: [
                Icon(Icons.monetization_on_rounded, color: Ds.gold),
                Spacer(),
                Icon(Icons.add_circle_outline_rounded, color: Ds.gold, size: 18),
              ]),
              coins == null
                  ? const Skeleton(width: 70, height: 18, radius: 6)
                  : Text('${coins!.total}コイン', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              Text(coins == null ? '' : 'フリー${coins!.free}・プレミアム${coins!.premium}', style: TextStyle(color: context.muted, fontSize: 11)),
            ]),
            ),
          ),
        ),
      ]),
    );
  }
}

class _MenuGroup extends StatelessWidget {
  const _MenuGroup({required this.group});

  final MyPageMenuGroup group;

  @override
  Widget build(BuildContext context) {
    final items = group.items.where((i) => !i.searchOnly).toList();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(group.title, style: TextStyle(color: context.muted, fontWeight: FontWeight.w700, fontSize: 13)),
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
                  items[i].open(context);
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

/// 実績（Web の /my の「実績」のうち、プロフィールのカードに無いもの）
class _Stats extends StatelessWidget {
  const _Stats({required this.user});

  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    Widget tile(IconData icon, String label, int v) => Expanded(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(icon, size: 13, color: context.muted),
              const SizedBox(width: 3),
              Flexible(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 11))),
            ]),
            const SizedBox(height: 2),
            Text(compactCount(v), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
          ]),
        );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(18), border: Border.all(color: context.hairline)),
        child: Row(children: [
          tile(Icons.visibility_outlined, tr('見られた数', 'Views'), user.integer('receivedViewsCount')),
          tile(Icons.favorite_border_rounded, tr('いいねした', 'Liked'), user.integer('createdLikesCount')),
          tile(Icons.bookmark_border_rounded, tr('ブックマーク', 'Bookmarks'), user.integer('createdBookmarksCount')),
          tile(Icons.chat_bubble_outline_rounded, tr('コメント', 'Comments'), user.integer('createdCommentsCount')),
        ]),
      ),
    );
  }
}

/// 最近の作品の横並び（「すべて管理」で自分の作品の管理へ）
class _RecentWorks extends StatelessWidget {
  const _RecentWorks({required this.works});

  final List<Map<String, dynamic>>? works;

  @override
  Widget build(BuildContext context) {
    final list = works;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(tr('最近の作品', 'Recent works'), style: TextStyle(color: context.muted, fontWeight: FontWeight.w700, fontSize: 13)),
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
            onPressed: () => context.push('/viewer/works'),
            child: Text(tr('すべて管理', 'Manage all'), style: const TextStyle(fontSize: 12.5)),
          ),
        ]),
        SizedBox(
          height: 96,
          child: list == null
              ? ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, __) => const Skeleton(width: 96, height: 96, radius: 14),
                )
              : list.isEmpty
                  ? Pressable(
                      onTap: () => openNewPost(context),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: Ds.br(14), border: Border.all(color: context.hairline)),
                        alignment: Alignment.center,
                        child: Text(tr('まだ作品がありません。最初の作品を投稿 ›', 'No works yet. Post your first work ›'), style: TextStyle(color: context.muted, fontSize: 13)),
                      ),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        final w = list[i];
                        return Pressable(
                          onTap: () => Nav.work(context, w.str('id')),
                          child: SizedBox(
                            width: 96,
                            child: Stack(fit: StackFit.expand, children: [
                              AppImage(w.strOrNull('smallThumbnailImageURL'), radius: 14, memCacheWidth: 288),
                              if (w.str('accessType') != 'PUBLIC')
                                Positioned(left: 4, top: 4, child: Badge2(accessTypeLabels[w.str('accessType')] ?? w.str('accessType'))),
                            ]),
                          ),
                        );
                      },
                    ),
        ),
      ]),
    );
  }
}
