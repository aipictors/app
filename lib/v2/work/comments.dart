import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/core/support_tier.dart';
import 'package:aipictors/v2/stickers/sticker_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/official_badge.dart';
import 'package:aipictors/v2/widgets/support_tier.dart';
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

  String get userName => user?.str('name', tr('退会したユーザー', 'Deleted user')) ?? tr('退会したユーザー', 'Deleted user');

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
              title: Text(tr('コメントを削除', 'Delete comment'), style: TextStyle(color: context.cs.error)),
              onTap: () => Navigator.pop(context, 'delete'),
            )
          else ...[
            ListTile(leading: const Icon(Icons.flag_outlined), title: Text(tr('コメントを通報', 'Report comment')), onTap: () => Navigator.pop(context, 'report')),
            if (c.userId.isNotEmpty) ...[
              ListTile(leading: const Icon(Icons.volume_off_outlined), title: Text(tr('${c.userName}さんをミュート', 'Mute ${c.userName}')), onTap: () => Navigator.pop(context, 'mute')),
              ListTile(leading: const Icon(Icons.block_rounded), title: Text(tr('${c.userName}さんをブロック', 'Block ${c.userName}')), onTap: () => Navigator.pop(context, 'block')),
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
          if (mounted) context.toast(tr('削除しました', 'Deleted'));
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
    final tier = support ? SupportTier.of(c.supportPt) : null;
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
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: tier != null ? tier.color.withValues(alpha: context.isDark ? 0.18 : 0.1) : context.skeleton.withValues(alpha: context.isDark ? 0.8 : 0.7),
                    border: tier != null ? Border.all(color: tier.color.withValues(alpha: 0.55)) : null,
                    borderRadius: const BorderRadius.only(topRight: Ds.r16, bottomLeft: Ds.r16, bottomRight: Ds.r16, topLeft: Radius.circular(4)),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    // 推し付きは段階の色の帯（コイン数を大きく）でスーパーチャットのように目立たせる
                    if (tier != null) SupportBand(free: c.supportFree, premium: c.supportPremium, pt: c.supportPt),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 9, 12, 10),
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
                      Text(tr('${widget.replyToUserName} さんのコメントへの返信', 'Reply to ${widget.replyToUserName}'), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 11)),
                    ],
                    if (c.isSensitive && !_revealed) ...[
                      const SizedBox(height: 6),
                      Text(widget.isReply ? tr('隠し付き（もしくはセンシティブ）な返信です', 'This reply is hidden (or sensitive)') : tr('隠し付き（もしくはセンシティブ）なコメントです', 'This comment is hidden (or sensitive)'), style: TextStyle(color: context.muted, fontSize: 13)),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 32), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () => setState(() => _revealed = true),
                        child: Text(tr('表示する', 'Show')),
                      ),
                    ] else ...[
                      if (c.text.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        // 英語表示では日本語のコメントをその場で英語に（訳せなければ元のまま）
                        AutoTranslatedText(c.text, builder: (context, text) => SelectableText(text, style: const TextStyle(height: 1.45, fontSize: 14))),
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
                      Text(tr('作者より：${c.thankYouMessage}', 'From the creator: ${c.thankYouMessage}'), style: TextStyle(color: context.muted, fontSize: 12)),
                    ],
                      ]),
                    ),
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
                label: c.likesCount > 0 ? '${c.likesCount}' : tr('いいね', 'Like'),
                onTap: _like,
              ),
              if (widget.onReply != null)
                _MiniAction(icon: Icons.reply_rounded, label: tr('返信', 'Reply'), onTap: () => widget.onReply!(c)),
              if (c.isWorkOwnerLiked)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(tr('作者がいいね', 'Liked by creator'), style: TextStyle(fontSize: 11, color: Ds.pink.withValues(alpha: 0.9), fontWeight: FontWeight.w700)),
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
  String? rating,
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
        rating: rating,
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
    this.rating,
    this.onChanged,
  });

  final String workId;
  final String ownerId;
  final String ownerName;
  final String? viewerId;
  final String? rating;
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
  final _composerKey = GlobalKey<CommentComposerState>();

  @override
  void initState() {
    super.initState();
    _controller.loadMore();
    if (widget.viewerId != null) PinnedStickers.ensureLoaded();
    // 開発用: /tmp/aipictors-debug の 2 行目が sheet:pins なら、デフォルトのスタンプを固定したことにして上の列を出す（表示の確認用。保存はしない）
    if (DebugBoot.screenTab == 'sheet:pins') {
      PinnedStickers.ensureLoaded().then((_) => Api.query(r'query AppDebugDefaultStickers { viewer { id defaultStickers { id title imageUrl } } }')).then((data) {
        PinnedStickers.items.value = data.obj('viewer')?.list('defaultStickers');
      });
    }
    // 開発用: /tmp/aipictors-debug の 2 行目が sheet:scroll:<px> なら一覧をその位置まで送る（表示の確認用）
    final debugTab = DebugBoot.screenTab;
    if (debugTab != null && debugTab.startsWith('sheet:scroll:')) {
      Future.delayed(const Duration(seconds: 5), () {
        final px = double.tryParse(debugTab.substring(13)) ?? 600;
        if (mounted && widget.scrollController.hasClients) widget.scrollController.jumpTo(px);
      });
    }
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
            Text(tr('コメント', 'Comments'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
            const Spacer(),
            IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close_rounded)),
          ]),
        ),
        Divider(height: 1, color: context.hairline),
        // 固定したスタンプ（押すとそのスタンプですぐコメントする。入力中の文字があれば一緒に送る）
        if (widget.viewerId != null) _PinnedStickerBar(onTap: (sticker) => _composerKey.currentState?.sendSticker(sticker)),
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
                return StateView(
                  icon: Icons.chat_bubble_outline_rounded,
                  title: tr('まだコメントがありません', 'No comments yet'),
                  message: tr('最初のコメントで作者さんを応援しよう', 'Cheer the creator with the first comment'),
                );
              }
              // コメント欄の上の「応援の帯」（読み込んだコメントだけで決める。段階の時間だけ出す）
              final pinned = pickPinnedSupports<CommentItem>(
                c.items.where((x) => !x.isSensitive).toList(),
                createdAt: (x) => x.createdAt,
                totalPt: (x) => x.supportPt,
                nowSeconds: DateTime.now().millisecondsSinceEpoch ~/ 1000,
              );
              final offset = pinned.isEmpty ? 0 : 1;
              return ListView.builder(
                controller: widget.scrollController,
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 24),
                itemCount: c.items.length + 1 + offset,
                itemBuilder: (context, index) {
                  if (offset == 1 && index == 0) return _PinnedSupports(items: pinned);
                  final i = index - offset;
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
          key: _composerKey,
          workId: widget.workId,
          ownerId: widget.ownerId,
          ownerName: widget.ownerName,
          rating: widget.rating,
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
    this.rating,
  });

  final String workId;
  final String ownerId;
  final String ownerName;

  /// 作品の年齢区分。全年齢（G / R15）のときだけ推しの欄に報酬の一言を出す
  final String? rating;
  final FocusNode? focusNode;
  final CommentItem? replyTo;
  final VoidCallback? onCancelReply;
  final void Function(CommentItem comment, CommentItem? parent) onPosted;

  @override
  State<CommentComposer> createState() => CommentComposerState();
}

