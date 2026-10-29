import 'package:aipictors/v2/work/support_sheet.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/user/user_actions.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/user/user_list_screen.dart';
import 'package:aipictors/v2/user/user_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:aipictors/v2/widgets/official_badge.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// ユーザーのページ（プロフィール・作品・シリーズ・フォロー）
class UserScreen extends StatefulWidget {
  const UserScreen({super.key, required this.userId});

  /// ユーザー ID（数字）。ログイン名が来ることもある
  final String userId;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

enum _Tab { works, albums }

class _UserScreenState extends State<UserScreen> {
  UserProfile? _user;
  String? _error;
  bool _notFound = false;
  String? _viewerId;
  _Tab _tab = _Tab.works;
  final _scroll = ScrollController();
  bool _collapsed = false;
  double _collapseAt = 120;

  // 作品タブ
  String? _kind;
  bool _popular = false;
  PagedController<WorkSummary>? _works;
  PagedController<AlbumSummary>? _albums;

  bool get _isSelf => _user != null && _viewerId != null && _viewerId == _user!.id;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      final c = _scroll.hasClients && _scroll.offset > _collapseAt;
      if (c != _collapsed) setState(() => _collapsed = c);
    });
    _load();
  }

  @override
  void dispose() {
    _scroll.dispose();
    _works?.dispose();
    _albums?.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _error = null;
      _notFound = false;
    });
    try {
      final results = await Future.wait([UserApi.profile(widget.userId), UserApi.viewerId()]);
      if (!mounted) return;
      final u = results[0] as UserProfile?;
      setState(() {
        _viewerId = results[1] as String?;
        _user = u;
        _notFound = u == null;
        if (u != null) {
          _works?.dispose();
          _works = _makeWorks(u.id);
          _albums?.dispose();
          _albums = PagedController(pageSize: 20, idOf: (a) => a.id, fetch: (o, l) => UserApi.albums(u.id, o, l));
        }
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } catch (_) {
      if (mounted) setState(() => _error = '読み込みに失敗しました');
    }
  }

  PagedController<WorkSummary> _makeWorks(String id) {
    final kind = _kind;
    final popular = _popular;
    return PagedController(
      pageSize: 30,
      idOf: (w) => w.id,
      fetch: (o, l) => UserApi.works(id, workType: kind, orderBy: popular ? 'LIKES_COUNT' : 'DATE_CREATED', offset: o, limit: l),
    );
  }

  void _setWorksFilter({String? kind, bool? popular, bool clearKind = false}) {
    final u = _user;
    if (u == null) return;
    final old = _works;
    setState(() {
      if (clearKind) _kind = null;
      if (kind != null) _kind = kind;
      if (popular != null) _popular = popular;
      _works = _makeWorks(u.id);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => old?.dispose());
  }

  Future<void> _refresh() async {
    final u = _user;
    if (u == null) return _load();
    try {
      final fresh = await UserApi.profile(u.id);
      if (mounted && fresh != null) setState(() => _user = fresh);
    } catch (_) {}
    await Future.wait([
      if (_works != null) _works!.refresh(),
      if (_albums != null && _tab == _Tab.albums) _albums!.refresh(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final u = _user;
    if (u == null) {
      return Scaffold(
        appBar: AppBar(),
        body: _error != null
            ? Center(child: StateView.error(_error!, onRetry: _load))
            : _notFound
                ? const Center(
                    child: StateView(icon: Icons.person_off_rounded, title: 'ユーザーが見つかりませんでした', message: '退会したか、IDが変わった可能性があります'),
                  )
                : const _ProfileSkeleton(),
      );
    }
    return Scaffold(
      body: RefreshIndicator.adaptive(
        edgeOffset: MediaQuery.paddingOf(context).top + kToolbarHeight,
        onRefresh: _refresh,
        child: CustomScrollView(
          controller: _scroll,
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            _appBar(context, u),
            SliverToBoxAdapter(child: _profile(context, u)),
            if (u.featured.isNotEmpty && !u.isBlocked)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const SectionHeader('ピックアップ', icon: Icons.push_pin_rounded),
                    WorkStrip(works: u.featured, height: 190),
                  ]),
                ),
              ),
            if (u.isBlocked)
              SliverToBoxAdapter(child: _blockedNotice(context, u))
            else ...[
              SliverPersistentHeader(pinned: true, delegate: _TabsHeader(child: _tabs(context, u))),
              ..._tabContent(context, u),
            ],
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, UserProfile u) {
    final width = MediaQuery.sizeOf(context).width;
    final h = (width / 3).clamp(130.0, 260.0);
    final wide = width >= 700;
    final avatar = wide ? 104.0 : 84.0;
    const strip = 56.0;
    final side = width > 852 ? (width - 820) / 2 + 16 : 16.0;
    _collapseAt = h + strip - kToolbarHeight - MediaQuery.paddingOf(context).top - 8;
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: h + strip,
      foregroundColor: Colors.white,
      backgroundColor: _collapsed ? Theme.of(context).colorScheme.surface : Colors.black,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: _collapsed ? context.cs.onSurface : Colors.white),
      actionsIconTheme: IconThemeData(color: _collapsed ? context.cs.onSurface : Colors.white),
      leading: Navigator.of(context).canPop() ? _CircleIcon(icon: Icons.arrow_back_rounded, plain: _collapsed, onTap: () => Navigator.of(context).maybePop()) : null,
      title: AnimatedOpacity(
        duration: Ds.fast,
        opacity: _collapsed ? 1 : 0,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Avatar(u.iconUrl, size: 28),
          const SizedBox(width: 8),
          Flexible(child: Text(u.name, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17, color: context.cs.onSurface))),
          if (u.isOfficial) ...[const SizedBox(width: 4), const OfficialBadge()],
        ]),
      ),
      actions: [
        _CircleIcon(icon: Icons.ios_share_rounded, plain: _collapsed, onTap: () => Share.share('${u.name}（@${u.login}）さんの作品 https://www.aipictors.com/users/${u.login}')),
        const SizedBox(width: 6),
        _CircleIcon(icon: Icons.more_horiz_rounded, plain: _collapsed, onTap: () => _openMenu(u)),
        const SizedBox(width: 8),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: const [StretchMode.zoomBackground],
        background: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(clipBehavior: Clip.none, children: [
            Positioned.fill(
              bottom: strip,
              child: Stack(fit: StackFit.expand, children: [
                if (u.headerImageUrl != null)
                  AppImage(u.headerImageUrl, memCacheWidth: 1200)
                else
                  const DecoratedBox(decoration: BoxDecoration(gradient: Ds.brandGradient)),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x55000000), Color(0x00000000)], stops: [0, 0.5]),
                  ),
                ),
              ]),
            ),
            Positioned(
              left: side,
              bottom: 2,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 4),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 12)],
                ),
                child: Avatar(u.iconUrl, size: avatar),
              ),
            ),
            Positioned(right: side, bottom: 4, child: _mainButton(context, u)),
          ]),
        ),
      ),
    );
  }

  Future<void> _openMenu(UserProfile u) async {
    final changed = await showUserActionsSheet(context, user: u, isSelf: _isSelf);
    if (changed == true && mounted) {
      setState(() {});
      if (!u.isBlocked && _works != null && _works!.items.isEmpty) _works!.refresh();
    }
  }

  Widget _mainButton(BuildContext context, UserProfile u) {
    if (_isSelf) {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 42),
          shape: RoundedRectangleBorder(borderRadius: Ds.br(21)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        onPressed: () => context.push('/config/profile'),
        icon: const Icon(Icons.edit_rounded, size: 18),
        label: const Text('プロフィールを編集', style: TextStyle(fontWeight: FontWeight.w800)),
      );
    }
    if (u.isBlocked) return const SizedBox.shrink();
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Pressable(
        onTap: () => showSupportSheet(context, userId: u.id, userName: u.name, iconUrl: u.iconUrl),
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(gradient: Ds.goldGradient, borderRadius: Ds.br(21)),
          child: const Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.volunteer_activism_rounded, color: Colors.white, size: 18),
            SizedBox(width: 4),
            Text('推す', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
          ]),
        ),
      ),
      const SizedBox(width: 8),
      FollowButton(
        userId: u.id,
        isFollowing: u.isFollowee,
        onChanged: (v) => setState(() {
          if (u.isFollowee != v) u.followersCount += v ? 1 : -1;
          u.isFollowee = v;
        }),
      ),
    ]);
  }

  Widget _profile(BuildContext context, UserProfile u) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 820),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Flexible(
                    child: Text(u.name, style: context.tt.headlineSmall?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.4)),
                  ),
                  if (u.isOfficial) ...[const SizedBox(width: 6), const OfficialBadge(size: 20)],
                  if (u.passType != null) ...[
                    const SizedBox(width: 6),
                    Tooltip(message: 'Aipictors+ 会員', child: ShaderMask(shaderCallback: (r) => Ds.goldGradient.createShader(r), child: const Icon(Icons.verified_rounded, color: Colors.white, size: 20))),
                  ],
                ]),
                const SizedBox(height: 2),
                Row(children: [
                  Text('@${u.login}', style: context.tt.bodyMedium?.copyWith(color: context.muted)),
                  if (u.isFollower && !_isSelf) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(6)),
                      child: Text('フォローされています', style: context.tt.labelSmall?.copyWith(color: context.muted, fontWeight: FontWeight.w700)),
                    ),
                  ],
                  if (u.isMuted) ...[
                    const SizedBox(width: 8),
                    Icon(Icons.volume_off_rounded, size: 16, color: context.muted),
                  ],
                ]),
                if (u.biography.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _Bio(text: u.biography),
                ],
                if (u.twitter != null || u.instagram != null || u.github != null || u.siteUrl != null) ...[
                  const SizedBox(height: 12),
                  Wrap(spacing: 8, runSpacing: 8, children: [
                    if (u.twitter != null) _LinkChip(icon: Icons.alternate_email_rounded, label: 'X', url: 'https://x.com/${u.twitter}'),
                    if (u.instagram != null) _LinkChip(icon: Icons.camera_alt_rounded, label: 'Instagram', url: 'https://instagram.com/${u.instagram}'),
                    if (u.github != null) _LinkChip(icon: Icons.code_rounded, label: 'GitHub', url: 'https://github.com/${u.github}'),
                    if (u.siteUrl != null) _LinkChip(icon: Icons.link_rounded, label: Uri.tryParse(u.siteUrl!)?.host ?? 'サイト', url: u.siteUrl!),
                  ]),
                ],
                const SizedBox(height: 16),
                _stats(context, u),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _stats(BuildContext context, UserProfile u) {
    Widget cell(String label, int value, {VoidCallback? onTap}) {
      return Expanded(
        child: Pressable(
          onTap: onTap,
          child: Column(children: [
            Text(compactCount(value), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5)),
            const SizedBox(height: 2),
            Text(label, style: context.tt.labelSmall?.copyWith(color: context.muted, fontWeight: FontWeight.w700)),
          ]),
        ),
      );
    }

    void openList(int index) => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => UserListScreen(userId: u.id, name: u.name, initialIndex: index, followCount: u.followCount, followersCount: u.followersCount),
        ));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(18), border: Border.all(color: context.hairline)),
      child: Row(children: [
        cell('フォロー', u.followCount, onTap: () => openList(0)),
        _divider(context),
        cell('フォロワー', u.followersCount, onTap: () => openList(1)),
        _divider(context),
        cell('作品', u.safeWorksCount),
        _divider(context),
        cell('いいねされた', u.receivedLikesCount),
      ]),
    );
  }

  Widget _divider(BuildContext context) => Container(width: 1, height: 28, color: context.hairline);

  Widget _blockedNotice(BuildContext context, UserProfile u) {
    return StateView(
      icon: Icons.block_rounded,
      title: 'このユーザーをブロックしています',
      message: 'ブロック中は作品が表示されず、相手はあなたをフォローしたりコメントしたりできません',
      actionLabel: 'ブロックを解除',
      onAction: () async {
        final ok = await UserActions.setBlocked(context, u, false);
        if (ok && mounted) setState(() {});
      },
    );
  }

  Widget _tabs(BuildContext context, UserProfile u) {
    final tabs = <(_Tab, String)>[
      (_Tab.works, '作品 ${compactCount(u.safeWorksCount)}'),
      if (u.albumCount > 0) (_Tab.albums, 'シリーズ ${u.albumCount}'),
    ];
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(children: [
        SizedBox(
          height: 46,
          child: Row(children: [
            for (final t in tabs)
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (_tab == t.$1) return;
                    Ds.tap();
                    setState(() => _tab = t.$1);
                  },
                  child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(t.$2, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: _tab == t.$1 ? context.cs.onSurface : context.muted)),
                    const SizedBox(height: 10),
                    AnimatedContainer(
                      duration: Ds.normal,
                      height: 3,
                      width: _tab == t.$1 ? 44 : 0,
                      decoration: BoxDecoration(gradient: Ds.brandGradient, borderRadius: Ds.br(2)),
                    ),
                  ]),
                ),
              ),
          ]),
        ),
        Container(height: 1, color: context.hairline),
      ]),
    );
  }

  List<Widget> _tabContent(BuildContext context, UserProfile u) {
    if (_tab == _Tab.albums && _albums != null) {
      return [_albumsGrid(context, u, _albums!)];
    }
    final kinds = <(String?, String)>[
      (null, 'すべて'),
      if ((u.counts['WORK'] ?? 0) > 0) ('WORK', 'イラスト ${compactCount(u.counts['WORK']!)}'),
      if ((u.counts['NOVEL'] ?? 0) > 0) ('NOVEL', '小説 ${compactCount(u.counts['NOVEL']!)}'),
      if ((u.counts['VIDEO'] ?? 0) > 0) ('VIDEO', '動画 ${compactCount(u.counts['VIDEO']!)}'),
      if ((u.counts['COLUMN'] ?? 0) > 0) ('COLUMN', 'コラム ${compactCount(u.counts['COLUMN']!)}'),
    ];
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(children: [
            Expanded(
              child: kinds.length <= 2
                  ? const SizedBox(height: 38)
                  : PillTabs(
                      labels: kinds.map((k) => k.$2).toList(),
                      index: kinds.indexWhere((k) => k.$1 == _kind).clamp(0, kinds.length - 1),
                      onChanged: (i) => i == 0 ? _setWorksFilter(clearKind: true) : _setWorksFilter(kind: kinds[i].$1),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 4),
              child: SegmentedButton<bool>(
                showSelectedIcon: false,
                style: SegmentedButton.styleFrom(visualDensity: VisualDensity.compact, textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                segments: const [ButtonSegment(value: false, label: Text('新着')), ButtonSegment(value: true, label: Text('人気'))],
                selected: {_popular},
                onSelectionChanged: (s) => _setWorksFilter(popular: s.first),
              ),
            ),
          ]),
        ),
      ),
      if (_works != null)
        SliverPagedWorks(
          key: ObjectKey(_works),
          controller: _works!,
          showUser: false,
          emptyTitle: _isSelf ? 'まだ作品がありません' : '公開されている作品はありません',
          emptyMessage: _isSelf ? '作品を投稿すると、ここに並びます' : null,
        ),
    ];
  }

  Widget _albumsGrid(BuildContext context, UserProfile u, PagedController<AlbumSummary> c) {
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        const delegate = SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 260, mainAxisSpacing: 14, crossAxisSpacing: 12, childAspectRatio: 0.82);
        if (c.items.isEmpty && c.hasMore && c.error == null) {
          if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
          return SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid.builder(gridDelegate: delegate, itemCount: 4, itemBuilder: (_, __) => const Skeleton(radius: 16)),
          );
        }
        if (c.items.isEmpty && c.error != null) return SliverToBoxAdapter(child: StateView.error(c.error!, onRetry: c.refresh));
        if (c.items.isEmpty) return const SliverToBoxAdapter(child: StateView(icon: Icons.collections_bookmark_outlined, title: 'シリーズはありません'));
        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          sliver: SliverGrid.builder(
            gridDelegate: delegate,
            itemCount: c.items.length,
            itemBuilder: (context, i) {
              if (i >= c.items.length - 4 && c.hasMore && !c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
              final a = c.items[i];
              return Pressable(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AlbumScreen(album: a, userName: u.name))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: Stack(fit: StackFit.expand, children: [
                      AppImage(a.thumbnailUrl, radius: 16, memCacheWidth: 500),
                      Positioned(right: 6, bottom: 6, child: Badge2('${a.worksCount}', icon: Icons.collections_rounded)),
                    ]),
                  ),
                  const SizedBox(height: 6),
                  Text(a.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodyMedium?.copyWith(fontWeight: FontWeight.w800)),
                ]),
              );
            },
          ),
        );
      },
    );
  }
}

