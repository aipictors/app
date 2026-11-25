import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// コメント欄に固定できるスタンプの数（Web の MAX_PINNED_STICKERS と同じ）
const maxPinnedStickers = 12;

const _stickerFields = 'id title imageUrl isUsable';

/// 押すとすぐ送れるスタンプ（ピン留め・最近使った）。作品の画面とコメントのシートで同じものを使う。
///
/// ピン留めは Web と同じくアカウントに保存（viewer.pinnedStickers / updatePinnedStickers）されるので、
/// Web で固定したスタンプもそのまま並ぶ。最近使ったものはサーバーの使った順（DATE_USED）
class StickerShelf extends ChangeNotifier {
  StickerShelf._();

  static final instance = StickerShelf._();

  List<Map<String, dynamic>> pinned = [];
  List<Map<String, dynamic>> recent = [];

  /// 最近使ったものが無く、代わりに並べているもの（null: 最近使った・'default': 既定のスタンプ・'mine': マイスタンプ）
  String? recentFallback;

  bool get recentIsFallback => recentFallback != null;
  bool loaded = false;
  bool loading = false;
  String? _uid;
  DateTime? _loadedAt;

  bool get isEmpty => pinned.isEmpty && recent.isEmpty;

  bool isPinned(String id) => pinned.any((s) => s['id'] == id);

  /// 5 分以内に読んだものはそのまま使う（作品を開くたびに読み直さない）
  Future<void> ensure({bool force = false}) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      if (loaded || _uid != null) _clear();
      return;
    }
    final fresh = _loadedAt != null && DateTime.now().difference(_loadedAt!) < const Duration(minutes: 5);
    if (!force && uid == _uid && loaded && fresh) return;
    if (loading) return;
    if (uid != _uid) _clear(notify: false);
    loading = true;
    notifyListeners();
    try {
      final data = await Api.query('''
query AppQuickStickers(\$limit: Int!) {
  viewer {
    id
    pinnedStickers { $_stickerFields }
    defaultStickers { $_stickerFields }
    userStickers(offset: 0, limit: \$limit, orderBy: DATE_USED) { $_stickerFields usedAt }
  }
}''', variables: {'limit': 40});
      final viewer = data.obj('viewer');
      _uid = uid;
      pinned = viewer?.list('pinnedStickers').where((s) => s.strOrNull('imageUrl') != null).toList() ?? [];
      final mine = viewer?.list('userStickers').where((s) => s.strOrNull('imageUrl') != null).toList() ?? [];
      final used = mine.where((s) => s.integer('usedAt') > 0).toList();
      final defaults = viewer?.list('defaultStickers').where((s) => s.strOrNull('imageUrl') != null).toList() ?? [];
      // まだ使ったことが無い人には、既定のスタンプか、追加したスタンプを並べる（空の枠にしない）
      recentFallback = used.isNotEmpty ? null : (_withoutPinned(defaults).isNotEmpty ? 'default' : 'mine');
      recent = _withoutPinned(used.isNotEmpty ? used : (recentFallback == 'default' ? defaults : mine)).take(20).toList();
      loaded = true;
      _loadedAt = DateTime.now();
    } on ApiException {
      // 読めなくても入力欄は使える（スタンプの一覧からは選べる）
      loaded = true;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Iterable<Map<String, dynamic>> _withoutPinned(Iterable<Map<String, dynamic>> list) {
    final ids = pinned.map((s) => s['id']).toSet();
    return list.where((s) => !ids.contains(s['id']));
  }

  void _clear({bool notify = true}) {
    pinned = [];
    recent = [];
    loaded = false;
    _uid = null;
    _loadedAt = null;
    if (notify) notifyListeners();
  }

  /// 送ったスタンプを「最近使った」の先頭へ（ピン留めしたものは動かさない）
  void markUsed(Map<String, dynamic> sticker) {
    if (isPinned(sticker.str('id'))) return;
    final rest = recentIsFallback ? <Map<String, dynamic>>[] : recent.where((s) => s['id'] != sticker['id']);
    recent = [sticker, ...rest].take(20).toList();
    recentFallback = null;
    notifyListeners();
  }

  /// ピン留めを付け外しする。だめだったときは画面に出す文言を返す
  Future<String?> togglePin(Map<String, dynamic> sticker) async {
    final id = sticker.str('id');
    final wasPinned = isPinned(id);
    if (!wasPinned && pinned.length >= maxPinnedStickers) {
      return tr('ピン留めできるスタンプは $maxPinnedStickers 個までです', 'You can pin up to $maxPinnedStickers stickers');
    }
    final before = (pinned: pinned, recent: recent);
    if (wasPinned) {
      pinned = pinned.where((s) => s['id'] != id).toList();
      recent = [sticker, ...recent.where((s) => s['id'] != id)];
    } else {
      pinned = [...pinned, sticker];
      recent = recent.where((s) => s['id'] != id).toList();
    }
    notifyListeners();
    try {
      await Api.mutate(r'mutation AppUpdatePinnedStickers($stickerIds: [ID!]!) { updatePinnedStickers(stickerIds: $stickerIds) { id } }', variables: {
        'stickerIds': pinned.map((s) => s['id']).toList(),
      });
      return null;
    } on ApiException catch (e) {
      pinned = before.pinned;
      recent = before.recent;
      notifyListeners();
      return e.message;
    }
  }
}