class CommentComposerState extends State<CommentComposer> {
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
    // 開発用: /tmp/aipictors-debug の 2 行目が sheet:support なら推しの欄を開く（表示の確認用。送信はしない）
    // 開発用: sheet:sticker ならスタンプ選びを開く（表示の確認用）
    if (DebugBoot.screenTab == 'sheet:sticker') {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) _pickSticker();
      });
    }
    if (DebugBoot.screenTab == 'sheet:support') {
      Future.delayed(const Duration(seconds: 3), () {
        if (!mounted) return;
        _text.text = tr('いつも素敵な作品をありがとうございます！', 'Thank you for your wonderful work!');
        _supportFree = 30;
        _pickSupport();
      });
    }
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  bool get _canSend => !_sending && (_text.text.trim().isNotEmpty || _sticker != null);

  /// スタンプを選ぶ下のシートをすぐ出す。シートの入力欄は下の入力欄と同じ文字で、スタンプを押すと一緒にすぐ送る
  Future<void> _pickSticker() async {
    if (!Nav.requireLogin(context)) return;
    FocusScope.of(context).unfocus();
    final picked = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (_) => _StickerPicker(text: _text),
    );
    if (picked != null && mounted) await sendSticker(picked);
  }

  /// このスタンプですぐコメントする（入力中の文字・推しコインがあれば一緒に送る）
  Future<void> sendSticker(Map<String, dynamic> sticker) async {
    if (!Nav.requireLogin(context) || _sending) return;
    setState(() => _sticker = sticker);
    await _send();
  }

  /// 推しコインの量を選ぶ下のシートをすぐ出す（手持ちのコインはシートの中で読む）
  Future<void> _pickSupport() async {
    if (!Nav.requireLogin(context)) return;
    FocusScope.of(context).unfocus();
    final balance = _balance != null ? Future.value(_balance!) : Coins.summary(supportTo: widget.ownerId);
    final picked = await showModalBottomSheet<SupportPick>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (_) => FutureBuilder<CoinSummary>(
        future: balance,
        builder: (context, snap) {
          if (snap.hasError) {
            final error = snap.error;
            return SizedBox(
              height: 240,
              child: StateView.error(error is ApiException ? error.message : tr('読み込みに失敗しました', 'Failed to load'), onRetry: () => Navigator.pop(context)),
            );
          }
          final b = snap.data;
          if (b == null) return const SizedBox(height: 320, child: Center(child: CircularProgressIndicator.adaptive()));
          _balance = b;
          return SupportPicker(
            balance: b,
            free: _supportFree,
            premium: _supportPremium,
            anonymous: _supportAnonymous,
            previewText: _text.text.trim(),
            // 報酬の一言は、全年齢の作品で、作者が報酬に参加していてプレミアムコインを受け取るときだけ
            showRewardNote: isCreatorRewardRating(widget.rating) && b.rewardJoined && b.premiumAccepted,
          );
        },
      ),
    );
    if (picked == null || !mounted) return;
    setState(() {
      _supportFree = picked.free;
      _supportPremium = picked.premium;
      _supportAnonymous = picked.anonymous;
    });
  }

  String get _hintText => _sensitive ? tr('隠し付きで送ります', 'Sending as hidden') : (widget.replyTo != null ? tr('返信を書く', 'Write a reply') : tr('${widget.ownerName}さんにコメント', 'Comment to ${widget.ownerName}'));

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
      final sent = (free: _supportFree, premium: _supportPremium, pt: _supportPt);
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
      if (hadSupport) {
        showSupportSent(context, free: sent.free, premium: sent.premium, pt: sent.pt);
      } else {
        context.toast(tr('コメントしました', 'Comment posted'));
      }
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
                  label: Text(tr('${widget.replyTo!.userName}さんへ返信', 'Reply to ${widget.replyTo!.userName}')),
                  onDeleted: widget.onCancelReply,
                ),
              if (_sticker != null)
                InputChip(
                  avatar: AppImage(_sticker!['imageUrl']?.toString(), width: 20, height: 20, fit: BoxFit.contain),
                  label: Text(tr('スタンプ', 'Stickers')),
                  onDeleted: () => setState(() => _sticker = null),
                ),
              if (_hasSupport)
                InputChip(
                  label: SupportTierChip(free: _supportFree, premium: _supportPremium, pt: _supportPt),
                  tooltip: tr('推しコイン（${supportAmountLabel(_supportFree, _supportPremium, _supportPt)}）', 'Support coins (${supportAmountLabel(_supportFree, _supportPremium, _supportPt)})'),
                  onPressed: _pickSupport,
                  onDeleted: () => setState(() {
                    _supportFree = 0;
                    _supportPremium = 0;
                  }),
                ),
            ]),
          ),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          IconButton(tooltip: tr('スタンプ', 'Stickers'), onPressed: _pickSticker, icon: const Icon(Icons.emoji_emotions_outlined)),
          IconButton(
            tooltip: tr('隠し付き', 'Hidden'),
            onPressed: () => setState(() => _sensitive = !_sensitive),
            icon: Icon(_sensitive ? Icons.visibility_off_rounded : Icons.visibility_outlined, color: _sensitive ? context.cs.primary : null),
          ),
          if (widget.replyTo == null)
            IconButton(
              tooltip: tr('推しコインを添える', 'Add support coins'),
              onPressed: _pickSupport,
              icon: Icon(Icons.monetization_on_outlined, color: _hasSupport ? (SupportTier.of(_supportPt)?.color ?? Ds.gold) : null),
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
                hintText: _hintText,
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
  const SupportPicker({required this.balance, required this.free, required this.premium, required this.anonymous, this.previewText = '', this.showRewardNote = false});

  final CoinSummary balance;
  final int free;
  final int premium;
  final bool anonymous;

  /// 入力中のコメント（送るとどう目立つかの見本に出す）
  final String previewText;

  /// 全年齢の作品のとき true（報酬の一言を出す）
  final bool showRewardNote;

  @override
  State<SupportPicker> createState() => SupportPickerState();
}

