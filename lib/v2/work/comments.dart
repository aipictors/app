import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/official_badge.dart';
import 'package:aipictors/v2/work/moderation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const commentFields = '''
  id
  text
  createdAt
  likesCount
  isLiked
  isDeleted
  isMuted
  isSensitive
  isWorkOwnerLiked
  supportThankYouMessage
  sticker { id imageUrl title isDownloaded }
  support { freeCoinAmount premiumCoinAmount totalPt }
  user { $userSummaryFields }
''';

class CommentItem {
  CommentItem(this.json, {List<CommentItem>? replies}) : replies = replies ?? [];

  final Map<String, dynamic> json;
  final List<CommentItem> replies;

  late bool isLiked = json.boolean('isLiked');
  late int likesCount = json.integer('likesCount');

  String get id => json.str('id');

  String get text => json.str('text');

  int get createdAt => json.integer('createdAt');

  String? get stickerUrl => json.obj('sticker')?.strOrNull('imageUrl');

  Map<String, dynamic>? get user => json.obj('user');

  String get userId => user?.str('id') ?? '';

  String get userName => user?.str('name', '退会したユーザー') ?? '退会したユーザー';

  String? get iconUrl => user?.strOrNull('iconUrl');

  bool get isOfficial => user?.boolean('isOfficial') ?? false;

  bool get isModerator => user?.boolean('isModerator') ?? false;

  bool get isSensitive => json.boolean('isSensitive');

  bool get isWorkOwnerLiked => json.boolean('isWorkOwnerLiked');

  String? get thankYouMessage => json.strOrNull('supportThankYouMessage');

  int get supportFree => json.obj('support')?.integer('freeCoinAmount') ?? 0;

  int get supportPremium => json.obj('support')?.integer('premiumCoinAmount') ?? 0;

  String? get stickerId => json.obj('sticker')?.strOrNull('id');

  int get supportPt => json.obj('support')?.integer('totalPt') ?? 0;

  int get supportCoins {
    final s = json.obj('support');
    if (s == null) return 0;
    return s.integer('freeCoinAmount') + s.integer('premiumCoinAmount');
  }

  static CommentItem fromJson(Map<String, dynamic> j) =>
      CommentItem(j, replies: j.list('responses').map((r) => CommentItem(r)).toList().reversed.toList());
}

/// コメント 1 件（返信は下にぶら下げる）
class CommentTile extends StatefulWidget {
  const CommentTile({
    super.key,
    required this.comment,
    required this.viewerId,
    this.onReply,
    this.onDeleted,
    this.isReply = false,
    this.replyToUserName,
  });

  final CommentItem comment;
  final String? viewerId;
  final ValueChanged<CommentItem>? onReply;
  final VoidCallback? onDeleted;
  final bool isReply;

  /// 返信先のコメントを書いた人
  final String? replyToUserName;

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  CommentItem get c => widget.comment;

  /// 隠し付きのコメントを開いた
  bool _revealed = false;

  Future<void> _like() async {
    if (!Nav.requireLogin(context)) return;
    final liked = !c.isLiked;
    setState(() {
      c.isLiked = liked;
      c.likesCount += liked ? 1 : -1;
    });
    Ds.impact();
    try {
      await Api.mutate(
        liked
            ? r'mutation AppLikeComment($input: CreateCommentLikeInput!) { createCommentLike(input: $input) { id } }'
            : r'mutation AppUnlikeComment($input: DeleteCommentLikeInput!) { deleteCommentLike(input: $input) { id } }',
        variables: {
          'input': {'commentId': c.id},
        },
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        c.isLiked = !liked;
        c.likesCount += liked ? -1 : 1;
      });
      context.toast(e.message, error: true);
    }
  }

  Future<void> _menu() async {
    final mine = widget.viewerId != null && widget.viewerId == c.userId;
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (context) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if (mine)
            ListTile(
              leading: Icon(Icons.delete_outline_rounded, color: context.cs.error),
              title: Text('コメントを削除', style: TextStyle(color: context.cs.error)),
              onTap: () => Navigator.pop(context, 'delete'),
            )
          else ...[
            ListTile(leading: const Icon(Icons.flag_outlined), title: const Text('コメントを通報'), onTap: () => Navigator.pop(context, 'report')),
            if (c.userId.isNotEmpty) ...[
              ListTile(leading: const Icon(Icons.volume_off_outlined), title: Text('${c.userName}さんをミュート'), onTap: () => Navigator.pop(context, 'mute')),
              ListTile(leading: const Icon(Icons.block_rounded), title: Text('${c.userName}さんをブロック'), onTap: () => Navigator.pop(context, 'block')),
            ],
          ],
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case 'delete':
        try {
          await Api.mutate(r'mutation AppDeleteComment($input: DeleteCommentInput!) { deleteComment(input: $input) { id } }', variables: {
            'input': {'commentId': c.id},
          });
          if (mounted) context.toast('削除しました');
          widget.onDeleted?.call();
        } on ApiException catch (e) {
          if (mounted) context.toast(e.message, error: true);
        }
      case 'report':
        await showReportSheet(context, target: ReportTarget.comment, id: c.id);
      case 'mute':
        if (await muteUser(context, c.userId, c.userName)) widget.onDeleted?.call();
      case 'block':
        if (await blockUser(context, c.userId, c.userName)) widget.onDeleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final support = c.supportCoins > 0;
    return Padding(
      padding: EdgeInsets.only(left: widget.isReply ? 44 : 0, top: 10, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAvatar.json(c.user, size: widget.isReply ? 28 : 36, tappable: true),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 9, 12, 10),
                  decoration: BoxDecoration(
                    color: support ? Ds.gold.withValues(alpha: context.isDark ? 0.16 : 0.1) : context.skeleton.withValues(alpha: context.isDark ? 0.8 : 0.7),
                    border: support ? Border.all(color: Ds.gold.withValues(alpha: 0.5)) : null,
                    borderRadius: const BorderRadius.only(topRight: Ds.r16, bottomLeft: Ds.r16, bottomRight: Ds.r16, topLeft: Radius.circular(4)),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Flexible(
                        child: Text(c.userName, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
                      ),
                      if (c.isOfficial || c.isModerator) ...[const SizedBox(width: 3), OfficialBadge(size: 14, isOfficial: c.isOfficial, isModerator: c.isModerator)],
                      const SizedBox(width: 6),
                      Text(relativeTime(c.createdAt), style: TextStyle(color: context.muted, fontSize: 11)),
                    ]),
                    if (widget.replyToUserName != null) ...[
                      const SizedBox(height: 2),
                      Text('${widget.replyToUserName} さんのコメントへの返信', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 11)),
                    ],
                    if (support) ...[
                      const SizedBox(height: 6),
                      _SupportBadge(comment: c),
                    ],
                    if (c.isSensitive && !_revealed) ...[
                      const SizedBox(height: 6),
                      Text(widget.isReply ? '隠し付き（もしくはセンシティブ）な返信です' : '隠し付き（もしくはセンシティブ）なコメントです', style: TextStyle(color: context.muted, fontSize: 13)),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 32), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () => setState(() => _revealed = true),
                        child: const Text('表示する'),
                      ),
                    ] else ...[
                      if (c.text.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        SelectableText(c.text, style: const TextStyle(height: 1.45, fontSize: 14)),
                      ],
                      if (c.stickerUrl != null) ...[
                        const SizedBox(height: 6),
                        GestureDetector(
                          onTap: c.stickerId == null ? null : () => context.push('/stickers/${c.stickerId}'),
                          child: AppImage(c.stickerUrl, width: 96, height: 96, fit: BoxFit.contain, radius: 8),
                        ),
                      ],
                    ],
                    if (support && c.thankYouMessage != null) ...[
                      const SizedBox(height: 6),
                      Text('作者より：${c.thankYouMessage}', style: TextStyle(color: context.muted, fontSize: 12)),
                    ],
                  ]),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: widget.isReply ? 38 : 46, top: 2),
            child: Row(children: [
              _MiniAction(
                icon: c.isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: c.isLiked ? Ds.pink : null,
                label: c.likesCount > 0 ? '${c.likesCount}' : 'いいね',
                onTap: _like,
              ),
              if (widget.onReply != null)
                _MiniAction(icon: Icons.reply_rounded, label: '返信', onTap: () => widget.onReply!(c)),
              if (c.isWorkOwnerLiked)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('作者がいいね', style: TextStyle(fontSize: 11, color: Ds.pink.withValues(alpha: 0.9), fontWeight: FontWeight.w700)),
                ),
              _MiniAction(icon: Icons.more_horiz_rounded, label: '', onTap: _menu),
            ]),
          ),
          for (final r in c.replies)
            CommentTile(
              key: ValueKey(r.id),
              comment: r,
              viewerId: widget.viewerId,
              isReply: true,
              replyToUserName: c.userName,
              // 返信への返信も、Web と同じく親のコメントにぶら下げる
              onReply: widget.onReply == null ? null : (_) => widget.onReply!(c),
              onDeleted: () => setState(() => c.replies.remove(r)),
            ),
        ],
      ),
    );
  }
}

/// 推しの合計 pt と内訳（フリーとプレミアムは価値が違うので分けて出す）
class _SupportBadge extends StatelessWidget {
  const _SupportBadge({required this.comment});

  final CommentItem comment;

  @override
  Widget build(BuildContext context) {
    final parts = [
      if (comment.supportPremium > 0) 'プレミアム ${comment.supportPremium}枚',
      if (comment.supportFree > 0) 'フリー ${comment.supportFree}枚',
    ];
    return Wrap(spacing: 6, crossAxisAlignment: WrapCrossAlignment.center, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(gradient: Ds.goldGradient, borderRadius: Ds.br(10)),
        child: Text('${comment.supportPt}pt', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
      ),
      Text(parts.join('・'), style: TextStyle(color: context.muted, fontSize: 11)),
    ]);
  }
}

class _MiniAction extends StatelessWidget {
  const _MiniAction({required this.icon, required this.label, required this.onTap, this.color});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: Ds.br(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 16, color: color ?? context.muted),
          if (label.isNotEmpty) ...[
            const SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 12, color: color ?? context.muted, fontWeight: FontWeight.w600)),
          ],
        ]),
      ),
    );
  }
}

/// コメント一覧（全画面のシート）
Future<void> showCommentsSheet(
  BuildContext context, {
  required String workId,
  required String ownerId,
  required String ownerName,
  required String? viewerId,
  bool openComposer = false,
  VoidCallback? onChanged,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (_) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scroll) => _CommentsSheet(
        workId: workId,
        ownerId: ownerId,
        ownerName: ownerName,
        viewerId: viewerId,
        scrollController: scroll,
        openComposer: openComposer,
        onChanged: onChanged,
      ),
    ),
  );
}

class _CommentsSheet extends StatefulWidget {
  const _CommentsSheet({
    required this.workId,
    required this.ownerId,
    required this.ownerName,
    required this.viewerId,
    required this.scrollController,
    required this.openComposer,
    this.onChanged,
  });

  final String workId;
  final String ownerId;
  final String ownerName;
  final String? viewerId;
  final ScrollController scrollController;
  final bool openComposer;
  final VoidCallback? onChanged;

  @override
  State<_CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<_CommentsSheet> {
  late final _controller = PagedController<CommentItem>(
    pageSize: 20,
    idOf: (c) => c.id,
    fetch: (offset, limit) async {
      final data = await Api.query('''
