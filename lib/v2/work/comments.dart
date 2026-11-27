import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/core/reported_comments.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/official_badge.dart';
import 'package:aipictors/v2/work/moderation.dart';
import 'package:aipictors/v2/work/quick_stickers.dart';
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
  sticker { id imageUrl title isDownloaded }
  user { $userSummaryFields }
''';

class CommentItem {
  CommentItem(this.json, {List<CommentItem>? replies, this.parent}) : replies = replies ?? [];

  final Map<String, dynamic> json;
  final List<CommentItem> replies;

  /// 返信のときは親のコメント（返信への返信も Web と同じく親にぶら下げる）
  CommentItem? parent;

  /// 返信を送る先（返信に返信したときも親のコメント）
  CommentItem get thread => parent ?? this;

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

  /// ミュートしている人のコメント（Web と同じく、畳んで「表示」で開ける）
  bool get isMuted => json.boolean('isMuted');

  /// 自分のコメントの審査の結果（commentModerationSummaries。無ければ null）
  Map<String, dynamic>? moderation;

  bool get isRejected => moderation?.str('moderationStatus') == 'REJECTED';

  bool get canAppeal => moderation?.boolean('canAppeal') ?? false;

  bool get isWorkOwnerLiked => json.boolean('isWorkOwnerLiked');

  String? get stickerId => json.obj('sticker')?.strOrNull('id');

  static CommentItem fromJson(Map<String, dynamic> j) {
    final item = CommentItem(j);
    item.replies.addAll(j.list('responses').map((r) => CommentItem(r, parent: item)).toList().reversed);
    return item;
  }
}

/// 返信はこの件数まで開いて出し、残りは「返信をあと N 件見る」で開く
const _visibleReplies = 2;

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

  /// ミュートした人のコメントを開いた
  bool _showMuted = false;

  /// 自分が通報したコメントを開いた
  bool _showReported = false;

  /// 返信をすべて開いた
  bool _allReplies = false;

  @override
  void initState() {
    super.initState();
    ReportedComments.ensureLoaded();
  }

  @override
  void didUpdateWidget(covariant CommentTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 自分が返信したら、その返信が見えるように開く
    if (c.replies.length > _visibleReplies && c.replies.last.userId == widget.viewerId && widget.viewerId != null) _allReplies = true;
  }

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
          if (mine) ...[
            if (c.canAppeal)
              ListTile(leading: const Icon(Icons.feedback_outlined), title: Text(tr('異議申し立て', 'Appeal')), onTap: () => Navigator.pop(context, 'appeal')),
            ListTile(
              leading: Icon(Icons.delete_outline_rounded, color: context.cs.error),
              title: Text(tr('コメントを削除', 'Delete comment'), style: TextStyle(color: context.cs.error)),
              onTap: () => Navigator.pop(context, 'delete'),
            ),
          ] else ...[
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
      case 'appeal':
        if (await showCommentAppealSheet(context, c.id) && mounted) {
          setState(() => c.moderation = {...?c.moderation, 'canAppeal': false, 'appealedAt': DateTime.now().millisecondsSinceEpoch ~/ 1000});
        }
      case 'report':
        if (await showReportSheet(context, target: ReportTarget.comment, id: c.id)) {
          await ReportedComments.add(c.id);
        }
      case 'mute':
        if (await muteUser(context, c.userId, c.userName)) widget.onDeleted?.call();
      case 'block':
        if (await blockUser(context, c.userId, c.userName)) widget.onDeleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: ReportedComments.ids,
      builder: (context, reported, _) {
        if (reported.contains(c.id) && !_showReported) {
          return Padding(
            padding: EdgeInsets.only(left: widget.isReply ? 44 : 0, top: 10, bottom: 4),
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
              decoration: BoxDecoration(borderRadius: Ds.br(12), border: Border.all(color: context.hairline)),
              child: Row(children: [
                Icon(Icons.visibility_off_outlined, size: 18, color: context.muted),
                const SizedBox(width: 8),
                Expanded(child: Text(tr('報告したコメントです', 'You reported this comment'), style: TextStyle(color: context.muted, fontSize: 13))),
                TextButton(onPressed: () => setState(() => _showReported = true), child: Text(tr('表示', 'Show'))),
              ]),
            ),
          );
        }
        return _buildComment(context);
      },
    );
  }

  Widget _buildComment(BuildContext context) {
    if (c.isMuted && !_showMuted) {
      return Padding(
        padding: EdgeInsets.only(left: widget.isReply ? 44 : 0, top: 10, bottom: 4),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
          decoration: BoxDecoration(borderRadius: Ds.br(12), border: Border.all(color: context.hairline)),
          child: Row(children: [
            Icon(Icons.visibility_off_outlined, size: 18, color: context.muted),
            const SizedBox(width: 8),
            Expanded(child: Text(tr('ミュートしているユーザのコメントです', 'This is a comment from a muted user'), style: TextStyle(color: context.muted, fontSize: 13))),
            TextButton(onPressed: () => context.push('/config/muted_users'), child: Text(tr('設定', 'Settings'))),
            TextButton(onPressed: () => setState(() => _showMuted = true), child: Text(tr('表示', 'Show'))),
          ]),
        ),
      );
    }
    // 作品への推しは終了したので、過去の推し付きコメントも帯や金額を付けず本文だけのコメントとして出す
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
                    color: context.skeleton.withValues(alpha: context.isDark ? 0.8 : 0.7),
                    borderRadius: const BorderRadius.only(topRight: Ds.r16, bottomLeft: Ds.r16, bottomRight: Ds.r16, topLeft: Radius.circular(4)),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                    // 審査で他の人に見えなくなった自分のコメント（Web と同じ文言）
                    if (c.isRejected) ...[
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Ds.gold.withValues(alpha: 0.12), borderRadius: Ds.br(8)),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            c.moderation?.strOrNull('userNotice') ?? tr('このコメントは審査により他のユーザーには表示されていません。', 'This comment is hidden from other users after moderation.'),
                            style: const TextStyle(fontSize: 12),
                          ),
                          if (c.moderation?['appealedAt'] != null)
                            Text(tr('異議申し立てを受け付けています。確認をお待ちください。', 'Your appeal has been received.'), style: TextStyle(fontSize: 12, color: context.muted)),
                        ]),
                      ),
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
          for (final r in _allReplies ? c.replies : c.replies.take(_visibleReplies))
            CommentTile(
              key: ValueKey(r.id),
              comment: r,
              viewerId: widget.viewerId,
              isReply: true,
              replyToUserName: c.userName,
              // 返信への返信も、Web と同じく親のコメントにぶら下げる（送る先は CommentItem.thread）
              onReply: widget.onReply,
              onDeleted: () => setState(() => c.replies.remove(r)),
            ),
          if (!_allReplies && c.replies.length > _visibleReplies)
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 2),
              child: TextButton.icon(
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact, foregroundColor: context.muted),
                onPressed: () => setState(() => _allReplies = true),
                icon: const Icon(Icons.subdirectory_arrow_right_rounded, size: 16),
                label: Text(
                  tr('返信をあと ${c.replies.length - _visibleReplies} 件見る', 'Show ${c.replies.length - _visibleReplies} more replies'),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
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
  CommentItem? replyTo,
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
        openComposer: openComposer || replyTo != null,
        replyTo: replyTo,
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
    this.replyTo,
    this.onChanged,
  });

  final String workId;
  final String ownerId;
  final String ownerName;
  final String? viewerId;
  final ScrollController scrollController;
  final bool openComposer;

  /// 作品の画面で「返信」を押して開いたときの返信先
  final CommentItem? replyTo;
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
      final items = list.where((c) => !c.boolean('isDeleted')).map(CommentItem.fromJson).toList();
      await _attachModeration(items);
      return items;
    },
  );

  late CommentItem? _replyTo = widget.replyTo;
  final _focus = FocusNode();

  /// 自分のコメントの審査の結果を付ける（Web の commentModerationSummaries）。取れなくても一覧は出す
  Future<void> _attachModeration(List<CommentItem> items) async {
    final viewerId = widget.viewerId;
    if (viewerId == null) return;
    final mine = [for (final c in items) ...[c, ...c.replies]].where((c) => c.userId == viewerId).toList();
    if (mine.isEmpty) return;
    try {
      final data = await Api.query(
        r'query AppCommentModerationSummaries($commentIds: [ID!]!) { commentModerationSummaries(commentIds: $commentIds) { commentId moderationStatus userNotice canAppeal appealedAt } }',
        variables: {'commentIds': mine.map((c) => c.id).toList()},
      );
      final byId = {for (final s in data.list('commentModerationSummaries')) s.str('commentId'): s};
      for (final c in mine) {
        c.moderation = byId[c.id];
      }
    } on ApiException catch (_) {}
  }

  @override
  void initState() {
    super.initState();
    _controller.loadMore();
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
              // 推した人の一覧（応援の帯）は出さない（オーナー依頼）
              return ListView.builder(
                controller: widget.scrollController,
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 24),
                itemCount: c.items.length + 1,
                itemBuilder: (context, index) {
                  final i = index;
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
              // 作品の画面から持ってきた返信先は、この一覧の同じコメントに足す
              final target = _controller.items.where((x) => x.id == parent.id).firstOrNull ?? parent;
              comment.parent = target;
              target.replies.add(comment);
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

/// コメント入力欄（スタンプを添えられる。作品への推しは終了したので推しコインは添えない）
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
  late final FocusNode _focus = widget.focusNode ?? FocusNode();
  bool _sending = false;
  Map<String, dynamic>? _sticker;

  /// 入力欄の上の「すぐ送れるスタンプ」。キーボードを出している間はしまい、スタンプのボタンで切り替える（LINE のように）
  bool _trayOpen = true;
  bool _sensitive = false;

  void _onFocus() {
    if (_focus.hasFocus && _trayOpen) setState(() => _trayOpen = false);
  }

  @override
  void initState() {
    super.initState();
    _text.addListener(() => setState(() {}));
    _focus.addListener(_onFocus);
    if (_focus.hasFocus) _trayOpen = false;
    // 開発用: sheet:sticker ならスタンプ選びを開く（表示の確認用）
    if (DebugBoot.screenTab == 'sheet:sticker') {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) _pickSticker();
      });
    }
  }

  @override
  void didUpdateWidget(covariant CommentComposer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 返信先を選んだらキーボードを出す（スタンプで返したいときはスタンプのボタンで戻せる）
    if (widget.replyTo != null && widget.replyTo != oldWidget.replyTo) _trayOpen = false;
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocus);
    if (widget.focusNode == null) _focus.dispose();
    _text.dispose();
    super.dispose();
  }

  bool get _canSend => !_sending && (_text.text.trim().isNotEmpty || _sticker != null);

  /// すべてのスタンプから選ぶ。選んだらそのまま送る（Web のスタンプの一覧と同じ）
  Future<void> _pickSticker() async {
    if (!Nav.requireLogin(context)) return;
    final picked = await showStickerPicker(context);
    if (picked != null) await _sendSticker(picked);
  }

  /// スタンプのボタン: キーボードとスタンプの枠を切り替える
  void _toggleTray() {
    if (!Nav.requireLogin(context)) return;
    if (_trayOpen) {
      setState(() => _trayOpen = false);
      _focus.requestFocus();
    } else {
      _focus.unfocus();
      setState(() => _trayOpen = true);
    }
  }

  /// 枠から押したスタンプはそのまま送る（書いている文章があれば一緒に）
  Future<void> _sendSticker(Map<String, dynamic> sticker) async {
    if (_sending) return;
    setState(() => _sticker = sticker);
    final ok = await _send();
    if (ok) StickerShelf.instance.markUsed(sticker);
    if (!ok && mounted) setState(() => _sticker = null);
  }
  /// 送れたら true
  Future<bool> _send() async {
    if (!Nav.requireLogin(context) || !_canSend) return false;
    setState(() => _sending = true);
    final parent = widget.replyTo?.thread;
    final stickerOnly = _sticker != null && _text.text.trim().isEmpty;
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
          },
        });
        created = data.obj('createWorkComment') ?? {};
      }
      Ds.success();
      _text.clear();
      setState(() {
        _sticker = null;
        _sensitive = false;
        _sending = false;
      });
      if (!mounted) return true;
      FocusScope.of(context).unfocus();
      widget.onPosted(CommentItem(created, parent: parent), parent);
      if (parent != null) {
        context.toast(stickerOnly ? tr('スタンプで返信しました', 'Replied with a sticker') : tr('返信しました', 'Reply posted'));
      } else {
        context.toast(stickerOnly ? tr('スタンプを送りました', 'Sticker sent') : tr('コメントしました', 'Comment posted'));
      }
      return true;
    } on ApiException catch (e) {
      if (!mounted) return false;
      setState(() => _sending = false);
      context.toast(e.message, error: true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final replyTo = widget.replyTo;
    final showTray = _trayOpen && Nav.isLoggedIn;
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceCard,
        border: Border(top: BorderSide(color: context.hairline)),
      ),
      padding: EdgeInsets.fromLTRB(10, 8, 10, 8 + (bottom > 0 ? bottom : MediaQuery.paddingOf(context).bottom)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        if (replyTo != null) _ReplyBanner(target: replyTo, onCancel: widget.onCancelReply),
        AnimatedSize(
          duration: Ds.fast,
          curve: Curves.easeOutCubic,
          alignment: Alignment.bottomCenter,
          child: showTray
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: QuickStickerTray(
                    onSend: _sendSticker,
                    onOpenAll: _pickSticker,
                    sendingId: _sending ? _sticker?.strOrNull('id') : null,
                    replyToName: replyTo?.userName,
                  ),
                )
              : const SizedBox(width: double.infinity),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          IconButton(
            tooltip: showTray ? tr('キーボード', 'Keyboard') : tr('スタンプ', 'Stickers'),
            onPressed: _toggleTray,
            icon: Icon(showTray ? Icons.keyboard_alt_outlined : Icons.emoji_emotions_outlined),
          ),
          IconButton(
            tooltip: tr('隠し付き', 'Hidden'),
            onPressed: () => setState(() => _sensitive = !_sensitive),
            icon: Icon(_sensitive ? Icons.visibility_off_rounded : Icons.visibility_outlined, color: _sensitive ? context.cs.primary : null),
          ),
          Expanded(
            child: TextField(
              controller: _text,
              focusNode: _focus,
              minLines: 1,
              maxLines: 5,
              maxLength: 1000,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                counterText: '',
                hintText: _sensitive
                    ? tr('隠し付きで送ります', 'Sending as hidden')
                    : (replyTo != null ? tr('${replyTo.userName}さんへ返信', 'Reply to ${replyTo.userName}') : tr('コメントを書く', 'Write a comment')),
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
              icon: _sending && _sticker == null
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.arrow_upward_rounded),
            ),
          ),
        ]),
      ]),
    );
  }
}

/// 入力欄の上の「〇〇さんへ返信」（返信先のコメントの書き出しを添えて、だれに返すのか分かるように）
class _ReplyBanner extends StatelessWidget {
  const _ReplyBanner({required this.target, this.onCancel});

  final CommentItem target;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final text = target.text.replaceAll(RegExp(r'\s+'), ' ').trim();
    final preview = text.isNotEmpty ? text : (target.stickerUrl != null ? tr('スタンプ', 'Sticker') : '');
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(10, 6, 2, 6),
      decoration: BoxDecoration(
        color: context.cs.primary.withValues(alpha: context.isDark ? 0.14 : 0.07),
        borderRadius: Ds.br(12),
        border: Border(left: BorderSide(color: context.cs.primary, width: 3)),
      ),
      child: Row(children: [
        Icon(Icons.reply_rounded, size: 18, color: context.cs.primary),
        const SizedBox(width: 6),
        if (target.stickerUrl != null && text.isEmpty) ...[
          AppImage(target.stickerUrl, width: 28, height: 28, fit: BoxFit.contain),
          const SizedBox(width: 6),
        ],
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(
              tr('${target.userName}さんへ返信', 'Replying to ${target.userName}'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: context.cs.primary),
            ),
            if (preview.isNotEmpty && !target.isSensitive)
              Text(preview, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: context.muted)),
          ]),
        ),
        IconButton(
          tooltip: tr('返信をやめる', 'Cancel reply'),
          visualDensity: VisualDensity.compact,
          onPressed: onCancel,
          icon: const Icon(Icons.close_rounded, size: 18),
        ),
      ]),
    );
  }
}

/// デフォルトのスタンプを先頭に、残りから同じスタンプを除いて並べる
List<Map<String, dynamic>> withDefaultStickersFirst(List<Map<String, dynamic>> defaults, Iterable<Map<String, dynamic>> rest) {
  final ids = defaults.map((s) => s['id']).toSet();
  return [...defaults, ...rest.where((s) => !ids.contains(s['id']))];
}

/// すべてのスタンプから 1 つ選ぶ（最近の使用・マイスタンプ）。ピン留めの付け外しもここでできる（Web のスタンプの一覧と同じ）
Future<Map<String, dynamic>?> showStickerPicker(BuildContext context) {
  return showModalBottomSheet<Map<String, dynamic>>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: context.surfaceCard,
    builder: (_) => const _StickerPicker(),
  );
}

class _StickerPicker extends StatefulWidget {
  const _StickerPicker();

  @override
  State<_StickerPicker> createState() => _StickerPickerState();
}

class _StickerPickerState extends State<_StickerPicker> {
  static const _orders = ['DATE_USED', 'DATE_CREATED'];

  final _shelf = StickerShelf.instance;
  int _tab = 0;
  final _items = <int, List<Map<String, dynamic>>>{};
  String? _error;

  /// ピン留めを編集中（押すと送らずにピン留めを付け外しする）
  bool _pinEditing = false;

  @override
  void initState() {
    super.initState();
    _shelf.ensure();
    _load();
  }

  Future<void> _load() async {
    final tab = _tab;
    setState(() => _error = null);
    try {
      // 「最近の使用」でも先頭にデフォルトのスタンプ（設定に従う）を出す。「マイスタンプ」はサーバーが先頭に入れて返す
      final data = await Api.query(tab == 0 ? r'''