class SupportPickerState extends State<SupportPicker> {
  static const _freeSteps = [10, 30, 50, 100];
  static const _premiumSteps = [1, 3, 5, 10];

  /// これ以上の pt を送るときは確認する（桁の間違いを防ぐ）
  static const _confirmPt = 1000;

  late int _free = widget.free;
  late int _premium = widget.balance.premiumAccepted ? widget.premium : 0;
  late bool _anonymous = widget.anonymous;

  int get _pt => _free + _premium * 10;

  Widget _row(String label, int balance, int value, List<int> steps, int ptPerCoin, ValueChanged<int> onChanged) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
        const SizedBox(width: Ds.s6),
        Text(tr('手持ち $balance枚', 'You have $balance'), style: TextStyle(color: context.muted, fontSize: 12)),
        const Spacer(),
        Text(tr('$value枚', '$value'), style: const TextStyle(fontWeight: FontWeight.w800)),
        if (value > 0) TextButton(onPressed: () => onChanged(0), child: Text(tr('クリア', 'Clear'))),
      ]),
      const SizedBox(height: Ds.s4),
      // 金額のボタンは段階の色（大きいほど濃い色）
      Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
        for (final n in steps)
          SupportAmountButton(label: '+$n', pt: n * ptPerCoin, selected: false, onTap: value + n <= balance ? () => onChanged(value + n) : null),
      ]),
    ]);
  }

  Future<void> _done() async {
    if (_pt >= _confirmPt && !await showConfirmSheet(context, title: tr('${_pt}pt 送りますか？', 'Send ${_pt}pt?'), message: tr('プレミアム$_premium枚・フリー$_free枚を使います', 'Uses $_premium premium and $_free free coins'))) return;
    if (mounted) Navigator.pop(context, SupportPick(_free, _premium, _anonymous));
  }

  @override
  Widget build(BuildContext context) {
    final b = widget.balance;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s16),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            Flexible(child: Text(tr('推しコインを添える', 'Add support coins'), style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800))),
            if (widget.showRewardNote) ...[const SizedBox(width: Ds.s8), const SupportRewardJoinedBadge()],
          ]),
          const SizedBox(height: Ds.s12),
          _row(tr('フリー', 'Free'), b.free, _free, _freeSteps, 1, (v) => setState(() => _free = v)),
          const SizedBox(height: Ds.s12),
          if (b.premiumAccepted)
            _row(tr('プレミアム（×10pt）', 'Premium (×10pt)'), b.premium, _premium, _premiumSteps, 10, (v) => setState(() => _premium = v))
          else
            Text(tr('この作者はプレミアムコインでの応援を受け付けていません。フリーコインで推せます', 'This creator does not accept support with premium coins. You can support with free coins.'), style: TextStyle(color: context.muted, fontSize: 12)),
          if (_pt > 0) ...[
            const SizedBox(height: Ds.s12),
            Text(tr('コメントはこう表示されます', 'Your comment will look like this'), style: TextStyle(color: context.muted, fontSize: 11)),
            const SizedBox(height: Ds.s4),
            _SupportPreview(free: _free, premium: _premium, pt: _pt, text: widget.previewText, anonymous: _anonymous),
          ],
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(tr('匿名で推す', 'Support anonymously'), style: const TextStyle(fontSize: 14)),
            value: _anonymous,
            onChanged: (v) => setState(() => _anonymous = v),
          ),
          if (widget.showRewardNote) ...[const SupportRewardNote(), const SizedBox(height: Ds.s8)],
          const SizedBox(height: Ds.s4),
          PrimaryButton(label: _pt > 0 ? tr('合計 ${_pt}pt を添える', 'Add ${_pt}pt in total') : tr('添えない', 'None'), onPressed: _done),
        ]),
      ),
    );
  }
}

