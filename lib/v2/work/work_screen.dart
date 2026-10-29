import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:aipictors/v2/work/comments.dart';
import 'package:aipictors/v2/work/moderation.dart';
import 'package:aipictors/v2/work/support_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

const _workQuery = '''
query AppWork(\$id: ID!) {
  viewer { id user { id } }
  work(id: \$id) {
    id title description type rating createdAt likesCount commentsCount viewsCount
    isLiked isCommentsEditable isGeneration
    imageURL imageWidth imageHeight url mdUrl
    largeThumbnailImageURL
    subWorks { id imageUrl }
    tagNames
    promptAccessType prompt negativePrompt seed steps scale sampler vae clipSkip model
    dailyTheme { id title }
    user { id login name iconUrl isFollowee biography followersCount }
    comments(offset: 0, limit: 3) {
      $commentFields
      responses(offset: 0, limit: 3) { $commentFields }
    }
    relatedWorks(offset: 0, limit: 24) { $workCardFields }
  }
}''';

/// 作品の詳細
class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key, required this.id});

  final String id;

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  Map<String, dynamic>? _work;
  String? _viewerId;
  String? _error;
  bool _liked = false;
  int _likes = 0;
  bool _following = false;
  bool _followBusy = false;
  int _imageIndex = 0;
  List<CommentItem> _comments = [];
  List<WorkSummary> _related = [];
  String? _novelText;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final data = await Api.query(_workQuery, variables: {'id': widget.id});
      final w = data.obj('work');
      if (!mounted) return;
      if (w == null || w.str('rating') == 'R18' || w.str('rating') == 'R18G') {
        setState(() => _error = 'この作品は表示できません');
        return;
      }
      setState(() {
        _work = w;
        _viewerId = data.obj('viewer')?.obj('user')?.strOrNull('id');
        _liked = w.boolean('isLiked');
        _likes = w.integer('likesCount');
        _following = w.obj('user')?.boolean('isFollowee') ?? false;
        _comments = w.list('comments').where((c) => !c.boolean('isMuted') && !c.boolean('isDeleted')).map(CommentItem.fromJson).toList();
        _related = WorkSummary.listFrom(w.list('relatedWorks'));
      });
      final md = w.strOrNull('mdUrl');
      if ((w.str('type') == 'NOVEL' || w.str('type') == 'COLUMN') && md != null) {
        http.get(Uri.parse(md)).then((r) {
          if (mounted && r.statusCode == 200) setState(() => _novelText = r.body);
        }).catchError((_) {});
      }
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Map<String, dynamic> get w => _work!;

  Map<String, dynamic> get user => w.obj('user') ?? const {};

  bool get _isMine => _viewerId != null && _viewerId == user.str('id');

  List<String> get _images {
    final main = w.strOrNull('imageURL') ?? w.strOrNull('largeThumbnailImageURL');
    return [
      if (main != null) main,
      ...w.list('subWorks').map((s) => s.strOrNull('imageUrl')).whereType<String>(),
    ];
  }

  Future<void> _toggleLike() async {
    if (!Nav.requireLogin(context)) return;
    final liked = !_liked;
    setState(() {
      _liked = liked;
      _likes += liked ? 1 : -1;
    });
    Ds.impact();
    try {
      await Api.mutate(
        liked
            ? r'mutation AppLikeWork($input: CreateWorkLikeInput!) { createWorkLike(input: $input) { id } }'
            : r'mutation AppUnlikeWork($input: DeleteWorkLikeInput!) { deleteWorkLike(input: $input) { id } }',
        variables: {
          'input': {'workId': w.str('id')},
        },
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _liked = !liked;
        _likes += liked ? -1 : 1;
      });
      context.toast(e.message, error: true);
    }
  }

  Future<void> _toggleFollow() async {
    if (!Nav.requireLogin(context) || _followBusy) return;
    final follow = !_following;
    setState(() {
      _following = follow;
      _followBusy = true;
    });
    Ds.impact();
    try {
      await Api.mutate(
        follow
            ? r'mutation AppFollow($input: FollowUserInput!) { followUser(input: $input) { id } }'
            : r'mutation AppUnfollow($input: UnfollowUserInput!) { unfollowUser(input: $input) { id } }',
        variables: {
          'input': {'userId': user.str('id')},
        },
      );
      if (mounted && follow) context.toast('${user.str('name')}さんをフォローしました', icon: Icons.person_add_alt_1_rounded);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _following = !follow);
      context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _followBusy = false);
    }
  }

  void _share() {
    final url = 'https://www.aipictors.com/posts/${w.str('id')}';
    Share.share('${w.str('title')} / ${user.str('name')}\n$url');
  }

  void _openComments({bool compose = false}) {
    showCommentsSheet(
      context,
      workId: w.str('id'),
      ownerId: user.str('id'),
      ownerName: user.str('name'),
      viewerId: _viewerId,
      openComposer: compose,
      onChanged: _load,
    );
  }

  Future<void> _menu() async {
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (context) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(leading: const Icon(Icons.ios_share_rounded), title: const Text('共有'), onTap: () => Navigator.pop(context, 'share')),
          ListTile(leading: const Icon(Icons.link_rounded), title: const Text('リンクをコピー'), onTap: () => Navigator.pop(context, 'copy')),
          if (!_isMine) ...[
            ListTile(leading: const Icon(Icons.flag_outlined), title: const Text('作品を通報'), onTap: () => Navigator.pop(context, 'report')),
            ListTile(leading: const Icon(Icons.volume_off_outlined), title: Text('${user.str('name')}さんをミュート'), onTap: () => Navigator.pop(context, 'mute')),
            ListTile(
              leading: Icon(Icons.block_rounded, color: context.cs.error),
              title: Text('${user.str('name')}さんをブロック', style: TextStyle(color: context.cs.error)),
              onTap: () => Navigator.pop(context, 'block'),
            ),
          ],
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case 'share':
        _share();
      case 'copy':
        await Clipboard.setData(ClipboardData(text: 'https://www.aipictors.com/posts/${w.str('id')}'));
        if (mounted) context.toast('リンクをコピーしました');
      case 'report':
        await showReportSheet(context, target: ReportTarget.work, id: w.str('id'));
      case 'mute':
        if (await muteUser(context, user.str('id'), user.str('name')) && mounted) Navigator.of(context).maybePop();
      case 'block':
        if (await blockUser(context, user.str('id'), user.str('name')) && mounted) Navigator.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(appBar: AppBar(), body: StateView.error(_error!, onRetry: _load));
    }
    if (_work == null) {
      return Scaffold(
        appBar: AppBar(),
        body: ListView(padding: const EdgeInsets.all(16), children: const [
          Skeleton(height: 420, radius: 20),
          SizedBox(height: 16),
          Skeleton(height: 22, width: 220, radius: 8),
          SizedBox(height: 12),
          Skeleton(height: 14, radius: 6),
          SizedBox(height: 8),
          Skeleton(height: 14, width: 260, radius: 6),
        ]),
      );
    }
    final images = _images;
    final isVideo = w.str('type') == 'VIDEO' && (w.strOrNull('url') ?? '').isNotEmpty;
    final isNovel = w.str('type') == 'NOVEL' || w.str('type') == 'COLUMN';
    final promptPublic = w.str('promptAccessType') == 'PUBLIC' && (w.strOrNull('prompt') ?? '').isNotEmpty;
    final tags = (w['tagNames'] as List?)?.map((e) => e.toString()).where((e) => e.isNotEmpty).toList() ?? const [];
    final width = MediaQuery.sizeOf(context).width;
    final mediaMax = width > 700 ? 700.0 : width;

    return Scaffold(
      body: Stack(children: [
        RefreshIndicator.adaptive(
          onRefresh: _load,
          edgeOffset: 80,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(w.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                actions: [
                  IconButton(onPressed: _share, icon: const Icon(Icons.ios_share_rounded)),
                  IconButton(onPressed: _menu, icon: const Icon(Icons.more_horiz_rounded)),
                ],
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: mediaMax),
                    child: isVideo
                        ? _VideoBox(url: w.str('url'), poster: images.isNotEmpty ? images.first : null)
                        : images.isEmpty
                            ? const SizedBox(height: 12)
                            : _ImagePager(
                                images: images,
                                aspect: w.integer('imageWidth') > 0 && w.integer('imageHeight') > 0
                                    ? (w.integer('imageWidth') / w.integer('imageHeight')).clamp(0.6, 1.8)
                                    : 1,
                                onIndex: (i) => setState(() => _imageIndex = i),
                                index: _imageIndex,
                                onDoubleTap: () {
                                  if (!_liked) _toggleLike();
                                },
                              ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 760),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        _ActionBar(
                          liked: _liked,
                          likes: _likes,
                          comments: w.integer('commentsCount'),
                          onLike: _toggleLike,
                          onComment: () => _openComments(),
                          onSupport: _isMine
                              ? null
                              : () => showSupportSheet(context, userId: user.str('id'), userName: user.str('name'), iconUrl: user.strOrNull('iconUrl')),
                          onShare: _share,
                        ),
                        const SizedBox(height: 14),
                        Text(w.str('title'), style: context.tt.headlineSmall?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.3)),
                        const SizedBox(height: 6),
                        Wrap(spacing: 12, crossAxisAlignment: WrapCrossAlignment.center, children: [
                          _Meta(icon: Icons.schedule_rounded, text: relativeTime(w.integer('createdAt'))),
                          _Meta(icon: Icons.visibility_outlined, text: compactCount(w.integer('viewsCount'))),
                          if (w.str('rating') == 'R15') const Badge2('R15', color: Color(0xCCE2A21B)),
                          if (w.obj('dailyTheme') != null)
                            ActionChip(
                              avatar: const Icon(Icons.today_rounded, size: 16),
                              label: Text('お題「${w.obj('dailyTheme')!.str('title')}」'),
                              visualDensity: VisualDensity.compact,
                              onPressed: () => context.push('/daily_themes/${w.obj('dailyTheme')!.str('id')}'),
                            ),
                        ]),
                        const SizedBox(height: 14),
                        _UserRow(
                          user: user,
                          following: _following,
                          isMine: _isMine,
                          busy: _followBusy,
                          onFollow: _toggleFollow,
                        ),
                        if (w.str('description').trim().isNotEmpty) ...[
                          const SizedBox(height: 14),
                          _ExpandableText(w.str('description').trim()),
                        ],
                        if (isNovel && _novelText != null) ...[
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.6), borderRadius: Ds.br(16)),
                            child: SelectableText(_novelText!, style: const TextStyle(height: 1.9, fontSize: 15.5)),
                          ),
                        ],
                        if (tags.isNotEmpty) ...[
                          const SizedBox(height: 14),
                          Wrap(spacing: 8, runSpacing: 8, children: [
                            for (final t in tags)
                              Pressable(
                                onTap: () => Nav.tag(context, t),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                                  decoration: BoxDecoration(
                                    color: context.cs.primary.withValues(alpha: 0.1),
                                    borderRadius: Ds.br(16),
                                  ),
                                  child: Text('#$t', style: TextStyle(color: context.cs.primary, fontWeight: FontWeight.w700, fontSize: 13)),
                                ),
                              ),
                          ]),
                        ],
                        if (promptPublic) ...[
                          const SizedBox(height: 16),
                          _GenerationInfo(work: w),
                        ],
                        const SizedBox(height: 8),
                        _CommentsPreview(
                          comments: _comments,
                          total: w.integer('commentsCount'),
                          viewerId: _viewerId,
                          editable: w.boolean('isCommentsEditable', true),
                          onOpen: () => _openComments(),
                          onCompose: () {
                            if (Nav.requireLogin(context)) _openComments(compose: true);
                          },
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              if (_related.isNotEmpty) ...[
                const SliverToBoxAdapter(child: SectionHeader('関連作品', icon: Icons.auto_awesome_mosaic_rounded)),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: gridColumns(context),
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 10,
                    childCount: _related.length,
                    itemBuilder: (context, i) => WorkCard(work: _related[i]),
                  ),
                ),
              ],
              SliverToBoxAdapter(child: SizedBox(height: 120 + MediaQuery.paddingOf(context).bottom)),
            ],
          ),
        ),
      ]),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 14, color: context.muted),
      const SizedBox(width: 4),
      Text(text, style: TextStyle(color: context.muted, fontSize: 12)),
    ]);
  }
}

