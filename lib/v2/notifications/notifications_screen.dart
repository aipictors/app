import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/notifications/notifications_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _notificationsTabIndex = 3;

/// サーバーが読める位置の上限
const _maxOffset = 1024;

enum _Tab {
  all('すべて', {'excludeCoin': true}),
  comment('コメント', {'type': 'WORK_COMMENT'}),
  reply('返信', {'type': 'COMMENT_REPLY'}),
  liked('いいね', {'type': 'LIKED_WORK'}),
  follow('フォロー', {'type': 'FOLLOW'}),
  award('入賞', {'type': 'WORK_AWARD'}),
  coin('コイン', {'type': 'LIKED_WORKS_SUMMARY'}),
  message('運営', {});

  const _Tab(this.label, this.where);

  final String label;
  final Map<String, dynamic> where;
}

enum _ReplyFilter {
  all('すべて', null),
  notReplied('未返信', false),
  replied('返信済み', true);

  const _ReplyFilter(this.label, this.isReplied);

  final String label;
  final bool? isReplied;
}

/// 通知タブ（Web の /notifications）。[inTab] が false なら単独の画面として開く
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key, this.inTab = true});

  final bool inTab;

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> with WidgetsBindingObserver {
  _Tab _tab = _Tab.values.where((t) => t.name == DebugBoot.screenTab).firstOrNull ?? _Tab.all;
  _ReplyFilter _replyFilter = _ReplyFilter.all;
  final Map<String, PagedController<NotificationItem>> _controllers = {};
  PagedController<SupportMessage>? _messages;

  /// 開いた時点の未読（一覧の先頭の色付けとタブの数に使う）
  UnreadCounts _opened = const UnreadCounts();
  bool _openedOnce = false;

  bool get _isVisible => !widget.inTab || ref.read(homeTabIndexProvider) == _notificationsTabIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // タブは最初に全部作られるので、バッジの数だけ読み、既読にするのは見たときにする
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_isVisible) {
        _open();
      } else {
        NotificationsApi.unreadCounts().catchError((_) => const UnreadCounts());
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    for (final c in _controllers.values) {
      c.dispose();
    }
    _messages?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    if (_isVisible) {
      _open();
    } else {
      NotificationsApi.unreadCounts().catchError((_) => const UnreadCounts());
    }
  }

  /// 未読を覚えてから既読にする。新しい通知があれば一覧も読み直す
  Future<void> _open() async {
    try {
      final counts = await NotificationsApi.unreadCounts();
      if (!mounted) return;
      final hasNew = counts.total > 0;
      if (hasNew || !_openedOnce) setState(() => _opened = counts);
      if (hasNew && _openedOnce) _refreshAll();
      _openedOnce = true;
      if (hasNew) {
        await NotificationsApi.markAsRead();
        AppBadgePlus.updateBadge(0).ignore();
      }
    } catch (_) {
      // 未読が読めなくても一覧は出せる
    }
  }

  void _refreshAll() {
    for (final c in _controllers.values) {
      if (c.items.isNotEmpty) c.refresh();
    }
    _messages?.refresh();
  }

  PagedController<NotificationItem> _controller() {
    final filter = _tab == _Tab.comment ? _replyFilter : _ReplyFilter.all;
    final key = '${_tab.name}/${filter.name}';
    return _controllers.putIfAbsent(key, () {
      final where = {..._tab.where, if (filter.isReplied != null) 'isReplied': filter.isReplied};
      return PagedController<NotificationItem>(
        pageSize: 40,
        idOf: (n) => n.id,
        fetch: (o, l) async => o >= _maxOffset ? <NotificationItem>[] : NotificationsApi.list(where, o, l),
      );
    });
  }

  PagedController<SupportMessage> get _messageController =>
      _messages ??= PagedController<SupportMessage>(pageSize: 40, idOf: (m) => m.id, fetch: NotificationsApi.messages);

  int _countOf(_Tab t) => switch (t) {
        _Tab.all => _opened.activity,
        _Tab.comment => _opened.comment,
        _Tab.reply => _opened.reply,
        _Tab.liked => _opened.liked,
        _Tab.follow => _opened.follow,
        _Tab.award => _opened.award,
        _Tab.coin => 0,
        _Tab.message => _opened.message,
      };

  /// 一覧で未読の色を付ける件数（返信の絞り込み中は順番が変わるので付けない）
  int get _unreadRows => _tab == _Tab.comment && _replyFilter != _ReplyFilter.all ? 0 : _countOf(_tab);

  @override
  Widget build(BuildContext context) {
    if (widget.inTab) {
      ref.listen(homeTabIndexProvider, (prev, next) {
        if (next == _notificationsTabIndex && prev != next) _open();
      });
    }
    final tabs = _Tab.values;
    String badge(int n) => n <= 0 ? '' : ' ${n > 99 ? '99+' : n}';
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('通知', style: TextStyle(fontWeight: FontWeight.w900)),
        actions: [
          IconButton(tooltip: '通知の設定', onPressed: () => context.push('/settings/notification'), icon: const Icon(Icons.tune_rounded)),
        ],
      ),
      body: Column(children: [
        PillTabs(
          labels: [for (final t in tabs) '${t.label}${badge(_countOf(t))}'],
          index: tabs.indexOf(_tab),
          onChanged: (i) => setState(() => _tab = tabs[i]),
        ),
        const SizedBox(height: Ds.s8),
        if (_tab == _Tab.comment)
          Padding(
            padding: const EdgeInsets.only(bottom: Ds.s8),
            child: SegmentedButton<_ReplyFilter>(
              showSelectedIcon: false,
              style: SegmentedButton.styleFrom(visualDensity: VisualDensity.compact, textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              segments: [for (final f in _ReplyFilter.values) ButtonSegment(value: f, label: Text(f.label))],
              selected: {_replyFilter},
              onSelectionChanged: (s) => setState(() => _replyFilter = s.first),
            ),
          ),
        Expanded(
          child: _tab == _Tab.message
              ? _MessageList(key: const ValueKey('messages'), controller: _messageController)
              : _NotificationList(
                  key: ObjectKey(_controller()),
                  controller: _controller(),
                  unreadRows: _unreadRows,
                  emptyTitle: _emptyTitle,
                ),
        ),
      ]),
    );
  }

  String get _emptyTitle {
    if (_tab == _Tab.comment && _replyFilter == _ReplyFilter.notReplied) return '未返信のコメントはありません';
    if (_tab == _Tab.comment && _replyFilter == _ReplyFilter.replied) return '返信済みのコメントはありません';
    return 'まだ通知はありません';
  }
}