/// デフォルトのスタンプを先頭に、残りから同じスタンプを除いて並べる
List<Map<String, dynamic>> withDefaultStickersFirst(List<Map<String, dynamic>> defaults, Iterable<Map<String, dynamic>> rest) {
  final ids = defaults.map((s) => s['id']).toSet();
  return [...defaults, ...rest.where((s) => !ids.contains(s['id']))];
}

/// 推しの欄の見本（送るとコメントがこの色の帯で目立つ）
class _SupportPreview extends StatelessWidget {
  const _SupportPreview({required this.free, required this.premium, required this.pt, required this.text, required this.anonymous});

  final int free;
  final int premium;
  final int pt;
  final String text;
  final bool anonymous;

  @override
  Widget build(BuildContext context) {
    final tier = SupportTier.of(pt)!;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: tier.color.withValues(alpha: context.isDark ? 0.18 : 0.1),
        border: Border.all(color: tier.color.withValues(alpha: 0.55)),
        borderRadius: Ds.br(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SupportBand(free: free, premium: premium, pt: pt, title: Text(anonymous ? tr('匿名', 'Anonymous') : tr('あなた', 'You'))),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
          child: Text(
            text.isEmpty ? tr('（コメントなしでも送れます）', '(You can send without a comment)') : text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: text.isEmpty ? context.muted : null),
          ),
        ),
      ]),
    );
  }
}