query AppWorkComments(\$id: ID!, \$offset: Int!, \$limit: Int!) {
  work(id: \$id) {
    id
    comments(offset: \$offset, limit: \$limit) {
      $commentFields
      responses(offset: 0, limit: 64) { $commentFields }
    }
  }
}''', variables: {'id': widget.workId, 'offset': offset, 'limit': limit});
      final list = data.obj('work')?.list('comments') ?? const [];
      return list.where((c) => !c.boolean('isMuted') && !c.boolean('isDeleted')).map(CommentItem.fromJson).toList();
    },
  );

  CommentItem? _replyTo;
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.loadMore();
    if (widget.openComposer) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _focus.requestFocus());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 12, 6),
          child: Row(children: [
            Text('コメント', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
            const Spacer(),
            IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close_rounded)),
          ]),
        ),
        Divider(height: 1, color: context.hairline),
        Expanded(
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              final c = _controller;
              if (c.isInitialLoading) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: List.generate(
                    5,
                    (_) => const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(children: [Skeleton(width: 36, height: 36, radius: 18), SizedBox(width: 10), Expanded(child: Skeleton(height: 56))]),
                    ),
                  ),
                );
              }
              if (c.items.isEmpty && c.error != null) return StateView.error(c.error!, onRetry: c.refresh);
              if (c.items.isEmpty) {
                return const StateView(
                  icon: Icons.chat_bubble_outline_rounded,
                  title: 'まだコメントがありません',
                  message: '最初のコメントで作者さんを応援しよう',
                );
              }
              return ListView.builder(
                controller: widget.scrollController,
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 24),
                itemCount: c.items.length + 1,
                itemBuilder: (context, i) {
                  if (i == c.items.length) {
                    if (c.hasMore && !c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(child: c.isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox()),
                    );
                  }
                  final item = c.items[i];
                  return CommentTile(
                    key: ValueKey(item.id),
                    comment: item,
                    viewerId: widget.viewerId,
                    onReply: (c) {
                      setState(() => _replyTo = c);
                      _focus.requestFocus();
                    },
                    onDeleted: () {
                      c.removeWhere((x) => x.id == item.id);
                      widget.onChanged?.call();
                    },
                  );
                },
              );
            },
          ),
        ),
        CommentComposer(
          workId: widget.workId,
          ownerId: widget.ownerId,
          ownerName: widget.ownerName,
          focusNode: _focus,
          replyTo: _replyTo,
          onCancelReply: () => setState(() => _replyTo = null),
          onPosted: (comment, parent) {
            if (parent != null) {
              parent.replies.add(comment);
              _controller.touch();
            } else {
              _controller.items.insert(0, comment);
              _controller.touch();
              if (widget.scrollController.hasClients) widget.scrollController.jumpTo(0);
            }
            setState(() => _replyTo = null);
            widget.onChanged?.call();
          },
        ),
      ],
    );
  }
}

/// コメント入力欄（スタンプ・推しコインを添えられる）
class CommentComposer extends StatefulWidget {
  const CommentComposer({
    super.key,
    required this.workId,
    required this.ownerId,
    required this.ownerName,
    required this.onPosted,
    this.focusNode,
    this.replyTo,
    this.onCancelReply,
  });

  final String workId;
  final String ownerId;
  final String ownerName;
  final FocusNode? focusNode;
  final CommentItem? replyTo;
  final VoidCallback? onCancelReply;
  final void Function(CommentItem comment, CommentItem? parent) onPosted;

  @override
  State<CommentComposer> createState() => _CommentComposerState();
}

class _CommentComposerState extends State<CommentComposer> {
  final _text = TextEditingController();
  bool _sending = false;
  Map<String, dynamic>? _sticker;
  int _supportFree = 0;
  int _supportPremium = 0;
  bool _supportAnonymous = false;
  bool _sensitive = false;
  CoinSummary? _balance;

  bool get _hasSupport => _supportFree + _supportPremium > 0;

  int get _supportPt => _supportFree + _supportPremium * 10;

  @override
  void initState() {
    super.initState();
    _text.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  bool get _canSend => !_sending && (_text.text.trim().isNotEmpty || _sticker != null);

  Future<void> _pickSticker() async {
    if (!Nav.requireLogin(context)) return;
    final picked = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (_) => const _StickerPicker(),
    );
    if (picked != null) setState(() => _sticker = picked);
  }

  Future<void> _pickSupport() async {
    if (!Nav.requireLogin(context)) return;
    try {
      _balance ??= await Coins.summary();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
      return;
    }
    if (!mounted) return;
    final picked = await showModalBottomSheet<SupportPick>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (_) => SupportPicker(balance: _balance!, free: _supportFree, premium: _supportPremium, anonymous: _supportAnonymous),
    );
    if (picked == null) return;
    setState(() {
      _supportFree = picked.free;
      _supportPremium = picked.premium;
      _supportAnonymous = picked.anonymous;
    });
  }

  Future<void> _send() async {
    if (!Nav.requireLogin(context) || !_canSend) return;
    setState(() => _sending = true);
    final parent = widget.replyTo;
    try {
      Map<String, dynamic> created;
      if (parent != null) {
        final data = await Api.mutate('''