class _ImagePager extends StatefulWidget {
  const _ImagePager({required this.images, required this.aspect, required this.onIndex, required this.index, required this.onDoubleTap});

  final List<String> images;
  final double aspect;
  final ValueChanged<int> onIndex;
  final int index;
  final VoidCallback onDoubleTap;

  @override
  State<_ImagePager> createState() => _ImagePagerState();
}

class _ImagePagerState extends State<_ImagePager> with SingleTickerProviderStateMixin {
  late final _heart = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));

  @override
  void dispose() {
    _heart.dispose();
    super.dispose();
  }

  void _open(int index) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      barrierColor: Colors.black,
      pageBuilder: (_, __, ___) => FullscreenImages(images: widget.images, initial: index),
      transitionsBuilder: (_, a, __, child) => FadeTransition(opacity: a, child: child),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images;
    return Column(children: [
      AspectRatio(
        aspectRatio: widget.aspect,
        child: Stack(fit: StackFit.expand, children: [
          PageView.builder(
            itemCount: images.length,
            onPageChanged: widget.onIndex,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () => _open(i),
              onDoubleTap: () {
                widget.onDoubleTap();
                _heart.forward(from: 0);
                Ds.success();
              },
              child: Container(
                color: context.isDark ? Colors.black : const Color(0xFFF2F3F5),
                child: AppImage(images[i], fit: BoxFit.contain),
              ),
            ),
          ),
          IgnorePointer(
            child: AnimatedBuilder(
              animation: _heart,
              builder: (context, _) {
                final v = _heart.value;
                if (v == 0 || v == 1) return const SizedBox.shrink();
                final scale = Curves.elasticOut.transform((v * 1.6).clamp(0, 1));
                return Center(
                  child: Opacity(
                    opacity: (1 - (v - 0.6).clamp(0, 0.4) / 0.4),
                    child: Transform.scale(
                      scale: 0.6 + scale * 0.8,
                      child: const Icon(Icons.favorite_rounded, color: Ds.pink, size: 110, shadows: [Shadow(blurRadius: 24, color: Colors.black38)]),
                    ),
                  ),
                );
              },
            ),
          ),
          if (images.length > 1)
            Positioned(
              right: 12,
              top: 12,
              child: Badge2('${widget.index + 1} / ${images.length}'),
            ),
        ]),
      ),
      if (images.length > 1)
        SizedBox(
          height: 64,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            itemCount: images.length,
            separatorBuilder: (_, __) => const SizedBox(width: 6),
            itemBuilder: (context, i) => GestureDetector(
              onTap: () => _open(i),
              child: AnimatedContainer(
                duration: Ds.fast,
                width: 54,
                decoration: BoxDecoration(
                  borderRadius: Ds.br(10),
                  border: Border.all(color: i == widget.index ? context.cs.primary : Colors.transparent, width: 2),
                ),
                child: AppImage(images[i], radius: 8, memCacheWidth: 160),
              ),
            ),
          ),
        ),
    ]);
  }
}