class _TabsHeader extends SliverPersistentHeaderDelegate {
  _TabsHeader({required this.child});

  final Widget child;

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;

  @override
  bool shouldRebuild(covariant _TabsHeader old) => true;
}

/// ヘッダー画像の上に置く丸いボタン
class _CircleIcon extends StatelessWidget {
  const _CircleIcon({required this.icon, required this.onTap, this.plain = false});

  final IconData icon;
  final VoidCallback onTap;
  final bool plain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pressable(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Ds.fast,
          width: 36,
          height: 36,
          decoration: BoxDecoration(shape: BoxShape.circle, color: plain ? Colors.transparent : Colors.black.withValues(alpha: 0.35)),
          child: Icon(icon, size: 20, color: plain ? context.cs.onSurface : Colors.white),
        ),
      ),
    );
  }
}

class _LinkChip extends StatelessWidget {
  const _LinkChip({required this.icon, required this.label, required this.url});

  final IconData icon;
  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: () => openExternalUrl(context, url),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(16)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 15, color: context.cs.primary),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
        ]),
      ),
    );
  }
}

Future<void> openExternalUrl(BuildContext context, String url) async {
  final uri = Uri.tryParse(url.startsWith('http') ? url : 'https://$url');
  if (uri == null) return;
  final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!ok && context.mounted) context.toast('リンクを開けませんでした', error: true);
}