query AppViewerRecentStickers($offset: Int!, $limit: Int!, $orderBy: StickerOrderBy) {
  viewer { id defaultStickers { id title imageUrl isUsable } userStickers(offset: $offset, limit: $limit, orderBy: $orderBy) { id title imageUrl isUsable usedAt } }
}''' : r'''
query AppViewerStickers($offset: Int!, $limit: Int!, $orderBy: StickerOrderBy) {
  viewer { id userStickers(offset: $offset, limit: $limit, orderBy: $orderBy) { id title imageUrl isUsable usedAt } }
}''', variables: {'offset': 0, 'limit': 120, 'orderBy': _orders[tab]});
      final list = data.obj('viewer')?.list('userStickers') ?? <Map<String, dynamic>>[];
      final defaults = data.obj('viewer')?.list('defaultStickers') ?? <Map<String, dynamic>>[];
      if (mounted) {
        setState(() => _items[tab] = tab == 0 ? withDefaultStickersFirst(defaults, list.where((s) => s.integer('usedAt') > 0)) : list);
      }
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<void> _togglePin(Map<String, dynamic> sticker) async {
    Ds.impact();
    final error = await _shelf.togglePin(sticker);
    if (error != null && mounted) context.toast(error, error: true);
  }

  void _tap(Map<String, dynamic> sticker) {
    if (_pinEditing) {
      _togglePin(sticker);
      return;
    }
    if (sticker['isUsable'] == false) {
      context.toast(tr('このスタンプは作者が非公開にしたため使えません', 'This sticker is unavailable because the creator made it private'));
      return;
    }
    Navigator.pop(context, sticker);
  }

  @override
  Widget build(BuildContext context) {
    final items = _items[_tab];
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(children: [
            Expanded(
              child: PillTabs(
                labels: [tr('最近の使用', 'Recent'), tr('マイスタンプ', 'My stickers')],
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
              child: Text(tr('広場', 'Browse')),
            ),
          ]),
        ),
        ListenableBuilder(
          listenable: _shelf,
          builder: (context, _) => Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 8, 0),
            child: Row(children: [
              Icon(Icons.push_pin_rounded, size: 14, color: _pinEditing ? context.cs.primary : context.muted),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  _pinEditing
                      ? tr('押してピン留めを付け外し（${_shelf.pinned.length}/$maxPinnedStickers）', 'Tap to pin or unpin (${_shelf.pinned.length}/$maxPinnedStickers)')
                      : tr('押すとすぐ送信・長押しでピン留め', 'Tap to send · long-press to pin'),
                  style: TextStyle(fontSize: 12, color: _pinEditing ? context.cs.primary : context.muted, fontWeight: _pinEditing ? FontWeight.w700 : null),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => _pinEditing = !_pinEditing),
                child: Text(_pinEditing ? tr('完了', 'Done') : tr('ピン留めを編集', 'Edit pins')),
              ),
            ]),
          ),
        ),
        Expanded(
          child: _error != null
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
                      : ListenableBuilder(
                          listenable: _shelf,
                          builder: (context, _) => GridView.builder(
                            padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 84, mainAxisSpacing: 8, crossAxisSpacing: 8),
                            itemCount: items.length,
                            itemBuilder: (context, i) {
                              final s = items[i];
                              final pinned = _shelf.isPinned(s.str('id'));
                              final unusable = s['isUsable'] == false;
                              return Pressable(
                                onTap: () => _tap(s),
                                onLongPress: () => _togglePin(s),
                                child: AnimatedContainer(
                                  duration: Ds.fast,
                                  decoration: BoxDecoration(
                                    color: pinned && _pinEditing ? context.cs.primary.withValues(alpha: 0.12) : context.skeleton,
                                    borderRadius: Ds.br(12),
                                    border: pinned && _pinEditing ? Border.all(color: context.cs.primary, width: 1.5) : null,
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  child: Stack(fit: StackFit.expand, children: [
                                    Opacity(opacity: unusable ? 0.35 : 1, child: AppImage(s.strOrNull('imageUrl'), fit: BoxFit.contain)),
                                    if (pinned)
                                      Positioned(
                                        right: -2,
                                        top: -2,
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(color: context.cs.primary, shape: BoxShape.circle),
                                          child: const Icon(Icons.push_pin_rounded, size: 11, color: Colors.white),
                                        ),
                                      ),
                                    if (unusable) Positioned(right: 0, bottom: 0, child: Icon(Icons.lock_rounded, size: 14, color: context.muted)),
                                  ]),
                                ),
                              );
                            },
                          ),
                        ),
        ),
      ]),
    );
  }
}

/// スタンプだけのコメントを送る（作品の画面の「すぐ送れるスタンプ」から。Web のクイックスタンプと同じ）
Future<CommentItem> postStickerComment({required String workId, required Map<String, dynamic> sticker}) async {
  final data = await Api.mutate('''
mutation AppStickerComment(\$input: CreateWorkCommentInput!) { createWorkComment(input: \$input) { $commentFields } }''', variables: {
    'input': {'workId': workId, 'text': '', 'stickerId': sticker['id']},
  });
  StickerShelf.instance.markUsed(sticker);
  return CommentItem(data.obj('createWorkComment') ?? {});
}