/// 全画面でピンチ拡大・左右スワイプ・下スワイプで閉じる
class FullscreenImages extends StatefulWidget {
  const FullscreenImages({super.key, required this.images, required this.initial});

  final List<String> images;
  final int initial;

  @override
  State<FullscreenImages> createState() => _FullscreenImagesState();
}

class _FullscreenImagesState extends State<FullscreenImages> {
  late final _pc = PageController(initialPage: widget.initial);
  late int _index = widget.initial;
  double _drag = 0;

  @override
  void dispose() {
    _pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final opacity = (1 - _drag.abs() / 400).clamp(0.3, 1.0);
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: opacity),
      body: Stack(children: [
        GestureDetector(
          onVerticalDragUpdate: (d) => setState(() => _drag += d.delta.dy),
          onVerticalDragEnd: (d) {
            if (_drag.abs() > 120 || d.velocity.pixelsPerSecond.dy.abs() > 900) {
              Navigator.pop(context);
            } else {
              setState(() => _drag = 0);
            }
          },
          child: Transform.translate(
            offset: Offset(0, _drag),
            child: PageView.builder(
              controller: _pc,
              itemCount: widget.images.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) => InteractiveViewer(
                maxScale: 5,
                child: Center(child: AppImage(widget.images[i], fit: BoxFit.contain)),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Row(children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close_rounded, color: Colors.white),
            ),
            const Spacer(),
            if (widget.images.length > 1)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text('${_index + 1} / ${widget.images.length}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              ),
          ]),
        ),
      ]),
    );
  }
}