/// 押すとすぐ送れるスタンプの枠（Web の WorkCommentQuickStickers と同じく、段ごとに見出しを付けて横に流す）
class QuickStickerTray extends StatefulWidget {
  const QuickStickerTray({
    super.key,
    required this.onSend,
    required this.onOpenAll,
    this.sendingId,
    this.replyToName,
    this.dense = false,
  });

  /// 押したスタンプ（isUsable が false のものは呼ばない）
  final void Function(Map<String, dynamic> sticker) onSend;
  final VoidCallback onOpenAll;

  /// 送っている最中のスタンプ（そのスタンプに回る印を出し、ほかは押せなくする）
  final String? sendingId;

  /// 返信のときは見出しに出す
  final String? replyToName;

  /// 作品の画面に置くときは 1 段を少し小さく
  final bool dense;

  @override
  State<QuickStickerTray> createState() => _QuickStickerTrayState();
}

class _QuickStickerTrayState extends State<QuickStickerTray> {
  final _shelf = StickerShelf.instance;

  @override
  void initState() {
    super.initState();
    _shelf.ensure();
  }

  Future<void> _longPress(Map<String, dynamic> sticker) async {
    Ds.impact();
    final pinned = _shelf.isPinned(sticker.str('id'));
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (context) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AppImage(sticker.strOrNull('imageUrl'), width: 96, height: 96, fit: BoxFit.contain),
          ),
          ListTile(
            leading: Icon(pinned ? Icons.push_pin_outlined : Icons.push_pin_rounded),
            title: Text(pinned ? tr('ピン留めを外す', 'Unpin') : tr('ピン留めする', 'Pin')),
            subtitle: pinned ? null : Text(tr('コメント欄の一番上にいつも並びます（$maxPinnedStickers 個まで）', 'Always shown first in comments (up to $maxPinnedStickers)')),
            onTap: () => Navigator.pop(context, 'pin'),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: Text(tr('スタンプの詳細', 'Sticker details')),
            onTap: () => Navigator.pop(context, 'detail'),
          ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (!mounted || action == null) return;
    if (action == 'detail') {
      context.push('/stickers/${sticker.str('id')}');
      return;
    }
    final error = await _shelf.togglePin(sticker);
    if (!mounted) return;
    if (error != null) {
      context.toast(error, error: true);
    } else {
      context.toast(pinned ? tr('ピン留めを外しました', 'Unpinned') : tr('ピン留めしました', 'Pinned'));
    }
  }