class _NotificationList extends StatefulWidget {
  const _NotificationList({super.key, required this.controller, required this.unreadRows, required this.emptyTitle});

  final PagedController<NotificationItem> controller;
  final int unreadRows;
  final String emptyTitle;

  @override
  State<_NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<_NotificationList> {
  @override
  void initState() {
    super.initState();
    if (widget.controller.items.isEmpty) widget.controller.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.controller;
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        if (c.isInitialLoading) return const SkeletonList(count: 8);
        if (c.items.isEmpty && c.error != null) return Center(child: StateView.error(c.error!, onRetry: c.refresh));
        if (c.items.isEmpty && !c.hasMore) {
          return AppRefresh(
            onRefresh: c.refresh,
            child: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
              const SizedBox(height: 80),
              StateView.empty(widget.emptyTitle, icon: Icons.notifications_none_rounded),
            ]),
          );
        }
        return AppRefresh(
          onRefresh: c.refresh,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: c.items.length + (c.hasMore ? 1 : 0),
            separatorBuilder: (context, _) => Divider(height: 1, color: context.hairline),
            itemBuilder: (context, i) {
              if (i >= c.items.length) {
                if (c.error != null) return StateView.error(c.error!, onRetry: c.loadMore);
                if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                return const Padding(padding: EdgeInsets.all(Ds.s16), child: Center(child: CircularProgressIndicator.adaptive()));
              }
              final item = c.items[i];
              return _NotificationRow(
                key: ValueKey(item.id),
                item: item,
                isUnread: i < widget.unreadRows,
                onHidden: () => c.removeWhere((n) => n.id == item.id),
              );
            },
          ),
        );
      },
    );
  }
}

class _NotificationRow extends StatefulWidget {
  const _NotificationRow({super.key, required this.item, required this.isUnread, required this.onHidden});

  final NotificationItem item;
  final bool isUnread;
  final VoidCallback onHidden;

  @override
  State<_NotificationRow> createState() => _NotificationRowState();
}

class _NotificationRowState extends State<_NotificationRow> {
  final _text = TextEditingController();
  bool _replying = false;
  bool _sending = false;

  NotificationItem get item => widget.item;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  /// 押したときの行き先（Web の toRowHref）。R18 の作品へは行かない
  VoidCallback? _destination(BuildContext context) {
    if (item.kind == NotificationKind.follow) {
      final id = item.user?.id;
      return id == null ? null : () => context.push('/users/$id');
    }
    if (item.kind == NotificationKind.coin) {
      return item.message?.startsWith('🏅') == true ? () => context.push('/achievements') : null;
    }
    final work = item.work;
    if (work == null || work.isAdult) return null;
    return () => context.push('/works/${work.id}');
  }