class _VideoBox extends StatefulWidget {
  const _VideoBox({required this.url, this.poster});

  final String url;
  final String? poster;

  @override
  State<_VideoBox> createState() => _VideoBoxState();
}

class _VideoBoxState extends State<_VideoBox> {
  late final VideoPlayerController _c = VideoPlayerController.networkUrl(Uri.parse(widget.url));
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _c.initialize().then((_) {
      if (!mounted) return;
      _c.setLooping(true);
      setState(() => _ready = true);
      _c.play();
    }).catchError((_) {});
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return AspectRatio(
        aspectRatio: 1,
        child: Stack(fit: StackFit.expand, children: [
          if (widget.poster != null) AppImage(widget.poster, fit: BoxFit.contain),
          const Center(child: CircularProgressIndicator.adaptive()),
        ]),
      );
    }
    return AspectRatio(
      aspectRatio: _c.value.aspectRatio,
      child: GestureDetector(
        onTap: () => setState(() => _c.value.isPlaying ? _c.pause() : _c.play()),
        child: Stack(fit: StackFit.expand, children: [
          VideoPlayer(_c),
          AnimatedOpacity(
            opacity: _c.value.isPlaying ? 0 : 1,
            duration: Ds.fast,
            child: const Center(child: Icon(Icons.play_circle_fill_rounded, size: 72, color: Colors.white70)),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: VideoProgressIndicator(_c, allowScrubbing: true)),
        ]),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.liked,
    required this.likes,
    required this.comments,
    required this.onLike,
    required this.onComment,
    required this.onSupport,
    required this.onShare,
  });

  final bool liked;
  final int likes;
  final int comments;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback? onSupport;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _RoundAction(
        onTap: onLike,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          AnimatedSwitcher(
            duration: Ds.normal,
            transitionBuilder: (c, a) => ScaleTransition(scale: CurvedAnimation(parent: a, curve: Curves.elasticOut), child: c),
            child: Icon(
              liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              key: ValueKey(liked),
              color: liked ? Ds.pink : null,
            ),
          ),
          const SizedBox(width: 6),
          Text(compactCount(likes), style: const TextStyle(fontWeight: FontWeight.w800)),
        ]),
      ),
      const SizedBox(width: 8),
      _RoundAction(
        onTap: onComment,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.chat_bubble_outline_rounded),
          const SizedBox(width: 6),
          Text(compactCount(comments), style: const TextStyle(fontWeight: FontWeight.w800)),
        ]),
      ),
      const Spacer(),
      if (onSupport != null)
        Pressable(
          onTap: onSupport,
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              gradient: Ds.goldGradient,
              borderRadius: Ds.br(22),
              boxShadow: [BoxShadow(color: Ds.gold.withValues(alpha: 0.35), blurRadius: 14, offset: const Offset(0, 6))],
            ),
            child: const Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.volunteer_activism_rounded, color: Colors.white, size: 20),
              SizedBox(width: 6),
              Text('推す', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
            ]),
          ),
        ),
    ]);
  }
}