  void _tap(Map<String, dynamic> sticker) {
    if (widget.sendingId != null) return;
    if (sticker['isUsable'] == false) {
      context.toast(tr('このスタンプは作者が非公開にしたため使えません。長押しでピン留めを外せます', 'This sticker is unavailable because the creator made it private. Long-press to unpin it.'));
      return;
    }
    Ds.impact();
    widget.onSend(sticker);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _shelf,
      builder: (context, _) {
        if (!_shelf.loaded) {
          // 読み込み中も高さを取っておく（入力欄が跳ねないように）
          return _frame(context, [
            SizedBox(
              height: widget.dense ? 56 : 64,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                separatorBuilder: (_, _) => const SizedBox(width: 6),
                itemBuilder: (_, _) => Skeleton(width: widget.dense ? 56 : 64, height: widget.dense ? 56 : 64, radius: 14),
              ),
            ),
          ]);
        }
        if (_shelf.isEmpty) {
          return _frame(context, [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              child: Text(
                tr('スタンプ広場で気に入ったスタンプを追加すると、ここからすぐ送れます', 'Add stickers from the sticker square to send them here in one tap'),
                style: TextStyle(color: context.muted, fontSize: 12),
              ),
            ),
          ]);
        }
        return _frame(context, [
          if (_shelf.pinned.isNotEmpty) _row(context, Icons.push_pin_rounded, tr('ピン留め', 'Pinned'), _shelf.pinned),
          if (_shelf.recent.isNotEmpty)
            _row(
              context,
              switch (_shelf.recentFallback) {
                'default' => Icons.auto_awesome_rounded,
                'mine' => Icons.collections_bookmark_outlined,
                _ => Icons.schedule_rounded,
              },
              switch (_shelf.recentFallback) {
                'default' => tr('おすすめ', 'Suggested'),
                'mine' => tr('マイスタンプ', 'My stickers'),
                _ => tr('最近使った', 'Recent'),
              },
              _shelf.recent,
            ),
        ]);
      },
    );
  }

  Widget _frame(BuildContext context, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 4, 4),
      decoration: BoxDecoration(color: context.skeleton.withValues(alpha: context.isDark ? 0.55 : 0.6), borderRadius: Ds.br(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
        Row(children: [
          Icon(Icons.touch_app_outlined, size: 13, color: context.muted),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              widget.replyToName != null ? tr('タップで ${widget.replyToName} さんへすぐ返信', 'Tap to reply to ${widget.replyToName}') : tr('タップですぐ送信・長押しでピン留め', 'Tap to send · long-press to pin'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: context.muted, fontSize: 11),
            ),
          ),
          InkWell(
            borderRadius: Ds.br(12),
            onTap: widget.onOpenAll,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(tr('すべて', 'All'), style: TextStyle(color: context.muted, fontSize: 11, fontWeight: FontWeight.w700)),
                Icon(Icons.chevron_right_rounded, size: 14, color: context.muted),
              ]),
            ),
          ),
        ]),
        ...children,
      ]),
    );
  }

  Widget _row(BuildContext context, IconData icon, String label, List<Map<String, dynamic>> items) {
    final size = widget.dense ? 56.0 : 64.0;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.only(left: 2, top: 2, bottom: 2),
        child: Row(children: [
          Icon(icon, size: 11, color: context.muted),
          const SizedBox(width: 3),
          Text(label, style: TextStyle(color: context.muted, fontSize: 10.5, fontWeight: FontWeight.w700)),
        ]),
      ),
      SizedBox(
        height: size,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(width: 4),
          itemBuilder: (context, i) {
            final s = items[i];
            final sending = widget.sendingId == s['id'];
            final unusable = s['isUsable'] == false;
            return Semantics(
              button: true,
              label: tr('スタンプ「${s.str('title')}」を送信', 'Send sticker "${s.str('title')}"'),
              child: Pressable(
                scale: 0.88,
                haptic: false,
                onTap: () => _tap(s),
                onLongPress: () => _longPress(s),
                child: AnimatedOpacity(
                  duration: Ds.fast,
                  opacity: widget.sendingId != null && !sending ? 0.45 : 1,
                  child: Container(
                    width: size,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: sending ? context.cs.primary.withValues(alpha: 0.12) : Colors.transparent,
                      borderRadius: Ds.br(14),
                    ),
                    child: Stack(fit: StackFit.expand, children: [
                      Opacity(
                        opacity: unusable ? 0.35 : 1,
                        child: AppImage(s.strOrNull('imageUrl'), fit: BoxFit.contain, memCacheWidth: 192),
                      ),
                      if (unusable)
                        Positioned(right: 0, bottom: 0, child: Icon(Icons.lock_rounded, size: 14, color: context.muted)),
                      if (sending) const Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.4))),
                    ]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