/// 自己紹介（URL を押せる・長いときは折りたたむ）
class _Bio extends StatefulWidget {
  const _Bio({required this.text});

  final String text;

  @override
  State<_Bio> createState() => _BioState();
}

class _BioState extends State<_Bio> {
  bool _expanded = false;
  final _recognizers = <TapGestureRecognizer>[];

  static final _url = RegExp(r'https?://[^\s　）)」』]+');

  @override
  void dispose() {
    for (final r in _recognizers) {
      r.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (final r in _recognizers) {
      r.dispose();
    }
    _recognizers.clear();
    final spans = <InlineSpan>[];
    var last = 0;
    for (final m in _url.allMatches(widget.text)) {
      if (m.start > last) spans.add(TextSpan(text: widget.text.substring(last, m.start)));
      final url = m.group(0)!;
      final r = TapGestureRecognizer()..onTap = () => openExternalUrl(context, url);
      _recognizers.add(r);
      spans.add(TextSpan(text: url, style: TextStyle(color: context.cs.primary, fontWeight: FontWeight.w600), recognizer: r));
      last = m.end;
    }
    if (last < widget.text.length) spans.add(TextSpan(text: widget.text.substring(last)));
    final style = context.tt.bodyMedium?.copyWith(height: 1.6);
    return LayoutBuilder(builder: (context, constraints) {
      final tp = TextPainter(text: TextSpan(text: widget.text, style: style), maxLines: 4, textDirection: TextDirection.ltr)..layout(maxWidth: constraints.maxWidth);
      final overflow = tp.didExceedMaxLines;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AnimatedSize(
          duration: Ds.normal,
          curve: Ds.curve,
          alignment: Alignment.topCenter,
          child: Text.rich(TextSpan(children: spans), style: style, maxLines: _expanded ? null : 4, overflow: _expanded ? null : TextOverflow.ellipsis),
        ),
        if (overflow)
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(_expanded ? '閉じる' : 'もっと見る', style: TextStyle(color: context.cs.primary, fontWeight: FontWeight.w800)),
            ),
          ),
      ]);
    });
  }
}

class _ProfileSkeleton extends StatelessWidget {
  const _ProfileSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(16), children: const [
      Row(children: [Skeleton(width: 84, height: 84, radius: 42), Spacer(), Skeleton(width: 120, height: 42, radius: 21)]),
      SizedBox(height: 16),
      Skeleton(width: 180, height: 22, radius: 8),
      SizedBox(height: 8),
      Skeleton(width: 110, height: 14, radius: 6),
      SizedBox(height: 16),
      Skeleton(height: 60, radius: 12),
      SizedBox(height: 16),
      Skeleton(height: 70, radius: 18),
      SizedBox(height: 24),
      Row(children: [
        Expanded(child: Skeleton(height: 220, radius: 14)),
        SizedBox(width: 10),
        Expanded(child: Skeleton(height: 180, radius: 14)),
      ]),
    ]);
  }
}