class _RoundAction extends StatelessWidget {
  const _RoundAction({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(22)),
        child: child,
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow({required this.user, required this.following, required this.isMine, required this.busy, required this.onFollow});

  final Map<String, dynamic> user;
  final bool following;
  final bool isMine;
  final bool busy;
  final VoidCallback onFollow;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      scale: 0.99,
      onTap: () => Nav.user(context, user.str('id')),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.surfaceCard,
          borderRadius: Ds.br(18),
          border: Border.all(color: context.hairline),
        ),
        child: Row(children: [
          Avatar(user.strOrNull('iconUrl'), size: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.str('name'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
              Text('フォロワー ${compactCount(user.integer('followersCount'))}', style: TextStyle(color: context.muted, fontSize: 12)),
            ]),
          ),
          if (!isMine)
            AnimatedSwitcher(
              duration: Ds.fast,
              child: following
                  ? OutlinedButton(
                      key: const ValueKey('following'),
                      onPressed: busy ? null : onFollow,
                      style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                      child: const Text('フォロー中'),
                    )
                  : FilledButton(
                      key: const ValueKey('follow'),
                      onPressed: busy ? null : onFollow,
                      style: FilledButton.styleFrom(shape: const StadiumBorder()),
                      child: const Text('フォロー'),
                    ),
            ),
        ]),
      ),
    );
  }
}