mutation AppReply(\$input: CreateResponseCommentInput!) { createResponseComment(input: \$input) { $commentFields } }''', variables: {
          'input': {
            'commentId': parent.id,
            'text': _text.text.trim(),
            'isSensitive': _sensitive,
            if (_sticker != null) 'stickerId': _sticker!['id'],
          },
        });
        created = data.obj('createResponseComment') ?? {};
      } else {
        final data = await Api.mutate('''
mutation AppComment(\$input: CreateWorkCommentInput!) { createWorkComment(input: \$input) { $commentFields } }''', variables: {
          'input': {
            'workId': widget.workId,
            'text': _text.text.trim(),
            'isSensitive': _sensitive,
            if (_sticker != null) 'stickerId': _sticker!['id'],
            if (_hasSupport) ...{
              'supportFreeCoinAmount': _supportFree,
              'supportPremiumCoinAmount': _supportPremium,
              'supportIsAnonymous': _supportAnonymous,
            },
          },
        });
        created = data.obj('createWorkComment') ?? {};
      }
      Ds.success();
      _text.clear();
      final hadSupport = _hasSupport;
      setState(() {
        _sticker = null;
        _supportFree = 0;
        _supportPremium = 0;
        _supportAnonymous = false;
        _sensitive = false;
        _balance = null;
        _sending = false;
      });
      if (!mounted) return;
      FocusScope.of(context).unfocus();
      widget.onPosted(CommentItem(created), parent);
      context.toast(hadSupport ? '推しコイン付きでコメントしました' : 'コメントしました');
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _sending = false);
      context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceCard,
        border: Border(top: BorderSide(color: context.hairline)),
      ),
      padding: EdgeInsets.fromLTRB(10, 8, 10, 8 + (bottom > 0 ? bottom : MediaQuery.paddingOf(context).bottom)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        if (widget.replyTo != null || _sticker != null || _hasSupport)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Wrap(spacing: 6, runSpacing: 6, children: [
              if (widget.replyTo != null)
                InputChip(
                  avatar: const Icon(Icons.reply_rounded, size: 16),
                  label: Text('${widget.replyTo!.userName}さんへ返信'),
                  onDeleted: widget.onCancelReply,
                ),
              if (_sticker != null)
                InputChip(
                  avatar: AppImage(_sticker!['imageUrl']?.toString(), width: 20, height: 20, fit: BoxFit.contain),
                  label: const Text('スタンプ'),
                  onDeleted: () => setState(() => _sticker = null),
                ),
              if (_hasSupport)
                InputChip(
                  avatar: const Icon(Icons.monetization_on_rounded, size: 16, color: Ds.gold),
                  label: Text('推し ${_supportPt}pt（${[if (_supportPremium > 0) 'プレミアム$_supportPremium枚', if (_supportFree > 0) 'フリー$_supportFree枚'].join('・')}）'),
                  onDeleted: () => setState(() {
                    _supportFree = 0;
                    _supportPremium = 0;
                  }),
                ),
            ]),
          ),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          IconButton(tooltip: 'スタンプ', onPressed: _pickSticker, icon: const Icon(Icons.emoji_emotions_outlined)),
          IconButton(
            tooltip: '隠し付き',
            onPressed: () => setState(() => _sensitive = !_sensitive),
            icon: Icon(_sensitive ? Icons.visibility_off_rounded : Icons.visibility_outlined, color: _sensitive ? context.cs.primary : null),
          ),
          if (widget.replyTo == null)
            IconButton(
              tooltip: '推しコインを添える',
              onPressed: _pickSupport,
              icon: Icon(Icons.monetization_on_outlined, color: _hasSupport ? Ds.gold : null),
            ),
          Expanded(
            child: TextField(
              controller: _text,
              focusNode: widget.focusNode,
              minLines: 1,
              maxLines: 5,
              maxLength: 1000,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                counterText: '',
                hintText: _sensitive ? '隠し付きで送ります' : (widget.replyTo != null ? '返信を書く' : '${widget.ownerName}さんにコメント'),
                filled: true,
                fillColor: context.skeleton,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                border: OutlineInputBorder(borderRadius: Ds.br(20), borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(width: 4),
          AnimatedScale(
            scale: _canSend ? 1 : 0.85,
            duration: Ds.fast,
            child: IconButton.filled(
              onPressed: _canSend ? _send : null,
              icon: _sending
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.arrow_upward_rounded),
            ),
          ),
        ]),
      ]),
    );
  }
}

class SupportPick {
  const SupportPick(this.free, this.premium, this.anonymous);

  final int free;
  final int premium;
  final bool anonymous;
}

/// 推しコインの内訳を選ぶ（Web の work-comment-support-panel。購入への導線は置かない）
class SupportPicker extends StatefulWidget {
  const SupportPicker({required this.balance, required this.free, required this.premium, required this.anonymous});

  final CoinSummary balance;
  final int free;
  final int premium;
  final bool anonymous;

  @override
  State<SupportPicker> createState() => SupportPickerState();
}

class SupportPickerState extends State<SupportPicker> {
  static const _freeSteps = [10, 30, 50, 100];
  static const _premiumSteps = [1, 3, 5, 10];

  /// これ以上の pt を送るときは確認する（桁の間違いを防ぐ）
  static const _confirmPt = 1000;

  late int _free = widget.free;
  late int _premium = widget.premium;
  late bool _anonymous = widget.anonymous;

  int get _pt => _free + _premium * 10;

  Widget _row(String label, int balance, int value, List<int> steps, ValueChanged<int> onChanged) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
        const SizedBox(width: Ds.s6),
        Text('手持ち $balance枚', style: TextStyle(color: context.muted, fontSize: 12)),
        const Spacer(),
        Text('$value枚', style: const TextStyle(fontWeight: FontWeight.w800)),
        if (value > 0) TextButton(onPressed: () => onChanged(0), child: const Text('クリア')),
      ]),
      const SizedBox(height: Ds.s4),
      Wrap(spacing: Ds.s6, children: [
        for (final n in steps)
          AppChip('+$n', onTap: value + n <= balance ? () => onChanged(value + n) : null),
      ]),
    ]);
  }

  Future<void> _done() async {
    if (_pt >= _confirmPt && !await showConfirmSheet(context, title: '${_pt}pt 送りますか？', message: 'プレミアム$_premium枚・フリー$_free枚を使います')) return;
    if (mounted) Navigator.pop(context, SupportPick(_free, _premium, _anonymous));
  }

  @override
  Widget build(BuildContext context) {
    final b = widget.balance;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s16),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('推しコインを添える', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: Ds.s12),
          _row('フリー', b.free, _free, _freeSteps, (v) => setState(() => _free = v)),
          const SizedBox(height: Ds.s12),
          _row('プレミアム（×10pt）', b.premium, _premium, _premiumSteps, (v) => setState(() => _premium = v)),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: const Text('匿名で推す', style: TextStyle(fontSize: 14)),
            value: _anonymous,
            onChanged: (v) => setState(() => _anonymous = v),
          ),
          const SizedBox(height: Ds.s4),
          PrimaryButton(label: _pt > 0 ? '合計 ${_pt}pt を添える' : '添えない', onPressed: _done),
        ]),
      ),
    );
  }
}

/// スタンプを選ぶ（最近使ったものとマイスタンプ）
class _StickerPicker extends StatefulWidget {
  const _StickerPicker();

  @override
  State<_StickerPicker> createState() => _StickerPickerState();
}

class _StickerPickerState extends State<_StickerPicker> {
  static const _orders = ['DATE_USED', 'DATE_CREATED'];

  int _tab = 0;
  final _items = <int, List<Map<String, dynamic>>>{};
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final tab = _tab;
    setState(() => _error = null);
    try {
      final data = await Api.query(r'''