  String get _action => switch (item.kind) {
        NotificationKind.liked => 'さんが作品にいいねしました',
        NotificationKind.comment => 'さんが作品にコメントしました',
        NotificationKind.reply => 'さんがコメントに返信しました',
        NotificationKind.follow => 'さんにフォローされました',
        NotificationKind.award => '',
        NotificationKind.coin => '',
      };

  (IconData, Color) get _icon => switch (item.kind) {
        NotificationKind.liked => (Icons.favorite_rounded, Ds.pink),
        NotificationKind.comment => (Icons.chat_bubble_rounded, Ds.sky),
        NotificationKind.reply => (Icons.reply_rounded, Ds.purple),
        NotificationKind.follow => (Icons.person_add_alt_1_rounded, Ds.blue),
        NotificationKind.award => (Icons.emoji_events_rounded, Ds.gold),
        NotificationKind.coin => (Icons.monetization_on_rounded, Ds.gold),
      };

  Future<void> _send() async {
    final id = item.replyTargetCommentId;
    final text = _text.text.trim();
    if (id == null || text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      await NotificationsApi.reply(id, text);
      if (!mounted) return;
      Ds.success();
      setState(() {
        item.myReplies.add(NotificationReply(text: text));
        _text.clear();
        _replying = false;
      });
      context.toast('返信しました');
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _hide() async {
    final ok = await showConfirmSheet(context, title: 'この通知を一覧から消しますか？', confirmLabel: '消す');
    if (!ok) return;
    try {
      await NotificationsApi.hide(item.id);
      widget.onHidden();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final muted = TextStyle(color: context.muted, fontSize: 12);
    // 🏅 で始まるお知らせは実績。絵文字はアイコンに置き換える（iOS で豆腐になり、続く文字もずれる）
    final isAchievement = item.message?.startsWith('🏅') == true;
    final body = (isAchievement ? item.message!.replaceFirst('🏅', '') : item.message)?.trim();
    final work = item.work;
    final (icon, iconColor) = isAchievement ? (Icons.emoji_events_rounded, Ds.gold) : _icon;
    final canReply = item.canReply && item.replyTargetCommentId != null && work?.isAdult != true;
    return Material(
      color: widget.isUnread ? context.cs.primary.withValues(alpha: context.isDark ? 0.14 : 0.06) : Colors.transparent,
      child: InkWell(
        onTap: _destination(context),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s12, Ds.s12),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: 44,
              height: 44,
              child: Stack(clipBehavior: Clip.none, children: [
                if (item.user != null)
                  UserAvatar.summary(item.user!, size: 40, tappable: true)
                else
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.14), shape: BoxShape.circle),
                    child: Icon(icon, color: iconColor, size: 20),
                  ),
                if (item.user != null)
                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(color: context.surfaceCard, shape: BoxShape.circle),
                      child: Icon(icon, color: iconColor, size: 12),
                    ),
                  ),
              ]),
            ),
            const SizedBox(width: Ds.s12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                if (_action.isNotEmpty)
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(text: item.user?.name ?? '匿名のユーザー', style: const TextStyle(fontWeight: FontWeight.w800)),
                      TextSpan(text: _action, style: TextStyle(color: context.muted)),
                    ]),
                    style: const TextStyle(fontSize: 13.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                if (item.parentText != null || item.parentStickerUrl != null) _parent(context),
                if (body != null && body.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: _action.isEmpty ? 0 : Ds.s4),
                    child: Text(body, maxLines: 4, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, height: 1.35)),
                  ),
                if (item.stickerUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(top: Ds.s4),
                    child: SizedBox(width: 72, height: 72, child: AppImage(item.stickerUrl, radius: 8, fit: BoxFit.contain, memCacheWidth: 216)),
                  ),
                if (item.supportCoins > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: Ds.s4),
                    child: Badge2('応援 ${item.supportCoins}コイン', icon: Icons.monetization_on_rounded, color: Ds.gold),
                  ),
                for (final r in item.myReplies)
                  Padding(
                    padding: const EdgeInsets.only(top: Ds.s6),
                    child: Text.rich(
                      TextSpan(children: [
                        const TextSpan(text: 'あなた: ', style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(text: r.text.isEmpty && r.stickerUrl != null ? '（スタンプ）' : r.text),
                      ]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: context.muted, fontSize: 12.5),
                    ),
                  ),
                const SizedBox(height: Ds.s4),
                Wrap(spacing: Ds.s8, crossAxisAlignment: WrapCrossAlignment.center, children: [
                  Text(relativeTime(item.createdAt), style: muted),
                  if (item.isNotReplied)
                    Text('未返信', style: TextStyle(color: context.cs.primary, fontSize: 12, fontWeight: FontWeight.w700)),
                  if (work?.isAdult == true) Text('アプリでは開けない作品です', style: muted),
                ]),
                if (canReply) _replyArea(context),
              ]),
            ),
            if (work != null && !work.isAdult && work.thumbnailUrl != null) ...[
              const SizedBox(width: Ds.s8),
              SizedBox(width: 52, height: 52, child: AppImage(work.thumbnailUrl, radius: 10, memCacheWidth: 156)),
            ],
          ]),
        ),
      ),
    );
  }

  /// 返信の通知で、何への返信かを出す
  Widget _parent(BuildContext context) {
    final name = item.parentUserName;
    final text = item.parentText?.trim();
    return Container(
      margin: const EdgeInsets.only(top: Ds.s6),
      padding: const EdgeInsets.symmetric(horizontal: Ds.s8, vertical: Ds.s6),
      decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(8)),
      child: Text(
        '${name == null ? '' : '$name: '}${text == null || text.isEmpty ? '（スタンプ）' : text}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: context.muted, fontSize: 12),
      ),
    );
  }

  Widget _replyArea(BuildContext context) {
    if (!_replying) {
      return Padding(
        padding: const EdgeInsets.only(top: Ds.s4),
        child: Row(children: [
          TextButton.icon(
            style: TextButton.styleFrom(visualDensity: VisualDensity.compact, padding: const EdgeInsets.symmetric(horizontal: Ds.s8), textStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700)),
            onPressed: () => setState(() => _replying = true),
            icon: const Icon(Icons.reply_rounded, size: 16),
            label: Text(item.myReplies.isEmpty ? '返信する' : 'もう一度返信する'),
          ),
          if (item.kind == NotificationKind.comment && item.myReplies.isEmpty)
            TextButton(
              style: TextButton.styleFrom(foregroundColor: context.muted, visualDensity: VisualDensity.compact, padding: const EdgeInsets.symmetric(horizontal: Ds.s8), textStyle: const TextStyle(fontSize: 12.5)),
              onPressed: _hide,
              child: const Text('一覧から消す'),
            ),
        ]),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: Ds.s8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          controller: _text,
          autofocus: true,
          minLines: 1,
          maxLines: 4,
          maxLength: 500,
          decoration: InputDecoration(hintText: '返信を入力', isDense: true, counterText: '', border: OutlineInputBorder(borderRadius: Ds.br(12))),
        ),
        const SizedBox(height: Ds.s6),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(onPressed: _sending ? null : () => setState(() => _replying = false), child: const Text('閉じる')),
          const SizedBox(width: Ds.s4),
          FilledButton(onPressed: _sending ? null : _send, child: Text(_sending ? '送信中…' : '返信する')),
        ]),
      ]),
    );
  }
}