/// コメント欄の上の「応援の帯」（最近の推しを段階の時間だけ上に出す。スーパーチャットのピン留め）
class _PinnedSupports extends StatelessWidget {
  const _PinnedSupports({required this.items});

  final List<CommentItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 4),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(width: 8),
          itemBuilder: (context, i) {
            final c = items[i];
            final tier = SupportTier.of(c.supportPt);
            return Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              decoration: BoxDecoration(
                color: (tier?.color ?? Ds.gold).withValues(alpha: context.isDark ? 0.18 : 0.1),
                border: Border.all(color: (tier?.color ?? Ds.gold).withValues(alpha: 0.5)),
                borderRadius: Ds.br(20),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                UserAvatar.json(c.user, size: 28),
                const SizedBox(width: 6),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 110),
                  child: Text(c.userName, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(width: 6),
                SupportTierChip(free: c.supportFree, premium: c.supportPremium, pt: c.supportPt),
              ]),
            );
          },
        ),
      ),
    );
  }
}

/// スタンプを選ぶ（最近使ったもの・マイスタンプ・固定したもの）。押したスタンプを返す（呼び出し側がすぐ送る）
/// 上の入力欄は下のコメント欄と同じ文字（[text]）で、書いてからスタンプを押すと一緒に送れる。長押しでコメント欄に固定する
class _StickerPicker extends StatefulWidget {
  const _StickerPicker({required this.text});

  final TextEditingController text;

  @override
  State<_StickerPicker> createState() => _StickerPickerState();
}

class _StickerPickerState extends State<_StickerPicker> {
  static const _orders = ['DATE_USED', 'DATE_CREATED'];

  /// 開いてすぐ出せるよう、前に読んだ一覧を覚えておく（開くたびに裏で読み直す）
  static final _cache = <int, List<Map<String, dynamic>>>{};

  late int _tab = (PinnedStickers.items.value?.isNotEmpty ?? false) ? 2 : 0;
  final _items = <int, List<Map<String, dynamic>>>{..._cache};
  String? _error;

  @override
  void initState() {
    super.initState();
    PinnedStickers.ensureLoaded();
    _load();
  }

  Future<void> _load() async {
    final tab = _tab;
    if (tab == 2) return;
    setState(() => _error = null);
    try {
      // 「最近の使用」でも先頭にデフォルトのスタンプ（設定に従う）を出す。「マイスタンプ」はサーバーが先頭に入れて返す
      final data = await Api.query(tab == 0 ? r'''
query AppViewerRecentStickers($offset: Int!, $limit: Int!, $orderBy: StickerOrderBy) {
  viewer { id defaultStickers { id title imageUrl } userStickers(offset: $offset, limit: $limit, orderBy: $orderBy) { id title imageUrl usedAt } }
}''' : r'''
query AppViewerStickers($offset: Int!, $limit: Int!, $orderBy: StickerOrderBy) {
  viewer { id userStickers(offset: $offset, limit: $limit, orderBy: $orderBy) { id title imageUrl usedAt } }
}''', variables: {'offset': 0, 'limit': 120, 'orderBy': _orders[tab]});
      final list = data.obj('viewer')?.list('userStickers') ?? <Map<String, dynamic>>[];
      final defaults = data.obj('viewer')?.list('defaultStickers') ?? <Map<String, dynamic>>[];
      final items = tab == 0 ? withDefaultStickersFirst(defaults, list.where((s) => s.integer('usedAt') > 0)) : list;
      _cache[tab] = items;
      if (mounted) setState(() => _items[tab] = items);
    } on ApiException catch (e) {
      // 前に読んだ一覧があればそれを出したままにする
      if (mounted && _items[tab] == null) setState(() => _error = e.message);
    }
  }