class _ExpandableText extends StatefulWidget {
  const _ExpandableText(this.text);

  final String text;

  @override
  State<_ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<_ExpandableText> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final long = widget.text.length > 140 || '\n'.allMatches(widget.text).length > 4;
    return GestureDetector(
      onTap: long ? () => setState(() => _open = !_open) : null,
      child: AnimatedSize(
        duration: Ds.normal,
        alignment: Alignment.topCenter,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SelectableText(
            widget.text,
            maxLines: _open || !long ? null : 4,
            style: const TextStyle(height: 1.6, fontSize: 14.5),
          ),
          if (long)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(_open ? '閉じる' : '続きを読む', style: TextStyle(color: context.cs.primary, fontWeight: FontWeight.w700)),
            ),
        ]),
      ),
    );
  }
}

class _GenerationInfo extends StatelessWidget {
  const _GenerationInfo({required this.work});

  final Map<String, dynamic> work;

  @override
  Widget build(BuildContext context) {
    Widget block(String label, String? text) {
      if (text == null || text.trim().isEmpty) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(label, style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700)),
            const Spacer(),
            InkWell(
              borderRadius: Ds.br(10),
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: text));
                if (context.mounted) context.toast('$labelをコピーしました', icon: Icons.copy_rounded);
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.copy_rounded, size: 14, color: context.cs.primary),
                  const SizedBox(width: 4),
                  Text('コピー', style: TextStyle(color: context.cs.primary, fontSize: 12, fontWeight: FontWeight.w700)),
                ]),
              ),
            ),
          ]),
          const SizedBox(height: 4),
          Text(text, maxLines: 6, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, height: 1.45)),
        ]),
      );
    }

    final params = <(String, String?)>[
      ('モデル', work.strOrNull('model')),
      ('Steps', work['steps']?.toString()),
      ('Scale', work['scale']?.toString()),
      ('Sampler', work.strOrNull('sampler')),
      ('Seed', work['seed']?.toString()),
      ('VAE', work.strOrNull('vae')),
    ].where((p) => p.$2 != null && p.$2!.isNotEmpty && p.$2 != 'null').toList();

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        borderRadius: Ds.br(18),
        border: Border.all(color: context.hairline),
        color: context.surfaceCard,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          ShaderMask(shaderCallback: (r) => Ds.brandGradient.createShader(r), child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 20)),
          const SizedBox(width: 6),
          Text('生成情報', style: context.tt.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
        ]),
        block('プロンプト', work.strOrNull('prompt')),
        block('ネガティブプロンプト', work.strOrNull('negativePrompt')),
        if (params.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(spacing: 6, runSpacing: 6, children: [
            for (final p in params)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(10)),
                child: Text('${p.$1}: ${p.$2}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              ),
          ]),
        ],
      ]),
    );
  }
}

class _CommentsPreview extends StatelessWidget {
  const _CommentsPreview({
    required this.comments,
    required this.total,
    required this.viewerId,
    required this.editable,
    required this.onOpen,
    required this.onCompose,
  });

  final List<CommentItem> comments;
  final int total;
  final String? viewerId;
  final bool editable;
  final VoidCallback onOpen;
  final VoidCallback onCompose;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 4),
        child: Row(children: [
          Text('コメント', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(width: 6),
          Text('$total', style: TextStyle(color: context.muted, fontWeight: FontWeight.w700)),
          const Spacer(),
          if (total > 0) TextButton(onPressed: onOpen, child: const Text('すべて見る')),
        ]),
      ),
      for (final c in comments) CommentTile(key: ValueKey(c.id), comment: c, viewerId: viewerId),
      if (editable) ...[
        const SizedBox(height: 10),
        Pressable(
          scale: 0.99,
          onTap: onCompose,
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(23)),
            child: Row(children: [
              Icon(Icons.edit_outlined, size: 18, color: context.muted),
              const SizedBox(width: 8),
              Text('コメントを書く', style: TextStyle(color: context.muted)),
              const Spacer(),
              Icon(Icons.emoji_emotions_outlined, size: 20, color: context.muted),
              const SizedBox(width: 8),
              const Icon(Icons.monetization_on_outlined, size: 20, color: Ds.gold),
            ]),
          ),
        ),
      ],
    ]);
  }
}
