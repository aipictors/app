import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/work/moderation.dart';
import 'package:flutter/material.dart';

const commentFields = '''
  id
  text
  createdAt
  likesCount
  isLiked
  isDeleted
  isMuted
  sticker { id imageUrl }
  support { freeCoinAmount premiumCoinAmount totalPt }
  user { id name login iconUrl }
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
  });

  final CommentItem comment;
  final String? viewerId;
  final ValueChanged<CommentItem>? onReply;
  final VoidCallback? onDeleted;
  final bool isReply;

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  CommentItem get c => widget.comment;

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
              GestureDetector(
                onTap: c.userId.isEmpty ? null : () => Nav.user(context, c.userId),
                child: Avatar(c.iconUrl, size: widget.isReply ? 28 : 36),
              ),
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
                      const SizedBox(width: 6),
                      Text(relativeTime(c.createdAt), style: TextStyle(color: context.muted, fontSize: 11)),
                    ]),
                    if (support) ...[
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(gradient: Ds.goldGradient, borderRadius: Ds.br(10)),
                        child: Text('${c.supportCoins}コインで推し（${c.supportPt}pt）',
                            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
                      ),
                    ],
                    if (c.text.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      SelectableText(c.text, style: const TextStyle(height: 1.45, fontSize: 14)),
                    ],
                    if (c.stickerUrl != null) ...[
                      const SizedBox(height: 6),
                      AppImage(c.stickerUrl, width: 96, height: 96, fit: BoxFit.contain, radius: 8),
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
              if (!widget.isReply && widget.onReply != null)
                _MiniAction(icon: Icons.reply_rounded, label: '返信', onTap: () => widget.onReply!(c)),
              _MiniAction(icon: Icons.more_horiz_rounded, label: '', onTap: _menu),
            ]),
          ),
          for (final r in c.replies)
            CommentTile(
              key: ValueKey(r.id),
              comment: r,
              viewerId: widget.viewerId,
              isReply: true,
              onDeleted: () => setState(() => c.replies.remove(r)),
            ),
        ],
      ),
    );
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
  int _supportCoins = 0;
  CoinSummary? _balance;

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
    final b = _balance!;
    final v = await showModalBottomSheet<int>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text('推しコインを添える', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text('手持ち：フリー${b.free}枚・プレミアム${b.premium}枚', style: TextStyle(color: context.muted, fontSize: 13)),
            const SizedBox(height: 12),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final n in const [0, 5, 10, 30, 50, 100])
                ChoiceChip(
                  label: Text(n == 0 ? 'なし' : '$n枚'),
                  selected: _supportCoins == n,
                  onSelected: n <= b.total ? (_) => Navigator.pop(context, n) : null,
                ),
            ]),
          ]),
        ),
      ),
    );
    if (v != null) setState(() => _supportCoins = v);
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
            if (_sticker != null) 'stickerId': _sticker!['id'],
          },
        });
        created = data.obj('createResponseComment') ?? {};
      } else {
        final breakdown = _supportCoins > 0 && _balance != null ? SupportBreakdown.of(_supportCoins, _balance!) : null;
        final data = await Api.mutate('''
mutation AppComment(\$input: CreateWorkCommentInput!) { createWorkComment(input: \$input) { $commentFields } }''', variables: {
          'input': {
            'workId': widget.workId,
            'text': _text.text.trim(),
            if (_sticker != null) 'stickerId': _sticker!['id'],
            if (breakdown != null) ...{
              'supportFreeCoinAmount': breakdown.free,
              'supportPremiumCoinAmount': breakdown.premium,
              'supportIsAnonymous': false,
            },
          },
        });
        created = data.obj('createWorkComment') ?? {};
      }
      Ds.success();
      _text.clear();
      final hadSupport = _supportCoins > 0;
      setState(() {
        _sticker = null;
        _supportCoins = 0;
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
        if (widget.replyTo != null || _sticker != null || _supportCoins > 0)
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
              if (_supportCoins > 0)
                InputChip(
                  avatar: const Icon(Icons.monetization_on_rounded, size: 16, color: Ds.gold),
                  label: Text('推し $_supportCoins枚'),
                  onDeleted: () => setState(() => _supportCoins = 0),
                ),
            ]),
          ),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          IconButton(tooltip: 'スタンプ', onPressed: _pickSticker, icon: const Icon(Icons.emoji_emotions_outlined)),
          if (widget.replyTo == null)
            IconButton(
              tooltip: '推しコインを添える',
              onPressed: _pickSupport,
              icon: Icon(Icons.monetization_on_outlined, color: _supportCoins > 0 ? Ds.gold : null),
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
                hintText: widget.replyTo != null ? '返信を書く' : '${widget.ownerName}さんにコメント',
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

class _StickerPicker extends StatefulWidget {
  const _StickerPicker();

  @override
  State<_StickerPicker> createState() => _StickerPickerState();
}

class _StickerPickerState extends State<_StickerPicker> {
  List<Map<String, dynamic>>? _items;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(r'''
query AppViewerStickers($offset: Int!, $limit: Int!, $orderBy: StickerOrderBy) {
  viewer { id userStickers(offset: $offset, limit: $limit, orderBy: $orderBy) { id title imageUrl } }
}''', variables: {'offset': 0, 'limit': 120, 'orderBy': 'DATE_USED'});
      if (mounted) setState(() => _items = data.obj('viewer')?.list('userStickers') ?? []);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: _error != null
          ? StateView.error(_error!, onRetry: _load)
          : _items == null
              ? const Center(child: CircularProgressIndicator.adaptive())
              : _items!.isEmpty
                  ? const StateView(
                      icon: Icons.emoji_emotions_outlined,
                      title: 'スタンプがありません',
                      message: 'スタンプ広場で気に入ったスタンプを追加すると、ここから使えます。',
                      compact: true,
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 84, mainAxisSpacing: 8, crossAxisSpacing: 8),
                      itemCount: _items!.length,
                      itemBuilder: (context, i) => Pressable(
                        onTap: () => Navigator.pop(context, _items![i]),
                        child: Container(
                          decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
                          padding: const EdgeInsets.all(6),
                          child: AppImage(_items![i]['imageUrl']?.toString(), fit: BoxFit.contain),
                        ),
                      ),
                    ),
    );
  }
}