  Future<void> _togglePin(Map<String, dynamic> sticker) async {
    final pinned = PinnedStickers.isPinned(sticker.str('id'));
    try {
      await PinnedStickers.toggle(sticker);
      Ds.success();
      if (mounted) context.toast(pinned ? tr('固定を外しました', 'Unpinned') : tr('コメント欄に固定しました', 'Pinned to comments'));
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  Widget _grid(List<Map<String, dynamic>> items) {
    return ValueListenableBuilder(
      valueListenable: PinnedStickers.items,
      builder: (context, _, _) => GridView.builder(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 84, mainAxisSpacing: 8, crossAxisSpacing: 8),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final sticker = items[i];
          final pinned = PinnedStickers.isPinned(sticker.str('id'));
          return Pressable(
            onTap: () => Navigator.pop(context, sticker),
            onLongPress: () => _togglePin(sticker),
            child: Stack(children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
                  padding: const EdgeInsets.all(6),
                  child: AppImage(sticker['imageUrl']?.toString(), fit: BoxFit.contain),
                ),
              ),
              if (pinned) Positioned(top: 3, right: 3, child: Icon(Icons.push_pin_rounded, size: 14, color: context.cs.primary)),
            ]),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final items = _items[_tab];
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: SizedBox(
        height: bottom > 0 ? 300 : 460,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 6),
            child: TextField(
              controller: widget.text,
              minLines: 1,
              maxLines: 3,
              maxLength: 1000,
              decoration: InputDecoration(
                counterText: '',
                hintText: tr('ひとこと（スタンプと一緒に送れます）', 'Add a message (sent with the sticker)'),
                filled: true,
                fillColor: context.skeleton,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                border: OutlineInputBorder(borderRadius: Ds.br(20), borderSide: BorderSide.none),
              ),
            ),
          ),
          Row(children: [
            Expanded(
              child: PillTabs(
                labels: [tr('最近の使用', 'Recent'), tr('マイスタンプ', 'My stickers'), tr('固定', 'Pinned')],
                index: _tab,
                onChanged: (i) {
                  setState(() => _tab = i);
                  _load();
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.push('/stickers');
              },
              child: Text(tr('広場', 'Browse')),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(tr('押すとすぐ送ります。長押しでコメント欄に固定', 'Tap to send. Long-press to pin it above comments'), style: TextStyle(color: context.muted, fontSize: 11)),
            ),
          ),
          Expanded(
            child: _tab == 2
                ? ValueListenableBuilder(
                    valueListenable: PinnedStickers.items,
                    builder: (context, pinned, _) => pinned == null
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : pinned.isEmpty
                            ? StateView(
                                icon: Icons.push_pin_outlined,
                                title: tr('固定したスタンプはありません', 'No pinned stickers'),
                                message: tr('スタンプを長押しすると、コメント欄の上に並べてすぐ送れます。', 'Long-press a sticker to pin it above comments for one-tap sending.'),
                                compact: true,
                              )
                            : _grid(pinned),
                  )
                : _error != null
                    ? StateView.error(_error!, onRetry: _load)
                    : items == null
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : items.isEmpty
                            ? StateView(
                                icon: Icons.emoji_emotions_outlined,
                                title: _tab == 0 ? tr('最近使ったスタンプはありません', 'No recent stickers') : tr('スタンプがありません', 'No stickers'),
                                message: tr('スタンプ広場で気に入ったスタンプを追加すると、ここから使えます。', 'Add stickers you like from the sticker square to use them here.'),
                                compact: true,
                              )
                            : _grid(items),
          ),
        ]),
      ),
    );
  }
}

/// コメント欄の上に並べる、固定したスタンプ。押すとそのスタンプですぐコメントする
class _PinnedStickerBar extends StatelessWidget {
  const _PinnedStickerBar({required this.onTap});

  final ValueChanged<Map<String, dynamic>> onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PinnedStickers.items,
      builder: (context, pinned, _) {
        if (pinned == null || pinned.isEmpty) return const SizedBox.shrink();
        return Container(
          height: 60,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: context.hairline))),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            itemCount: pinned.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, i) => Tooltip(
              message: tr('このスタンプでコメント', 'Comment with this sticker'),
              child: Pressable(
                onTap: () => onTap(pinned[i]),
                child: Container(
                  width: 48,
                  decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
                  padding: const EdgeInsets.all(4),
                  child: AppImage(pinned[i]['imageUrl']?.toString(), fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