class _MessageList extends StatefulWidget {
  const _MessageList({super.key, required this.controller});

  final PagedController<SupportMessage> controller;

  @override
  State<_MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<_MessageList> {
  @override
  void initState() {
    super.initState();
    if (widget.controller.items.isEmpty) widget.controller.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.controller;
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        if (c.isInitialLoading) return const SkeletonList(count: 5);
        if (c.items.isEmpty && c.error != null) return Center(child: StateView.error(c.error!, onRetry: c.refresh));
        if (c.items.isEmpty && !c.hasMore) {
          return AppRefresh(
            onRefresh: c.refresh,
            child: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
              const SizedBox(height: 80),
              StateView.empty('まだメッセージはありません', icon: Icons.mail_outline_rounded),
            ]),
          );
        }
        return AppRefresh(
          onRefresh: c.refresh,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s4, Ds.s16, 100),
            itemCount: c.items.length + (c.hasMore ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: Ds.s8),
            itemBuilder: (context, i) {
              if (i >= c.items.length) {
                if (c.error != null) return StateView.error(c.error!, onRetry: c.loadMore);
                if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                return const Center(child: CircularProgressIndicator.adaptive());
              }
              final m = c.items[i];
              return Container(
                padding: const EdgeInsets.all(Ds.s12),
                decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(14), border: Border.all(color: context.hairline)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(m.isFromTeam ? '運営より' : 'あなた', style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700)),
                  const SizedBox(height: Ds.s4),
                  SelectableText(m.text, style: const TextStyle(fontSize: 14, height: 1.4)),
                  const SizedBox(height: Ds.s4),
                  Text(relativeTime(m.createdAt), style: TextStyle(color: context.muted, fontSize: 11.5)),
                ]),
              );
            },
          ),
        );
      },
    );
  }
}