query AppViewerStickers($offset: Int!, $limit: Int!, $orderBy: StickerOrderBy) {
  viewer { id userStickers(offset: $offset, limit: $limit, orderBy: $orderBy) { id title imageUrl usedAt } }
}''', variables: {'offset': 0, 'limit': 120, 'orderBy': _orders[tab]});
      final list = data.obj('viewer')?.list('userStickers') ?? <Map<String, dynamic>>[];
      if (mounted) {
        setState(() => _items[tab] = tab == 0 ? list.where((s) => s.integer('usedAt') > 0).toList() : list);
      }
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items[_tab];
    return SizedBox(
      height: 400,
      child: Column(children: [
        Row(children: [
          Expanded(
            child: PillTabs(
              labels: const ['最近の使用', 'マイスタンプ'],
              index: _tab,
              onChanged: (i) {
                setState(() => _tab = i);
                if (_items[i] == null) _load();
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.push('/stickers');
            },
            child: const Text('広場'),
          ),
        ]),
        Expanded(
          child: _error != null
              ? StateView.error(_error!, onRetry: _load)
              : items == null
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : items.isEmpty
                      ? StateView(
                          icon: Icons.emoji_emotions_outlined,
                          title: _tab == 0 ? '最近使ったスタンプはありません' : 'スタンプがありません',
                          message: 'スタンプ広場で気に入ったスタンプを追加すると、ここから使えます。',
                          compact: true,
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 84, mainAxisSpacing: 8, crossAxisSpacing: 8),
                          itemCount: items.length,
                          itemBuilder: (context, i) => Pressable(
                            onTap: () => Navigator.pop(context, items[i]),
                            child: Container(
                              decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
                              padding: const EdgeInsets.all(6),
                              child: AppImage(items[i]['imageUrl']?.toString(), fit: BoxFit.contain),
                            ),
                          ),
                        ),
        ),
      ]),
    );
  }
}
